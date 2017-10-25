#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

print "Please input an positive integer: ";
chomp (my $number = <>);
given ($number) {
    when (/\D/) { say "Not an positive integer!" }
    my @divisors = &divisors($_);
    my @empty = ();
    when (@divisors ~~ @empty) { say "Prime number: $_" }
    default { say "@divisors" }
}

sub divisors {
    my $number = shift;
    my @divisors = ();
    for my $divisor (2 .. ($number / 2)) {
        push @divisors, $divisor unless $number % $divisor;
    }
    return @divisors;
}
