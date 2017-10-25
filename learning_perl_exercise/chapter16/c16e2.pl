#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

open STDOUT, '>', 'ls.out' or die "can't open ls.out!\n";
open STDERR, '>', 'ls.err' or die "can't open ls.err!\n";
chdir '/d';
system 'ls -l';
