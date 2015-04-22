#!/usr/bin/perl

use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME               => 'App::calendr',
    AUTHOR             => q{Mohammad S Anwar <mohammad.anwar@yahoo.com>},
    VERSION_FROM       => 'lib/App/calendr.pm',
    ABSTRACT_FROM      => 'lib/App/calendr.pm',
    LICENSE            => 'artistic_2',
    EXE_FILES          => [ 'script/calendr' ],
    PL_FILES           => {},
    MIN_PERL_VERSION   => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES   => {
        'Test::More' => 0,
    },
    PREREQ_PM               => {
        'Types::Standard'   => 0,
        'MooX::Options'     => 0,
        'Module::Pluggable' => 0,
        'Moo'               => 0,
        'namespace::clean'  => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'App-calendr-*' },
    (eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/Manwar/App-calendr.git',
                web  => 'https://github.com/Manwar/App-calendr',
            },
        }})
     : ()
    ),
);
