#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @inputs;

while (<STDIN>) {
    chomp;
    push @inputs, $_;
}

@inputs = sort @inputs;
# output in seperated lines
foreach (@inputs) {
    say;
}

# output in the same line
foreach (@inputs) {
    print $_ . ' ';
}
say '';
