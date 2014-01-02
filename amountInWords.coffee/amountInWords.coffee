# Класс для преобразования числа в пропись 

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


#### Вспомогательные функции для работы со строками
if typeof String.prototype.endsWith != 'function'
    String.prototype.endsWith = ( str ) ->
        return this.substring( this.length - str.length, this.length ) == str

if typeof String.prototype.right != 'function'
    String.prototype.right = ( subLen ) ->
        return "" if subLen <= 0
        return this if subLen >= this.length
        return this.substring( this.length - subLen, this.length )
  
if typeof String.prototype.left != 'function'
    String.prototype.left = ( subLen ) ->
        return "" if subLen <= 0
        return this if subLen >= this.length
        return this.substring( 0, subLen )

unless String::trim then String::trim = -> @replace /^\s+|\s+$/g, ""


#### Класс для хранения значения, преобразуемого в текст 
module.exports = class amountInWords
    constructor: (@amount) ->

    @degree = 0
    @amountInWords = ""

    singleToText: (string, isFemale) ->
        return "undefinded" unless /^[0-9]$/.test string
        digit = string - 0
        isFemale ?= false
    
        wordByIndex = [
            ""
            "один"
            "два"
            "три"
            "четыре"
            "пять"
            "шесть"
            "семь"
            "восемь"
            "девять"
        ]
        if isFemale
            wordByIndex[1] = "одна"
            wordByIndex[2] = "две"
        return wordByIndex[digit]

        
    # Заменяем число из двух цифр словами
    coupleToText: ( string, isFemale ) ->
    
        return "undefinded" unless /^[0-9][0-9]$/.test string

        leftDigit = string.substring(0,1)
        rightDigit = string.substring(1,2)

        if string - 0 < 10
            return @singleToText rightDigit, isFemale

        if string - 0 < 20
            wordByIndex = [
                "десять"
                "одиннадцать"
                "двенадцать"
                "тринадцать"
                "четырнадцать"
                "пятнадцать"
                "шестнадцать"
                "семнадцать"
                "восемнадцать"
                "девятнадцать"
            ]
            return wordByIndex[string - 10]

        wordByIndex = [
            "двадцать"
            "тридцать"
            "сорок"
            "пятьдесят"
            "шестьдесят"
            "семьдесят"
            "восемьдесят"
            "девяносто"
        ]
        
        return wordByIndex[leftDigit - 2] if rightDigit == "0"
        return wordByIndex[leftDigit - 2] + " " + @singleToText rightDigit, isFemale

    # Заменяем число из трех цифр словами
    tripleToText: ( string ) ->
        return "undefinded" unless /^[0-9][0-9][0-9]$/.test string

        leftDigit = string.substring(0,1)
        rightCouple = string.substring(1,3)

        if string - 0 < 100
            return @coupleToText rightCouple

        wordByIndex = [
            "сто"
            "двести"
            "триста"
            "четыреста"
            "пятьсот"
            "шестьсот"
            "семьсот"
            "восемьсот"
            "девятьсот"
        ]
        return wordByIndex[leftDigit-1] if rightCouple == "00"
        return wordByIndex[leftDigit-1] + " " + @coupleToText rightCouple

    degreeText: ( string ) ->

        return "" if  @degree < 1 or @degree > 4

        if @degree == 1
            return " тысяча" if string.endsWith "одна"
            return " тысячи" if string.endsWith("две") || string.endsWith("три") || string.endsWith("четыре")
            return " тысяч"

        if @degree == 2
            return " миллион" if string.endsWith "один"
            return " миллиона" if string.endsWith("два") || string.endsWith("три") || string.endsWith("четыре")
            return " миллионов"

        if @degree == 3
            return " миллиард" if string.endsWith "один"
            return " миллиарда" if string.endsWith("два") || string.endsWith("три") || string.endsWith("четыре")
            return " миллиардов"

        if @degree == 4
            return " триллион" if string.endsWith "один"
            return " триллиона" if string.endsWith("два") || string.endsWith("три") || string.endsWith("четыре")
            return " триллионов"

    toText:  ->
        string = @amount + ""
        @degree = 0
        @amountInWords = ""

        # отрезаем по три цифры с конца и делаем их преобразование
        while string.length >= 3 
            string = @parseLast3 string

        # обрабатываем оставшееся после отрезания
        if string.length > 0
            if string.length == 2
                coupleSingleText = @coupleToText string, @degree == 1
            else
                coupleSingleText = @singleToText string, @degree == 1
            
            degreeText = @degreeText coupleSingleText
            if @amountInWords != "" && (coupleSingleText + degreeText) != ""
                @amountInWords =  coupleSingleText + degreeText + " " + @amountInWords
            else
                @amountInWords =  coupleSingleText + degreeText + @amountInWords

        @amountInWords.trim()


    parseLast3: (string) ->
        if !string.endsWith "000"
            tripleText = @tripleToText string.right 3
            @amountInWords = tripleText + @degreeText( tripleText ) + " "+ @amountInWords 
        @degree++
        string.left( string.length - 3);