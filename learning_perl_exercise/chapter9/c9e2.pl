#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my @files = @ARGV;

foreach (@files) {
    chomp;
    my $input = $_;
    my $output = $input . ".out";
    open INPUT, "<", $input;
    open OUTPUT, ">", $output;
    while (<INPUT>) {
        chomp;
        s/fred/Larry/ig;
        say OUTPUT $_;
    }
    close INPUT;
    close OUTPUT;
}
