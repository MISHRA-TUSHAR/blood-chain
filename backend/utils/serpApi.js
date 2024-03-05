import { getJson } from "serpapi";
import dotenv from "dotenv";

dotenv.config();

const searchHospitalNearby = (latitude, longitude) => {
    return new Promise((resolve, reject) => {
        getJson({
            engine: "google_maps",
            q: "hospitals",
            ll: `@${latitude},${longitude},15.1z`,
            type: "search",
            api_key: process.env.SERP_API_KEY,
        }, (json) => {
            if (json.error) {
                reject(json.error);
            } else {
                resolve(json.local_results);
            }
        });
    });
};

export default searchHospitalNearby;