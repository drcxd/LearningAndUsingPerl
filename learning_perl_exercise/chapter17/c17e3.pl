#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @files = glob '*';

for my $file (@files) {
    # my ($atime, $mtime) = (stat $file)[8, 9];
    my @times = (stat $file)[8, 9];
    # my ($day, $mon, $year) = (localtime $atime)[3, 4, 5];
    my ($atime, $mtime) = map {
        my ($day, $mon, $year) = (localtime($_))[3, 4, 5];
        $year += 1900;
        $mon += 1;
        sprintf("%-4d-%-2d-%-2d", $year, $mon, $day);
    } @times;
    say "$file\t$atime\t$mtime";
}
