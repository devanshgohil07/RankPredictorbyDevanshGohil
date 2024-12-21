.onLoad <- function(libname, pkgname) {
  # Function to print the message in blue
  blue <- function(text) {
    cat("\033[34m", text, "\033[39m", sep = "")  # ANSI escape code for blue
  }

  # Display the introduction message in blue
  blue("Welcome to RankPredictorbyDevanshGohil!\n")
  blue("This package predicts academic ranks based on CGPA and term data.\n")
  blue("For any support or issues, visit the package's \n")
  blue("GitHub page: https://github.com/devanshgohil07/RankPredictorbyDevanshGohil\n")
  blue("\nCreated by: Devansh Gohil\n")
  blue("You can contact me at: i24devanshg@iimidr.ac.in\n")
  blue("Feel free to check out my work at: https://www.linkedin.com/in/devansh-gohil-2369b4314/\n")

  # Load the necessary packages
  library(httr)
  library(jsonlite)
  library(remotes)

  # Define the current version of the package (or fetch it from DESCRIPTION)
  current_version <- packageDescription(pkgname)$Version

  # Check if the stored version is different from the current version
  stored_version <- getOption("RankPredictorbyDevanshGohil_version", NA)

  # Only check for updates if the stored version is different or not set
  if (is.na(stored_version) || stored_version != current_version) {
    # Call the update check function to check for updates
    check_for_update(current_version)

    # Store the current version after checking to avoid repeated checks
    options(RankPredictorbyDevanshGohil_version = current_version)
  }
}

check_for_update <- function(current_version) {
  # URL to fetch the latest release data from GitHub
  url <- "https://api.github.com/repos/devanshgohil07/RankPredictorbyDevanshGohil/releases/latest"

  # Make the GET request to GitHub API
  response <- httr::GET(url)

  # Check if the request was successful
  if (httr::status_code(response) == 200) {
    # Parse the JSON response
    release_data <- jsonlite::fromJSON(httr::content(response, "text"))

    # Get the latest version from the release data
    latest_version <- release_data$tag_name

    # Compare the current version with the latest version
    if (current_version != latest_version) {
      message("A new version is available: ", latest_version)
      user_response <- readline(prompt = "Do you want to update the package? (yes/no): ")

      if (tolower(user_response) == "yes") {
        # Use remotes package to install the latest version
        remotes::install_github("devanshgohil07/RankPredictorbyDevanshGohil")
        message("Package updated successfully!")
      } else {
        message("Package not updated.")
      }
    } else {
      message("You are using the latest version.")
    }
  } else {
    message("Error fetching release data from GitHub. Could not check for updates.")
  }
}
