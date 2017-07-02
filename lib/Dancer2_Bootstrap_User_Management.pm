package Dancer2_Bootstrap_User_Management;
    
use Dancer2;
use Dancer2::Plugin::DBIC;
use Dancer2::Plugin::Auth::Extensible;
use Dancer2::Plugin::Auth::Extensible::Provider::DBIC;
### Form lib
use Dancer2_Bootstrap_User_Management::User::Form::User;

require Dancer2_Bootstrap_User_Management::User::User;

our $VERSION = '0.1';




get '/' => require_login sub {
my $users = logged_in_user;
my $user_id = $users->{id};
my $user = resultset('User')->find($users->{id})
        or return send_error('Not Found', 404);

   
    template 'index' => { user => $user };
};

    get '/user' => require_login sub {
        my $user = logged_in_user;
        return "Hi there, $user->{id}";
    };

get '/new' => sub {
    template 'new';
};


    post '/login' => sub {
        my ($success, $realm) = authenticate_user(
            params->{username}, params->{password}
        );
        if ($success) {
            session logged_in_user => params->{username};
	    session logged_in_user_realm => $realm;
            
	
            # other code here
        } else {
            # authentication failed
        }
    };
    
    any '/logout' => sub {
        session->destroy;
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
