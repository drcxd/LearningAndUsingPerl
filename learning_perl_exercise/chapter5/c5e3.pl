#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

say "input the line width: ";
my $width = <STDIN>;
chomp $width;
say "input some strings: ";
my @strings;
while (<STDIN>) {
    chomp;
    push @strings, $_;
}
say "1234567890" x ($width / 10 + 1);
foreach (@strings) {
    my $format = "%${width}s\n";
    printf $format, $_;
}
