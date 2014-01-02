AmountInWords
======

CoffeeScript класс AmountInWords преобразует целое положительное число 
в пропись.  
Пример: "999035" будет преобразовано в "девятьсот девяносто девять тысяч тридцать пять"  


### Установка
	# Перейдите во временную пустую папку  
	# Получите код  
	git clone https://github.com/app/apptools.git  
	# Установите зависимости  
	cd apptools/amount-in-words.coffee/  
	npm install  
	# Скопируйте папку node_modules/ и файл AmountInWords.coffee в свой проект  
	cp -r node_modules/ AmountInWords.coffee <PATH-TO-YOU-PROJECT/>  


### Запуск тестов
 
	git clone https://github.com/app/apptools.git  
	cd apptools/amount-in-words.coffee/  
	npm install  
	make test 


### Пример использования
	# В начале файла поместите  
	AmountInWords = require "./AmountInWords"  

	# Создайте экземпляр класса, указав в качестве параметра преобразуемое число  
	total = new AmountInWords "999035"  
	console.log total.toText()  
	# выведет на экран  
	девятьсот девяносто девять тысяч тридцать пять  

Удачи!