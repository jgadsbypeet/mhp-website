// CSS
import "./styles/site.scss";


// js
import "./scripts/site.js";

// Import images and svg sprite to Vite manifest
import.meta.glob("../images/**/*", { eager: true, import: "default" })
// import.meta.glob("../sprite.svg", { eager: true, import: "default" })