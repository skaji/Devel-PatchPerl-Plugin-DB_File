package Devel::PatchPerl::Plugin::DB_File;
use v5.16;
use warnings;

use version;

sub patchperl {
    my ($class, %argv) = @_;
    if ($^O ne "darwin") {
        return 1; # XXX
    }
    my $version = version->parse($argv{version});
    if ($version >= v5.10.1) {
        return 1; # OK
    }

    my $file = "ext/DB_File/Makefile.PL";
    warn "patching $file\n";

    open my $in, "<", $file or die;
    open my $out, ">", "$file.tmp" or die;

    while (my $l = <$in>) {
        print {$out} $l;
        if ($l =~ /NAME\s*=>\s*'DB_File',/) {
            print {$out} "CCFLAGS => '-Wno-incompatible-function-pointer-types',\n";
        }
    }
    close $in;
    close $out;
    rename "$file.tmp", $file or die $!;
    return 1;
}

1;
