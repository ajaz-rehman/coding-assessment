<template>
	<div>
		<h1 class="text-3xl font-bold mb-4">{{ title }}</h1>
		<div v-if="fetching" class="flex items-center justify-center">
			<Spinner />
		</div>
		<ProductList v-else :products="products" />
	</div>
</template>

<script lang="ts">
import Spinner from "@components/atoms/Spinner.vue";
import ProductList from "@components/organisms/ProductList.vue";

export default {
	name: "ProductSection",
	components: {
		Spinner,
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
		fetching: {
			type: Boolean,
			required: false,
			default: false,
		},
	},
};
</script>
