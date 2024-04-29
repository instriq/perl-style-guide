#!/usr/bin/env perl

use 5.030;
use utf8;
use strict;
use warnings;
use LWP::UserAgent;
use Mojolicious::Lite;
use Mojo::JSON qw(decode_json);


get "/" => sub {
    my $self   = shift;
    my $site   = $self -> param("site");

    if ($site) {
        my $userAgent = LWP::UserAgent -> new(
             timeout  => 5,
            ssl_opts => {
                verify_hostname => 0,
                SSL_verify_mode => 0
            },
            agent => "Spellbook / v0.3.3"
        );

        my $request = $userAgent -> get($site);

        if ($request -> code() == 200) {
            my $content = $request -> content();

            return $self -> render(
                text => $content,
                status => 200
            );
        }
    }

    return $self -> render(
        status => 404,
        json => { "Error" => "Resource not found" }
    );
};

app -> start();
