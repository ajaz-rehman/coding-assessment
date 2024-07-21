<template>
	<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
		<ProductCard v-for="product in products" :key="product.id" :product="product" @add-to-cart="addToCart" />
	</div>
</template>

<script lang="ts">
import ProductCard from "../molecules/ProductCard.vue";

export default {
	name: "ProductList",
	components: {
		ProductCard,
	},
	emits: ["add-to-cart"],
	props: {
		products: {
			type: Array,
			required: true,
		},
	},
	setup(props, { emit }) {
		const addToCart = product => {
			emit("add-to-cart", product);
		};

		return {
			addToCart,
		};
	},
};
</script>
