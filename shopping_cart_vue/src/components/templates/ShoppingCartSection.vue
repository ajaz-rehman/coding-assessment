<template>
	<div>
		<h2 class="text-2xl font-bold mb-4">Shopping Cart</h2>
		<div class="flex flex-col gap-4">
			<ShoppingCartItemList :items="items" />
			<div class="flex gap-2 items-center justify-end">
				<p class="font-bold">Total: ${{ total }}</p>
				<Button @click="onPurchase" variant="green">Purchase</Button>
			</div>
		</div>
	</div>
</template>

<script lang="ts">
import { computed } from "vue";
import CartItem from "@/types/CartItem";
import Button from "@/components/atoms/Button.vue";
import ShoppingCartItemList from "@/components/organisms/ShoppingCartItemList.vue";

export default {
	name: "ShoppingCartSection",
	props: {
		items: {
			type: Array<CartItem>,
			required: true,
		},
	},
	emits: ["purchase"],
	components: {
		Button,
		ShoppingCartItemList,
	},
	setup(props, { emit }) {
		const total = computed(() => {
			return props.items.reduce((sum, item) => sum + item.price * item.quantity, 0).toFixed(2);
		});

		const onPurchase = () => {
			emit("purchase");
		};

		return {
			total,
			onPurchase,
		};
	},
};
</script>
