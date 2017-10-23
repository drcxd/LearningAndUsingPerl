#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my $numbers = <STDIN>;
chomp $numbers;
my @numbers = split / /, $numbers;

for (sort { $a <=> $b } @numbers) {
    printf "%20s\n", $_;
}
