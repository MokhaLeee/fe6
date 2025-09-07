# Build image with docker build --tag fe6 .
# Create a container with docker run -it fe6
# Start the container on subsequent runs with docker start
# Inside the container, you can run ./setup.sh, which clones the repo and builds agbcc + tools for you
FROM ubuntu:24.04
SHELL ["/bin/bash", "-c"]
CMD ["/bin/bash"]

RUN apt update && apt dist-upgrade -y

# Install sudo just so sudo commands don't fail in the container
RUN apt install -y sudo git make pkg-config
RUN apt install -y build-essential gcc-arm-none-eabi binutils-arm-none-eabi libpng-dev python3-full python3-pip python-is-python3

# Create python venv, activate it and install packages
RUN python -m venv /fe6_venv &&            \
    source /fe6_venv/bin/activate &&       \
    pip install requests argparse numpy pillow

# Add our venv to path, so that it's automatically used
ENV VIRTUAL_ENV=/fe6_venv
ENV PATH="/fe6_venv/bin:$PATH"

# Add a setup.sh to the container that clones the repo and builds agbcc+tools
RUN echo "git clone https://github.com/FireEmblemUniverse/fireemblem6j && cd fireemblem6j && ./tools/install_agbcc.sh && ./build_tools.sh" >> setup.sh && \
    chmod 777 setup.sh