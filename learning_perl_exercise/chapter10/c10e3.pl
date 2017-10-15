#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my $max_length = 0;
foreach (keys %ENV) {
    if (length > $max_length) {
        $max_length = length;
    }
}

printf "%-${max_length}s\t\t%s\n", "KEYS", "VALUES";
foreach (sort keys %ENV) {
    printf "%-${max_length}s\t\t%s\n", $_, $ENV{$_} // 'undefined value';
}

for (qw (rain man dragon death killer wrong)) {
    printf "%-${max_length}s\t\t%s\n", $_, $ENV{$_} // 'undefined value';
}
