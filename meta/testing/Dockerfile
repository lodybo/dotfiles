FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
  git \
  zsh \
  curl \
  python3 \
  vim \
  sudo

RUN useradd -rm -d /home/tester -s /bin/bash -g root -G sudo -u 1001 tester
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'tester:tester' | chpasswd
USER tester
WORKDIR /home/tester

COPY --chown=tester:root . /home/tester/.dotfiles

RUN cd /home/tester

CMD ["/bin/bash"]
