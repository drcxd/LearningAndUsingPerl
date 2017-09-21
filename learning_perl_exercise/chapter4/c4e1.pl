#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @fred = qw{ 1 3 5 7 9 };
my $fred_total = &total(@fred);
print "The total of \@fred is $fred_total.\n";
my $user_total = total(<STDIN>);
print "The total of those numbers is $user_total.\n";

sub total {
    my $sum = 0;
    foreach (@_) {
        $sum += $_;
    }
    $sum;
}
