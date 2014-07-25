require('coffee-script/register')

coffeelint = require 'coffeelint'
expect = require('chai').expect

PreferEnglishOperators = require '../src/RuleProcessor'

coffeelint.registerRule PreferEnglishOperators

configError = {prefer_english_operators: {level: 'error'}}

describe 'PreferEnglishOperators', ->
  describe 'non-English operators', ->
    it 'should warn when == is used', ->
      result = coffeelint.lint('1 == 1', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: =='

    it 'should warn when != is used', ->
      result = coffeelint.lint('1 != 1', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: !='

    it 'should warn when && is used', ->
      result = coffeelint.lint('1 && 1', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: &&'

    it 'should warn when || is used', ->
      result = coffeelint.lint('1 || 1', configError)[0]
      expect(result).to.be.ok
      expect(result.context).to.equal 'Found: ||'

  describe 'English operators', ->
    it 'should not warn when \'is\' is used', ->
      expect(coffeelint.lint('1 is 1', configError).length).to.be.not.ok

    it 'should not warn when \'isnt\' is used', ->
      expect(coffeelint.lint('1 isnt 1', configError).length).to.be.not.ok

    it 'should not warn when \'and\' is used', ->
      expect(coffeelint.lint('1 and 1', configError).length).to.be.not.ok

    it 'should not warn when \'or\' is used', ->
      expect(coffeelint.lint('1 or 1', configError).length).to.be.not.ok

  describe 'Comments', ->
    it 'should not warn when == is used in a comment', ->
      expect(coffeelint.lint('# 1 == 1', configError).length).to.be.not.ok

  describe 'Strings', ->
    it 'should not warn when == is used in a single-line string', ->
      expect(coffeelint.lint('"1 == 1"', configError).length).to.be.not.ok

    it 'should not warn when == is used in a multiline string', ->
      expect(coffeelint.lint('''
        """
        1 == 1
        """
        ''', configError).length).to.be.not.ok
