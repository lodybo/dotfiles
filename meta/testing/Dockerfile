FROM ubuntu

RUN apt-get update && apt-get install -y \
  git \
  zsh \
  curl \
  python\
  vim

RUN useradd -rm -d /home/tester -s /bin/bash -g root -G sudo -u 1001 tester
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo 'tester:tester' | chpasswd
USER tester
WORKDIR /home/tester

COPY --chown=tester:root ../.. /home/tester/.dotfiles

RUN cd /home/tester
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
RUN . .nvm/nvm.sh && nvm install --lts

CMD ["/bin/bash"]
