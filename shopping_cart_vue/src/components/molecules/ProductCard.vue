<script setup lang="ts">
import Card from "../atoms/Card.vue";
import Button from "../atoms/Button.vue";
</script>

<template>
	<Card>
		<h2 class="text-lg font-semibold">{{ product.name }}</h2>
		<p class="text-gray-600">{{ product.description }}</p>
		<p class="text-green-600 font-bold mt-2">${{ product.price }}</p>
		<Button @click="onAddToCart" class="mt-2">Add to Cart</Button>
	</Card>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
	name: "ProductCard",
	props: {
		product: {
			type: Object,
			required: true,
		},
	},
	methods: {
		onAddToCart() {
			this.$emit("add-to-cart", this.product);
		},
	},
});
</script>
