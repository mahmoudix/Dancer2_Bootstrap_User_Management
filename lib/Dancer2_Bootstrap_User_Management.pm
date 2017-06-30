package Dancer2_Bootstrap_User_Management;
    
use Dancer2;
use Dancer2::Plugin::DBIC;

### Form lib
use Dancer2_Bootstrap_User_Management::User::Form::User;

require Dancer2_Bootstrap_User_Management::User::User;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'Dancer2_Bootstrap_User_Management' };
};



get '/new' => sub {
    template 'new';
};

post '/new' => sub {
    my $user;
    my @errors;
    my %cols = (
        username       => 'Username',
        email => 'Email',
        password        => 'Password',
        password_confirmation        => 'Password_confirmation',

    );

    foreach (qw[username email password password_confirmation]) {

        unless ($user->{$_} = body_parameters->get($_)) {
            push @errors, $cols{$_};
        }
      
    }

    if (@errors) {
        return template 'new', { errors => \@errors, item => $user };
    }

    resultset('User')->create($user);
    redirect('/');
};

true;
