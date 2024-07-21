<template>
	<button :class="buttonClasses">
		<slot></slot>
	</button>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
	name: "Button",
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
	computed: {
		buttonClasses() {
			if (this.outlined) {
				return {
					"btn rounded px-3 py-1": true,
					"border border-blue-500 text-blue-500 hover:bg-blue-500 hover:text-white": this.variant === "blue",
					"border border-green-500 text-green-500 hover:bg-green-500 hover:text-white":
						this.variant === "green",
					"border border-red-500 text-red-500 hover:bg-red-500 hover:text-white": this.variant === "red",
					"cursor-not-allowed opacity-50": this.disabled,
				};
			}

			return {
				"btn rounded px-3 py-1": true,
				"bg-blue-500 text-white hover:bg-blue-600": this.variant === "blue",
				"bg-green-500 text-white hover:bg-green-600": this.variant === "green",
				"bg-red-500 text-white hover:bg-red-600": this.variant === "red",
				"cursor-not-allowed opacity-50": this.disabled,
			};
		},
	},
});
</script>
