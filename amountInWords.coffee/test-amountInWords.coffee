# This file is part of apptools.
# Copyright (C) 2012-2014 Andrey Paskal.

# apptools is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# apptools is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along
# with this program.  If not, see <http://www.gnu.org/licenses/>.



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
checkWith 1001, 'одна тысяча один'
checkWith 1011, 'одна тысяча одиннадцать'
checkWith 10000001, 'десять миллионов один'
checkWith 9999999, 'девять миллионов девятьсот девяносто девять тысяч девятьсот девяносто девять'
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


