#!/bin/sh

# Checking Truecolor
# Based on: https://gist.github.com/XVilka/8346728 and https://unix.stackexchange.com/a/404415/395213
awk -v term_cols="${width:-$(tput cols || echo 80)}" -v term_lines="${height:-1}" 'BEGIN{
    s="/\\";
    total_cols=term_cols*term_lines;
    for (colnum = 0; colnum<total_cols; colnum++) {
        r = 255-(colnum*255/total_cols);
        g = (colnum*510/total_cols);
        b = (colnum*255/total_cols);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum%2+1,1);
        if (colnum%term_cols==term_cols) printf "\n";
    }
    printf "\n";
}'

# Based on: https://michenriksen.com/posts/italic-text-in-alacritty-tmux-neovim/
echo -e '\e[1mBold\e[22m'
echo -e '\e[2mDimmed\e[22m'
echo -e '\e[3mItalic\e[23m'
echo -e '\e[4mUnderlined\e[24m'
echo -e '\e[4:3mCurly Underlined\e[4:0m'
echo -e '\e[4:3m\e[58;2;240;143;104mColored Curly Underlined\e[59m\e[4:0m'
