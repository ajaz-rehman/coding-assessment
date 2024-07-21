<template>
	<div class="flex flex-col gap-2">
		<ShoppingCartItem v-for="item in items" :key="item.id" :item="item" />
	</div>
</template>

<script lang="ts">
import { CartItem } from "../../types";
import ShoppingCartItem from "@components/molecules/ShoppingCartItem.vue";

export default {
	name: "ShoppingCartItemList",
	components: {
		ShoppingCartItem,
	},
	props: {
		items: {
			type: Array<CartItem>,
			required: true,
		},
	},
};
</script>
