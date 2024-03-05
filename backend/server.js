import express from 'express';
import dotenv from 'dotenv';
import morgan from 'morgan';
import cors from 'cors';
import connectDB from './config/db.js';
import ApiRoutes from './routes/api.js'

dotenv.config();
connectDB();

const app = express();


app.use(express.json());
app.use(cors());
app.use(morgan("dev"));

app.use("/api/v1", ApiRoutes);
// app.use("/api/v1/auth", );
// app.use("/api/v1/inventory", );
// app.use("/api/v1/analytics", );
// app.use("/api/v1/admin", );


const PORT = 8000;

app.listen(PORT, () => {
    console.log("Server is runnning")
})