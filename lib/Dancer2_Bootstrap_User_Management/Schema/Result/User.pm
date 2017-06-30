use utf8;
package Dancer2_Bootstrap_User_Management::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Dancer2_Bootstrap_User_Management::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut
__PACKAGE__->load_components(qw(PassphraseColumn));
__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 password

  data_type: 'varchar'
  default_value: null
  is_nullable: 1
  size: 40

=head2 email

  data_type: 'varchar'
  default_value: null
  is_nullable: 1
  size: 255

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0
  size: 1

=head2 lastlogin

  data_type: 'datetime'
  default_value: null
  is_nullable: 1

=head2 pw_changed

  data_type: 'datetime'
  default_value: null
  is_nullable: 1

=head2 pw_reset_code

  data_type: 'varchar'
  default_value: null
  is_nullable: 1
  size: 255

=head2 created_at

  data_type: 'timestamp'
  is_nullable: 1

=head2 updated_at

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "username",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "email",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 255,
  },
  "deleted",
  { data_type => "tinyint", default_value => 0, is_nullable => 0, size => 1 },
  "lastlogin",
  { data_type => "datetime", default_value => \"null", is_nullable => 1 },
  "pw_changed",
  { data_type => "datetime", default_value => \"null", is_nullable => 1 },
  "pw_reset_code",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 255,
  },
  "created_at",
  { data_type => "timestamp", is_nullable => 1 },
  "updated_at",
  { data_type => "timestamp", is_nullable => 1 },
);


__PACKAGE__->add_column(
    "password",
  {
        passphrase => 'crypt',
        passphrase_class => 'BlowfishCrypt',
        passphrase_args  => { key_nul => 1, cost => 10, salt_random => 1 },
        passphrase_check_method => 'check_password',
    }
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut


__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user_roles

Type: has_many

Related object: L<Dancer2_Bootstrap_User_Management::Schema::Result::UserRole>

=cut


__PACKAGE__->has_many(
  "user_roles",
  "Dancer2_Bootstrap_User_Management::Schema::Result::UserRole",
  { "foreign.users_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 roles

Type: many_to_many

Composing rels: L</user_roles> -> role

=cut

__PACKAGE__->many_to_many("roles", "user_roles", "role");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2017-06-29 00:14:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kBlyx+L9oxy+KAuk7P46GQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
