#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

while (<STDIN>) {
    chomp;
    if (/fred/) {
        say;
    }
}
