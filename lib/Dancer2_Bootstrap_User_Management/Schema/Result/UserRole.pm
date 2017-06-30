use utf8;
package Dancer2_Bootstrap_User_Management::Schema::Result::UserRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dancer2_Bootstrap_User_Management::Schema::Result::UserRole

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user_role>

=cut

__PACKAGE__->table("user_role");

=head1 ACCESSORS

=head2 users_id

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0
  size: 11

=head2 role_id

  data_type: 'int'
  is_foreign_key: 1
  is_nullable: 0
  size: 11

=cut

__PACKAGE__->add_columns(
  "users_id",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0, size => 11 },
  "role_id",
  { data_type => "int", is_foreign_key => 1, is_nullable => 0, size => 11 },
);

=head1 PRIMARY KEY

=over 4

=item * L</users_id>

=item * L</role_id>

=back

=cut

__PACKAGE__->set_primary_key("users_id", "role_id");

=head1 RELATIONS

=head2 role

Type: belongs_to

Related object: L<Dancer2_Bootstrap_User_Management::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "Dancer2_Bootstrap_User_Management::Schema::Result::Role",
  { id => "role_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user

Type: belongs_to

Related object: L<Dancer2_Bootstrap_User_Management::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Dancer2_Bootstrap_User_Management::Schema::Result::User",
  { id => "users_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2017-06-29 00:14:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lTqn3hq6ExgrdZxOGO6HYg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
