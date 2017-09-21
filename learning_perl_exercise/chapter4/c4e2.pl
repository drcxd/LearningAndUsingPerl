#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @numbers = 1 .. 1000;

say &total(@numbers);

sub total {
    my $sum = 0;
    foreach (@_) {
        $sum += $_;
    }
    $sum;
}
