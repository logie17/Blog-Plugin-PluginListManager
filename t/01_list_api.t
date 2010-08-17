use strict;
use warnings;

use Test::More tests => 2;                      # last test to print

BEGIN{ use_ok('Blog::Plugin::PluginListManager') }

my $obj = Blog::Plugin::PluginListManager->new(plugin_path => '../test_data/');

is $obj->build_list, 2;



