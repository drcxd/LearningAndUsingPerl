#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @lines;

while (<STDIN>) {
    chomp;
    push @lines, $_;
}

@lines = reverse @lines;

foreach (@lines) {
    say;
}
