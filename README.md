# William Joseph Craft Boilerplate
This is the boilerplate install for Craft CMS builds at William Joseph. It contains an asset build pipeline, common plugins and a starting template architecture.

A site using this boilerplate is set up on William Joseph's Krystal hosting server and uses the subdomain craft-boilerplate.williamjoseph.dev (DNS in Cloudflare). The deployment pipeline is set up in William Joseph's Buddy account.

## How to use boilerplate
1. Make a website local directory
    - `mkdir folder-name`
1. Enter that directory
    - `cd folder-name`
1. Git clone boilerplate into the directory
    - `git clone https://github.com/WilliamJosephLtd/wj-craft5-boilerplate.git .`
1. Create a new repository on the command line
	- `git init`
    - `git remote set-url origin https://github.com/git-repo-url.git`
	- `git push -u origin main`
1. Change the `name` value in `.ddev/config.yaml` to the project name (this will define the dev site URL).
1. Edit the `name`, `description` and `url` values in `package.json`.
1. With Docker Desktop running in the background, run `ddev start`
    - See below **Running the site locally** section for [Docker Desktop](https://www.docker.com/products/docker-desktop/) install
1. Install Craft/plugins
    - `ddev composer install`
1. Create .env file from .env.example
    - `cp .env.example.dev .env`
1. Set up craft (`PRIMARY_SITE_URL` value should be empty in .env)
    - `ddev php craft setup`
    - Follow instructions on terminal
1. You should be able to log into CP (control panel) now. Some user login details are in 1Password if you need to create a new user for yourself.
    - Change user password
1. Edit .env file (add below)
    - SITE_NAME
    - SITE_GROUP_NAME
    - SYSTEM_EMAIL
    - EMAIL_SENDER_NAME
1. Check (or edit) system settings to match above variables from CMS settings
    - Settings > General ($SITE_GROUP_NAME),
	- Settings > Sites ($SITE_NAME), Update the site group name
	- Settings > Email ($SYSTEM_EMAIL, $EMAIL_SENDER_NAME)
1. Recreate a Craft license key
    - Delete `config/license.key` file
    - Craft will recreate a new license key automatically
1. Upgrade Craft and plugins to the latest
    - Check available upgrade from Utilities > Updates
    - `ddev composer update`
1. Recreate plugin license keys
    - Delete license keys in the CMS plugin settings (Settings > Plugins)
    - Craft will recreate new license keys automatically
1. Edit and lock the Craft and plugins versions
    - Check plugin versions from Settings > Plugins
    - Edit Craft and plugin versions in composer.json file
1. Fix the front-end error: `None of the configured strategies 'manifest' returned a value.`
    - From the project's root directory, run `ddev npm ci` to install the dependencies for the Gulp tasks. (See **Building assets** section for more details)
        - `ddev npm ci` will install `node_modules` exactly same as `package-lock.json` file
        - `ddev npm install` may change/update `package-lock.json` file
    - Run `ddev npm run build` which will trigger a production ready build of the project's assets using Gulp
    - A 'manifest' file for asset versions will be created in `/web/dist/rev-manifest.json`
    - The front-end should load okay now
1. Edit this README.md file for the new project by doing the following:
    - Edit the title and description at the top.
    - Remove the **How to use boilerplate** section.
    - Edit the **Running the site locally** section.

## Running the site locally
The quickest way to get this site up and running in your local development machine is to use [DDEV](https://ddev.com/). On a Mac;

1. Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
1. Install [DDEV-Local](https://ddev.com/get-started/). If you have Homebrew installed, run `brew tap drud/ddev && brew install ddev`
1. Login to the production CMS, navigate to 'Utilities' in the left hand menu and download (and unzip) a back-up of the production database
1. Clone this Github repository to your machine and open a terminal at the root of the project
1. Copy-paste the `.env.example.dev` file and rename the new file to `.env`. Edit DB related values as below
    - `CRAFT_DB_SERVER=db`
    - `CRAFT_DB_DATABASE=db`
    - `CRAFT_DB_USER=db`
    - `CRAFT_DB_PASSWORD=db`
1. With Docker Desktop running in the background, run `ddev start`
1. This will give the URL of the site (e.g. `https://yourprojectname.ddev.site`)
    - If you are running DDEV for the first time, you need to run `mkcert -install` for SSL certificate
1. Import database
    - Run `ddev import-db`
    - enter the file path for the `.sql` or `.zip` database export you downloaded (e.g. `/Users/username/Desktop/craft-boilerplate.sql.zip`)
1. You may need to fetch some other `.env` values (by fetching them from the server)
    - Update `PRIMARY_SITE_URL` value to match the URL given
    - Update `SITE_NAME`
    - Update `SITE_GROUP_NAME`
    - Update `SYSTEM_EMAIL`
    - Update `EMAIL_SENDER_NAME`
1. Run `ddev composer install`
1. The website should be running on the URL given (e.g. `https://yourprojectname.ddev.site`)
1. Fix the front-end error: `None of the configured strategies 'manifest' returned a value.`
    - From the project's root directory, run `ddev npm ci` to install the dependencies for the Gulp tasks. (See **Building assets** section for more details)
        - `ddev npm ci` will install `node_modules` exactly same as `package-lock.json` file
        - `ddev npm install` may change/update `package-lock.json` file
    - A 'manifest' file for asset versions will be created in `/web/dist/rev-manifest.json`
    - The front-end should load okay now

In the terminal, you should now run any PHP and Craft commands within the DDEV container. For example:
```
ddev php craft project-config/apply
```
If you would like to use `DDEV share` CLI for sharing your local dev site over the internet, run `brew install ngrok/ngrok/ngrok` to install `ngrok`

## Building assets
SCSS, JS and image assets are built using Gulp; the configuration for which can be found in `./gulpfile.js`. To begin development;

1. You will need to have the [Gulp CLI](https://gulpjs.com/docs/en/getting-started/quick-start/) installed globally on your machine in order to run the Gulp build tasks for this project. To install the Gulp CLI, run `npm install --global gulp-cli`. Once you have done these steps, you should never have to repeat them again for future projects.
1. From the project's root directory, run `ddev npm ci` to install the dependencies for the Gulp tasks.
    - `ddev npm ci` will install `node_modules` exactly same as `package-lock.json` file
    - `ddev npm install` may change/update `package-lock.json` file
1. From the project's root, run `ddev npm run dev`, which will trigger a Gulp dev task to build and watch your SCSS, JS and image files located in `./src/` as well as start a Browser-sync proxy server on `https://yourprojectname.ddev.site:3000` which should reflect your Craft development site. Note that Browser-sync will likely want to offer your project on `http` but ddev's router will accept `https` - you may just have to force this in your browser URL bar
1. You can now begin editing your SCSS, JS and image files in their respective `./src/` folders whilst leaving the Gulp task open in your terminal. Any changes to relevant files should trigger the appropriate asset build task as well as immediately seeing your changes reflected in your Browser-sync tab in your browser<sup>1</sup>.

<sup>1</sup>: Sometimes Browser-sync may get out of sync with the proxied main Craft development server, at which point you may be better to return to your main localhost URL (i.e. the one being served by DDEV or equivalent) with the disadvantage of refreshing the page to see your changes. Or alternatively you can kill the running `gulp` task and restart it.

## Image srcset
Image `srcset` can be generated by using `image srcset macro` in templates.
```
{{ macro.image({
    image: image,
    imageClass: "",
    alt: image.alt,
    lazyLoad: null,
    sizes: [
        { maxScreen: "479px", width: 448, height: null },
        { maxScreen: "767px", width: 688, height: null },
        { maxScreen: "", width: 904, height: null }
    ]
}) }}
```
1. `height` value is optional.
    - if height is specified, the image will be cropped to the size.
    - if height is empty, the image will not be cropped.

## CSS framework
The Tailwind CSS framework has been installed on this site. The Tailwind CSS is compiled when a Gulp task is run (`gulp` or `gulp build`). The compiled Tailwind CSS only contains classes that are in use in the HTML. The Tailwind documentation gives you lists of classes to use: https://tailwindcss.com/docs/installation

For example, instead of using `width:100%` in the custom CSS, add the class to the tag like this: `<header class="w-full">`

This class then uses the following from the base Tailwind CSS: `.w-full {width:100%}`

### Breakpoints
Every utility class in Tailwind can be applied conditionally at different breakpoints to build responsive interfaces without ever leaving your HTML. We still use a mobile-first approach.

To add a utility but only have it take effect at a certain breakpoint, prefix the class name with the breakpoint name, followed by a colon. This example gives the image a width of 16rem by default, 32rem on medium screens and 48rem on large screens:
`<img class="w-16 md:w-32 lg:w-48" src="...">`

The sizes for the breakpoints are specified in the Tailwind configuration file (`screens` in `tailwind.config.js`). These override Tailwind’s default sizes.

### Spacers (padding and margin)
Tailwind uses the following utilities for padding: `p{t|r|b|l}-{size}`

For example, we use `pt-6` for size 6 padding on the top.

We can also use:
- `p-{size}` for all sides
- `px-{size}` for both `padding-left` and `padding-right`
- `py-{size}` for both `padding-top` and `padding-bottom`

Tailwind uses similar class names for margins – just replace `p` with `m`.

The spacing sizes are set in the Tailwind configuration file (`spacing` in `tailwind.config.js`).

Use the responsive spacing Tailwind classes in the HTML like this:
`<div class="social pb-10 md:pb-10-lg">`

### Hover states
Prefix the class name with `hover:` to have a utility take effect on hover, for example:
`<label class="border block bg-white hover:bg-grey cursor-pointer...`