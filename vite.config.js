import { defineConfig } from "vite";
import { ViteImageOptimizer } from "vite-plugin-image-optimizer";
import ViteRestart from "vite-plugin-restart";
import copy from "rollup-plugin-copy";
import legacy from "@vitejs/plugin-legacy";

export default defineConfig(({ command }) => ({
    base: command === "serve" ? "" : "/dist/",
    publicDir: false,
    build: {
        outDir: "./web/dist/",
        emptyOutDir: true,
        sourcemap: true,
        manifest: true,
        minify: "esbuild",
        rollupOptions: {
            input: {
                index: "./src/index.js",
                // sprite: "./src/sprite.svg" // Ensure this is included
            },
            output: {
                dir: "./web/dist/",
                assetFileNames: (assetInfo) => {
                    let extType = assetInfo.name.split(".").pop();
                    if (/png|jpe?g|svg|gif|tiff|bmp|ico/i.test(extType)) {
                        extType = "images";
                    }
                    return `assets/${extType}/[name]-[hash][extname]`;
                },
                entryFileNames: "assets/js/[name]-[hash].js",
            },
            plugins: [
                copy({
                    targets: [
                        {
                            src: "./src/static/*",
                            dest: "./web/dist",
                        },
                    ],
                    flatten: true,
                    hook: "writeBundle",
                }),
            ],
        },
    },
    server: {
        host: "0.0.0.0",
        port: 3000,
    },
    plugins: [
        ViteRestart({
            reload: ["./templates/**/*"],
        }),
        copy({
            targets: [
                { 
                    src: "./src/public/**/*",
                    dest: "./web/dist",
                },
            ],
        }),
        legacy({
            targets: ["defaults", "not IE 11"],
        }),
        ViteImageOptimizer({
            svg: {
                multipass: true,
                plugins: [
                    {
                        name: "preset-default",
                        params: {
                            overrides: {
                                removeUselessDefs: false,
                                cleanupIds: false,
                                removeHiddenElems: false,
                                cleanupNumericValues: false,
                                removeViewBox: false,
                            },
                            cleanupIDs: {
                                minify: false,
                                remove: false,
                            },
                            convertPathData: false,
                        },
                    },
                    "sortAttrs",
                    {
                        name: "addAttributesToSVGElement",
                        params: {
                            attributes: [
                                { xmlns: "http://www.w3.org/2000/svg" },
                            ],
                        },
                    },
                ],
            },
            jpeg: {
                quality: 80,
            },
            jpg: {
                quality: 80,
            },
        }),
    ],
}));