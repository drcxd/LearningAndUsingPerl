#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

while (<>) {
    chomp;
    if (/(\w*a)\W+/ or /(\w*a)$/) {
        print "Matched: |$`<$&>$'|\n";
        print '$1' . " contains '$1'\n";
    } else {
        print "No match: |$_|\n";
    }
}
