import express from "express";
import testController from "../controllers/testController.js";
import { currentUserController, loginController, registerController } from "../controllers/authController.js";
import { authMiddleware } from "../middlewares/authMiddelware.js";
import { createInventoryController, getDonarsController, getHospitalController, getInventoryController, getInventoryHospitalController, getOrgnaisationController, getOrgnaisationForHospitalController, getRecentInventoryController } from "../controllers/inventoryController.js";
import bloodGroupDetailsContoller from "../controllers/analyticsController.js";
import { adminMiddleware } from "../middlewares/adminMiddleware.js";
import { deleteDonarController, getDonarsListController, getHospitalListController, getOrgListController } from "../controllers/adminController.js";
import { fetchHospitals, postHospitals } from "../controllers/locationController.js";


const router = express.Router();


//TEST ROUTE
router.get("/test", testController);

router.post("/hospitalsNearby", postHospitals);
router.get("/hospitalsNearby", fetchHospitals);

//REGISTER || POST
router.post("/auth/register", registerController);
//LOGIN || POST
router.post("/auth/login", loginController);
//GET CURRENT USER || GET
router.get("/auth/current-user", authMiddleware, currentUserController);


// ADD INVENTORY || POST
router.post("/inventory/create-inventory", authMiddleware, createInventoryController);

//GET ALL BLOOD RECORDS
router.get("/inventory/get-inventory", authMiddleware, getInventoryController);
//GET RECENT BLOOD RECORDS
router.get(
    "/inventory/get-recent-inventory", authMiddleware, getRecentInventoryController
);

//GET HOSPITAL BLOOD RECORDS
router.post(
    "/inventory/get-inventory-hospital",
    authMiddleware, getInventoryHospitalController
);

//GET DONAR RECORDS
router.get("/inventory/get-donars", authMiddleware, getDonarsController);

//GET HOSPITAL RECORDS
router.get("/inventory/get-hospitals", authMiddleware, getHospitalController);

//GET orgnaisation RECORDS
router.get("/inventory/get-orgnaisation", authMiddleware, getOrgnaisationController);

//GET orgnaisation RECORDS
router.get(
    "/inventory/get-orgnaisation-for-hospital",
    authMiddleware,
    getOrgnaisationForHospitalController
);

//GET BLOOD DATA
router.get("/analytics//bloodGroups-data", authMiddleware, bloodGroupDetailsContoller);


//GET || DONAR LIST
router.get(
    "/admin/donar-list", authMiddleware, adminMiddleware, getDonarsListController);
//GET || HOSPITAL LIST
router.get(
    "/admin/hospital-list", authMiddleware, adminMiddleware, getHospitalListController);
//GET || ORG LIST
router.get("/admin/org-list", authMiddleware, adminMiddleware, getOrgListController);

// DELETE DONAR || GET
router.delete(
    "/admin/delete-donar/:id", authMiddleware, adminMiddleware, deleteDonarController);

export default router;