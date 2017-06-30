#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run her
    use Dancer2;
    use Dancer2_Bootstrap_User_Management;
    use Plack::Builder;


builder {
  enable 'Plack::Middleware::Static',
  path => qr{^/(javascripts|css)/} , root => './public/';
  Dancer2_Bootstrap_User_Management->to_app;

};


=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use Dancer2_Bootstrap_User_Management;
use Plack::Builder;

builder {
    enable 'Deflater';
    Dancer2_Bootstrap_User_Management->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use Dancer2_Bootstrap_User_Management;
use Dancer2_Bootstrap_User_Management_admin;

builder {
    mount '/'      => Dancer2_Bootstrap_User_Management->to_app;
    mount '/admin'      => Dancer2_Bootstrap_User_Management_admin->to_app;
}

=end comment

=cut

