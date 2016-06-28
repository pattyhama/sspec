# Dockerfile for sspec
# https://github.com/pattyhama

FROM ubuntu

MAINTAINER Harumi Hamaoka <strodr@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade -y

# APTのソースリストにOPSCODEのリポジトリを追加する。
RUN echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list

# 続いて鍵の登録
RUN mkdir -p /etc/apt/trusted.qpg.d
RUN gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
RUN gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null

# パッケージをアップデート
RUN apt-get update
RUN apt-get install opscode-keyring

# chefのインストール（aptでインストールする場合）
RUN apt-get install -y chef
# インストール中に使用するChef ServerのURLの入力を求められるけど、今回はchef-solo使うので「none」と入力。
