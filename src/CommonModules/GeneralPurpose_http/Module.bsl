
#Область СтандартныеСтруктурыОтветов
 
// Функция - положительный ответ HTTP сервиса
//
// Параметры:
//  Данные		 - Любой - любые данные, с которыми нужно сформировать ответ
//  КодСостояния - Число - код ответа HTTP сервиса, можно переопределить (не рекомендуется)
//  Причина		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
// 
// Возвращаемое значение:
//   Структура - Новый Структура("КодСостояния, Причина") или Новый Структура("КодСостояния, Причина, Данные")
//
Функция ОтветОК(Данные = Неопределено, КодСостояния = 200, Причина = "Ok.") Экспорт
	
	Структура = Новый Структура;
	Структура.Вставить("КодСостояния", КодСостояния);
	Структура.Вставить("Причина", Причина);
	
	Если Данные <> Неопределено Тогда
		Структура.Вставить("Данные", Данные);
	КонецЕсли;
	
	Возврат Структура;
	
КонецФункции

// Функция - ответ без данных.
//
// Параметры:
//  КодСостояния - Число - код ответа HTTP сервиса, можно переопределить (не рекомендуется)
//  Причина		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
// 
// Возвращаемое значение:
//   Структура - Новый Структура("КодСостояния, Причина")
// 
Функция ОтветПустоеТело(КодСостояния = 204, Причина = "No content.") Экспорт
	
	Структура = Новый Структура;
	Структура.Вставить("КодСостояния", КодСостояния);
	Структура.Вставить("Причина", Причина);
	
	Возврат Структура;
	
КонецФункции

// Функция - положительный ответ HTTP сервиса
//
// Параметры:
//  КодСостояния - Число - код ответа HTTP сервиса, можно переопределить (не рекомендуется)
//  Причина		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
//  Представление - Строка - представление поля
// 
// Возвращаемое значение:
//   Структура - Структура("КодСостояния, Причина") или Новый Структура("КодСостояния, Причина, Данные")
//
Функция ОтветТребуетсяЗаполитьПараметр(КодСостояния = 400, Причина = "Request failed. Parameter is filled incorrectly",
	 Представление = "") Экспорт
	
	Структура = Новый Структура;
	Структура.Вставить("КодСостояния", КодСостояния);
	Структура.Вставить("Причина", СтрШаблон(Причина + ": %1", Представление));
	Возврат Структура;
	
КонецФункции

// Функция - ответ ошибка, должно быть передано тело.
//
// Параметры:
//  КодСостояния - Число - код ответа HTTP сервиса, можно переопределить (не рекомендуется)
//  Причина		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
// 
// Возвращаемое значение:
//   Структура - Новый Структура("КодСостояния, Причина")
// 
Функция ОтветОшибкаПустоеТело(КодСостояния = 400, Причина = "Request failed. Empty request body.") Экспорт
	
	Структура = Новый Структура;
	Структура.Вставить("КодСостояния", КодСостояния);
	Структура.Вставить("Причина", Причина);
	
	Возврат Структура;
	
КонецФункции

// Функция - ответ ошибка, не заполнен переданный в запрос JSON.
//
// Параметры:
//  КодСостояния - Число - код ответа HTTP сервиса, можно переопределить (не рекомендуется)
//  Причина		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
// 
// Возвращаемое значение:
//   Структура - Новый Структура("КодСостояния, Причина")
// 
Функция ОтветОшибкаПустойJSON(КодСостояния = 400, Причина = "Request failed. Empty JSON file.") Экспорт
	
	Структура = Новый Структура;
	Структура.Вставить("КодСостояния", КодСостояния);
	Структура.Вставить("Причина", Причина);
	
	Возврат Структура;
	
КонецФункции

// Функция - ответ ошибка, не удалось сериализовать JSON.
//
// Параметры:
//  КодСостояния - Число - код ответа HTTP сервиса, можно переопределить (не рекомендуется)
//  Причина		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
//  Представление		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
// Возвращаемое значение:
//   Структура - Новый Структура("КодСостояния, Причина")
//
Функция ОтветОшибкаСериализацииРеквизита(КодСостояния = 400, 
	Причина = "Request failed. Parameter is filled incorrectly: %1", Представление = "") Экспорт
	
	Структура = Новый Структура;
	Структура.Вставить("КодСостояния", КодСостояния);
	Структура.Вставить("Причина", СтрШаблон(Причина, Представление));
	Возврат Структура;
	
КонецФункции

// Функция - ответ ошибка, не ничего не найдено.
//
// Параметры:
//  КодСостояния - Число - код ответа HTTP сервиса, можно переопределить (не рекомендуется)
//  Причина		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
// 
// Возвращаемое значение:
//   Структура - Новый Структура("КодСостояния, Причина")
// 
Функция ОтветНеНайдено(КодСостояния = 404, Причина = "Not found.") Экспорт
	
	Структура = Новый Структура;
	Структура.Вставить("КодСостояния", КодСостояния);
	Структура.Вставить("Причина", Причина);
	
	Возврат Структура;
	
КонецФункции

// Функция - ответ, непредвиденная ошибка.
//
// Параметры:
//  КодСостояния - Число - код ответа HTTP сервиса, можно переопределить (не рекомендуется)
//  Причина		 - Строка - текст ответа HTTP сервиса для пользователя, можно переопределить (не рекомендуется)
// 
// Возвращаемое значение:
//   Структура - Новый Структура("КодСостояния, Причина")
Функция ОтветНепредвиденнаяОшибка(КодСостояния = 500,
	Причина = "Unexpected error. Report - https://bpm.mbrd.ru/portal") Экспорт
	
	Структура = Новый Структура;
	Структура.Вставить("КодСостояния", КодСостояния);
	Структура.Вставить("Причина", Причина);
	Возврат Структура;
	
КонецФункции

#КонецОбласти


#Область СериализацияОтветов

// Функция формирует стандартный ответ HTTP сервиса.
//
// Параметры:
//  СтруктураОтвета - Структура -
//					** Код - Число - код ответа, который нужно вернуть.
//					** Причина - Строка - описание ошибки для пользователя.
//					** Данные - Структура("Данные", Данные) - (не обязательно) - если запрос должен вернуть какие-то
// данные, то их нужно передать в эту переменную.
// СоответствиеПолей - Соответствие - ключом является ключ в структуре ответа и значение, на которое нужно заменить 
// структуру ключа.
//  СтандартноеСоответствие - Булево - см. СтандартноеСоответствиеИмен().
// 
// Возвращаемое значение:
//   HTTPСервисОтвет - ОтветHTTP;
Функция СтандартныйОтветJSON(СтруктураОтвета, СоответствиеПолей = Неопределено,
	СтандартноеСоответствие = Истина) Экспорт
	
	ЗаголовокТипКонтентаJSON = ЗаголовокТипКонтентаJSON();
	СтрокаJSON = СтруктуруОтветаВСтрокуJSON(СтруктураОтвета, СоответствиеПолей, СтандартноеСоответствие);
	
	Ответ = Новый HTTPСервисОтвет(СтруктураОтвета.КодСостояния);
	Ответ.УстановитьТелоИзСтроки(СтрокаJSON);
	Ответ.Заголовки.Вставить(ЗаголовокТипКонтентаJSON.Ключ,
		ЗаголовокТипКонтентаJSON.Тело);
	
	Возврат Ответ;
	
КонецФункции


// !Рекурсивное преобразование структуры по перечню имен в соответствии в JSON
// 
// Структура - Структура - стандартное представление, которое нужно перевести, см. СтандартныйОтветJSON
// СоответствиеПолей - Сответствие - список имен для перевода и значений, в которые переводим. 
// СтандартноеСоответствие - булево - определить Имена по умолчанию, см. СтандартноеСоответствиеИмен()
// 
// *Может содержать в себе другую структуру, массив, массив структур или соответствие.   
// **Если стандартное соответствие = истина и Передано СоответствиеПолей, то стандартные поля добавятся к переданным
Функция СтруктуруОтветаВСтрокуJSON(Структура, СоответствиеПолей, СтандартноеСоответствие) Экспорт
	
	Если СтандартноеСоответствие Тогда
		СоответствиеПолей = СформироватьСтандартноеСоответствиеИмен(СоответствиеПолей);
	КонецЕсли;
	
	НоваяСтруктура = Новый Структура;
	Для Каждого Поле Из Структура Цикл
			
		ИмяСоответственно = Поле.Ключ;
		
		Если ЗначениеЗаполнено(СоответствиеПолей) Тогда
			ИмяСоответственно = СоответствиеПолей.Получить(Поле.Ключ);
			ИмяСоответственно = ?(ЗначениеЗаполнено(ИмяСоответственно), ИмяСоответственно, Поле.Ключ);
		КонецЕсли;
			
		Если ТипЗнч(Поле.Значение) = Тип("Массив") Тогда
			НовыйМассив = РазобратьМассивЭлементов(Поле.Значение, СоответствиеПолей);
			НоваяСтруктура.Вставить(ИмяСоответственно, НовыйМассив);
		ИначеЕсли ТипЗнч(Поле.Значение) = Тип("Структура") Тогда
			НоваяСтруктура.Вставить(ИмяСоответственно, РазобратьСтруктуруЭлементов(Поле.Значение, СоответствиеПолей));
		Иначе
			НоваяСтруктура.Вставить(ИмяСоответственно, Поле.Значение);
		КонецЕсли;
	КонецЦикла;
	
	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();
	ЗаписатьJSON(ЗаписьJSON, НоваяСтруктура);
	СтрокаJSON = ЗаписьJSON.Закрыть();
	
	Возврат СтрокаJSON;
	
КонецФункции

Функция РазобратьМассивЭлементов(Массив, СоответствиеПолей)

	НовыйМассив = Новый Массив;
	Для Каждого Элемент Из Массив Цикл
		
		Если ТипЗнч(Элемент) = Тип("Структура") Тогда
			
			НоваяСтруктура = Новый Структура;
			Для Каждого Поле Из Элемент Цикл
				
				ИмяСоответственно = Поле.Ключ;
		
				Если ЗначениеЗаполнено(СоответствиеПолей) Тогда
					ИмяСоответственно = СоответствиеПолей.Получить(Поле.Ключ);
					ИмяСоответственно = ?(ЗначениеЗаполнено(ИмяСоответственно), ИмяСоответственно, Поле.Ключ);
				КонецЕсли;
				
				Если ТипЗнч(Поле.Значение) = Тип("Массив") Тогда
					НовыйМассивЭлемента = РазобратьМассивЭлементов(Поле.Значение, СоответствиеПолей);
					НоваяСтруктура.Вставить(ИмяСоответственно, НовыйМассивЭлемента);
				Иначе
					НоваяСтруктура.Вставить(ИмяСоответственно, Поле.Значение);
				КонецЕсли;
				
			КонецЦикла;
			
			НовыйМассив.Добавить(НоваяСтруктура);
		Иначе
			НовыйМассив.Добавить(Элемент);
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат НовыйМассив;
	
КонецФункции

Функция РазобратьСтруктуруЭлементов(Структура, СоответствиеПолей)
	
	НоваяСтруктура = Новый Структура;
	Для Каждого Поле Из Структура Цикл
		
		ИмяСоответственно = Поле.Ключ;
		
		Если ЗначениеЗаполнено(СоответствиеПолей) Тогда
			ИмяСоответственно = СоответствиеПолей.Получить(Поле.Ключ);
			ИмяСоответственно = ?(ЗначениеЗаполнено(ИмяСоответственно), ИмяСоответственно, Поле.Ключ);
		КонецЕсли;
		
		Если ТипЗнч(Поле.Значение) = Тип("Массив") Тогда
			НовыйМассив = РазобратьМассивЭлементов(Поле.Значение, СоответствиеПолей);
			НоваяСтруктура.Вставить(ИмяСоответственно, НовыйМассив);
		ИначеЕсли ТипЗнч(Поле.Значение) = Тип("Структура") Тогда
			НоваяСтруктура.Вставить(ИмяСоответственно, РазобратьСтруктуруЭлементов(Поле.Значение, СоответствиеПолей));
		Иначе
			НоваяСтруктура.Вставить(ИмяСоответственно, Поле.Значение);
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат НоваяСтруктура;
	
КонецФункции


Функция СформироватьСтандартноеСоответствиеИмен(СоответствиеПолей = Неопределено) Экспорт
	
	Если СоответствиеПолей = Неопределено Тогда
		СоответствиеПолей = Новый Соответствие;
	КонецЕсли;
	
	СтандартноеСоответствие = СтандартноеСоответствиеИмен();
	Для Каждого Элемент Из СтандартноеСоответствие Цикл
		Если НЕ ЗначениеЗаполнено(СоответствиеПолей.Получить(Элемент.Ключ)) Тогда
			СоответствиеПолей.Вставить(Элемент.Ключ, Элемент.Значение);
		КонецЕсли;
	КонецЦикла;
	
	Возврат СоответствиеПолей;
	
КонецФункции

#КонецОбласти


#Область КонстантыHTTP

// Функция - Заголовок тип контента JSON
// 
// Возвращаемое значение:
//   - Структура - Ключ - Content-Type, Тело - application/json
//
Функция ЗаголовокТипКонтентаJSON() Экспорт
	
	Структура = Новый Структура("Ключ, Тело");
	Структура.Ключ = "Content-Type";
	Структура.Тело = "application/json";
	Возврат Структура;
	
КонецФункции

// Функция - Стандартное соответствие имен
//
Функция СтандартноеСоответствиеИмен() Экспорт
	
	Соответствие = Новый Соответствие;
	Соответствие.Вставить("КодСостояния", "Code");
	Соответствие.Вставить("Причина", "Reason");
	Соответствие.Вставить("Данные", "Data");
	
	Возврат Соответствие;
	
КонецФункции

#КонецОбласти


#Область ПреобразованиеJSONСтандартное

// Функция - Получить строку ответа
//
// Параметры:
//  СтруктураОтвета	 - Структура - любая структура
// 
// Возвращаемое значение:
//   - Строка - СтрокаJSON
//
Функция ПолучитьСтрокуОтвета(СтруктураОтвета) Экспорт
	
	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();
	ЗаписатьJSON(ЗаписьJSON, СтруктураОтвета);
	СтрокаJSON = ЗаписьJSON.Закрыть();
	
	Возврат СтрокаJSON;
	
КонецФункции

// Функция - Получить строку ответа
//
// Параметры:
//  СтрокаJSON	 - Строка - любая строка
// 
// Возвращаемое значение:
//   - Структура - структура по JSON
//
Функция ПолучитьСтруктуруОтвета(СтрокаJSON) Экспорт
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(СтрокаJSON);
	Структура = ПрочитатьJSON(ЧтениеJSON);
	ЧтениеJSON.Закрыть();
	
	Возврат Структура;
	
КонецФункции


// Функция - Выбрать различные данные ИЗМассива структур HTTPЗапроса
//
// Параметры:
//  ДанныеЗапроса	 - МассивСтруктур - любой массив со структурами
// 
// Возвращаемое значение:
//   - массив - Массив возвращаемого значения
//
Функция ВыбратьРазличныеДанныеИЗМассиваСтруктурHTTPЗапроса(ДанныеЗапроса) Экспорт
	
//	TODO Преобразовать массив в таблицу значений
//	ТЗ = СлужебныйСервер.ПреобразоватьМассивВТаблицуЗначений(ДанныеЗапроса);
//	МассивКолонок = Новый Массив;
//	Для Каждого Колонка ИЗ ТЗ.Колонки Цикл
//		МассивКолонок.Добавить(Колонка.Имя);
//	КонецЦикла;
//	ТЗ.Свернуть(СтрСоединить(МассивКолонок, ","));
//	TODO Преобразовать таблицу значений в массив
//	ДанныеЗапроса = ОбщегоНазначения.ТаблицаЗначенийВМассив(ТЗ);
//	
//	Возврат ДанныеЗапроса;
//	
КонецФункции

#КонецОбласти

#Область РаботаСИсключениями

// Функция - Обработать информацию об ошибке
//
// Параметры:
//  ИнформацияОбОшибке	 - ИнформацияОбОшибке - ошибка, которую нужно обработать.
//  HTTPЗапрос			 - HTTPЗапрос - обрабатываемый запрос.
// 
// Возвращаемое значение:
//   - Структура - структура для ответа пользователю.
//
Функция ОбработатьИнформациюОбОшибке(ИнформацияОбОшибке, HTTPЗапрос) Экспорт
	
	ТекстОшибкиJSON = ИнформацияОбОшибке.Описание;
	БазовыйURL = HTTPЗапрос.БазовыйURL;
	ТелоЗапроса = HTTPЗапрос.ПолучитьТелоКакСтроку();
	
	Если ЗначениеЗаполнено(ТекстОшибкиJSON) И ЭтоJSON(ТекстОшибкиJSON) Тогда
		СтруктураОтвета = ПолучитьСтруктуруОтвета(ТекстОшибкиJSON);
		СформироватьЗаписьОбОшибкеВЖурналРегистрации(ИнформацияОбОшибке, БазовыйURL, ТелоЗапроса);
	Иначе
		СтруктураОтвета = ОтветНепредвиденнаяОшибка();
		СформироватьЗаписьОбОшибкеВЖурналРегистрации(ИнформацияОбОшибке, БазовыйURL, ТелоЗапроса);
	КонецЕсли;
	
	Возврат СтруктураОтвета;
	
КонецФункции

Процедура СформироватьЗаписьОбОшибкеВЖурналРегистрации(ИнформацияОбОшибке, БазовыйURL, ТелоЗапроса)
	
	ШаблонОшибки = СтрШаблон("Имя модуля - %1, Строка %2, Номер строки - %3, ИнформацияОбОшибке - %4",
		ИнформацияОбОшибке.ИмяМодуля,
		ИнформацияОбОшибке.ИсходнаяСтрока,
		ИнформацияОбОшибке.НомерСтроки,
		ИнформацияОбОшибке.Описание);
	ДетализацияПоОшибке = СтрШаблон("URL: %1, ТелоЗапроса: %2", БазовыйURL, ТелоЗапроса);
		
	ЗаписьЖурналаРегистрации("Ошибка работы HTTP сервиса",
		УровеньЖурналаРегистрации.Ошибка,,
		ДетализацияПоОшибке,
		ШаблонОшибки);
	
КонецПроцедуры

#КонецОбласти


#Область СлужебныеПроцедурыИФункции

// Функция - Это JSON
//
// Параметры:
//  ТекстJSON - любой текст JSON - 
// 
// Возвращаемое значение:
//   Булево - это JSON
//
Функция ЭтоJSON(ТекстJSON) Экспорт
	// TODO так делать нельзя, это плохо, нужно как-то проверить, является ли строка JSON или
	// завернуть стандартные ошибки 1С в JSON универсально
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(ТекстJSON);
	
	Попытка 
		ПрочитатьJSON(ЧтениеJSON, Истина);
		Возврат Истина;
	Исключение
		Возврат Ложь;
	КонецПопытки;
		
КонецФункции


// Функция - Получить представление реквизита для ответа пользователю HTTP запроса
// и сформировать имя по переданному соответствию имен ключей
//
// Параметры:
//  Ключ		 - Строка - реквизит, который необходимо представить
//  Данные		 - Строка - данные реквизита
//  Соответствие - Соответствие - соответствие реквизитов, пример см. СтандартноеСоответствиеИмен  
// 
// Возвращаемое значение:
//   Строка - текстовое представление из значения соответствия
//
Функция ПолучитьПредставлениеРеквизитаПоСоответствию(Ключ, Данные, Соответствие) Экспорт
	
	Имя = Соответствие.Получить(Ключ);
	Представление = СтрШаблон("%1:%2", Имя, Данные);
	
	Возврат Представление;
	
КонецФункции

// Функция - Получить представление реквизита для ответа пользователю HTTP запроса
//
// Параметры:
//  Ключ	 - Строка - реквизит, который необходимо представить
//  Данные	 - Строка - данные реквизита
// 
// Возвращаемое значение:
//   Строка - текстовое представление из значения соответствия
//
Функция ПолучитьПредставлениеРеквизита(Ключ, Данные) Экспорт
	
	Представление = СтрШаблон("%1:%2", Ключ, Данные);
	
	Возврат Представление;
	
КонецФункции

#КонецОбласти
