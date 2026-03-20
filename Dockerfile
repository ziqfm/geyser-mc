FROM eclipse-temurin:21-jre-alpine

# Install wget and create a standard non-root user (matching Pumpkin)
RUN apk add --no-cache wget && \
    addgroup -g 1000 geyser && \
    adduser -u 1000 -G geyser -s /bin/sh -D geyser

# Download the latest Geyser Standalone build directly into /opt
RUN wget -O /opt/Geyser.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

# Set the working directory where the config files will live
WORKDIR /geyser
USER geyser

# Run the proxy with a small memory footprint
CMD ["java", "-Xms256M", "-Xmx512M", "-jar", "/opt/Geyser.jar"]