package Character;

use strict;
use warnings;

use base qw(Object);

use Data::Dumper;

sub can_go {
    my $self = shift;
    my $direction = shift;
    my $here = $self->where();
    my $exits = $here->get_exits();
    return $exits->{$direction} ? 1: 0;
}

sub move_to {
    my $self = shift;
    my $where = shift;
    my $here = $self->where();
    $here->occupant_remove($self);
    $where->occupant_add($self);
    return $self->{'location'} = $where;
}

sub is_in {
    my $self = shift;
    my $place = shift;
    return $self->{'location'} eq $place;
}

sub get_health { 1 }

sub has {
    my $self = shift;
    my $item = shift;
    return ( $self->has_on($item) || $self->has_in($item) ) ? 1 : 0;
}

sub has_on {
    my $self = shift;
    my $item = shift;
    return $self->{'visible'}->contains($item);
}

sub has_in {
    my $self = shift;
    my $item = shift;
    return $self->{'hidden'}->contains($item);
}
1;
