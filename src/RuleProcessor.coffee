regexes =
  nonEnglishOperators: /[&|\||\=]{2}|\!\=/

module.exports = class RuleProcessor
  rule:
    name: 'prefer_english_operator'
    description: '''
      This rule prohibits &&, ||, == and !=.
      Use and, or, is, and isnt instead.
      '''
    level: 'warn'
    message: 'Don\'t use &&, ||, == and !='

  # Most of this method is stolen from the no_trailing_semicolons rule.
  lintLine: (line, lineApi) ->
    # The TERMINATOR token is extended through to the next token. As a
    # result a line with a comment DOES have a token: the TERMINATOR from
    # the last line of code.
    lineTokens = lineApi.getLineTokens()

    newTokens = []
    for token in lineTokens
      newTokens.push token unless token[0] is 'STRING'
    lineTokens = newTokens

    if lineTokens.length is 1 and
        lineTokens[0][0] in ['TERMINATOR', 'HERECOMMENT']
      return

    newLine = line
    if lineTokens.length > 1 and
        lineTokens[lineTokens.length - 1][0] is 'TERMINATOR'

      # startPos contains the end position of the last non-TERMINATOR token
      # endPos contains the start position of the TERMINATOR token
      # if startPos and endPos arent equal, that probably means a comment
      # was sliced out of the tokenizer
      startPos = lineTokens[lineTokens.length - 2][2].last_column + 1
      endPos = lineTokens[lineTokens.length - 1][2].first_column
      if (startPos isnt endPos)
        startCounter = startPos
        while line[startCounter] isnt "#" and startCounter < line.length
          startCounter++
        newLine = line.substring(0, startCounter).replace(/\s*$/, '')

    hasNonEnglishOperators = newLine.match regexes.nonEnglishOperators
    [first..., last] = lineTokens
    hasNewLine = last and last.newLine?

    # Don't throw errors when the contents of multiline strings,
    # regexes and the like contain non-English operators.
    if hasNonEnglishOperators and not hasNewLine and lineApi.lineHasToken() and
        not (last[0] in ['STRING', 'IDENTIFIER'])
      return {context: "Found: #{hasNonEnglishOperators[0]}"}
