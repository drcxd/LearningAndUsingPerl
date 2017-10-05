#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

while (<>) {
    chomp;
    if (/match/) {
        print "Matched: |$`<$&>$'|\n";
    } else {
        print "No match: |$_|\n";
    }
}
