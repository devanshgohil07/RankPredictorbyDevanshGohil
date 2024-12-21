library(httr)
library(jsonlite)
library(remotes)

# Your GitHub repository details
REPO_OWNER <- "DevanshGohil"  # Your GitHub username
REPO_NAME <- "RankPredictorbyDevanshGohil"  # Your repository name

# Function to fetch the latest release version from GitHub
get_latest_release_version <- function() {
  url <- paste0("https://api.github.com/repos/", REPO_OWNER, "/", REPO_NAME, "/releases/latest")
  response <- GET(url)

  if (status_code(response) == 200) {
    release_data <- content(response, "parsed")
    latest_version <- release_data$tag_name  # e.g., "v1.0.1"
    return(latest_version)
  } else {
    cat("Error fetching release data from GitHub.\n")
    return(NULL)
  }
}

# Function to check for update and prompt user
check_for_update <- function(current_version) {
  latest_version <- get_latest_release_version()

  if (!is.null(latest_version)) {
    cat("Current version:", current_version, "\n")
    cat("Latest version:", latest_version, "\n")

    if (latest_version != current_version) {
      cat("A new update is available!\n")

      # Prompt the user for update
      response <- readline(prompt = "Do you want to update this package? (yes/no): ")

      if (tolower(response) == "yes") {
        cat("Updating package...\n")

        # Install the latest version from GitHub using remotes
        remotes::install_github(paste0(REPO_OWNER, "/", REPO_NAME))

        cat("Package updated to the latest version!\n")
      } else {
        cat("Update skipped.\n")
      }
    } else {
      cat("You have the latest version.\n")
    }
  } else {
    cat("Could not check for updates.\n")
  }
}
