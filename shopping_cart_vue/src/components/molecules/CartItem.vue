<template>
	<div class="flex justify-between items-center">
		<span>{{ product.name }} - ${{ price }}</span>
		<Button @click="onRemoveFromCart" variant="red" outlined>Remove</Button>
	</div>
</template>

<script lang="ts">
import { inject, computed } from "vue";

export default {
	props: {
		product: {
			type: Object,
			required: true,
		},
		quantity: {
			type: Number,
			required: true,
			validator: (value: number) => value >= 0,
		},
	},
	setup(props) {
		const removeFromCart = inject<Function>("removeFromCart");

		const onRemoveFromCart = () => {
			if (removeFromCart) {
				removeFromCart(props.product);
			}
		};

		const price = computed(() => props.product.price * props.quantity);

		return {
			price,
			onRemoveFromCart,
		};
	},
};
</script>
