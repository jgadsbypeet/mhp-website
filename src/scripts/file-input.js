const pickers = document.querySelectorAll(".file-picker");

pickers.forEach((picker) => {
	const input = picker.querySelector(".file-picker__input");
	const name = picker.querySelector(".file-picker__name");

	if (!input || !name) {
		return;
	}

	input.addEventListener("change", () => {
		const file = input.files && input.files[0];
		name.textContent = file ? file.name : "No file chosen";
	});
});
