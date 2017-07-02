##### USER SETTING REQUIREMENT 

set template => 'template_toolkit';       # set template engine

##### USER HOME
get '/users/' =>  sub {

#	set layout   => 'main';                    # 'undef' to disable layout
#	set views    => File::Spec->rel2abs('home/users'); # full path to views

    my @users = resultset('User')->all;
    template 'users/index' => { users => \@users };

};

##### USER NEW

get '/users/new' => sub {

#	set layout   => 'main';                    # 'undef' to disable layout
#	set views    => File::Spec->rel2abs('home/users'); # full path to views

    ##Params
    my $user = resultset('User')->new_result({});
    my $form = Dancer2_Bootstrap_User_Management::User::Form::User->new;
    
    ##Execution
    $form->process(item => $user, params => { params });

    ## Return Result To Template
    template 'users/new' => { form => $form };

};

##### USER SHOW

get '/users/:id' => require_login  sub {  

#    set layout   => 'main';                    # 'undef' to disable layout
#    set views    => File::Spec->rel2abs('home/users'); # full path to views

    my $user = resultset('User')->find(param('id'))
        or return send_error('Not Found', 404);


    template 'users/show' => { user => $user };
};



##### USER EDIT


get '/users/:id/edit'  =>  require_login sub {

#	 set layout   => 'main';                    # 'undef' to disable layout
# 	 set views    => File::Spec->rel2abs('home/users'); # full path to views

  my $users = logged_in_user;
my $user_id = $users->{id};
my $user = resultset('User')->find($users->{id})

     or return send_error('Not Found', 404);
	  
    my $form = Dancer2_Bootstrap_User_Management::User::Form::User->new;
     $form->process(item => $user, params => { params });             
    
template 'users/edit' => { form => $form };


};

##### USER CREATE

post '/users' => sub {
    
#         set layout   => 'main';                    # 'undef' to disable layout                                    
 #       set views    => File::Spec->rel2abs('home/users'); # full path to views                                    
  
    my $user = resultset('User')->new_result({});
    my $form = Dancer2_Bootstrap_User_Management::User::Form::User->new;
    $form->process(item => $user, params => { params });

    if ($form->validated) {
#	sign_in $user;
	redirect uri_for('/users/'. $user->id);
    } else {
	template 'users/new' => { form => $form };
    }

};
##### USER UPDATE
   
any [ 'post', 'put' ] => '/users/:id' => sub {

#    set layout   => 'main';                    # 'undef' to disable layout
 #   set views    => File::Spec->rel2abs('home/users'); # full path to views
    
    
    my $user = resultset('User')->find(param('id'))
        or return send_error('Not Found', 404);

    my $form = Dancer2_Bootstrap_User_Management::User::Form::User->new;
    $form->process(item => $user, params => { params });

    if ($form->validated) {
               redirect uri_for('users/' . $user->id);
    } else {
        template 'users/edit' => { form => $form };
    }

};


1;
