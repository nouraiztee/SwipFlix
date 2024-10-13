# Movie Listing App

## Overview

This project is a simple master-detail iOS application that displays a list of popular movies fetched from The Movie Database (TMDB) API. The app provides a clean and user-friendly interface following Apple’s Human Interface Guidelines.

## Features

- Displays a list of popular movies using the TMDB API.
- Allows users to tap on a movie to view detailed information.
- Handles edge cases gracefully, including:
  - Missing poster images.
  - Missing movie titles and release dates.
  - Empty movie lists returned from the API.

## Requirements

- iOS 13.0 or later
- Xcode 12.0 or later
- Swift 5.0 or later

## API Key

To run this project, you'll need a TMDB API key. Follow these steps to obtain one:

1. Go to [TMDB](https://www.themoviedb.org/).
2. Create a free account and log in.
3. Navigate to [API Settings](https://www.themoviedb.org/settings/api) to generate your API key.

## Project Structure

- `Models/`: Contains data models for the movie and its details.
- `Views/`: Contains UI components and view controllers.
- `ViewModels/`: Contains view models that handle data manipulation and business logic.
- `Networking/`: Contains the networking layer responsible for API calls.
- `Resources/`: Contains assets like images and storyboards.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/movielistingapp.git
   ```

2. Open the project in Xcode:
   ```bash
   open movielistingapp.xcodeproj
   ```

3. Replace the placeholder API key in the code with your TMDB API key.

4. Build and run the application on a simulator or a physical device.

## Usage

- Launch the app to see the list of popular movies.
- Tap on a movie to view its details, including title, release date, overview, and poster image.

## Edge Cases

The application is designed to handle various edge cases, such as:

- Displaying a placeholder image if no poster is available.
- Showing default text when movie details are missing.
- Handling empty states gracefully when no movies are returned.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or need further assistance, feel free to reach out!

---

Happy Coding!
