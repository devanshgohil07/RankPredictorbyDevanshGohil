.onLoad <- function(libname, pkgname) {
  # Define the current version of the package (or fetch it from DESCRIPTION)
  current_version <- packageDescription(pkgname)$Version

  # Call the update check function to check for updates
  check_for_update(current_version)
}
