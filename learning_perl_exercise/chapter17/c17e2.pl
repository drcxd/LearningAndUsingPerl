#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @files = glob '*';

for my $file (@files) {
    my ($atime, $mtime) = (stat $file)[8, 9];
    say "$file\t$atime\t$mtime";
}
