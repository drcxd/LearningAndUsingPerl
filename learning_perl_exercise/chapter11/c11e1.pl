#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

use Module::CoreList;

my %modules = %{  $Module::CoreList::version{5.014}};

for (keys %modules) {
    printf "Module Name: \t%s\nVersion: \t%s\n", $_, $modules{$_} // "undefined value";
}
