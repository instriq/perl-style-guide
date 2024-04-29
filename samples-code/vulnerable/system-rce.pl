#!/usr/bin/env perl

use 5.018;
use strict;
use warnings;

sub main {
    my $name = $ARGV[0];

    if ($name) {
        system ("echo Hello World! $name");
    }

    return 0;
}

exit main();
