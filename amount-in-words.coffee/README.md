AmountInWords
======

CoffeeScript класс AmountInWords преобразует целое положительное число 
в пропись.  
Пример: "999035" будет преобразовано в "девятсот девяносто девять тысяч тридцать пять"


### Установка
	# Перейдите во временную пустую папку  
	# Получите код  
	git clone https://github.com/app/apptools.git  
	cd apptools/amountInWords.coffee  
	npm install  
	# Скопируйте папку amountInWords.coffee в свой проект  
	# 


# Для запуска тестов в среде bash операционной системы Linux 
# выполните команды
 
	git clone https://github.com/app/apptools.git  
	cd apptools/amountInWords.coffee  
	npm install  
	make test 


### Пример использования
	# В начале файла поместите  
	AmountInWords = require "./AmountInWords"  

	# Создайте экземпляр класса, указав в качестве параметра преобразуемое число  
	total = new AmountInWords "999035"  
	console.log total.toText()  
	# выведет на экран  
	девятсот девяносто девять тысяч тридцать пять  

Удачи!