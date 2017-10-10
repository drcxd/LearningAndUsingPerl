#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

$^I = "~";

my $prefix = "## Copyright (C) 2017 by Chang Xiaoduan\n";

while (<>) {
    s/\A#!.*\n\z/$_$prefix/;
    print;
}
