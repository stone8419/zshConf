#!/bin/bash

if [ ! -n "${HOMEDIR}" ]; then
  HOMEDIR=~
fi

if [ ! -n "${ZSH}" ]; then
  ZSH=${HOMEDIR}/.oh-my-zsh
fi

if [ ! -d "${ZSH}" ]; then
  echo -e "\033[0;33mYou haven't installed Oh-My-Zsh.\033[0m You'll need to install ${ZSH} if you want to config Oh-My-Zsh"
  exit
fi

echo -e "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ${HOMEDIR}/.zshrc ]; then
  echo -e "\033[0;33mFound ${HOMEDIR}/.zshrc.\033[0m \033[0;32mBacking up to ${HOMEDIR}/.zshrc.pre-oh-my-zsh\033[0m";
  mv ${HOMEDIR}/.zshrc ${HOMEDIR}/.zshrc.pre-oh-my-zsh
fi

echo -e "\033[0;34mLooking for an existing bash config...\033[0m"
if [ -f ${HOMEDIR}/.bash_profile ]; then
  echo -e "\033[0;33mFound ${HOMEDIR}/.bash_profile.\033[0m \033[0;32mBacking up to ${HOMEDIR}/.bash_profile.pre-oh-my-zsh\033[0m";
  mv ${HOMEDIR}/.bash_profile ${HOMEDIR}/.bash_profile.pre-oh-my-zsh
fi

echo -e "\033[0;34mLooking for an existing colors config...\033[0m"
if [ -f ${HOMEDIR}/.dir_colors ]; then
  echo -e "\033[0;33mFound ${HOMEDIR}/.dir_colors.\033[0m \033[0;32mBacking up to ${HOMEDIR}/.dir_colors.pre-oh-my-zsh\033[0m";
  mv ${HOMEDIR}/.dir_colors ${HOMEDIR}/.dir_colors.pre-oh-my-zsh
fi

echo -e "\033[0;34mLooking for an existing paladin.zsh-theme config...\033[0m"
if [ -f ${HOMEDIR}/.oh-my-zsh/themes/paladin.zsh-theme ]; then
  echo -e "\033[0;33mFound ${HOMEDIR}/.oh-my-zsh/themes/paladin.zsh-theme.\033[0m \033[0;32mBacking up to ${HOMEDIR}/.oh-my-zsh/themes/paladin.zsh-theme.pre-oh-my-zsh\033[0m";
  mv ${HOMEDIR}/.oh-my-zsh/themes/paladin.zsh-theme ${HOMEDIR}/.oh-my-zsh/themes/paladin.zsh-theme.pre-oh-my-zsh
fi

cp .dir_colors ${HOMEDIR}/
cp .bash_profile ${HOMEDIR}/
cp .zshrc ${HOMEDIR}/
cp paladin.zsh-theme ${HOMEDIR}/.oh-my-zsh/themes/
