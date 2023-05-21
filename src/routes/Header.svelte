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

<nav class="navbar is-dark" style="background-color: #1A1A1A;">
	<div class="navbar-brand is-size-3">
		<a
			class="navbar-item is-hidden-desktop"
			href="/"
			style="font-size: 3vw; color:white; margin-left: .5%; margin-top: .5%"
			><Icon icon="fa6-solid:house-chimney" /></a
		>
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
			style="background-color: #1A1A1A;"
		>
			<a
				class="navbar-item is-hidden-touch"
				href="/"
				style="font-size: 3.5vh; color:white; margin-left: .5%; margin-top: .5%"
				><Icon icon="fa6-solid:house-chimney" /></a
			>
			<div class="navbar-start mx-auto">
				<a
					href="/research"
					class="navbar-item {navbarActive ? 'is-burger-active' : ''} mr-60-desktop"
					style="color:white; font-size: {navbarActive ? '2vh' : '3vh'}; margin-top: .5%"
					>Research</a
				>
				<a
					href="/resume"
					class="navbar-item {navbarActive ? 'is-burger-active' : ''} mr-60-desktop"
					style="color:white; font-size: {navbarActive ? '2vh' : '3vh'}; margin-top: .5%"
					>Resume</a
				>
				<a
					href="/projects"
					class="navbar-item {navbarActive ? 'is-burger-active' : ''}"
					style="color:white; font-size: {navbarActive ? '2vh' : '3vh'}; margin-top: .5%"
					>Projects</a
				>
			</div>
			<a
				class="navbar-item is-hidden-touch"
				style="font-size: 3.5vh; color:white; margin-right:.5%; margin-top: .5%"
				><Icon icon="bi:translate" /></a
			>
			<a class="navbar-item is-hidden-desktop" style="font-size:2vh; color:white;">English | 中文</a>
		</div>
	{/if}
</nav>
