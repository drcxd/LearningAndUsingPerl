#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @fred = &above_average(1 .. 10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = &above_average(100, 1 .. 10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";

sub above_average {
    my $count = 0;
    my $sum = 0;
    foreach (@_) {
        $sum += $_;
        ++$count;
    }
    my $average = $sum / $count;
    my @result;
    foreach (@_) {
        push @result, $_ if $_ > $average;
    }
    return @result;
}
