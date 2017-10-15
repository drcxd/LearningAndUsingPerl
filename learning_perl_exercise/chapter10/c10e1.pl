#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my $secret_number = int(1 + rand 100);
my $answer = -1;

while ($answer != $secret_number) {
    say "Input your answer boy!";
    $answer = <>;
    chomp $answer;
    if ($answer eq '' or
        $answer eq 'quit' or
        $answer eq 'exit') {
        last;
    }
    if ($answer > $secret_number) {
        say "Too high";
    } elsif ($answer < $secret_number) {
        say "Too low";
    } else {
        say "Congratulations! You found the secret number!";
    }
}

say 'Game Over. See You Again.';
