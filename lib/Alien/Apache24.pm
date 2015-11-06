package Alien::Apache24;

use strict;
use warnings;
use base qw( Alien::Base );

# ABSTRACT: Build and install Apache httpd 2.4.x
# VERSION

=head1 SYNOPSIS

From the command line:

 % cpanm Alien::Apache24
 % alien-apache24 httpd -v
 % alien-apache24-install-mod_perl

From Perl:

 use Alien::Apache24;
 use File::Spec;
 my $httpd = File::Spec->catfile(Alien::Apache24->bin_dir, 'httpd');

=head1 DESCRIPTION

This module is intended primarily to build an Apache for the specific 
Perl instance in a setting where you may have many Perl instances on the 
same host.  Unlike most L<Alien::Based> based distributions, it will 
NEVER use the system Apache.  Instead it will ALWAYS install its own 
private instance of Apache into a share directory.

It is especially useful for me for testing L<mod_perl> based modules 
without having them integrate with the system Apache.

=head1 METHODS

=head2 bin_dir

 my $dir = Alien::Apache24->bin_dir;

Returns the location of the directory that contains the Apache executables,
such as apxs and httpd.

=head1 COMMANDS

=head2 alien-apache24

 % alien-apache24 httpd -v

Run a command with the Apache bin directory in your path.

=head2 alien-apache24-install-mod_perl

 % alien-apache24-install-mod_perl

Download mod_perl from the internet and attempt to install it.  It will 
run the test suite before installing, and will prompt you if you want to 
install it even if the test suite fails.  If the test suite passes it 
will install without prompting.

This script may attempt to patch the mod_perl source code for known 
problems and incompatibilities.

=head1 CAVEATS

The install of this module is NOT relocatable.  Apache hard codes the 
paths in a number of its helper scripts and you will be entering a world 
of pain if you attempt to relocate this modules install files after the 
fact.

=head1 SEE ALSO

L<alien-apache24>, L<alien-apache24-install-mod_perl>

=cut

sub import {}

1;
