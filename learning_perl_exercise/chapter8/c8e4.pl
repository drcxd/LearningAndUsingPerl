#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

while (<>) {
    chomp;
    if (/(?<word>\w*a)\W+/ or /(?<word>\w*a)$/) {
        print "Matched: |$`<$&>$'|\n";
        print 'word' . " contains '$+{word}'\n";
    } else {
        print "No match: |$_|\n";
    }
}
