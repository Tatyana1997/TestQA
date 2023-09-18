﻿#language: ru

@tree

Функционал: проверка заполнения поля Организация в документе Заказ клиента

Как Тестироващик я хочу
проверить заполнения поля Организаци в документе Заказ клиента 
чтобы заполнить поле вручную, если оно не заполнилось автоматически  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка заполнения поля Организация
* В соглашении не заполнена Организация
Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
И я нажимаю на кнопку с именем 'FormCreate'
И я нажимаю кнопку выбора у поля с именем "Partner"
Тогда открылось окно 'Партнеры'
И в таблице "List" я перехожу к строке:
	| 'Код' | 'Наименование'       |
	| '12'  | 'Розничный клиент 1' |
И в таблице "List" я выбираю текущую строку
* Проверка на то, заполнилась ли Организация из соглашения
	И я нажимаю на кнопку открытия поля с именем "Agreement"
	И я запоминаю значение поля "Организация" как "Организация"
	И я закрываю текущее окно
* Проверка на заполнение организации из справочника
	Если элемент формы с именем "Company" стал равен '$Организация$' Тогда
		Если элемент формы с именем "Company" стал равен '' Тогда
			И я нажимаю кнопку выбора у поля с именем "Company"
			И в таблице "List" я перехожу к строке:
				| 'Код' | 'Наименование'           |
				| '1'   | 'Собственная компания 1' |
			И в таблице "List" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна 'Заказ покупателя * от *' в течение 20 секунд
	И я закрываю все окна клиентского приложения

	



