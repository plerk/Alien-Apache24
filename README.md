# Alien::Apache24 [![Build Status](https://secure.travis-ci.org/plicease/Alien-Apache24.png)](http://travis-ci.org/plicease/Alien-Apache24)

Build and install Apache httpd 2.4.x

# SYNOPSIS

From the command line:

    % cpanm Alien::Apache24
    % alien-apache24 httpd -v
    % alien-apache24-install-mod_perl

From Perl:

    use Alien::Apache24;
    use File::Spec;
    my $httpd = File::Spec->catfile(Alien::Apache24->bin_dir, 'httpd');

# DESCRIPTION

This module is intended primarily to build an Apache for the specific 
Perl instance in a setting where you may have many Perl instances on the 
same host.  Unlike most [Alien::Based](https://metacpan.org/pod/Alien::Based) based distributions, it will 
NEVER use the system Apache.  Instead it will ALWAYS install its own 
private instance of Apache into a share directory.

It is especially useful for me for testing [mod\_perl](https://metacpan.org/pod/mod_perl) based modules 
without having them integrate with the system Apache.

# METHODS

## bin\_dir

    my $dir = Alien::Apache24->bin_dir;

Returns the location of the directory that contains the Apache executables,
such as apxs and httpd.

# COMMANDS

## alien-apache24

    % alien-apache24 httpd -v

Run a command with the Apache bin directory in your path.

## alien-apache24-install-mod\_perl

    % alien-apache24-install-mod_perl

Download mod\_perl from the internet and attempt to install it.  It will 
run the test suite before installing, and will prompt you if you want to 
install it even if the test suite fails.  If the test suite passes it 
will install without prompting.

This script may attempt to patch the mod\_perl source code for known 
problems and incompatibilities.

# CAVEATS

The install of this module is NOT relocatable.  Apache hard codes the 
paths in a number of its helper scripts and you will be entering a world 
of pain if you attempt to relocate this modules install files after the 
fact.

# SEE ALSO

[alien-apache24](https://metacpan.org/pod/alien-apache24), [alien-apache24-install-mod\_perl](https://metacpan.org/pod/alien-apache24-install-mod_perl)

# AUTHOR

Graham Ollis &lt;plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
