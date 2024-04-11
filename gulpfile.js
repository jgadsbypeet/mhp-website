const autoprefixer = require("autoprefixer");
const browserSync = require("browser-sync").create();
const clean = require("gulp-clean");
const concat = require("gulp-concat");
const gulp = require("gulp");
const imagemin = require("gulp-imagemin");
const postcss = require("gulp-postcss");
const sass = require("gulp-sass")(require("sass"));
const cssnano = require('gulp-cssnano');
const sourcemaps = require("gulp-sourcemaps");
const uglify = require("gulp-uglify");
const rev = require("gulp-rev");
const tailwind = require("tailwindcss");

//----------------//
// Site Proxy URL //
//----------------//

require("dotenv").config();
const siteProxy = process.env.DDEV_HOSTNAME;

//-------//
// Paths //
//-------//

const paths = {
  source: {
    root: "./src/",
    styles: "./src/styles/",
    cpStyles: "./src/styles/cp/",
    scripts: "./src/js/",
    images: "./src/images/",
    fonts: "./src/fonts/",
    favicons: "./src/favicons/",
    templates: "./templates/",
  },
  destination: {
    root: "./web/dist/",
    styles: "./web/dist/styles/",
    cpStyles: "./web/dist/styles/cp/",
    scripts: "./web/dist/js/",
    images: "./web/dist/images/",
    fonts: "./web/dist/fonts/",
    favicons: "./web/",
  },
};

//-------//
// Clean //
//-------//

gulp.task("clean-dist", () =>
  gulp
    .src(paths.destination.root, { read: false, allowEmpty: true })
    .pipe(clean({ force: true }))
);

//------//
// SCSS //
//------//

gulp.task("compile-rev-scss", () =>
  gulp
    .src(paths.source.styles + "*.scss")
    .pipe(sourcemaps.init())
    .pipe(
      sass({
        outputStyle: "compressed",
      }).on("error", sass.logError)
    )
    .pipe(postcss([tailwind(),autoprefixer()]))
    .pipe(cssnano())
    .pipe(sourcemaps.write("./"))
    .pipe(rev())
    .pipe(gulp.dest(paths.destination.styles))
    .pipe(rev.manifest(
      "web/dist/rev-manifest.json", // rev-manifest path (where to save)
      {
        base: paths.destination.root,
        merge: true // Merge with the existing manifest if one exists
      }
    ))
    .pipe(gulp.dest(paths.destination.root)) // manifest file distination
);

gulp.task("compile-scss", () =>
  gulp
    .src(paths.source.styles + "*.scss")
    .pipe(sourcemaps.init())
    .pipe(
      sass({
        outputStyle: "compressed",
      }).on("error", sass.logError)
    )
    .pipe(postcss([tailwind(),autoprefixer()]))
    .pipe(cssnano())
    .pipe(sourcemaps.write("./"))
    .pipe(gulp.dest(paths.destination.styles))
);

gulp.task("compile-cp-scss", () =>
  gulp
    .src(paths.source.cpStyles + "*.scss")
    .pipe(sourcemaps.init())
    .pipe(
      sass({
        outputStyle: "compressed",
      }).on("error", sass.logError)
    )
    .pipe(postcss([autoprefixer()]))
    .pipe(cssnano())
    .pipe(sourcemaps.write("./"))
    .pipe(gulp.dest(paths.destination.cpStyles))
);

gulp.task("watch-scss", () =>
  gulp.watch(
    [
      paths.source.templates + "**/*",
      paths.source.templates + "*",
      paths.source.styles + "**/*",
      paths.source.styles + "*",
      paths.source.cpStyles + "*",
      "./tailwind.config.js"
    ],
    gulp.series(["compile-rev-scss", "compile-scss", "compile-cp-scss"])
  )
);

//----//
// JS //
//----//

gulp.task("build-rev-vendor-js", () =>
  gulp
    .src(paths.source.scripts + "vendor/**/*.js")
    .pipe(rev())
    .pipe(gulp.dest(paths.destination.scripts + "vendor/"))
    .pipe(rev.manifest(
      "web/dist/rev-manifest.json", // rev-manifest path (where to save)
      {
        base: paths.destination.root,
        merge: true // Merge with the existing manifest if one exists
      }
    ))
    .pipe(gulp.dest(paths.destination.root)) // manifest file distination
);

gulp.task("build-vendor-js", () =>
  gulp
    .src(paths.source.scripts + "vendor/**/*.js")
    .pipe(gulp.dest(paths.destination.scripts + "vendor/"))
);

gulp.task("build-rev-js", () =>
  gulp
    .src(paths.source.scripts + "*.js")
    .pipe(sourcemaps.init())
    .pipe(concat("main.js"))
    .pipe(uglify())
    .pipe(sourcemaps.write("./"))
    .pipe(rev())
    .pipe(gulp.dest(paths.destination.scripts))
    .pipe(rev.manifest(
      "web/dist/rev-manifest.json", // rev-manifest path (where to save)
      {
        base: paths.destination.root,
        merge: true // Merge with the existing manifest if one exists
      }
    ))
    .pipe(gulp.dest(paths.destination.root)) // manifest file distination
);

gulp.task("build-js", () =>
  gulp
    .src(paths.source.scripts + "*.js")
    .pipe(sourcemaps.init())
    .pipe(concat("main.js"))
    .pipe(uglify())
    .pipe(sourcemaps.write("./"))
    .pipe(gulp.dest(paths.destination.scripts))
);

gulp.task("watch-js", () =>
gulp.watch(paths.source.scripts + "*", gulp.series("build-rev-js", "build-js"))
);

//--------//
// Images //
//--------//

gulp.task("compress-images", () =>
  gulp
    .src(paths.source.images + "**/*")
    .pipe(
      imagemin([
        // imagemin.gifsicle({interlaced: true}),
        // imagemin.mozjpeg({quality: 75, progressive: true}),
        // imagemin.optipng({optimizationLevel: 5}),
        imagemin.svgo({
          plugins: [{ removeViewBox: false }, { cleanupIDs: false }],
        }),
      ])
    )
    .pipe(gulp.dest(paths.destination.images))
);

gulp.task("watch-images", () =>
  gulp.watch(paths.source.images + "**/*", gulp.series("compress-images"))
);

//--------------//
// Other assets //
//--------------//

gulp.task("build-fonts", () =>
  gulp.src(paths.source.fonts + "**/*").pipe(gulp.dest(paths.destination.fonts))
);
gulp.task("build-favicons", () =>
  gulp
    .src(paths.source.favicons + "*")
    .pipe(gulp.dest(paths.destination.favicons))
);

//--------//
// Server //
//--------//

gulp.task("serve", () => {
  browserSync.init({
    proxy: siteProxy,
    host: siteProxy,
    port: 3000
  });

  gulp
    .watch([
      paths.source.styles + "**/*",
      paths.source.styles + "*",
      paths.source.scripts + "**/*",
      paths.source.scripts + "*",
      paths.destination.images + "**/*",
      paths.source.templates + "**/*",
      "./tailwind.config.js"
    ])
    .on("change", browserSync.reload);
});

//-----------------//
// Task assignment //
//-----------------//

gulp.task(
  "build",
  gulp.series(
    "clean-dist",
    "compile-rev-scss",
    "compile-scss",
    "compile-cp-scss",
    "build-rev-vendor-js",
    "build-vendor-js",
    "build-rev-js",
    "build-js",
    "compress-images",
    "build-fonts",
    "build-favicons"
  )
);

gulp.task(
  "dev",
  gulp.parallel("serve", "watch-scss", "watch-js", "watch-images")
);

gulp.task("default", gulp.series("build", "dev"));
