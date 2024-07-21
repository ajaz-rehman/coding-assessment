<template>
	<div class="flex justify-between items-center">
		<span>{{ item.name }} - ${{ price }}</span>
		<Button @click="onRemoveFromCart" variant="red" outlined>Remove</Button>
	</div>
</template>

<script lang="ts">
import { inject, computed } from "vue";
import Button from "@components/atoms/Button.vue";

export default {
	name: "ShoppingCartItem",
	components: {
		Button,
	},
	props: {
		item: {
			type: Object,
			required: true,
		},
	},
	setup(props) {
		const removeFromCart = inject<Function>("removeFromCart");

		const onRemoveFromCart = () => {
			if (removeFromCart) {
				removeFromCart(props.item);
			}
		};

		const price = computed(() => {
			const rawPrice = props.item.price * props.item.quantity;

			return Math.round(rawPrice * 100) / 100;
		});

		return {
			price,
			onRemoveFromCart,
		};
	},
};
</script>
