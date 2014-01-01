amountInWords = require "./amountInWords"


# helper function

checkWith = (amount, text) ->
  total = new amountInWords amount
  describe 'Amount in words', ->
    describe 'for #{amount}', ->
      it 'should return #{text}', ->
        total.toText().should.equal text      


#tests

checkWith 1, 'один'
checkWith 2, 'два'
checkWith 3, 'три'
checkWith 4, 'четыре'
checkWith 5, 'пять'
checkWith 6, 'шесть'
checkWith 7, 'семь'
checkWith 8, 'восемь'
checkWith 9, 'девять'
checkWith 10, 'десять'
checkWith 11, 'одиннадцать'
checkWith 12, 'двенадцать'
checkWith 13, 'тринадцать'
checkWith 14, 'четырнадцать'
checkWith 15, 'пятнадцать'
checkWith 16, 'шестнадцать'
checkWith 17, 'семнадцать'
checkWith 18, 'восемнадцать'
checkWith 19, 'девятнадцать'
checkWith 20, 'двадцать'
checkWith 1000, 'одна тысяча'
checkWith 1011, 'одна тысяча одиннадцать'
# checkWith 10000001, 'десять миллионов один'
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''
# checkWith , ''


