import { searchHospitalNearby } from "../utils/serpApi.js"

let hospital = [];
let isUpdating = false;

const postHospitals = async(req,res) => {
    if(!isUpdating){
        isUpdating= true;
        const { latitude, longitude } = req.body.coordinates
        try {
            const list = await searchHospitalNearby(latitude,longitude);
            hospital = list;
            res.send(list);
        } catch (error) {
            res.status(500).send({error: "Internal Server Error"});
        }
    }else{
        res.status(400).send({ error: "Update in progress. Try again later"});
    }
}

const fetchHospitals = async( req, res) => {
     await new Promise(resolve => setTimeout(resolve,3000));
     res.send(hospital);
     console.log(hospital);    
}

export { postHospitals, fetchHospitals };