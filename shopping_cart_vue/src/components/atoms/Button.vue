<template>
	<button :class="buttonClasses">
		<slot></slot>
	</button>
</template>

<script lang="ts">
import { computed } from "vue";

export default {
	props: {
		variant: {
			type: String,
			default: "blue",
			validator: (value: string) => ["blue", "green", "red"].includes(value),
		},
		outlined: {
			type: Boolean,
			default: false,
		},
		disabled: {
			type: Boolean,
			default: false,
		},
	},
	setup(props) {
		const buttonClasses = computed(() => {
			if (props.outlined) {
				return {
					"btn rounded px-3 py-1": true,
					"border border-blue-500 text-blue-500 hover:bg-blue-500 hover:text-white": props.variant === "blue",
					"border border-green-500 text-green-500 hover:bg-green-500 hover:text-white":
						props.variant === "green",
					"border border-red-500 text-red-500 hover:bg-red-500 hover:text-white": props.variant === "red",
					"cursor-not-allowed opacity-50": props.disabled,
				};
			}

			return {
				"btn rounded px-3 py-1": true,
				"bg-blue-500 text-white hover:bg-blue-600": props.variant === "blue",
				"bg-green-500 text-white hover:bg-green-600": props.variant === "green",
				"bg-red-500 text-white hover:bg-red-600": props.variant === "red",
				"cursor-not-allowed opacity-50": props.disabled,
			};
		});

		return {
			buttonClasses,
		};
	},
};
</script>
