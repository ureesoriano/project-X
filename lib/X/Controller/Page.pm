package X::Controller::Page;
use Mojo::Base 'Mojolicious::Controller';
use v5.24; use feature qw(signatures);
no warnings qw(experimental::signatures);

sub home($c) {
  # ... something with $c (controller) ?
}

sub about($c) {
  # ... something with $c (controller) ?
}

use Mojo::Pg;

sub add_user($c) {
    my $res = $c->pg->db->insert('users', {email => 'john@smith.com'});
}

1;
