#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

use Mojo::Pg;
use Mojo::Pg::Migrations;
use FindBin '$Bin';

my $pg = Mojo::Pg->new('postgresql://postgres@localhost:5432/projectx');
my $mg = Mojo::Pg::Migrations->new(pg => $pg);
$mg->from_file("$Bin/../database/projectx_migrations.sql");
my $latest = $mg->latest;
$mg->migrate($latest);

