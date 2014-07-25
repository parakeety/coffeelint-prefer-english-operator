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

  lintLine: (line, lineApi) ->
    lineTokens = lineApi.getLineTokens()

    for token in lineTokens
      if token[0] in ['COMPARE', 'LOGIC']
        location = token[2]
        substring = line[location.first_column..location.last_column]
        hasNonEnglishOperators = substring.match regexes.nonEnglishOperators
        if hasNonEnglishOperators
          return {context: "Found: #{hasNonEnglishOperators[0]}"}
