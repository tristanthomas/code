ARG VARIANT="slim"
ARG VERSION="351.0.0"
FROM gcr.io/google.com/cloudsdktool/cloud-sdk:${VERSION}-${VARIANT}

# Install updates and additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends unzip

# Install Terraform
COPY install_terraform.sh /tmp
RUN chmod +x /tmp/install_terraform.sh
RUN /tmp/install_terraform.sh
