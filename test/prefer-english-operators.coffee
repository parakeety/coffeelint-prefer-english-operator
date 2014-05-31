expect = require('chai').expect
require('coffee-script/register')

PreferEnglishOperators = require '../src/prefer-english-operators'

describe 'PreferEnglishOperators', ->
  beforeEach ->
    @rule = new PreferEnglishOperators()

  afterEach ->
    @rule = null

  describe '==', ->
    it 'should warn when == is used', ->
      expect(@rule.lintLine('1 == 1', null)).to.be.ok

  describe '!=', ->
    it 'should warn when != is used', ->
      expect(@rule.lintLine('1 != 1', null)).to.be.ok

  describe '&&', ->
    it 'should warn when && is used', ->
      expect(@rule.lintLine('1 && 1', null)).to.be.ok

  describe '||', ->
    it 'should warn when || is used', ->
      expect(@rule.lintLine('1 || 1', null)).to.be.ok

  describe 'english operators', ->
    it 'should not warn when english operator is used', ->
      expect(@rule.lintLine('1 is 1', null)).to.be.not.ok

