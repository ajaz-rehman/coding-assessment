<template>
	<div class="container mx-auto px-4 py-8 flex flex-col gap-8">
		<ProductSection :products="products" :fetching="fetching" />
		<ShoppingCartSection v-if="cartItems.length > 0" :items="cartItems" />
	</div>
</template>

<script lang="ts">
import axios from "axios";
import { CartItem, Product } from "./types";
import { ref, provide, onMounted } from "vue";
import Spinner from "@components/atoms/Spinner.vue";
import ProductSection from "@components/templates/ProductSection.vue";
import ShoppingCartSection from "@components/templates/ShoppingCartSection.vue";

export default {
	name: "App",
	components: {
		Spinner,
		ProductSection,
		ShoppingCartSection,
	},
	setup() {
		const fetching = ref(false);
		const cartItems = ref<Product[]>([]);
		const products = ref<CartItem[]>([]);

		const addToCart = (product: Product) => {
			const existingItem = cartItems.value.find((item: CartItem) => item.id === product.id);

			if (existingItem) {
				if (updateQuantityOfProduct(existingItem.id, -1)) {
					existingItem.quantity += 1;
				}
			} else {
				if (updateQuantityOfProduct(product.id, -1)) {
					cartItems.value.push({ ...product, quantity: 1 });
				}
			}
		};

		const updateQuantityOfProduct = (id: number, value = 1) => {
			const existingProduct = products.value.find((product: Product) => product.id === id);

			if (existingProduct) {
				if (existingProduct.quantity + value < 0) {
					return false;
				}

				existingProduct.quantity += value;

				return true;
			}

			return false;
		};

		const removeFromCart = (item: CartItem) => {
			const index = cartItems.value.findIndex(cartItem => cartItem.id === item.id);

			if (index !== -1) {
				cartItems.value.splice(index, 1);
				updateQuantityOfProduct(item.id, item.quantity);
			}
		};

		const clearCart = () => {
			cartItems.value = [];
		};

		const fetchProducts = async () => {
			try {
				fetching.value = true;
				const response = await axios.get("http://localhost:4000/api/inventory/products");
				products.value = response.data.data;
			} catch (error) {
				console.error("Error fetching products:", error);
			} finally {
				fetching.value = false;
			}
		};

		const purchaseItems = async (purchaseItems: CartItem[]) => {
			try {
				const items = purchaseItems.map(item => ({ product_id: item.id, quantity: item.quantity }));
				await axios.post("http://localhost:4000/api/inventory/confirm_purchase", { items });
				clearCart();
				alert("Purchase confirmed!");
			} catch (error) {
				console.error("Error confirming purchase:", error);
				alert("Error confirming purchase. Please try again.");
			}
		};

		onMounted(() => {
			fetchProducts();
		});

		provide("addToCart", addToCart);
		provide("removeFromCart", removeFromCart);
		provide("purchaseItems", purchaseItems);

		return {
			fetching,
			cartItems,
			products,
		};
	},
};
</script>
