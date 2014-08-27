package Biome::Forest;

use strict;
use warnings;

use base qw(Biome);
use Fixture::Tree;
use Mob::Deer;

sub initialize {
    my $self = shift;
    $self->SUPER::initialize();
    # if within 90% {
        my $tree = Fixture::Tree->new();
        $self->add_item($tree);
    # }
    # if within 90% {
        my $deer = Mob::Deer->new();
        $self->add_item($deer);
    # }
}

1;
