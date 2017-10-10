#!/usr/local/bin/perl
use strict;
use warnings;
use 5.010;

# my $what = "fred";
my $what = "fred|lil";
while (<>) {
    chomp;
    if (/(:?$what){3}/) {
        print "Matched: |$`<$&>$'|\n";
    } else {
        print "No match: |$_|\n";
    }
}
