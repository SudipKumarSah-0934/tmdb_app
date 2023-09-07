# tmdb_movies_app
Movies App project
## Getting Started
A movie app using flutter
## Instructions
- Clone and Extract
- Generate files for database and apiService with command
  - dart run build_runner build
- Can replace api key with your own
- View list of currently showing movies, with features like
  - search by movie title and navigate to details of searched movie
  - save favorite movies
    - View saved favourite movie and navigate to details of saved movie
## FDD clean architecture
lib
- config
- core
- features
  - data
    - data_sources
    - models
    - repository
  - domain
    - entities
    - repository
    - use-cases
  - presentation
    - bloc
    - pages
    - widgets
## Apis
    https://developer.themoviedb.org/reference/intro/getting-started
## Packages
#icon
ionicons: ^0.2.2

#state management
flutter_bloc: ^8.1.2

#comparing dart objects
equatable: ^2.0.5

#service locator
get_it: ^7.6.0

#dateFormat
intl: ^0.18.1

#Database
floor: any

#make request to api
retrofit: ^4.0.1

#Hooks
flutter_hooks: ^0.20.0

#chached image
cached_network_image: ^3.2.0

#svg assets
flutter_svg: ^2.0.7

#for text auto size
auto_size_text: ^3.0.0

retrofit_generator: 7.0.8

floor_generator: 1.4.2

build_runner: 2.4.6
## Screenshots
![Screenshot_2023-08-25-14-56-22-55_4b09a48aa96f35f1241503b80300e46c 1](https://github.com/SudipKumarSah-0934/tmdb_app/assets/46530574/f4f99d6d-6554-44d1-9280-74f992923524)
![Screenshot_2023-08-25-14-56-32-24_4b09a48aa96f35f1241503b80300e46c 1](https://github.com/SudipKumarSah-0934/tmdb_app/assets/46530574/2fb502c8-0384-4708-9977-15c8f854c7ef)
![Screenshot_2023-08-25-14-56-37-91_4b09a48aa96f35f1241503b80300e46c 1](https://github.com/SudipKumarSah-0934/tmdb_app/assets/46530574/5ff24e05-b054-42ef-9f04-242ff8198606)
![Screenshot_2023-08-25-14-56-56-84_4b09a48aa96f35f1241503b80300e46c 1](https://github.com/SudipKumarSah-0934/tmdb_app/assets/46530574/ce3f1fe0-e7f2-443f-abe0-c1b7f26963ff)


