<template>
	<Card>
		<h2 class="text-lg font-semibold">{{ product.name }}</h2>
		<p class="text-gray-600">{{ product.description }}</p>
		<p class="text-green-600 font-bold mt-2">${{ product.price }}</p>
		<Button @click="onAddToCart" class="mt-2">Add to Cart</Button>
	</Card>
</template>

<script lang="ts">
import Card from "../atoms/Card.vue";
import Button from "../atoms/Button.vue";

export default {
	name: "ProductCard",
	components: {
		Card,
		Button,
	},
	emits: ["add-to-cart"],
	props: {
		product: {
			type: Object,
			required: true,
		},
	},
	setup(props, { emit }) {
		const onAddToCart = () => {
			emit("add-to-cart", props.product);
		};

		return {
			onAddToCart,
		};
	},
};
</script>
