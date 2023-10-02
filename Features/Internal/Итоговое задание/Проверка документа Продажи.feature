﻿#language: ru

@tree

Функционал: Проыерка документа Продажи

Как Тестировщик я хочу
проверить Документ Продажи
чтобы проверить соответствие его работы требованиям   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа Продажи
	* Открытие
		Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
	* Заполнение шапки
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
		И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Животноводство ООО '
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
	* Заполнение табличной части
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Продукты'     |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Торт '        |
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '15,00'
		И в таблице "Товары" я завершаю редактирование строки
	* Зполнение вкладки Прочее
		И я перехожу к закладке с именем "Прочее"
		И в поле с именем 'ОбоснованиеОтгрузки' я ввожу текст 'Можно вводить обоснование отгрузки'		
	* Запись и проведение
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

		И я запоминаю значение поля "Номер" как "$$$$Номер$$$$"		
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Продажа товара (создание) *' в течение 20 секунд
	* Проверка того, что документ создался
		Тогда таблица "Список" содержит строки:
			| 'Номер'     | 'Организация'        | 'Покупатель'          | 'Склад'               |
			| '$$Номер$$' | 'ООО "1000 мелочей"' | 'Животноводство ООО ' | 'Склад отдела продаж'   |
Сценарий: проверка появления и доступности поля Валюта взаиморасчетов
	* Открытие ранее созданного документа'
		Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И в таблице "Список" я перехожу к строке:
			| 'Номер'   | 'Организация'        | 'Покупатель'          | 'Склад'               |
			| '$$Номер$$' | 'ООО "1000 мелочей"' | 'Животноводство ООО ' | 'Склад отдела продаж' |
		И в таблице "Список" я выбираю текущую строку
	* Проверка на недоступность поля взаиморасчетов
		И поле "Валюта взиморасчетов" не существует
	* Проверка на недоступность поля взаиморасчетов при перевыборе контрагента
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"''
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'EUR'
	* Записать и закрыть
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Продажа * от * *' в течение 20 секунд
Сценарий: проверка корректности заполненной шапки документа
	* Открытие документа
		Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И в таблице "Список" я перехожу к строке:
			| 'Номер'     | 'Организация'        | 'Покупатель'          | 'Склад'               |
			| '$$Номер$$' | 'ООО "Все для дома"' | 'Животноводство ООО ' | 'Склад отдела продаж' |
		И в таблице "Список" я выбираю текущую строку
	* Проверка данных в форме
		И реквизиты формы имеют значение:
			| 'Имя'                  | 'Значение'                           |
			| 'Валюта'               | 'EUR'                                |
			| 'ВидЦен'               | 'Оптовая'                            |
			| 'Номер'                | '$$Номер$$'                          |
			| 'ОбоснованиеОтгрузки'  | 'Можно вводить обоснование отгрузки' |
			| 'Организация'          | 'ООО \"Все для дома\"'               |
			| 'Покупатель'           | 'Животноводство ООО '                |
			| 'Склад'                | 'Склад отдела продаж'                |
			| 'ТоварыИтогКоличество' | '15'                                 |
			| 'ТоварыИтогСумма'      | '1 500'                              |
Сценарий: проверка расчета итогового количества и суммы 
	* открытие документа
		Дано я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И в таблице "Список" я перехожу к строке:
			| 'Номер'   | 'Организация'        | 'Покупатель'          | 'Склад'               |
			| '$$Номер$$' | 'ООО "Все для дома"' | 'Животноводство ООО ' | 'Склад отдела продаж' |
		И в таблице "Список" я выбираю текущую строку
	* изменение цены
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Veko345MO'
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '10 000,00'
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,00'	
		И в таблице "Товары" я завершаю редактирование строки				
	* Проверка итогового количества и суммы
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '20'	
		И элемент формы с именем "ТоварыИтогСумма" стал равен '51 500'				
	* проверка расчета итогового количества и суммы при изменении количества
		И в таблице "Товары" я перехожу к строке:
			| 'Товар'     |
			| 'Veko345MO' |
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,00'
		И в таблице "Товары" я завершаю редактирование строки
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '16'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '11 500'
	* проверка расчета итогового количества и суммы при изменении цены
		И в таблице "Товары" я перехожу к строке:
			| 'Товар'     |
			| 'Veko345MO' |
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '11 200,00'
		И в таблице "Товары" я завершаю редактирование строки
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '16'
		И элемент формы с именем "ТоварыИтогСумма" стал равен "12 700"
Сценарий: проверка изменения цены и количества у Услуги
	* Открытие документа
		Дано я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И в таблице "Список" я перехожу к строке:
			| 'Номер'   | 'Организация'        | 'Покупатель'          | 'Склад'               |
			| '$$Номер$$' | 'ООО "Все для дома"' | 'Животноводство ООО ' | 'Склад отдела продаж' |
		И в таблице "Список" я выбираю текущую строку
	* Изменение количества
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Доставка'
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,00'
Сценарий: удаление созданного документа
	Дано я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И в таблице "Список" я перехожу к строке:
			| 'Номер'   | 'Организация'        | 'Покупатель'          | 'Склад'               |
			| '$$Номер$$' | 'ООО "Все для дома"' | 'Животноводство ООО ' | 'Склад отдела продаж' |
	И я нажимаю на кнопку с именем 'ФормаУдалить'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button0'

Сценарий: проверка движений по регистру продаж и регистру товарный запасов и печетной формы Расходная накладная
	* Открытие документа продажи товара
		Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И в таблице "Список" я перехожу к строке:

			| 'Номер'     | 'Организация'        | 'Покупатель'      | 'Склад'               | 'Валюта взаиморасчетов' | 'Вид цен'   |
			| '000000001' | 'ООО "1000 мелочей"' | 'Магазин "Обувь"' | 'Склад отдела продаж' | ''                      | 'Розничная' |			
		И в таблице "Список" я выбираю текущую строку
	* Проверка движений по регистру продаж
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
		Тогда таблица "Список" стала равной:
			| 'Покупатель'      | 'Товар'       | 'Количество' | 'Сумма'      |
			| 'Магазин "Обувь"' | 'Торт '       | '12,00'      | '3 600,00'   |
			| 'Магазин "Обувь"' | 'Доставка'    | '1,00'       | '300,00'     |
			| 'Магазин "Обувь"' | 'Ремонт'      | '1,00'       | '100 000,00' |
			| 'Магазин "Обувь"' | 'Veko345MO'   | '10,00'      | '200 000,00' |
			| 'Магазин "Обувь"' | 'Sony К3456P' | '3,00'       | '30 000,00'  |
	* Проверка движений по регистру товарных запасов	
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
		Тогда таблица "Список" стала равной:
			| 'Товар'       | 'Склад'               | 'Количество' |
			| 'Торт '       | 'Склад отдела продаж' | '12,00'      |
			| 'Veko345MO'   | 'Склад отдела продаж' | '10,00'      |
			| 'Sony К3456P' | 'Склад отдела продаж' | '3,00'       |
	* Проверка печатной формы
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
		И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
		Тогда табличный документ "SpreadsheetDocument" содержит строки:
			| 'Расход товара' | ''                                                             | ''           | ''        |
			| ''              | ''                                                             | ''           | ''        |
			| 'Номер'         | '000000001'                                                    | ''           | ''        |
			| 'Покупатель'    | 'Магазин "Обувь"'                                              | ''           | ''        |
			| 'Склад'         | 'Склад отдела продаж'                                          | ''           | ''        |
			| 'Сумма'         | '333 900 рублей (Триста тридцать три тысячи девятьсот рублей)' | ''           | ''        |
			| 'Вес'           | ''                                                             | ''           | ''        |
			| ''              | ''                                                             | ''           | ''        |
			| 'Товар'         | 'Цена'                                                         | 'Количество' | 'Сумма'   |
			| 'Торт '         | '300'                                                          | '12'         | '3 600'   |
			| 'Доставка'      | '300'                                                          | '1'          | '300'     |
			| 'Ремонт'        | '100 000'                                                      | '1'          | '100 000' |
			| 'Veko345MO'     | '20 000'                                                       | '10'         | '200 000' |
			| 'Sony К3456P'   | '10 000'                                                       | '3'          | '30 000'  |
Сценарий: проверка движений по регистру продаж и регистру товарный запасов и печатной формы расходная накладная, если документ не проведен
	* Снятие проведений у документа
		Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И в таблице "Список" я перехожу к строке:
			| 'Номер'     | 'Организация'        | 'Покупатель'      | 'Склад'               | 'Валюта взаиморасчетов' | 'Вид цен'   |
			| '000000001' | 'ООО "1000 мелочей"' | 'Магазин "Обувь"' | 'Склад отдела продаж' | ''                      | 'Розничная' |
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"			
	* Открытие документа продажи товара
		И в таблице "Список" я выбираю текущую строку
	* Проверка движений по регистру продаж
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
		Тогда в таблице "Список" количество строк "равно" 0
	* Проверка движений по тегистру товарных запасов	
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
		Тогда в таблице "Список" количество строк "равно" 0	
	* Проверка печатной формы
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
		И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
		Тогда в логе сообщений TestClient есть строка по шаблону "Документ не проведен*"									
Сценарий: проведение документа
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И в таблице "Список" я перехожу к строке:
		| 'Номер'     | 'Организация'        | 'Покупатель'      | 'Склад'               | 'Валюта взаиморасчетов' | 'Вид цен'   |
		| '000000001' | 'ООО "1000 мелочей"' | 'Магазин "Обувь"' | 'Склад отдела продаж' | ''                      | 'Розничная' |
	И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюПровести' на элементе формы с именем "Список"


	
		
				
		
				

		