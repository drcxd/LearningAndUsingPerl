#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

say 'input a number: ';
my $num1 = <STDIN>;
chomp $num1;
say 'input another number: ';
my $num2 = <STDIN>;
chomp $num2;
say "the result of $num1 times $num2 is " . $num1 * $num2;
