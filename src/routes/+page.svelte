<script>
	import Header from './Header.svelte';
	import Icon from '@iconify/svelte';
	import tippy from 'svelte-tippy';
	import { fade } from 'svelte/transition';
	import 'tippy.js/dist/tippy.css';
	import OnMount from './OnMount.svelte';

	let tooltipContent = 'Click to copy';

	function copyEmail() {
		navigator.clipboard.writeText('email@example.com');
		tooltipContent = 'Copied!';
		setTimeout(() => {
			tooltipContent = 'Click to copy';
		}, 2000);
	}
</script>

<svelte:head>
	<style>
		@media (min-width: 768px) {
			html,
			body {
				overflow-y: hidden;
				height: 100%;
			}
		}
	</style>
</svelte:head>

<Header />

<section class="hero is-link is-fullheight-with-navbar" style="background-color: #1A1A1A;">
	<div class="hero-body">
		<OnMount>
			<div class="container has-text-centered" in:fade>
				<p class="title" style="font-size: 5.5vh;">Conner Chu</p>
				<p class="title" style="font-size: 3.5vh;">MCB @ Berkeley</p>
			</div>
		</OnMount>
	</div>
	<div class="hero-foot">
		<div class="container has-text-centered mb-3 is-size-3">
			<a href="https://github.com/cchuster" target="_blank" style="font-size: 4vh;"><Icon icon="mdi:github" /></a>
			<a href="https://www.linkedin.com/in/connerchu" target="_blank" style="font-size: 4vh;"
				><Icon icon="mdi:linkedin" /></a
			>
			<a
				href="javascript:void(0);"
				style="font-size: 4vh;"
				use:tippy={{ content: tooltipContent, placement: 'top' }}
				on:click={copyEmail}
			>
				<Icon icon="material-symbols:mail" />
			</a>
		</div>
	</div>
</section>
