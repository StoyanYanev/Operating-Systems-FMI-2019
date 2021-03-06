# **Обработка на текст**

**Задача 1**

Сортирайте **/etc/passwd** лексикографски по поле UserID.
```
sort -t: -k3 /etc/passwd
```
**Задача 2**

Сортирайте **/etc/passwd** числово по поле UserID.

(Открийте разликите с лексикографската сортировка)
```
sort -n -t: -k3 /etc/passwd
```
**Задача 3**

Изведете само 1-ва и 5-та колона на файла **/etc/passwd** спрямо разделител
**":"**.
```
cut -d: -f1,5 /etc/passwd |head -n1
```
**Задача 4**

Изведете съдържанието на файла **/etc/passwd** от 2-ри до 6-ти символ.
```
cut -c2-6 /etc/passwd
```
**Задача 5**

Намерете броя на символите в **/etc/passwd**. А колко реда има в
**/etc/passwd**?
```
wc -m < /etc/passwd  
wc -l < /etc/passwd
```
**Задача 6**

Извадете от файл **/etc/passwd**:

\- първите 12 реда

\- първите 26 символа

\- всички редове, освен последните 4

\- последните 17 реда

\- 151-я ред (или друг произволен, ако нямате достатъчно редове)

\- последните 4 символа от 13-ти ред
```
1. head -n12 < /etc/passwd 

2. cut -c1-26 < /etc/passwd |head -n1

3. head -n $(($(wc-l < /etc/passwd) - 4)) /etc/passwd 
    или 
    head -n -4 /etc/passwd

4.  tail -n17

5.  sed -n '151p' < /etc/passwd  
     или   
    cat < /etc/passwd | head -n151 | tail -1

6.  head -n13 /etc/passwd | tail -n1 | tail -c3
```
**Задача 7**

Отпечатайте потребителските имена и техните home директории от **/etc/passwd**.
```
cut -d: -f1,6 /etc/passwd | cut -d/ -f1,2
```
**Задача 8**

Отпечатайте втората колона на **/etc/passwd**, разделена спрямо символ **'/'**.
```
cut -d/ -f2 /etc/passwd
```
**Задача 9**

Запаметете във файл в своята home директория резултатът от командата ls -l
изпълнена за вашата home директорията.

Сортирайте създадения файла по второ поле (numeric, alphabetically).
```
ls -l | sort -n -k 2 > sortedBySecondColumn
```
**Задача 10**

Отпечатайте 2 реда над вашия ред в **/etc/passwd** и 3 реда под него // може да
стане и без пайпове
```
grep -A3 -B3 s62240 /etc/passwd
```
**Задача 11**

Колко хора не се казват Ivan според **/etc/passwd**
```
grep -v Ivan /etc/passwd | wc -l
```
**Задача 12**

Изведете имената на хората с второ име по-дълго от 7 (\>7) символа според
**/etc/passwd**
```
egrep ‘*:[[:alpha:]]+ [[:alpha:]]{,7}’ /etc/passwd| cut –d: –f5| cut –d, -f1
```
**Задача 13**

Изведете имената на хората с второ име по-късо от 8 (\<=7) символа според
**/etc/passwd** // !(\>7) = ?
```
egrep ‘*:[[:alpha:]]+ [[:alpha:]]{8,}’ /etc/passwd| cut –d: –f5| cut –d, -f1
```
**Задача 14**

Изведете целите редове от /etc/passwd за хората от **Задача 1**
```
egrep ':[[:alpha:]]* ([[:alpha:]]){,7}:' /etc/passwd
```
**Задача 15**

Намерете факултетния си номер или името си във файлa **/etc/passwd**.
```
grep "Stoyan Yanev" /etc/passwd|cut -c2-6
```
**Задача 16**

Запазете само потребителските имена от **/etc/passwd** във файл users във вашата
home директория.
```
cut -d: -f1 /etc/passwd > userNames
```
**Задача 17**

Колко коментара има във файла **/etc/services** ? Коментарите се маркират със
символа \#, след който всеки символ на реда се счита за коментар.
 ```
grep '\#' /etc/services | wc -l
```
**Задача 18**

Вижте man 5 services. Напишете команда, която ви дава името на протокол с порт
естествено число N. Командата да не отпечатва нищо, ако търсения порт не
съществува (например при порт 1337). Примерно, ако номера на порта N е 69,
командата трябва да отпечати tftp.
```
grep -w 69 /etc/services | cut -f1
```
**Задача 19**

Колко файлове в /bin са shell script? (Колко файлове в дадена директория са
ASCII text?)
```
find /bin -type f -exec file {} + | grep 'shell script' | wc -l

find /bin -type f -exec file {} +| grep ASCII |wc –l
```
**Задача 20**

Направете списък с директориите на вашата файлова система, до които нямате
достъп. Понеже файловата система може да е много голяма, търсете до 3 нива на
дълбочина. А до кои директории имате достъп? Колко на брой са директориите, до
които нямате достъп?
```
find / -type d -maxdepth 3 > /dev/nullfind / -type d -maxdepth 3 2> /dev/nullfind / -type d -maxdepth 3 2>&1 > /dev/null | wc -l
```
**Задача 21**

Създайте следната файлова йерархия.

/home/s...../dir1/file1

/home/s...../dir1/file2

/home/s...../dir1/file3

Посредством vi въведете следното съдържание:

**file1:**

1

2

3

**file2:**

s

a

d

f

**file3:**

3

2

1

45

42

14

1

52

*Изведете на екрана:*

\* статистика за броя редове, думи и символи за всеки един файл

\* статистика за броя редове и символи за всички файлове

\* общия брой редове на трите файла
```
mkdir -p dir1/file{1..3}  
vi file1  
vi file2  
vi file3  
wc -l -w -c file{1..3}  
wc -l -c file{1..3}  
cat f1 f2 f3 | wc -l
```
**Задача 22**

Във **file2** подменете всички малки букви с главни.
```
sed -r -i 's/([a-z])/\\U\\1/g' file2

или 

tr '[:lower:]' '[:upper:]' \< file2

или   

tr a-z A-Z \< file2
```
**Задача 23**

Във file3 изтрийте всички "1"-ци.
```
sed -r -i 's/([1])//g' file1
```
**Задача 24**

Изведете статистика за най-често срещаните символи в трите файла.
```
cat file{1..3}|grep -o .| sort|uniq -c|sort –n
```
**Задача 25**

Направете нов файл с име по ваш избор, който е конкатенация от file{1,2,3}.

Забележка: съществува решение с едно извикване на определена програма - опитайте
да решите задачата чрез него.
```
cat file{1..3} > concatenateFiles-1-2-3
```
**Задача 26**

Прочетете текстов файл **file1** и направете всички главни букви малки като
запишете резултата във **file2**.
```
cat file1 | tr A-Z a-z >> file2
```
**Задача 27**

Изтрийте всички срещания на буквата 'a' (lower case) в **/etc/passwd** и
намерете броят на оставащите символи.
```
tr -d a < /etc/passwd | wc -c
```
**Задача 28**

Намерете броя на уникалните символи, използвани в имената на потребителите от
**/etc/passwd**.
```
cat /etc/passwd | grep -o . |sort -n | uniq -u | wc –l
```
**Задача 29**

Отпечатайте всички редове на файла **/etc/passwd**, които не съдържат символния
низ 'ov'.
```
grep -v ov /etc/passwd
```
**Задача 30**

Отпечатайте последната цифра на UID на всички редове между 28-ми и 46-ред в
**/etc/passwd**.
```
tail -n +28 /etc/passwd | head -n 19|cut -d: -f3 | awk '{print substr($0,length,1)}'  
или  
tail -n +28 /etc/passwd | head -n 19|cut -d: -f3 | grep -o .$
```
**Задача 31**

Отпечатайте правата **(permissions)** и имената на всички файлове, до които
имате read достъп, намиращи се в директорията **/tmp**.
```
ls -la /tmp |tr -s ' '|cut -d" " -f1,9 |grep "^-r"
```
**Задача 32**

Намерете имената на 10-те файла във вашата home директория, чието съдържание е
редактирано най-скоро. На първо място трябва да бъде най-скоро редактираният
файл. Намерете 10-те най-скоро достъпени файлове. (**hint:** Unix time)
```
find . -type f -printf "%T\@ %f\\n" | sort -r -n| head| cut -d ' ' -f2

find . -type f -printf "%A\@ %f\\n" | sort -r -n| head| cut -d ' ' -f2
```
**Задача 33**

Файловете, които съдържат C код, завършват на \`.c\`.

Колко на брой са те във файловата система (или в избрана директория)?

Колко реда C код има в тези файлове?
```
find / 2\> /dev/null | grep //.c$ | wc -l - Брой на С файловете

find / -name '*.c' 2> /dev/null -exec cat {} + | wc -l - Брой редове на С код
```
**Задача 34**

Даден ви е ASCII текстов файл (например **/etc/services**). Отпечатайте
хистограма на N-те (например 10) най-често срещани думи.
```
tr -c '[:alnum:]' '[\n*]' < /etc/services| tr -s '\n'|sort|uniq -c| sort -r -n| head
```
**Задача 35**

Вземете факултетните номера на студентите от СИ и ги запишете във файл
**si.txt** сортирани.
```
cat /etc/passwd | grep "SI" |cut -c2,6|sort -n > faculltyNumber
```
**Задача 36**

За всеки логнат потребител изпишете "Hello, потребител", като ако това е вашият
потребител, напишете "Hello, потребител - this is me!".

*Пример:*

hello, human - this is me!

Hello, s63465

Hello, s64898
```
who -u|cut -d' ' -f1| awk -v me="Stoyan Yanev" '{print ($1==me)? "Hello, " $1 " - this is me!" : "Hello " $1}'
```
**Задача 37**

Изпишете имената на студентите от **/etc/passwd** с главни букви.
```
cut -d: -f5 < /etc/passwd |cut -d',' -f1 | tr a-z A-Z
```
**Задача 38**

Shell Script-овете са файлове, които по конвенция имат разширение .sh. Всеки
такъв файл започва с "\#!\<interpreter\>" , където \<interpreter\> указва на
операционната система какъв интерпретатор да пусне (пр: "\#!/bin/bash",
"\#!/usr/bin/python3 -u").

Намерете всички .sh файлове и проверете кой е най-често използваният
интерпретатор.
```
find / -type f -name '*.sh' -readable -exec head -n 1 {} \; 2>/dev/null | grep '^#!' | sort | uniq -c | sort -nr
```
**Задача 39**

Намерете 5-те най-големи групи подредени по броя на потребителите в тях.
```
cat/etc/passwd | cut -d: -f4| sort -n| uniq -c|sort -n| tail -n 5|tr -s ' '| cut -d' ' -f3
```
**Задача 40**

Направете файл eternity. Намерете всички файлове, които са били модифицирани в
последните 15мин (по възможност изключете .). Запишете във eternity името на
файла и часa на последната промяна.
```
find / -type f -mmin -15 2>/dev/null | xargs stat --format "%n : %y > eternity
```
**Задача 41**

Копирайте файл **/home/tony/population.csv** във вашата home директория.
```
cp /home/tony/population.cs ~
```
**Задача 42**

Използвайки файл **population.csv**, намерете колко е общото население на света
през 2008 година. А през 2016?
```
awk -F ',' '$3==2008 {sum+=$4}END {print sum}' population.csv

awk -F ',' '$3==2016 {sum+=$4}END {print sum}' population.csv

```
**Задача 43**

Използвайки файл **population.csv**, намерете през коя година в България има
най-много население.
```
awk -F ',' '($1=="Bulgaria"){print $3 " " $4}' population.csv|sort -t' ' -k2 -n| cut -d' ' -f1| tail -n1 
или 
grep -w Bulgaria population.csv|sort -t',' -k4 -n| cut -d',' -f3| tail -n1
```
**Задача 44**

Използвайки файл **population.csv**, намерете коя държава има най-много
население през 2016. А коя е с най-малко население?

(**Hint:** Погледнете имената на държавите)
```
grep -w 2016 population.csv| sed –r “s/^(.*),.+,([0-9]+)$/\1:\2/” |sort -n –t“:” –k2|tail -n1|cut -d':' -f1

grep -w 2016 population.csv| sed –r “s/^(.*),.+,([0-9]+)$/\1:\2/” |sort -n –t“:” –k2|head -n1|cut -d':' -f1
```
**Задача 45**

Използвайки файл population.csv, намерете коя държава е на 42-ро място по
население през 1969. Колко е населението й през тази година?
```
grep -w 1969 population.csv| sed –r “s/^(.*),.+,([0-9]+)$/\1:\2/” |sort -n –t“:” –k2|head –n42|tail –n1
```
**Задача 46**

В home директорията си изпълнете командата **\`curl -o songs.tar.gz
"http://fangorn.uni-sofia.bg/misc/songs.tar.gz"\`**
```
\`curl -o songs.tar.gz
"[http://fangorn.uni-sofia.bg/misc/songs.tar.gz"\`](http://fangorn.uni-sofia.bg/misc/songs.tar.gz%22%60)
```
**Задача 47**

Да се разархивира архивът **songs.tar.gz** в папка songs във вашата home
директорията.
```
tar -x -f songs.tar.gz
```
**Задача 48**

Да се изведат само имената на песните.
```
ls ~/songs\| cut -d'-' -f2|cut -d'(' -f1
```
**Задача 49**

Имената на песните да се направят с малки букви, да се заменят спейсовете с
долни черти и да се сортират.
```
ls ~/songs| cut -d'-' -f2|cut -d'(' -f1|sed 's/ //'|sed 's/ $//'|tr A-Z a-z|tr ' ' '_'|sort
```
**Задача 50**

Да се изведат всички албуми, сортирани по година.
```
ls | cut -d'(' -f2| cut -d')' -f1| sort -t',' -n -k2
```
**Задача 51**

Да се преброят/изведат само песните на Beatles и Pink.
```
ls |egrep --color "(Beatles|Pink -)" |cut -d'-' -f2|cut -d'(' -f1 – изведа имената на песните

ls |egrep --color "(Beatles|Pink -)" |wc -l  – извежда броя на имената на песните
```
**Задача 52**

Да се направят директории с имената на уникалните групи. За улеснение, имената
от две думи да се напишат слято:

Beatles, PinkFloyd, Madness
```
ls |cut -d'-' -f1| tr -d ' '|mkdir $(uniq -u)
```
**Задача 53**

Напишете серия от команди, които извеждат детайли за файловете и директориите в
текущата директория, които имат същите права за достъп както най-големият файл в
**/etc** директорията.
```
find /etc -type f -printf "%s %p %m\n" 2>/dev/null | sort -n | tail -1 | cut -d ' ' -f 3 | xargs find . -maxdepth 1 -perm
```
**Задача 54**

Дадени са ви 2 списъка с email адреси - първият има 12 валидни адреса, а
вторията има само невалидни. Филтрирайте всички адреси, така че да останат само
валидните. Колко кратък регулярен израз можете да направите за целта?

**Валидни email адреси (12 на брой):**

email\@example.com

firstname.lastname\@example.com

email\@subdomain.example.com

email\@123.123.123.123

1234567890\@example.com

email\@example-one.com

\_______\@example.com

email\@example.name

email\@example.museum

email\@example.co.jp

firstname-lastname\@example.com

unusually.long.long.name\@example.com

**Невалидни email адреси:**

\#\@%\^%\#\$\@\#\$\@\#.com

\@example.com

myemail

Joe Smith \<email\@example.com\>

email.example.com

email\@example\@example.com

.email\@example.com

email.\@example.com

email..email\@example.com

email\@-example.com

email\@example..com

Abc..123\@example.com

(),:;\<\>[\\]\@example.com

just"not"right\@example.com

this\\ is"really"not\\allowed\@example.com
```

//TODO:

```
**Задача 55**

Запишете във файл next потребителското име на човека, който е след вас в изхода
на who. Намерете в /etc/passwd допълнителната ифнромация (име, специалност...) и
също го запишете във файла next.
```
who | grep "Stoyan Yanev" -A 1|tail –n1| cut –d’ ’ –f1 > next
grep $(cat next) /etc/passwd >> next
```
