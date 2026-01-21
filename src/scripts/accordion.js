// Initialize accordion on DOMContentLoaded (with fallback if already loaded)
const initAccordion = () => {
	// Get all the <h3> headings inside an element with the .accordion class
	const headings = document.querySelectorAll('.accordion h3')

	Array.prototype.forEach.call(headings, heading => {
		// Skip if already initialized
		if (heading.querySelector('button')) return

		// Get block ID
		let blockID = heading.id

		// Give each <h3> a toggle button child, but only if JS is loaded
		// Communicate the state non-visually by applying aria-expanded to the button
		// Communicate the state visually by adding an the icon to the <span> tag with CSS
		// Set aria-controls to the ID of the element containing the accordion panel content
		heading.innerHTML = `
			<button aria-expanded="false" aria-controls="${blockID}">
				<span>${heading.textContent}</span>
			</button>
		`

		// Function to create a node list of the content between this <h3> and the next
		const getContent = (elem) => {
			let elems = []
			while (elem.nextElementSibling && elem.nextElementSibling.tagName !== 'H3') {
				elems.push(elem.nextElementSibling)
				elem = elem.nextElementSibling
			}

			// Delete the old versions of the content nodes
			elems.forEach((node) => {
				node.parentNode.removeChild(node)
			})

			return elems
		}

		// Assign the contents to be expanded/collapsed (array)
		let contents = getContent(heading)

		// Create a wrapper element for `contents` and hide it, but only if JS is loaded
		let wrapper = document.createElement('div')
		wrapper.classList.add('collapse')
		wrapper.id = blockID

		// Add each element of `contents` to `wrapper`
		contents.forEach(node => {
			wrapper.appendChild(node)
		})

		// Add the wrapped content back into the DOM after the heading
		heading.parentNode.insertBefore(wrapper, heading.nextElementSibling)

		// Assign the button
		let btn = heading.querySelector('button')

		btn.onclick = () => {
			// Cast the state as a boolean
			let expanded = btn.getAttribute('aria-expanded') === 'true' || false

			// Switch the state
			btn.setAttribute('aria-expanded', !expanded)
			// Switch the content's visibility
			wrapper.classList.toggle('collapse')
		}
	})
}

if (document.readyState === 'loading') {
	document.addEventListener('DOMContentLoaded', initAccordion)
} else {
	initAccordion()
}