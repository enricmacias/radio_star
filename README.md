# radio_star

App to search and listen to radio stations. You can also favorite your favorite stations.

<img src="https://github.com/enricmacias/radio_star/blob/main/images/logo.png" alt="logo" width="300">

## How to Compile the Project

Open a terminal in the project directory and run:
```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Architecture and State Management
- MMVM with Riverpod Annotations

## Things to improve
- Improve search speed by implementing pagination to the search
- Make errors user friendly
- Add a default screen on the search section to be able to search stations by genre (collection view search by tags)
- Keep track of the listening station and mark it yellow in both lists (search and favorites), improve yellow selection overall, with only one station selected a time
- Ad a search button in favorites screen to be able to search inside your favorites
- More exhaustive unit tests for all providers and widgets
