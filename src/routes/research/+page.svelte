<script>
	import Header from '../Header.svelte';
	import Icon from '@iconify/svelte';
	import tippy from 'svelte-tippy';
	import 'tippy.js/dist/tippy.css';

	let tooltipContent = 'Click to copy';

	function copyEmail() {
		navigator.clipboard.writeText('conner.chu@outlook.com');
		tooltipContent = 'Copied!';
		setTimeout(() => {
			tooltipContent = 'Click to copy';
		}, 2000);
	}
</script>

<Header />

<section class="hero is-dark">
	<div class="hero-body">
		<div class="container box has-shadow">
			<object type="application/pdf"
					    data="/manuscript.pdf" style="width: 100%; height: 100vh;">
			</object>
		</div>
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
				use:tippy={{ content: tooltipContent, placement: 'top', hideOnClick: false }}
				on:click={copyEmail}
			>
				<Icon icon="material-symbols:mail" />
			</a>
		</div>
	</div>
</section>
