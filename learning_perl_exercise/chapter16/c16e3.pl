#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

if (`date` =~ /\A(Sat|Sun)/) {
    say "go play";
} else {
    say "get to work";
}
