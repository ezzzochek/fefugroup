# Класс fefudoc

Репозиторий содержит реализацию класса `fefudoc` для автоматизации сборки документов и учебных материалов в Дальневосточном федеральном университете с помощью программы `XeLaTeX`.

## Требования

* Компиляторы LaTeX, XeLaTeX и Biber, например распространяемые [MikTeX](https://miktex.org/download).
* Текстовый редактор или среда разработки LaTeX, например [TeXstudio](https://texstudio.org/#download).
* Стандартный набор шрифтов Windows или шрифты в составе пакета `fonts-liberation`.

## Содержимое репозитория

Реализация класса выполняется файлом `fefudoc.cls`, а также требуемыми файлами из поддиректории `details`; для компиляции документов класса остальные файлы не требуются.

### Файлы примеров
* `report-example.tex` - пример реферата; использует список литературы из файла `example-sources.bib`;
* `masterthesis-example.tex` - пример магистерской ВКР; использует файлы из директории `главы примеров ВКР`, в которых приведено основное наполнение документа;
* `barchelorthesis-example.tex` - пример бакалаврской ВКР; использует файлы из директории `главы примеров ВКР`, в которых приведено основное наполнение документа;
* `masterthesisreviewv1-example.tex` - пример отзыва руководителя на магистерскую ВКР;
* `barchelorthesisreviewv1-example.tex` - пример отзыва руководителя на магистерскую ВКР;
* `thesisassignmentv1-example.tex` - _устаревшее_ задание на ВКР образца 2022 г;
* `thesisassignmentv2-example.tex` - актуальное задание на ВКР образца 2023 г;
* `thesiscalendarplan-example.tex` - календарный план ВКР образца 2023 г;
* `workbook-example.tex` - учебное пособие использует список литературы из файла `example-sources.bib`;.
* `example-sources.bib` - пример списка библиографических источников.

При создании документов удобно брать за основу соответствующий пример и модифицировать его под собственные нужды.

# Использование

Как и большинство документов LaTeX нестандартных классов или использующих нестандартные расширения, компилируемый документ должен находиться в той же директории, что и файл класса `fefudoc.cls`.