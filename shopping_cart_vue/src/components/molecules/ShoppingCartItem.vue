<template>
	<div class="flex gap-2 justify-between sm:items-center flex-col sm:flex-row">
		<span class="font-semibold">{{ item.name }}</span>
		<div class="flex gap-2 items-center justify-between">
			<span class="font-semibold">{{ item.price }} X {{ item.quantity }} = ${{ price }}</span>
			<Button @click="onRemoveFromCart" variant="red" outlined>Remove</Button>
		</div>
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
