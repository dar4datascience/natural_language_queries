# Use the Rocker Shiny image as the base image
FROM rocker/shiny:latest

# Install any additional dependencies required by your Shiny app
# For example, if your app needs additional R packages, you can install them here
# Example:
# RUN R -e "install.packages('shinydashboard')"

# Copy the Shiny app files into the Docker image
COPY . /srv/shiny-server/myapp

# Expose the Shiny app's port
EXPOSE 3838
# Set the working directory to the Shiny app folder
WORKDIR /srv/shiny-server/myapp

# Run the Shiny app when the container starts
RUN ["R", "-e", "renv::restore()"]
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/myapp', host = '0.0.0.0', port = 3838)"]
