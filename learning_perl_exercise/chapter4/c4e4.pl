#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

&greet("Fred");
&greet("Barney");

sub greet {
    my ($name) = @_;
    state $n = 0;
    state $prev;
    if ($n == 0) {
        say "Hi $name! You are the first one here!";
    } else {
        say "Hi $name! $prev is also here!";
    }
    $prev = $name;
    ++$n;
}
