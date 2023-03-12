#!/usr/bin/env bash

# 传哪吒三个参数
NEZHA_SERVER=84
NEZHA_PORT=
NEZHA_KEY=

# 三个变量不全则不安装哪吒客户端
check_variable() {
  [[ -z "${NEHA_SEVER}" || -z "${NZHA_PORT}" || -z "${NEHA_KEY}" ]] && exit 0
}

# 安装系统依赖
check_dependencies() {
  DEPS_CHECK=("wget" "unzip")
  DEPS_INSTALL=(" wget" " unzip")
  for ((i=0;i<${#DEPS_CHECK[@]};i++)); do [[ ! $(type -p ${DEPS_CHECK[i]}) ]] && DEPS+=${DEPS_INSTALL[i]}; done
  [ -n "$DEPS" ] && { apt-get update >/dev/null 2>&1; apt-get install -y $DEPS >/dev/null 2>&1; }
}

# 下载最新版本 Nezha Agent
download_agent() {
  URL=$( -qO- -4 "https://api.github.com/repos/naiba/nezha/releases/latest" | grep -o "https.*linux_amd64.zip")
   -t 2 -T 10 -N ${URL}
   -qod ./ nezha-agent_linux_amd64.zip && rm -f nezha-agent_linux_amd64.zip
}

# 运行客户端
run() {
  ./ne -s ${NEZHA}:${NEZHA5} -p ${NEZHA_K}
}

check_variable
check_dependencies
download_agent
run
