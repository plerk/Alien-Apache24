package My::ModuleBuild;

use strict;
use warnings;
use base qw( Alien::Base::ModuleBuild );
use File::chdir;

sub new
{
  my($class, %args) = @_;
  
  $args{alien_name} = 'apache';
  $args{alien_repository} = {
    protocol => 'http',
    host     => 'www.motorlogy.com',
    location => '/apache/httpd/',
    pattern  => qr{httpd-2\.4\..*\.tar\.gz$},
  };
  $args{alien_version_check} = 'false';
  $args{alien_stage_install} = 0;
  $args{alien_install_commands} = [ 'rm -rf %s', 'make install' ];
  
  my $self = $class->SUPER::new(%args);
  
  $self;
}

sub alien_check_built_version
{
  $CWD[-1] =~ /^httpd-(.*)$/ ? $1 : 'unknown';
}

1;
