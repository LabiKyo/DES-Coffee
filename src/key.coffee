class DES.Key

  constructor: (hex) ->
    unless hex.length is 16
      throw new Error "Wrong argument: #{hex}"
    @hex = hex
    @bit = ''
    for char in @hex
      @bit += @fill_zero(parseInt(char, 16).toString(2), 4)
    @generate_subkey()

  toString: ->
    @bit

  fill_zero: (string, length) ->
    while string.length < length
      string = '0' + string
    string

  generate_subkey: =>
    @round = []
    @subkey = []
    @round[0] = @permute @bit, PC1

  permute: (from, rule) =>
    target = []
    for index in [0..rule.length]
      target[index] = from[rule[index]]

    target.join ''

