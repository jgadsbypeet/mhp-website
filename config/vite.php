<?php

use craft\helpers\App;

// return [
//     'useDevServer' => App::env('ENVIRONMENT') === 'dev' || App::env('CRAFT_ENVIRONMENT') === 'dev',
//     'manifestPath' => '@webroot/dist/.vite/manifest.json',
//     'devServerPublic' => App::env('PRIMARY_SITE_URL') . ':3000',
//     'serverPublic' => App::env('PRIMARY_SITE_URL') . '/dist/',
//     'errorEntry' => '',
//     'cacheKeySuffix' => '',
//     'devServerInternal' => 'http://localhost:3000',
//     'checkDevServer' => true,
//     'includeReactRefreshShim' => false,
//     'includeModulePreloadShim' => true,
//     // 'criticalPath' => '@webroot/dist/criticalcss',
//     // 'criticalSuffix' =>'_critical.min.css',
// ];

return [

    '*' => [
        'checkDevServer' => false,
        'devServerInternal' => 'http://localhost:3000',
        'devServerPublic' => App::env('PRIMARY_SITE_URL') . ':3000',
        'errorEntry' => 'src/scripts/site.js',
        'manifestPath' => '@webroot/dist/.vite/manifest.json',
        'serverPublic' => App::env('PRIMARY_SITE_URL') . '/dist/',
        'useDevServer' => false,
    ],

    'dev' => [
        'useDevServer' => true,
        'checkDevServer' => true,
    ]
];
