#!/usr/bin/env perl

use 5.030;
use strict;
use warnings;

sub main {
    my $chips = 20;
    my $player = 1;

    while ($chips > 0) {
        print "Available chips: $chips\n";

        if ($player == 1) {
            print "Player $player, how many chips do you want to take (1 or 2)? ";
            my $withdrawal = <STDIN>;
            chomp($withdrawal);

            while ($withdrawal !~ /^[1-2]$/ or $withdrawal > $chips) {
                print "Invalid input. Please choose 1 or 2 chips: ";
                $withdrawal = <STDIN>;
                chomp($withdrawal);
            }

            $chips -= $withdrawal;
        }
        
        else {
            my $withdrawal = $chips % 2;
            $withdrawal = $withdrawal == 0 ? 1 : $withdrawal;

            print "Computer withdraws $withdrawal chip(s)\n";

            $chips -= $withdrawal;
        }

        $player = 3 - $player;
    }

    print "Player $player wins!\n";
}

main();
