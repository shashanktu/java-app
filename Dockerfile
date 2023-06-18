# Use a base image with a web server installed (e.g., nginx)
FROM nginx:latest
# Copy the HTML files to the appropriate location in the container
COPY index.html /usr/share/nginx/html/
# Expose port 80 to allow incoming traffic
EXPOSE 80
# Start the web server when the container is run
CMD ["nginx", "-g", "daemon off;"]
