<template>
	<div>
		<h1 class="text-3xl font-bold mb-4">{{ title }}</h1>
		<ProductList :products="products" @add-to-cart="addToCart" />
	</div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import ProductList from "../organisms/ProductList.vue";

export default defineComponent({
	name: "ProductSection",
	emits: ["add-to-cart"],
	components: {
		ProductList,
	},
	props: {
		title: {
			type: String,
			required: false,
			default: "Products",
		},
		products: {
			type: Array,
			required: true,
		},
	},
	methods: {
		addToCart(product) {
			this.$parent.$emit("add-to-cart", product);
		},
	},
});
</script>
