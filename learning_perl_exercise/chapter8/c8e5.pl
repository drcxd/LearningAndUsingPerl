#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

while (<>) {
    chomp;
    if (/(?<word>\w*a)(?<extra>\W+.{0,4})/ or /(?<word>\w*a)$/) {
        print "Matched: |$`<$&>$'|\n";
        print 'word' . " contains '$+{word}'\n";
        if (defined $+{extra}) {
            print "extra contains '$+{extra}'\n";
        }
    } else {
        print "No match: |$_|\n";
    }
}
