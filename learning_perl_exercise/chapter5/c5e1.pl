#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

while (my $file_name = pop @ARGV) {
    open INPUT, '<', $file_name
        or die "can't open file $file_name\n $!\n";
    my @lines = <INPUT>;
    @lines = reverse @lines;
    foreach (@lines) {
        print;
    }
}
