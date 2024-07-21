<template>
	<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
		<ProductCard v-for="product in products" :key="product.id" :product="product" />
	</div>
</template>

<script lang="ts">
import { Product } from "../../types";
import ProductCard from "@components/molecules/ProductCard.vue";

export default {
	name: "ProductList",
	components: {
		ProductCard,
	},
	props: {
		products: {
			type: Array<Product>,
			required: true,
		},
	},
};
</script>
