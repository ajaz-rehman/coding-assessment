<template>
	<button @click="onClick" :class="buttonClasses">
		<slot></slot>
	</button>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
	name: "Button",
	props: {
		onClick: {
			type: Function,
			required: false,
		},
		variant: {
			type: String,
			default: "blue",
		},
		disabled: {
			type: Boolean,
			default: false,
		},
	},
	computed: {
		buttonClasses() {
			return {
				"btn rounded px-4 py-2": true,
				"bg-blue-500 text-white hover:bg-blue-600": this.variant === "blue",
				"bg-green-500 text-white hover:bg-green-600": this.variant === "green",
				"bg-red-500 text-white hover:bg-red-600": this.variant === "red",
				"cursor-not-allowed opacity-50": this.disabled,
			};
		},
	},
	methods: {
		onClick() {
			this.$emit("click");
		},
	},
});
</script>
