#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my $favorite_number = 2;

print "Please input an positive integer: ";
chomp (my $number = <>);
given ($number) {
    when (/\D/) { say "Not an positive integer!" }
    when ($_ % 2 ~~ 0) { say "Even number"; continue }
    when ($_ % 2 ~~ 1) { say "Odd number"; continue }
    when ($_ % $favorite_number ~~ 0) { say "Divisible by my favorite number $favorite_number"; continue}
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
