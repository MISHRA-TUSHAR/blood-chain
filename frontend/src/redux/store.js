import { configureStore } from "@reduxjs/toolkit";
import authSlice from "./features/Auth/authSlice";


const store = configureStore({
  reducer: {
    auth: authSlice.reducer,
  },
});

export default store;