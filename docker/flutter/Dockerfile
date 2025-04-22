# Use the official Debian base image
FROM debian:bookworm-slim

ENV UID=1000
ENV GID=1000
ENV USER="developer"
# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
# https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.29.3-stable.tar.xz
ENV FLUTTER_VERSION=3.29.3-stable
ENV FLUTTER_HOME=/home/$USER/flutter
ENV PATH="$FLUTTER_HOME/bin:$PATH"
# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    unzip \
    xz-utils \
    libglu1-mesa \
    ca-certificates 

# create user
RUN groupadd --gid $GID $USER \
    && useradd -s /bin/bash --uid $UID --gid $GID -m $USER \
    && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER


RUN mkdir -p $FLUTTER_HOME 
# WORKDIR $FLUTTER_HOME

# Download and install Flutter SDK
RUN curl -o flutter.tar.xz -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz

RUN tar -xf flutter.tar.xz -C $FLUTTER_HOME --strip-components=1 
RUN rm flutter.tar.xz

# Enable Flutter web
RUN flutter config --enable-web --no-analytics
RUN flutter precache --web
RUN flutter update-packages

# Verify installation
RUN flutter doctor -v


# Default command
CMD ["bash"]