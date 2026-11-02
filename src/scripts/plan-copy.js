document.querySelectorAll("[data-copy-target]").forEach((button) => {
	button.addEventListener("click", async () => {
		const field = document.getElementById(button.getAttribute("data-copy-target"));
		const root = button.closest(".plan-copy");
		if (!field || !root) return;

		try {
			await navigator.clipboard.writeText(field.value);
		} catch (error) {
			field.select();
		}

		root.classList.add("is-copied");
	});
});
