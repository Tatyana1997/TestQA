#language: ru

@tree

Функционал: тестирование отражения возвратов в отчете D2001 Продажи

Как Тестировщик я хочу
проверить откражение возвратов в отчете D2001 Продажи 
чтобы исключить некорректное заполнение отчета

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Сценарий: подготовнительный сценарий (загрузка документа Возврат товара)
		// Document.SalesReturn

	// Документ.SalesReturn

	И я проверяю или создаю для документа "SalesReturn" объекты:
		| 'Ref'                                                                  | 'DeletionMark' | 'Number' | 'Date'                | 'Posted' | 'Agreement'                                                          | 'BaseDocument' | 'Company'                                                           | 'Currency'                                                           | 'DateOfShipment'     | 'LegalName'                                                         | 'ManagerSegment' | 'Partner'                                                          | 'PriceIncludeTax' | 'DueAsAdvance' | 'LegalNameContract' | 'Author'                                                        | 'Branch' | 'Description' | 'DocumentAmount' |
		| 'e1cib/data/Document.SalesReturn?ref=8c7a2c6dc111657411ee471214650d7c' | 'False'        | 3        | '30.08.2023 11:57:16' | 'True'   | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6867' | ''             | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | '01.01.0001 0:00:00' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7674324a4a2a' | ''               | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794b' | 'True'            | 'False'        | ''                  | 'e1cib/data/Catalog.Users?ref=aa7f120ed92fbced11eb13d7279770c0' | ''       | ''            | 15000            |

	И я перезаполняю для объекта табличную часть "ItemList":
		| 'Ref'                                                                  | 'Key'                                  | 'Cancel' | 'ItemKey'                                                          | 'Store'                                                          | 'NetAmount' | 'OffersAmount' | 'Price' | 'PriceType'                                             | 'Quantity' | 'TaxAmount' | 'TotalAmount' | 'Unit'                                                          | 'SalesReturnOrder' | 'SalesInvoice' | 'DontCalculateRow' | 'QuantityInBaseUnit' | 'ProfitLossCenter' | 'RevenueType' | 'AdditionalAnalytic' | 'UseGoodsReceipt' | 'ReturnReason' |
		| 'e1cib/data/Document.SalesReturn?ref=8c7a2c6dc111657411ee471214650d7c' | '3419bf77-0b1a-46c5-a4db-b846a41876dd' | 'False'  | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb76684b9f687e' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 12500       |                | 1500    | 'e1cib/data/Catalog.PriceTypes?refName=ManualPriceType' | 10         | 2500        | 15000         | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | ''                 | ''             | 'False'            | 10                   | ''                 | ''            | ''                   | 'True'            | ''             |

	И я перезаполняю для объекта табличную часть "TaxList":
		| 'Ref'                                                                  | 'Key'                                  | 'Tax'                                                           | 'Amount' | 'Analytics' | 'TaxRate'                                                          | 'IncludeToTotalAmount' | 'ManualAmount' |
		| 'e1cib/data/Document.SalesReturn?ref=8c7a2c6dc111657411ee471214650d7c' | '3419bf77-0b1a-46c5-a4db-b846a41876dd' | 'e1cib/data/Catalog.Taxes?ref=b762b13668d0905011eb7663e35d7970' | 2500     | ''          | 'e1cib/data/Catalog.TaxRates?ref=b762b13668d0905011eb7663e35d796c' | 'True'                 | 2500           |

	И я перезаполняю для объекта табличную часть "Currencies":
		| 'Ref'                                                                  | 'CurrencyFrom'                                                       | 'Rate' | 'ReverseRate' | 'ShowReverseRate' | 'Multiplicity' | 'Key' | 'MovementType'                                                                                    | 'Amount' | 'IsFixed' |
		| 'e1cib/data/Document.SalesReturn?ref=8c7a2c6dc111657411ee471214650d7c' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | ''    | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 15000    | 'False'   |
		| 'e1cib/data/Document.SalesReturn?ref=8c7a2c6dc111657411ee471214650d7c' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 0.859  | 1.1641        | 'False'           | 1              | ''    | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796a' | 12885    | 'False'   |
		| 'e1cib/data/Document.SalesReturn?ref=8c7a2c6dc111657411ee471214650d7c' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | ''    | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7968' | 15000    | 'False'   |
		| 'e1cib/data/Document.SalesReturn?ref=8c7a2c6dc111657411ee471214650d7c' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' |        |               | 'False'           |                | ''    | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7969' |          | 'False'   |

	И я перезаполняю для объекта табличную часть "RowIDInfo":
		| 'Ref'                                                                  | 'Key'                                  | 'RowID'                                | 'Quantity' | 'Basis' | 'CurrentStep' | 'NextStep'                                    | 'RowRef'                                                         | 'BasisKey' |
		| 'e1cib/data/Document.SalesReturn?ref=8c7a2c6dc111657411ee471214650d7c' | '3419bf77-0b1a-46c5-a4db-b846a41876dd' | '3419bf77-0b1a-46c5-a4db-b846a41876dd' | 10         | ''      | ''            | 'e1cib/data/Catalog.MovementRules?refName=GR' | 'e1cib/data/Catalog.RowIDs?ref=8c7a2c6dc111657411ee471214650d7b' | ''         |


Сценарий: тестирование отражения возвратов в отчете D2001 Продажи
	* Проверка отражения в отчете документа под помером
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesReturn"
		И в таблице "List" я перехожу к строке:
			| 'Номер' |
			| '3'     |
		И в таблице "List" я активизирую поле с именем "Date"
		И в таблице "List" я активизирую поле с именем "Number"
		И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
		Тогда открылось окно 'Движения документа'
		И в табличном документе 'ResultTable' я перехожу к ячейке "R1C1"
		И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R2001 Продажи'
		И я нажимаю на кнопку с именем 'GenerateReport'
		Дано Табличный документ "ResultTable" равен макету "ОтчетПродажи"
		