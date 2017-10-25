#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

say "Please input a number: ";
chomp(my $number = <>);

given ($number) {
    when (! ($number % 3)) { say "Fizz"; continue }
    when (! ($number % 5)) { say "Bin"; continue }
    when (! ($number % 7)) { say "Sausage" }
}
