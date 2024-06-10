<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\config\GeneralConfig;
use craft\helpers\App;

return GeneralConfig::create()
    // Allow administrative changes
    ->allowAdminChanges(App::env('CRAFT_ALLOW_ADMIN_CHANGES') ?? false)
    // The URI segment Craft should look for when determining if the current request should route to the control panel rather than the front-end website.
    ->cpTrigger("boiler-admin")
    // The default language the control panel should use for users who haven’t set a preferred language yet.
    ->defaultCpLanguage("en-GB")
    // The quality level Craft will use when saving JPG and PNG files. Ranges from 1 (worst quality, smallest file) to 100 (best quality, biggest file).
    ->defaultImageQuality(75)
    // Set the default week start day for date pickers (0 = Sunday, 1 = Monday, etc.)
    ->defaultWeekStartDay(1)
    // Enable Dev Mode (see https://craftcms.com/guides/what-dev-mode-does)
    ->devMode(App::env('CRAFT_DEV_MODE') ?? false)
    // Disallow robots
    ->disallowRobots(App::env('CRAFT_DISALLOW_ROBOTS') ?? false)
    // Whether the GraphQL API should be enabled.
    ->enableGql(false)
    // Prevent generated URLs from including "index.php"
    // Put error templates in /templates/error directory
    ->errorTemplatePrefix('_error/')
    // The maximum upload file size allowed. (160mb)
    ->maxUploadFileSize(167772160)
    // Prevent generated URLs from including "index.php"
    ->omitScriptNameInUrls()
    // Preload Single entries as Twig variables
    ->preloadSingles()
    // Prevent user enumeration attacks
    ->preventUserEnumeration(true)
    // The amount of time content preview tokens can be used before expiring. (7 days)
    ->previewTokenDuration(604800)
    // Whether asset URLs should be revved so browsers don’t load cached versions when they’re modified.
    ->revAssetUrls(true)
    // Whether Craft should run pending queue jobs automatically when someone visits the control panel.
    ->runQueueAutomatically(App::env('CRAFT_DEV_MODE') ?? false)
    // Whether an X-Powered-By: Craft CMS header should be sent
    ->sendPoweredByHeader(false)
    // Whether Craft should set users’ usernames to their email addresses, rather than let them set their username separately.
    ->useEmailAsUsername(true)
    // Set the @webroot alias so the clear-caches command knows where to find CP resources
    ->aliases([
        '@web' => App::env('CRAFT_WEB_URL'),
        '@webroot' => App::env('CRAFT_WEB_ROOT'),
    ])
;
