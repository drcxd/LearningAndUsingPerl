#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

say 'input a string: ';
my $string = <STDIN>;
say 'input a number: ';
my $times = <STDIN>;
say $string x $times;
