#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

say 'input the raidus: ';
my $radius = <STDIN>;
$radius = 0 if $radius < 0;
say 'the cirumference is ' . 2 * 3.141592654 * $radius;
