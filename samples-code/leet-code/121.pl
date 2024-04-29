#!/usr/bin/env perl

use 5.030;
use strict;
use warnings;

sub main {
    my @prices = (7,1,5,3,6,4);
    # [7,1,5,3,6,4]
    # [7,6,4,3,1]
    
    my $position  = 0;
    my $min_value = $prices[0];

    foreach my $item (keys @prices) {
        if ($prices[$item] < $min_value) {
            $min_value = $prices[$item];
        }

        my $operation = $prices[$item] - $min_value;
        
        if ($operation > $position) {
            $position = $operation;
        }
    }

    return $position;
}

print main(), "\n";

# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
# 121. Best Time to Buy and Sell Stock
