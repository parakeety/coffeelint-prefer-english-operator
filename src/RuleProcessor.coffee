class RuleProcessor
  rule:
    name: 'prefer_english_operator'
    description: 'This rule encourages to use english style operators.'
    level: 'warn'
    message: 'Use English equivalent operators. i.e)is, isnt, and, or'

  lintLine: (line, lineApi) ->
    /[&|\||\=]{2}|\!\=/.test(line)

module.exports = RuleProcessor
