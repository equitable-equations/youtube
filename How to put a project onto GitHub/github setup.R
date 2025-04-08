# GitHub setup
# First, sign up for an account at www.github.com
library(usethis)

# Connect RStudio to your GitHub
create_github_token()
gitcreds::gitcreds_set()

# Put a project onto GitHub
use_github()

# Create a readme
use_readme_md()


