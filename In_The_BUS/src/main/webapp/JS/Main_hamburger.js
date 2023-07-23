const trigger = document.getElementById('trigger')
const menu_trigger = document.getElementById('menu-trigger')

menu_trigger.addEventListener('click', function() {
	trigger.removeAttribute('hidden')
	trigger.classList.toggle('active');
})



const closed = document.getElementById('close')

closed.addEventListener('click', function() {
	trigger.setAttribute('hidden', 'true')
	trigger.classList.toggle('active');
})