const expectedHash = "d028db7bb2b40894bad0d81fb432568cdd15db4c7f76ba1a8639333a4b0a737c";

function rotateRight(value, bits) {
	return (value >>> bits) | (value << (32 - bits));
}

function sha256(bytes) {
	const k = new Uint32Array([
		0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
		0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
		0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
		0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
		0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
		0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
		0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
		0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
	]);
	const bitLength = bytes.length * 8;
	const paddedLength = Math.ceil((bytes.length + 9) / 64) * 64;
	const padded = new Uint8Array(paddedLength);
	padded.set(bytes);
	padded[bytes.length] = 0x80;
	const view = new DataView(padded.buffer);
	view.setUint32(paddedLength - 4, bitLength);
	const hash = new Uint32Array([
		0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
	]);
	const w = new Uint32Array(64);
	for (let offset = 0; offset < paddedLength; offset += 64) {
		for (let index = 0; index < 16; index += 1) {
			w[index] = view.getUint32(offset + index * 4);
		}
		for (let index = 16; index < 64; index += 1) {
			const s0 = rotateRight(w[index - 15], 7) ^ rotateRight(w[index - 15], 18) ^ (w[index - 15] >>> 3);
			const s1 = rotateRight(w[index - 2], 17) ^ rotateRight(w[index - 2], 19) ^ (w[index - 2] >>> 10);
			w[index] = (w[index - 16] + s0 + w[index - 7] + s1) | 0;
		}
		let a = hash[0];
		let b = hash[1];
		let c = hash[2];
		let d = hash[3];
		let e = hash[4];
		let f = hash[5];
		let g = hash[6];
		let h = hash[7];
		for (let index = 0; index < 64; index += 1) {
			const s1 = rotateRight(e, 6) ^ rotateRight(e, 11) ^ rotateRight(e, 25);
			const choice = (e & f) ^ (~e & g);
			const temp1 = (h + s1 + choice + k[index] + w[index]) | 0;
			const s0 = rotateRight(a, 2) ^ rotateRight(a, 13) ^ rotateRight(a, 22);
			const majority = (a & b) ^ (a & c) ^ (b & c);
			const temp2 = (s0 + majority) | 0;
			h = g;
			g = f;
			f = e;
			e = (d + temp1) | 0;
			d = c;
			c = b;
			b = a;
			a = (temp1 + temp2) | 0;
		}
		hash[0] = (hash[0] + a) | 0;
		hash[1] = (hash[1] + b) | 0;
		hash[2] = (hash[2] + c) | 0;
		hash[3] = (hash[3] + d) | 0;
		hash[4] = (hash[4] + e) | 0;
		hash[5] = (hash[5] + f) | 0;
		hash[6] = (hash[6] + g) | 0;
		hash[7] = (hash[7] + h) | 0;
	}
	return [...hash].map((word) => (word >>> 0).toString(16).padStart(8, "0")).join("");
}

const root = document.documentElement;
const gate = document.getElementById("library-gate");
const main = document.getElementById("content");
const form = document.getElementById("library-gate-form");
const field = document.getElementById("library-password");
const error = document.getElementById("library-password-error");

function matches(left, right) {
	if (left.length !== right.length) {
		return false;
	}
	let difference = 0;
	for (let index = 0; index < left.length; index += 1) {
		difference |= left.charCodeAt(index) ^ right.charCodeAt(index);
	}
	return difference === 0;
}

function unlock() {
	sessionStorage.setItem("mhp-library-open", "1");
	root.classList.remove("library-locked");
	if (main) {
		main.inert = false;
	}
	const heading = document.querySelector("#content h1");
	if (heading) {
		heading.setAttribute("tabindex", "-1");
		heading.focus();
	}
}

if (root.classList.contains("library-locked") && form && field && error) {
	if (main) {
		main.inert = true;
	}
	field.focus();
	form.addEventListener("submit", async (event) => {
		event.preventDefault();
		const hash = sha256(new TextEncoder().encode(field.value));
		if (matches(hash, expectedHash)) {
			field.removeAttribute("aria-invalid");
			field.removeAttribute("aria-describedby");
			error.hidden = true;
			unlock();
			return;
		}
		field.setAttribute("aria-invalid", "true");
		field.setAttribute("aria-describedby", "library-password-error");
		error.hidden = false;
		field.select();
	});
}
