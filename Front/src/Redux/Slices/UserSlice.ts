import { createSlice, PayloadAction } from "@reduxjs/toolkit";
import {
  UserState,
  User,
  Address,
  Product,
  Review,
  Order,
  Cart,
} from "../../types";

const initialState: UserState = {
  user: JSON.parse(localStorage.getItem("user") || "null"),
  addresses: [],
  products: [],
  reviews: [],
  orders: [],
  cart: null,
};

const userSlice = createSlice({
  name: "user",
  initialState,
  reducers: {
    setUser: (state, action: PayloadAction<User>) => {
      state.user = action.payload;
    },
    setAddresses: (state, action: PayloadAction<Address[]>) => {
      state.addresses = action.payload;
    },
    setProducts: (state, action: PayloadAction<Product[]>) => {
      state.products = action.payload;
    },
    setReviews: (state, action: PayloadAction<Review[]>) => {
      state.reviews = action.payload;
    },
    setOrders: (state, action: PayloadAction<Order[]>) => {
      state.orders = action.payload;
    },
    setCart: (state, action: PayloadAction<Cart | null>) => {
      state.cart = action.payload;
    },
    clearUser: (state) => {
      state.user = null;
    },
  },
});

export const {
  setUser,
  setAddresses,
  setProducts,
  setReviews,
  setOrders,
  setCart,
  clearUser,
} = userSlice.actions;
export default userSlice.reducer;
