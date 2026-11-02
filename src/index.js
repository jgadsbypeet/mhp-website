// CSS
import "./styles/site.css";


// js
import "./scripts/site.js";
import "./scripts/file-input.js";
import "./scripts/plan-copy.js";
import "./scripts/library-gate.js";

// images
// Note that images that are duplicates of each other are ignored even if you change the file name.
import.meta.glob(["./images/**/*", "./images/**/**/*"], { eager: true, import: "default" })
// import.meta.glob("../sprite.svg", { eager: true, import: "default" })