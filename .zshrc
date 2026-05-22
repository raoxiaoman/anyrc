export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined"
ZSH_DISABLE_COMPFIX="true"
plugins=(git wd sudo zsh-autosuggestions zsh-syntax-highlighting extract history-substring-search z)

source "$ZSH/oh-my-zsh.sh"

typeset -U path PATH

export ANDROID_SDK="$HOME/Library/Android/sdk"
export GAPID_PATH="$HOME/software/gapid"
export PIPX_HOME="$HOME/.pipx"
export CPATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"
export SVN_EDITOR="vim"
export _JAVA_OPTIONS="-Djava.net.preferIPv4Addresses=true"
export DISPLAY="localhost:0.0"
export HOMEBREW_NO_AUTO_UPDATE="true"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export BUN_INSTALL="$HOME/.bun"

if [[ -x /usr/libexec/java_home ]]; then
  JAVA_HOME="$(/usr/libexec/java_home -v 17 2>/dev/null)"
  [[ -n "$JAVA_HOME" ]] && export JAVA_HOME
fi

if command -v brew >/dev/null 2>&1; then
  QT5_PREFIX="$(brew --prefix qt@5 2>/dev/null)"
  [[ -n "$QT5_PREFIX" ]] && export QT5_PATH="$QT5_PREFIX/bin"
fi

if [[ -d "$ANDROID_SDK/ndk" ]]; then
  ANDROID_NDK="$(find "$ANDROID_SDK/ndk" -mindepth 1 -maxdepth 1 -type d | sort -V | tail -n 1)"
  [[ -n "$ANDROID_NDK" ]] && export ANDROID_NDK
fi

[[ -n "$JAVA_HOME" ]] && export CLASSPATH="$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar"

[[ -d "$BUN_INSTALL/bin" ]] && path=("$BUN_INSTALL/bin" $path)
[[ -d "$HOME/.config/kaku/zsh/bin" ]] && path=("$HOME/.config/kaku/zsh/bin" $path)

[[ -n "$JAVA_HOME" && -d "$JAVA_HOME/bin" ]] && path+=("$JAVA_HOME/bin")
[[ -n "$NODE_JS_HOME" && -d "$NODE_JS_HOME/bin" ]] && path+=("$NODE_JS_HOME/bin")
[[ -n "$MAVEN_HOME" && -d "$MAVEN_HOME/bin" ]] && path+=("$MAVEN_HOME/bin")
[[ -d "$ANDROID_SDK" ]] && path+=("$ANDROID_SDK")
[[ -n "$ANDROID_NDK" && -d "$ANDROID_NDK" ]] && path+=("$ANDROID_NDK")
[[ -n "$QT5_PATH" && -d "$QT5_PATH" ]] && path+=("$QT5_PATH")
[[ -d "$GAPID_PATH" ]] && path+=("$GAPID_PATH")
[[ -d "$HOME/.local/bin" ]] && path+=("$HOME/.local/bin")

export PATH

export TABBY_WEBSERVER_JWT_TOKEN_SECRET="C069DDF4-148B-4229-B90D-EB99C64ACD94"
export LANHU_COOKIE=".eJyNkEFKBEEMRe_Saxsq6VQlmcs0qUqigzoOPTO4EO9uiRdwE_iBB-__r2XPI24vyynt7RZPy3725bRsRto4q0cXs06jSwXgZs4eRMWzGve-AWqULcuQUVIQvRcCLuq-aZKyxCat1BoDTKV1bALRSKHQUCWTRARzy6JsAVpbVa5RlilyjePdLnG5L6f78Zhqbx_P58s-XmK8rgVQwkdbu0uupPMoYM6_OiRCD5DZAx21Y7BoG6WFUE3FLcWGqDXt-74Dc0EmrVjrjJOjoFm5E7l5BxuGAZSjG1LyNLt--p7ny3Mc1+P8q7dUdmmZbAVImDdKh1KMoUHCQJjQ_bARf-MGRjJ5X7VYne4Zq8311sKuRlWsWZvE4xbHH_Cvst8_M7mCXQ.HGrrng.yymjifKc_Uvc9hrLew2_0i94_mw"
export SERVER_HOST="0.0.0.0"
export SERVER_PORT="8000"
export DATA_DIR="$HOME/code/tools/lanhu-mcp/data"
export LOG_LEVEL="INFO"

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

if [[ "$TERM" == "linux" ]]; then
  export LANGUAGE="en_US"
  export LANG="en_US.UTF-8"
fi

alias grep="grep --color=auto"
alias vimrc='vi ~/.vimrc'
alias currentFocus='adb shell dumpsys window | grep mCurrentFocus'
alias packageName='currentFocus'
alias currentActivity='adb -d shell dumpsys activity activities | grep mResumedActivity'
alias topActivity='currentActivity'
alias infoActivities='adb shell dumpsys activity activities | grep "Hist #"'
alias infoActivitys='infoActivities'
alias gcmaker="gcloud config set project videoguru-30412"
alias gcyoucut="gcloud config set project youcut-7d8a3"
alias videoInfo="/Users/raohui/code/sh/videoInfo.sh"
alias screen-info='/Users/raohui/code/sh/screen-info.sh'
alias claude-mem='bun "/Users/raohui/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'

function currentFragment() {
  adb shell dumpsys activity top | grep '#[0-9]: ' | tail -n 1
}

function topFragment() {
  currentFragment "$@"
}

function listFragments() {
  adb shell dumpsys activity top | grep '#[0-9]: '
}

function infoFragments() {
  listFragments "$@"
}

function debugMaker() {
  adb shell am start -D videoeditor.videomaker.videoeditorforyoutube/com.camerasideas.instashot.main.MainActivity "$@"
}

function dsmaker() {
  debugMaker "$@"
}

function debugYouCut() {
  adb shell am start -D com.camerasideas.trimmer/com.camerasideas.instashot.MainActivity "$@"
}

function dsyoucut() {
  debugYouCut "$@"
}

function debugUTool() {
  adb shell am start -D videoeditor.videomaker.aieffect/com.appbyte.utool.ui.splash.SplashActivity "$@"
}

function dsutool() {
  debugUTool "$@"
}

function doUpload() {
  python3 /Users/raohui/code/sh/upload.py "$@"
}

function xlogDecode() {
  python3 /Users/raohui/code/sh/decode_mars_nocrypt_log_file_py3.py "$@"
}

function lanhu-mcp() {
  cd "$HOME/code/tools/lanhu-mcp" && python3 lanhu_mcp_server.py "$@"
}

function rotate-test() {
  adb shell settings put system accelerometer_rotation 0
  adb shell settings put system user_rotation 0
  sleep 1
  adb shell settings put system user_rotation 1
  sleep 1
  adb shell settings put system user_rotation 0
  sleep 1
  adb shell settings put system accelerometer_rotation 1
}

function rotate-log() {
  local pkg="${1:-}"
  local pid=""

  if [[ -z "$pkg" ]]; then
    echo 'Usage: rotate-log <package-name>'
    echo 'Example: rotate-log com.camerasideas.trimmer'
    return 1
  fi

  pid="$(adb shell pidof "$pkg" 2>/dev/null | tr -d '\r')"
  adb logcat -c

  if [[ -n "$pid" ]]; then
    echo "Filtering logcat for $pkg (pid=$pid)"
    adb logcat --pid="$pid"
  else
    echo "Process for $pkg is not running yet; showing package-filtered logcat"
    adb logcat | grep --line-buffered "$pkg"
  fi
}

[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
[[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && source "$HOME/google-cloud-sdk/path.zsh.inc"
[[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && source "$HOME/google-cloud-sdk/completion.zsh.inc"
[[ -f "$HOME/.openclaw/completions/openclaw.zsh" ]] && source "$HOME/.openclaw/completions/openclaw.zsh"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

#[[ -f "$HOME/.config/kaku/zsh/kaku.zsh" ]] && source "$HOME/.config/kaku/zsh/kaku.zsh"
