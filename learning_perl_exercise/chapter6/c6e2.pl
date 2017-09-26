#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my %count;

while (<STDIN>) {
    chomp;
    ++$count{$_};
}

foreach (sort keys %count) {
    say "$_ $count{$_}";
}
