<template>
	<div class="flex justify-between items-center">
		<span>{{ product.name }} - ${{ product.price }} x {{ quantity }}</span>
		<Button @click="onRemoveFromCart" variant="red" outlined>Remove</Button>
	</div>
</template>

<script lang="ts">
import { inject } from "vue";

export default {
	props: {
		product: {
			type: Object,
			required: true,
		},
		quantity: {
			type: Number,
			required: true,
			validator: value => value >= 0,
		},
	},
	setup(props) {
		const removeFromCart = inject("removeFromCart");

		const onRemoveFromCart = () => {
			if (removeFromCart) {
				removeFromCart(props.product);
			}
		};

		return {
			onRemoveFromCart,
		};
	},
};
</script>
