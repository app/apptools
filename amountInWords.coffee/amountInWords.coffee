# Класс для преобразования числа в пропись 
# При разработке использовались исходники Ananas application library
#
# Copyright (C) 2012 Andrey Paskal.
#
# This file is part of the Designer application of the Ananas 
# automation accounting system.
#
# This file may be distributed and/or modified under the terms of the
# GNU General Public License version 2 as published by the Free Software
# Foundation and appearing in the file LICENSE.GPL included in the
# packaging of this file.
#
# This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
# WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


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

    singleToText: (string, isFemale) ->
        # console.log 111
        return "undefinded" unless /^[0-9]$/.test string
        # console.log 222
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
        # console.log 333 + " digit="+digit
        return wordByIndex[digit]

        
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
        console.log "rightDigit="+rightDigit+" len="+rightDigit.length
        return wordByIndex[leftDigit - 2] + " " + @singleToText rightDigit, isFemale

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

    degreeText: (  string,  degree) ->

        return "" if  degree < 1 or degree > 4

        if degree == 1
            return " тысяча" if string.endsWith "одна"
            return " тысячи" if string.endsWith("две") || string.endsWith("три") || string.endsWith("четыре")
            return " тысяч"

        if degree == 2
            return " миллион" if string.endsWith "один"
            return " миллиона" if string.endsWith("два") || string.endsWith("три") || string.endsWith("четыре")
            return " миллионов"

        if degree == 3
            return " миллиард" if string.endsWith "один"
            return " миллиарда" if string.endsWith("два") || string.endsWith("три") || string.endsWith("четыре")
            return " миллиардов"

        if degree == 4
            return " триллион" if string.endsWith "один"
            return " триллиона" if string.endsWith("два") || string.endsWith("три") || string.endsWith("четыре")
            return " триллионов"

    toText:  ->
        string = @amount + ""
        degree = 0
        result = ""
        while string.length >= 3
            if !string.endsWith "000"
                # console.log  'string.right(3)='+string.right(3)
                tripleText = @tripleToText string.right(3)
                result = tripleText + @degreeText( tripleText, degree ) + " "+ result
            
            string = string.left( string.length - 3)
            degree++

        if string.length > 0
            if string.length == 2
                coupleSingleText = @coupleToText string, degree == 1
            else
                # console.log "degree="+degree+ " string = "+string
                coupleSingleText = @singleToText string, degree == 1
            
            degreeText = @degreeText( coupleSingleText, degree )
            if result != "" && (coupleSingleText + degreeText) != ""
                result =  coupleSingleText + degreeText + " " + result
            else
                result =  coupleSingleText + degreeText + result

        result.trim()


