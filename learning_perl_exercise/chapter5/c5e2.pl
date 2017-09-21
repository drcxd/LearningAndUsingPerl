#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

say 'enter some strings:';
my @strings;
while (<STDIN>) {
    chomp;
    push @strings, $_;
}
say '123456789012345678901234567890';
foreach (@strings) {
    printf "%20s\n", $_;
}
