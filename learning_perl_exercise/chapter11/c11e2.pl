#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

use DateTime;

die "Input yyyy mm dd\n" unless @ARGV == 3;

my $debug;

my ($year, $month, $day) = @ARGV;

my $input = DateTime->new(
    year => $year,
    month => $month,
    day => $day,
    );

my $now = DateTime->now;

say $debug // "now is $now";
say $debug // "input is $input";

my $duration = $now - $input;

say $debug // "duration is $duration";

my @units = $duration->in_units( qw(years months days) );

printf "%d years, %d months, and %d days\n", @units;
