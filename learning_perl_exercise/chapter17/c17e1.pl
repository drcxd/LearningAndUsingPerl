#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my $file = 'strings.txt';
open FILE, '<', $file or die "can't open file $file: $!\n";
my @strings = <FILE>;

while (1) {
    say "input your pattern: ";
    chomp(my $pattern = <STDIN>);
    last if $pattern =~ /\A\s*\Z/;
    my @matches = eval { grep /$pattern/, @strings; };
    if ($@) {
        say "An error occured ($@), continuing";
    } else {
        my $count = @matches;
        say "There were $count match strings:\n@matches";
    }
}
