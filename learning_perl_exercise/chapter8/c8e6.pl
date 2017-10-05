#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

while (<>) {
    chomp;
    # say $_;
    if (/\s+$/) {
        say $_ . "EOL";
    }
}
