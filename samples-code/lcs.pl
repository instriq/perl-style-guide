use strict;
use warnings;

sub longest_common_subsequence {
    my ($string1, $string2) = @_;

    my @chars1 = split //, $string1;
    my @chars2 = split //, $string2;
    my $length1 = scalar @chars1;
    my $length2 = scalar @chars2;

    my @matrix;
    for my $i (0..$length1) {
        for my $j (0..$length2) {
            $matrix[$i][$j] = 0;
        }
    }

    for my $i (1..$length1) {
        for my $j (1..$length2) {
            $matrix[$i][$j] = $matrix[$i-1][$j-1] + 1 if $chars1[$i-1] eq $chars2[$j-1];
            $matrix[$i][$j] = $matrix[$i-1][$j] if $chars1[$i-1] ne $chars2[$j-1] && $matrix[$i-1][$j] > $matrix[$i][$j-1];
            $matrix[$i][$j] = $matrix[$i][$j-1] if $chars1[$i-1] ne $chars2[$j-1] && $matrix[$i][$j-1] >= $matrix[$i-1][$j];
        }
    }

    my $i = $length1;
    my $j = $length2;
    my @lcs;

    while ($i > 0 && $j > 0) {
        if ($chars1[$i-1] eq $chars2[$j-1]) {
            unshift @lcs, $chars1[$i-1];
            $i--;
            $j--;
            next;
        }
        $i-- if $matrix[$i-1][$j] > $matrix[$i][$j-1];
        $j-- if $matrix[$i][$j-1] >= $matrix[$i-1][$j];
    }

    return join('', @lcs);
}

my $string1 = "ABCBDAB";
my $string2 = "BDCABC";

my $lcs = longest_common_subsequence($string1, $string2);

print "Longest common subsequence: $lcs\n";
