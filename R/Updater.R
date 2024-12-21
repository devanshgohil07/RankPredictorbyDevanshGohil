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
