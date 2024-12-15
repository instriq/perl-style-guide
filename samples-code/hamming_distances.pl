#!/usr/bin/env perl

use strict;
use warnings;

sub calculate_hamming_distance {
    my ($sequence_a, $sequence_b) = @_;

    die "Sequences must have the same length\n" if length($sequence_a) != length($sequence_b);

    my $distance = 0;
    for my $index (0 .. length($sequence_a) - 1) {
        $distance++ if substr($sequence_a, $index, 1) ne substr($sequence_b, $index, 1);
    }

    return $distance;
}

my $sequence_a = "1011101";
my $sequence_b = "1001001";

my $hamming_distance = calculate_hamming_distance($sequence_a, $sequence_b);

print "Hamming distance between '$sequence_a' and '$sequence_b': $hamming_distance\n";
