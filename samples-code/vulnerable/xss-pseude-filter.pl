#!/usr/bin/env perl
# Use: perl xss-pseudo-filter.pl daemon -m production -l http://*:8001

use 5.018;
use strict;
use warnings;
use re::engine::TRE;
use Mojolicious::Lite -signatures;

get "/" => sub ($request) {
    my $xss = $request -> param("TryHarder");
    $xss = lc $xss;

    if (($xss) && (length($xss) <= 32)) {
        my @blocklist = (
            "script", ";", "img", "link", "onload", "onfocus", "onblur", "onclick",
            "(", ")", "/", "onerror", "onplay", "onend", "svg", "<details", "audio",
            "h1", "h2", "h3", "h4", "h5", "h6", "iframe", "div", "section", "marquee", "onstart",
            "onmouseover", "onmousehover", "<body", "onmouseout", "onanimationend", "onanimationstart",
            "onbeforeprint", "onbegin", "onblur", "oncanplay", "<textarea", "select", "object", "data", "input",
            "alert", "confirm", "javascript", ":", "xss", "<b>", "<i>", "</b>", "</i>", "%",
            "onmouseup", "onwheel", "xss"
        );

        for (my $i = 0; $i <= 5; $i++) {
             foreach my $filter (@blocklist) {
                $xss =~ s/$filter//;          
            }
        }

        return ($request -> render ( 
            text => "
                <html>
                    <head>
                        <title>Awesome WAF - Try Harder!</title>
                    </head>
                    <body>
                        <h3>Hello $xss!!</h3>
                    </body>
                    <!-- Try Popup anything ;) -->
                </html>"
        ));    
    }
    
    return ($request -> render (
        text => "<script>window.location='/?TryHarder=Bob'</script>"
    ));
};

app -> start();
