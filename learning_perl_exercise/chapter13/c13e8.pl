#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

opendir DIR, '.' or die "Can't open current directory\n";

for (readdir DIR) {
    if (-l) {
        my $target = readlink;
        printf "$_\t$target\n";
    }
}
