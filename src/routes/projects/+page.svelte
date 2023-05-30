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

<section class="hero is-dark is-fullheight-with-navbar">
	<div class="hero-body">
		<div class="container">
			<div class="columns is-desktop is-vcentered is-variable is-8">
				<div class="column has-text-centered">
					<div class="card">
						<div class="card-image">
							<figure class="image">
								<img src="/imu.jpg" alt="AHRS Motion Tracker" />
							</figure>
						</div>
					</div>
					<div class="card-content">
						<div class="content has-text-grey-light">
							<h3 style="color: white;">AHRS Motion Tracker</h3>
							3-axis IMU + Raspberry Pi Pico
						</div>
					</div>
				</div>
				<div class="column has-text-centered">
					<div class="card">
						<div class="card-image">
							<figure class="image">
								<img src="/br2049.png" alt="Blade Runner 2049 Inspired Rice" />
							</figure>
						</div>
					</div>
					<div class="card-content">
						<div class="content has-text-grey-light">
							<h3 style="color: white;">Blade Runner 2049 Inspired Rice</h3>
							i3 Tiling Window Manager
						</div>
					</div>
				</div>
				<div class="column has-text-centered">
					<div class="card">
						<div class="card-image">
							<figure class="image">
								<img src="/speader.png" alt="Blade Runner 2049 Inspired Rice" />
							</figure>
						</div>
					</div>
					<div class="card-content">
						<div class="content has-text-grey-light">
							<h3 style="color: white;">Speader</h3>
							Kindle's Removed Word Runner Feature
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-foot">
		<div class="container has-text-centered mb-3 is-size-3">
			<a href="https://github.com/cchuster" target="_blank" style="font-size: 4vh;"
				><Icon icon="mdi:github" /></a
			>
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
