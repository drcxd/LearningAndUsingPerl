#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

# $^I = ".bak";

my $prefix = "## Copyright (C) 2017 by Chang Xiaoduan\n";
my $to_match_comment = 0;

while (<>) {
    if (/\A#!.*\n\z/) {
        $to_match_comment = 1;
        print;
        next;
    }
    if ($to_match_comment) {
        if (/\A##/) {
            $to_match_comment = 0;
        } else {
            s/$_/$prefix/;
            $to_match_comment = 0;
        }
    }
    print;
}
