# lab03
## Плышевская К. ИУ8-23. Лабораторная работа по ТиМП №3
### Part 1
Создала репозиторий на GitHub с названием lab03    
Инициализируем переменные
```
export GITHUB_USERNAME=jezzixxx
export GITHUB_EMAIL=pkapav02@gmail.com
export GITHUB_TOKEN=<сгенирированный_токен>
```
Выбираем режим редактирования nano:    
`alias edit=nano`    
Записываем в файл ~/.config/hub (EOF — маркер окончания записи):
```
cat > ~/.config/hub <<EOF
github.com:
- user: ${GITHUB_USERNAME}
  oauth_token: ${GITHUB_TOKEN}
  protocol: https
EOF
```
Записываем глобальные настройки (протокол, имя и почта пользователя):    
```
git config --global hub.protocol https
git config --global user.name ${GITHUB_USERNAME}
git config --global user.email ${GITHUB_EMAIL}
```
Создаём папку lab03 внутри папки projects и переходим в неё:
```
mkdir lab03
cd lab03
```
Создаём пустой репозиторий:    
`git init`    
Добавляем удалённый репозиторий:    
`git remote add origin https://github.com/${GITHUB_USERNAME}/lab03.git`    
Создаём пустой файл README.md:    
`touch README.md`    
Добавляем созданный файл:    
`git add README.md`    
Создаём коммит "added README.md":    
`git commit -m"added README.md"`    
Загружаем коммит в ветку master:    
`git push origin master`     
Установка cmake из официальных репозиториев:    
`sudo apt-get install cmake`    
Создаём директорию "formatter_lib" и переходим в неё:    
```
mkdir formatter_lib
cd formatter_lib
```
Загружаем файлы "formatter.h" и "formatter.cpp" из сети (ссылка типа raw при переходе в файл в репозитории. Необходима для корректного формата файла):
```
wget https://raw.githubusercontent.com/tp-labs/lab03/master/formatter_lib/formatter.h
wget https://raw.githubusercontent.com/tp-labs/lab03/master/formatter_lib/formatter.cpp
```
Создаём и наполняем файл CMakeLists.txt:    
`nano CMakeLists.txt`    
В открывшемся окне заполняем (комментарии не прописываем):
```
//Создание CMakeLists.txt для сборки библиотеки formatter:
cmake_minimum_required(VERSION 3.10) 
project(formatter)

//Установка стандарта языка, делаем его обязательным:
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

//Инициализируем исходники библиотеки (отдельно заголовки, отдельно cpp файлы):
set(SOURCES ~/projects/lab03/formatter_lib/formatter.cpp)
set(HEADERS ~/projects/lab03/formatter_lib/formatter.h)

//Сборка статической библиотеки "formatter":
add_library(formatter STATIC ${SOURCES} ${HEADERS})
```
Добавим упорядоченное дерево в путь поиска для включенных файлов:    
`target_include_directories(formatter PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})`    
Проверим корректность заполнения CMakeLists.txt и найдём полный путь до файла:    
`cmake -H. -B_build`
### Part 2
Создаём директорию "formatter_ex_lib" и переходим в неё:
```
mkdir formatter_ex_lib
cd formatter_ex_lib
```
Загружаем файлы "formatter_ex.h" и "formatter_ex.cpp" из сети (ссылка типа raw при переходе в файл в репозитории. Необходима для корректного формата файла):
```
wget https://raw.githubusercontent.com/tp-labs/lab03/master/formatter_ex_lib/formatter_ex.cpp
wget https://raw.githubusercontent.com/tp-labs/lab03/master/formatter_ex_lib/formatter_ex.h
```
Создаём и заполняем файл CMakeLists.txt:    
`nano CMakeLists.txt`    
В открывшемся окне заполняем (комментарии не пишем):
```
//Создание CMakeLists.txt для сборки библиотеки formatter_ex:
cmake_minimum_required(VERSION 3.10) 
project(formatter_ex)

//Установка стандарта языка, делаем его обязательным:
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

//Инициализируем исходники библиотеки (отдельно заголовки, отдельно cpp файлы):
set(SOURCES ~/projects/lab03/formatter_ex_lib/formatter_ex.cpp)
set(HEADERS ~/projects/lab03/formatter_ex_lib/formatter_ex.h)

//Сборка статической библиотеки "formatter_ex":
add_library(formatter_ex STATIC ${SOURCES} ${HEADERS})

//Добавим упорядоченное дерево в путь поиска для включенных файлов:
target_include_directories(formatter_ex PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

//Связываем с библиотекой formatter:
target_link_libraries(formatter_ex formatter)
```
Проверим корректность заполнения CMakeLists.txt и найдём полный путь до файла:    
`cmake -H. -B_build`
### Part 3
Создаём директорию "hello_world_application" и переходим в неё:
```
mkdir hello_world_application
cd hello_world_application
```
Загружаем файл "hello_world.cpp" из сети (ссылка типа raw при переходе в файл в репозитории. Необходима для корректного формата файла):    
`wget https://raw.githubusercontent.com/tp-labs/lab03/master/hello_world_application/hello_world.cpp`    
Создаём и заполняем файл CMakeLists.txt:    
`nano CMakeLists.txt`    
В открывшемся окне заполняем (комментарии не прописываем):
```
//Создание CMakeLists.txt для программы "hello_world":
cmake_minimum_required(VERSION 3.4)
project(hello_world)

//Установка стандарта языка, делаем его обязательным:
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

//Подключаем директории с библиотеками:
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib ${CMAKE_CURRENT_SOURCE_DIR}/formatter)

//Добавляем исполняемый файл
add_executable(source hello_world.cpp)

//Связываем с библиотеками formatter и formatter_ex:
target_link_libraries(source formatter_ex)
target_link_libraries(source formatter)
```
Аналогично создаём библиотеку solver_lib и проект solver_application:
```
mkdir solver_lib
cd solver_lib
wget https://raw.githubusercontent.com/tp-labs/lab03/master/solver_lib/solver.cpp
wget https://raw.githubusercontent.com/tp-labs/lab03/master/solver_lib/solver.h
nano CMakeLists.txt
```
В открывшемся окне заполняем:
```
cmake_minimum_required(VERSION 3.10) 
project(formatter_ex)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES ~/projects/lab03/solver_lib/solver.cpp)
set(HEADERS ~/projects/lab03/solver_lib/solver.h)

add_library(solver_lib STATIC ${SOURCES} ${HEADERS})
target_include_directories(solver_lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(solver_lib formatter)
target_link_libraries(solver_lib formatter_ex)
```
Переходим обратно в терминал:
```
cmake -H. -B_build
cd ..
mkdir solver_application
cd solver_application
wget https://raw.githubusercontent.com/tp-labs/lab03/master/solver_application/equation.cpp
nano CMakeLists.txt
```
В открывшемся окне заполняем:
```
cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(solver)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib ${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib ${CMAKE_CURRENT_SOURCE_DIR}/formatter)

add_executable(source equation.cpp)

target_link_libraries(source solver_lib)
target_link_libraries(source formatter_ex)
target_link_libraries(source formatter)
```
ОБратно в терминал. Собираем проект:
```
cmake -H. -B_build
cmake --build _build
```
Добавляем файлы и директории, создаём коммит, пушим:
```
git add <все директории, выпавшие при вызове git status>
git commit -m"done work"
git push origin master
```
