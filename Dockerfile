ARG VARIANT="slim"
ARG VERSION="355.0.0"
FROM gcr.io/google.com/cloudsdktool/cloud-sdk:${VERSION}-${VARIANT}

# Install updates and additional packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends unzip

# Install Terraform
COPY src/scripts/install-terraform.sh /tmp
RUN chmod +x /tmp/install-terraform.sh
RUN /tmp/install-terraform.sh
