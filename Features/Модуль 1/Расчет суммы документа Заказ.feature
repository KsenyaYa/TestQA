﻿#language: ru

@tree

Функционал: расчет суммы документа Заказа при изменении количесва и цены

Как Менеджер по продажам я хочу
расчет суммы документа Заказа
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: созданипе документа Заказа
* Открытие формы создания документа 
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение "Магазин \"Бытовая техника\""
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Большой"
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000007" | "Сланцы"       |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "1"
	И в таблице 'Товары' я завершаю редактирование строки
	И я нажимаю на кнопку "Записать"
* Проверка заполнения табличной части
	Тогда таблица 'Товары' содержит строки:
		| 'Товар'  | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Сланцы' | '500,00' | '1'         | '500,00' |
	И я нажимаю на кнопку "Записать"	
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проверка  расчета суммы документа при изменении количества и цены
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "100,00"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "10"
	Тогда таблица 'Товары' содержит строки:
		| 'Товар'  | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Сланцы' | '100,00' | '10'         | '1 000,00' |
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
* Проверка создания документа Заказа
	 И таблица "Список" содержит строки:
		 | 'Номер' |
		 | '$Номер$'   |

		
	 