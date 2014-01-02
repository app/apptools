AmountInWords
======

CoffeeScript класс AmountInWords преобразует целое положительное число 
в пропись.  
Пример: "999035" будет преобразовано в "девятьсот девяносто девять тысяч тридцать пять"  
Диапазон поддерживаемых чисел - от 0 (ноль) до 999999999999999 (девятьсот девяносто девять триллионов девятьсот девяносто девять миллиардов девятьсот девяносто девять миллионов девятьсот девяносто девять тысяч девятьсот девяносто девять)  


### Установка
	# Перейдите во временную пустую папку  
	# Получите код apptools  
	git clone https://github.com/app/apptools.git  
	# Скопируйте файл AmountInWords.coffee в свой проект  
	cp -r apptools/amount-in-words.coffee/AmountInWords.coffee <PATH-TO-YOU-PROJECT/>  


### Пример использования
	# В начале файла поместите  
	AmountInWords = require "./AmountInWords"  

	# Создайте экземпляр класса, указав в качестве параметра преобразуемое число  
	total = new AmountInWords "999035"  
	console.log total.toText()  
	# выведет на экран  
	девятьсот девяносто девять тысяч тридцать пять  


### Запуск тестов
 
	git clone https://github.com/app/apptools.git  
	cd apptools/amount-in-words.coffee/  
	npm install  
	make test 



Удачи!