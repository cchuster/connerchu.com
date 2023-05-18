<script>
	import Icon from '@iconify/svelte';

	let navbarActive = false;

	function toggleNavbar() {
		navbarActive = !navbarActive;
	}
</script>

<nav class="navbar">
	<div class="container">
		<div class="navbar-brand is-size-3">
			<a class="navbar-item x" href="/">
				<Icon icon="material-symbols:house" />
			</a>
			<span class="navbar-burger {navbarActive ? 'is-active' : ''}" on:click={toggleNavbar}>
				<span />
				<span />
				<span />
			</span>
		</div>
		<div class="navbar-menu {navbarActive ? 'is-active' : ''} is-size-4-desktop">
			<div class="navbar-start mx-auto">
				<a href="/research" class="navbar-item mr-60-desktop">Research</a>
				<a href="/resume" class="navbar-item mr-60-desktop">Resume</a>
				<a href="/projects" class="navbar-item">Projects</a>
			</div>
			<a class="navbar-item"><Icon icon="bi:translate" /></a>
		</div>
	</div>
</nav>
