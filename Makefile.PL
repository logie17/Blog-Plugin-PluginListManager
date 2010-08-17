use inc::Module::Install;

name            'Blog-Plugin-PluginListManager';
author          'Logan Bell <logan@orchardtech.com>';
version         '0.01';
license         'gpl';
perl_version    '5.008008';
all_from        'lib/Blog/Plugin/PluginListManager.pm';

requires        'Test::MockModule'          => '0.05';
requires        'Moose'                     => '1.08';

WriteAll;
