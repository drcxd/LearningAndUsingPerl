#!/usr/local/bin/perl

# The experimental warning is really annoying.
# And the isn't numeric in smart match warning.

use strict;
use warnings;
use 5.026;

my $secret_number = int(1 + rand 100);
my $answer = -1;

until ($answer ~~ $secret_number) {
    say "Input your answer boy!";
    chomp($answer = <>);
    given ($answer) {
        when (/quit/) { last }
        when (/exit/) { last }
        when ('') { last }
        when (!/\A-?\d+\z/) { say "Please input a number!" }
        when ($answer > $secret_number) { say "Too large" }
        when ($answer < $secret_number) { say "Too small" }
        when ($answer ~~ $secret_number) { say "Congratulations! You found the secret number!" }
    }
}
