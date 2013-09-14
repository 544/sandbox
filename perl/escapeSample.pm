#!/usr/bin/perl

package main;

# エスケープシーケンスでコンソール制御

# クリア : Esc[2J
sub clearConsole {
    printf("\e[2J");
}

# 移動 : Esc[0;0H  (ただし、0;0 は座標)
sub moveCursor {
    $x = shift;
    $y = shift;
    printf( "\e[%s;%sH", $x, $y );
}

# 上移動 : Esc[0A  (ただし、0 は移動数)
sub up {
    $n = shift || 1;
    printf( "\e[%sA", $n );
}

# 下移動 : Esc[0B  (ただし、0 は移動数)
sub down {
    $n = shift || 1;
    printf( "\e[%sB", $n );
}

# 右移動 : Esc[0C  (ただし、0 は移動数)
sub right {
    $n = shift || 1;
    printf( "\e[%sC", $n );
}

# 左移動 : Esc[0D  (ただし、0 は移動数)
sub left {
    $n = shift || 1;
    printf( "\e[%sD", $n );
}

# 文字色 : Esc[30m  (ただし、0 はカラーコード)
# 0 : 黒
# 1 : 赤
# 2 : 緑
# 3 : 黄
# 4 : 青
# 5 : マゼンダ
# 6 : シアン
# 7 : 白
sub setColor {
    $n = "3" . shift || "0";
    printf( "\e[%sm", $n );
}

# 背景色 : Esc[40m  (ただし、0 はカラーコード)
sub setBgColor {
    $n = "4" . shift || "0";
    printf( "\e[%sm", $n );
}

# 文字色・背景色のリセット : Esc[0m
sub resetColor {
    printf("\e[0m");
}

1;
__END__

clearConsole;
moveCursor 0,0;
setColor 4;
print "hogehoge";
resetColor;

left 3;
setColor 3;
print "fuga";



