# 0x0 upload script
Unofficial [0x0](https://0x0.st) upload bash script implementing the full [0x0](https://0x0.st) API and extra QoL.  
Quality of life features such as:
- copying the output link to clipboard. (Only works on Xorg)
- [embeds.video](https://embeds.video) support.
- token file containing all links and management tokens of uploaded files for changing of expiry time/deletion after uploading.
- config file to set default upload options and change the 0x0 instance.

## Installation
This is a one file bash script, installing can be done in a few ways, examples: (with either example don't forget to make the script executable with `chmod +x 0x0`)
- Download/copy the [`0x0`](0x0) file from GitHub and put it anywhere in PATH (for example: `/usr/local/bin` or preferrably `~/.local/bin` if in PATH).
- `git clone https://github.com/AndyRusso/0x0` and symlink the script to a directory in PATH (example: `ln -s $(realpath 0x0) ~/.local/bin/0x0)`), this has the bonus of easy updates (`git pull`) if this script ever gets an update.

Config file and token file will be generated by the script and placed according to the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).

This script can be integrated with other programs. This repository contains two ready for use examples:
- "Send To" entry for the [Thunar](https://docs.xfce.org/xfce/thunar/start) file manager in [`0x0.desktop`](0x0.desktop). (Replace `kitty` with your terminal emulator)
- [Lua mpv script](https://mpv.io/manual/master/#lua-scripting) for uploading media right from the player. Press `Shift + u` and the script will start uploading with a progress bar: [`0x0.lua`](0x0.lua).

## Usage
This is a copy of the help message from the actual script.
```
Usage:
  0x0 [upload] [OPTION]... FILE
  0x0 delete URL [TOKEN]
  0x0 expire URL TIME [TOKEN]

0x0 upload bash script implementing the full 0x0 API and extra QoL.

Upload a FILE (can be a URL) to https://0x0.st.
Or delete a URL, optionally using TOKEN.
Or set expiry date of a URL to TIME,
optionally using TOKEN.

Delete and expire commands try
to find the URL inside the tokens file,
so you could end up with more than one match,
in which case the script will use the latest token.
If a TOKEN is provided, it will be used instead,
but URL must be a valid URL.

Config stored at "$config_path".
Tokens file stored at "$tokens_path".

Commands:
  upload (default if omitted)
  delete
  expire sets expiry date

Options for upload:
  -h,   --help      show this help message.
  -e,   --embed     wrap with https://embeds.video to embed videos >50 MB on discord.
  -ne,  --no-embed  do not wrap output with https://embeds.video. (default)
  -s,   --secret    enables secret filename. (0x0.st/s/*/filename)
  -ns,  --no-secret disables secret filename. (default)
  -ex,  --expire    expire time in hours or epoch milliseconds, 0 for unset.
  -nex, --no-expire do not expire, same as "--expire 0". (default)

Examples:
  0x0 upload video.mp4
  0x0 -s --no-expire -e video.mp4 (results in https://0x0.st/abcd.mp4 for examples)
  0x0 expire abcd.mp4 10 (looked up URL and token in the tokens file)
  0x0 expire https://0x0.st/abcd.mp4 10 MfOaB8Yf7SADSlkR3NJKbNT99Idt9t09gyHfDsOlkrU
  0x0 delete abcd (look up by incomplete string)
  0x0 delete MfOaB8Yf7SADSlkR3NJKbNT99Idt9t09gyHfDsOlkrU (look up by token)
```
