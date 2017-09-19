#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @names = qw (fred betty barney dino wilma pebbles bamm-bamm);
my @indices;

while (<STDIN>) {
    chomp;
    push @indices, $_ - 1;
}

foreach (@indices) {
    say $names[$_];
}
