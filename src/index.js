// CSS
import "./styles/site.scss";


// js
import "./scripts/site.js";

// images
// Note that images that are dupliactes of each other are ignored even if you change the file name.
import.meta.glob(["./images/**/*", "./images/**/**/*"], { eager: true, import: "default" })
// import.meta.glob("../sprite.svg", { eager: true, import: "default" })