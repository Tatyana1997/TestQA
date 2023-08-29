﻿#language: ru

@tree

Функционал: Проверка заполнения справочника Организация

Как Тестировщик я хочу
проверить заполнение справочника Организация
чтобы исключить ошибки при заполнении справочника Организация   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнения справочника Организация
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Организация (создание)'
	И в поле с именем 'Description_ru' я ввожу текст 'Тестовый контрагент'
	И из выпадающего списка с именем "Type" я выбираю точное значение 'Организация'
	И я нажимаю на кнопку с именем 'FormWrite'
	Тогда элемент формы с именем "Type" стал равен 'Организация'
	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	И я нажимаю на кнопку "Записать и закрыть"
	И в таблице "List" я перехожу к строке:
		| 'Наименование'        |
		| 'Тестовый контрагент' |
	И в таблице "List" я выбираю текущую строку
	Тогда элемент формы с именем "Type" стал равен 'Организация'
	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
	И я закрываю все окна клиентского приложения

				