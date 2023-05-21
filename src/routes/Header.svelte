<script>
	import Icon from '@iconify/svelte';
	import { slide } from 'svelte/transition';

	let navbarActive = false;

	function toggleNavbar() {
		navbarActive = !navbarActive;
	}

	let windowWidth = 0;
	const desktopSize = 1024;

	function slideBurger(node, options) {
		const slideTransition = slide(node, options);
		if (windowWidth >= desktopSize) {
			return {
				duration: 0,
				css: ''
			};
		} else {
			return slideTransition;
		}
	}
</script>

<svelte:window bind:innerWidth={windowWidth} />

<nav class="navbar">
	<div class="navbar-brand is-size-3">
		<a class="navbar-item is-hidden-desktop" href="/"><Icon icon="material-symbols:house" /></a>
		<span class="navbar-burger {navbarActive ? 'is-active' : ''}" on:click={toggleNavbar}>
			<span />
			<span />
			<span />
		</span>
	</div>
	{#if navbarActive || windowWidth >= desktopSize}
		<div
			transition:slideBurger
			class="navbar-menu {navbarActive ? 'is-active' : ''} is-size-4-desktop"
		>
			<a class="navbar-item is-hidden-touch" href="/"><Icon icon="material-symbols:house" /></a>
			<div class="navbar-start mx-auto">
				<a href="/research" class="navbar-item mr-60-desktop">Research</a>
				<a href="/resume" class="navbar-item mr-60-desktop">Resume</a>
				<a href="/projects" class="navbar-item">Projects</a>
			</div>
			<a class="navbar-item is-hidden-touch"><Icon icon="bi:translate" /></a>
			<a class="navbar-item is-hidden-desktop">Translate</a>
		</div>
	{/if}
</nav>
