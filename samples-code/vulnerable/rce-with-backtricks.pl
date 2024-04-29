my $folder = $ARGV[0];
my $cmd = "ls -a $folder"; # assume $folder is dynamic/user provided value; if unchecked, could result in RCE attack
my @results = `$cmd`;
