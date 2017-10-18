#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

for (@ARGV) {
    unlink $_ or warn "failed on $_: $!\n";
}
