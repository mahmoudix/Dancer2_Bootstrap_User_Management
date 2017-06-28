package Dancer2_Bootstrap_User_Management;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'Dancer2_Bootstrap_User_Management' };
};

true;
