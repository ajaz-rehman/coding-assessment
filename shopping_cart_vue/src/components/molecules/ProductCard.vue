<template>
	<Card>
		<h2 class="text-lg font-semibold">{{ product.name }}</h2>
		<p class="text-gray-600">{{ product.description }}</p>
		<p class="text-green-600 font-bold mt-2">${{ product.price }}</p>
		<Button @click="onAddToCart" class="mt-2" :disabled="product.quantity <= 0">Add to Cart</Button>
	</Card>
</template>

<script lang="ts">
import { inject } from "vue";
import Card from "@components/atoms/Card.vue";
import Button from "@components/atoms/Button.vue";

export default {
	name: "ProductCard",
	components: {
		Card,
		Button,
	},
	props: {
		product: {
			type: Object,
			required: true,
		},
	},
	setup(props) {
		const addToCart = inject<Function>("addToCart");

		const onAddToCart = () => {
			if (addToCart) {
				addToCart(props.product);
			}
		};

		return {
			onAddToCart,
		};
	},
};
</script>
