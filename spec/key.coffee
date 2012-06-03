{Key} = DES

# {{{ const for test
KEY_HEX = '3b3898371520f75e'
KEY_BIT = '0011101100111000100110000011011100010101001000001111011101011110'

ROUND = [
  '01000100110000000110101111011100100111011000100001111111', # ROUND[0]
  '10001001100000001101011110101001001110110001000011111111', # ROUND[1]
  '00010011000000011010111101010010011101100010000111111111', # ROUND[2]
  '01001100000001101011110101001001110110001000011111111100', # ROUND[3]
  '00110000000110101111010100010111011000100001111111110010', # ROUND[4]
  '11000000011010111101010001001101100010000111111111001001', # ROUND[5]
  '00000001101011110101000100110110001000011111111100100111', # ROUND[6]
  '00000110101111010100010011001000100001111111110010011101', # ROUND[7]
  '00011010111101010001001100000010000111111111001001110110', # ROUND[8]
  '00110101111010100010011000000100001111111110010011101100', # ROUND[9]
  '11010111101010001001100000000000111111111001001110110001', # ROUND[10]
  '01011110101000100110000000110011111111100100111011000100', # ROUND[11]
  '01111010100010011000000011011111111110010011101100010000', # ROUND[12]
  '11101010001001100000001101011111111001001110110001000011', # ROUND[13]
  '10101000100110000000110101111111100100111011000100001111', # ROUND[14]
  '10100010011000000011010111101110010011101100010000111111', # ROUND[15]
  '01000100110000000110101111011100100111011000100001111111', # ROUND[16]
]
SK = [
  '', # no such subkey
  '010111000000100001001100010101011000111101001111', # SK[1]
  '010100010010110111110000011001001001011111001100', # SK[2]
  '110101001110010010000101110110001011010011101111', # SK[3]
  '010100111000011100000110011011101101111010101001', # SK[4]
  '011010001001000010100111000110100111110101111011', # SK[5]
  '101100011000000001101110101011111101100100110000', # SK[6]
  '101000000100001010110010110000010110111101110010', # SK[7]
  '101101000001101100110100111111011000101000011100', # SK[8]
  '001000101101110101000010100100111000011001111100', # SK[9]
  '011010000110000101010111110110011011111110000100', # SK[10]
  '001001011100010100011001001110000110011010111101', # SK[11]
  '010001110000000110110011011110110111100010000111', # SK[12]
  '101111111000100010010001101001100110000110111011', # SK[13]
  '000111110010001010001010101001110011101101000111', # SK[14]
  '001110100001010010011100111101101000001111110010', # SK[15]
  '000100010111110010000001110101111110000101001110', # SK[16]
]
# }}}

describe 'Key', ->
  it 'initialize with 16 hex numbers', ->
    key = new Key KEY_HEX
    key.toString().should.eql KEY_BIT

  it 'raise Error when initialize with wrong argument', ->
    init = ->
      key = new Key 'abc'
    init.should.throw 'Wrong argument: abc'

  it 'generate sub-key round 0', ->
    key = new Key KEY_HEX
    key.round[0].should.eql ROUND[0]
