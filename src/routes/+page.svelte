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

<Header />

<section class="hero is-link is-fullheight-with-navbar">
	<div class="hero-body">
		<OnMount>
			<div class="container has-text-centered" in:fade>
				<p class="title">Conner Chu</p>
			</div>
		</OnMount>
	</div>
	<div class="hero-foot">
		<div class="container has-text-centered mb-3 is-size-3">
			<a href="https://github.com/cchuster"><Icon icon="mdi:github" /></a>
			<a href="https://www.linkedin.com/in/connerchu"><Icon icon="mdi:linkedin" /></a>
			<a
				href="javascript:void(0);"
				use:tippy={{ content: tooltipContent, placement: 'top' }}
				on:click={copyEmail}
			>
				<Icon icon="material-symbols:mail" />
			</a>
		</div>
	</div>
</section>
