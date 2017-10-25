#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

for (@ARGV) {
    when (! -e) { next }
    when (-r) { say "$_ is readable"; continue }
    when (-w) { say "$_ is writable"; continue }
    when (-x) { say "$_ is executable"; continue }
}
