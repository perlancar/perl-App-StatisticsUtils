package App::StatisticsUtils;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'CLI utilities related to statistics',
};

$SPEC{z2pct} = {
    v => 1.1,
    summary => 'Convert z-score to percentile (for standard normal distribution)',
    args_as => 'array',
    args => {
        z => {
            schema => 'float*',
            req => 1,
            pos => 0,
        },
    },
    result_naked => 0,
    examples => [
        {
            args => {z=>0},
            result => 50,
        },
    ],
};
sub z2pct {
    require Statistics::Standar_Normal;
    Statistics::Standar_Normal::z_to_pct(shift);
}

$SPEC{pct2z} = {
    v => 1.1,
    summary => 'Convert percentile to z-score (for standard normal distribution)',
    args_as => 'array',
    args => {
        pct => {
            schema => ['float*', xbetween=>[0,100]],
            req => 1,
            pos => 0,
        },
    },
    result_naked => 0,
    examples => [
        {
            args => {pct=>50},
            result => 0,
        },
    ],
};
sub pct2z {
    require Statistics::Standar_Normal;
    Statistics::Standar_Normal::pct_to_z(shift);
}

1;
# ABSTRACT:

=head1 DESCRIPTION

This distribution contains the following CLI utilities:

# INSERT_EXECS_LIST


=head1 SEE ALSO

=cut
