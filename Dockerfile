FROM opensuse/leap:15.2

MAINTAINER lemmy04 <Mathias.Homann@openSUSE.org>

## Date: 2021-04-20

## install everything needed to run a telegram bot
RUN zypper ar -e -p 75 -r https://download.opensuse.org/repositories/home:/lemmy04/openSUSE_Leap_15.2/home:lemmy04.repo
RUN zypper --gpg-auto-import-keys ref
RUN zypper install -y -l git wget curl python3-telegram-bot frotz redis

## clean zypper cache for smaller image
RUN zypper cc --all

LABEL version=0.0.1 Description="An image to run a telegrami z5bot for playing infocom games" Vendor="Mathias.Homann@openSUSE.org"

## setup /run/uscreens
RUN mkdir -p /run/uscreens
RUN chmod a+rwx,o+t /run/uscreens

## create an opensim user and group
RUN useradd \
        -c "The user that runs the bot" \
        --no-log-init \
        -m \
        -U \
        z5bot

USER z5bot

WORKDIR /home/z5bot

RUN git clone https://github.com/sneaksnake/z5bot.git

RUN mkdir -p /home/z5bot/z5bot/{stories,tools}

RUN cp /usr/bin/dfrotz /home/z5bot/z5bot/tools

WORKDIR /home/z5bot/z5bot

CMD python3 ./bot.py
