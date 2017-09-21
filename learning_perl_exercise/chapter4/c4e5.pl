#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

&greet("Fred");
&greet("Barney");
&greet("Wilma");
&greet("Betty");

sub greet {
    state $n = 0;
    state @names;
    my ($name) = @_;
    if ($n == 0) {
        say "Hi $name! You are the first one here";
    } else {
        say "Hi $name! I've seen: @names";
    }
    push @names, $name;
    ++$n;
}
