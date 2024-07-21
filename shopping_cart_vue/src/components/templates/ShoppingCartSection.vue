<template>
	<div>
		<h2 class="text-2xl font-bold mb-4">Shopping Cart</h2>
		<div class="flex flex-col gap-4">
			<ShoppingCartItemList :items="items" />
			<div class="flex gap-2 items-center justify-between sm:justify-end">
				<p class="font-bold">Total: ${{ total }}</p>
				<Button @click="onPurchaseItems" variant="green">Purchase</Button>
			</div>
		</div>
	</div>
</template>

<script lang="ts">
import { computed, inject } from "vue";
import { CartItem } from "../../types";
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
	components: {
		Button,
		ShoppingCartItemList,
	},
	setup(props) {
		const total = computed(() => {
			return props.items.reduce((sum, item) => sum + item.price * item.quantity, 0).toFixed(2);
		});

		const purchaseItems = inject<Function>("purchaseItems");

		const onPurchaseItems = () => {
			if (purchaseItems) {
				purchaseItems(props.items);
			}
		};

		return {
			total,
			onPurchaseItems,
		};
	},
};
</script>
