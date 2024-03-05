import mongoose from 'mongoose';
import InventoryModel from '../models/inventoryModel.js';
import User from '../models/userModel.js';

// CREATE INVENTORY
const createInventoryController = async (req, res) => {
    try {
      const { email } = req.body;
      //validation
      const user = await User.findOne({ email });
      if (!user) {
        throw new Error("User Not Found");
      }
      // if (inventoryType === "in" && user.role !== "donar") {
      //   throw new Error("Not a donar account");
      // }
      // if (inventoryType === "out" && user.role !== "hospital") {
      //   throw new Error("Not a hospital");
      // }
  
      if (req.body.inventoryType == "out") {
        const requestedBloodGroup = req.body.bloodGroup;
        const requestedQuantityOfBlood = req.body.quantity;
        const organisation = new mongoose.Types.ObjectId(req.body.userId);
        //calculate Blood Quanitity
        const totalInOfRequestedBlood = await InventoryModel.aggregate([
          {
            $match: {
              organisation,
              inventoryType: "in",
              bloodGroup: requestedBloodGroup,
            },
          },
          {
            $group: {
              _id: "$bloodGroup",
              total: { $sum: "$quantity" },
            },
          },
        ]);
        // console.log("Total In", totalInOfRequestedBlood);
        const totalIn = totalInOfRequestedBlood[0]?.total || 0;
        //calculate OUT Blood Quanitity
  
        const totalOutOfRequestedBloodGroup = await InventoryModel.aggregate([
          {
            $match: {
              organisation,
              inventoryType: "out",
              bloodGroup: requestedBloodGroup,
            },
          },
          {
            $group: {
              _id: "$bloodGroup",
              total: { $sum: "$quantity" },
            },
          },
        ]);
        const totalOut = totalOutOfRequestedBloodGroup[0]?.total || 0;
  
        //in & Out Calc
        const availableQuanityOfBloodGroup = totalIn - totalOut;
        //quantity validation
        if (availableQuanityOfBloodGroup < requestedQuantityOfBlood) {
          return res.status(500).send({
            success: false,
            message: `Only ${availableQuanityOfBloodGroup}ML of ${requestedBloodGroup.toUpperCase()} is available`,
          });
        }
        req.body.hospital = user?._id;
      } else {
        req.body.donar = user?._id;
      }
  
      //save record
      const inventory = new InventoryModel(req.body);
      await inventory.save();
      return res.status(201).send({
        success: true,
        message: "New Blood Reocrd Added",
      });
    } catch (error) {
      console.log(error);
      return res.status(500).send({
        success: false,
        message: "Errro In Create Inventory API",
        error,
      });
    }
  };
  
  // GET ALL BLOOD RECORS
  const getInventoryController = async (req, res) => {
    try {
      const inventory = await InventoryModel
        .find({
          organisation: req.body.userId,
        })
        .populate("donar")
        .populate("hospital")
        .sort({ createdAt: -1 });
      return res.status(200).send({
        success: true,
        messaage: "get all records successfully",
        inventory,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).send({
        success: false,
        message: "Error In Get All Inventory",
        error,
      });
    }
  };
  // GET Hospital BLOOD RECORS
  const getInventoryHospitalController = async (req, res) => {
    try {
      const inventory = await InventoryModel
        .find(req.body.filters)
        .populate("donar")
        .populate("hospital")
        .populate("organisation")
        .sort({ createdAt: -1 });
      return res.status(200).send({
        success: true,
        messaage: "get hospital comsumer records successfully",
        inventory,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).send({
        success: false,
        message: "Error In Get consumer Inventory",
        error,
      });
    }
  };
  
  // GET BLOOD RECORD OF 3
  const getRecentInventoryController = async (req, res) => {
    try {
      const inventory = await InventoryModel
        .find({
          organisation: req.body.userId,
        })
        .limit(3)
        .sort({ createdAt: -1 });
      return res.status(200).send({
        success: true,
        message: "recent Invenotry Data",
        inventory,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).send({
        success: false,
        message: "Error In Recent Inventory API",
        error,
      });
    }
  };
  
  // GET DONAR REOCRDS
  const getDonarsController = async (req, res) => {
    try {
      const organisation = req.body.userId;
      //find donars
      const donorId = await InventoryModel.distinct("donar", {
        organisation,
      });
      // console.log(donorId);
      const donars = await User.find({ _id: { $in: donorId } });
  
      return res.status(200).send({
        success: true,
        message: "Donar Record Fetched Successfully",
        donars,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).send({
        success: false,
        message: "Error in Donar records",
        error,
      });
    }
  };
  
  const getHospitalController = async (req, res) => {
    try {
      const organisation = req.body.userId;
      //GET HOSPITAL ID
      const hospitalId = await InventoryModel.distinct("hospital", {
        organisation,
      });
      //FIND HOSPITAL
      const hospitals = await User.find({
        _id: { $in: hospitalId },
      });
      return res.status(200).send({
        success: true,
        message: "Hospitals Data Fetched Successfully",
        hospitals,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).send({
        success: false,
        message: "Error In get Hospital API",
        error,
      });
    }
  };
  
  // GET ORG PROFILES
  const getOrgnaisationController = async (req, res) => {
    try {
      const donar = req.body.userId;
      const orgId = await InventoryModel.distinct("organisation", { donar });
      //find org
      const organisations = await User.find({
        _id: { $in: orgId },
      });
      return res.status(200).send({
        success: true,
        message: "Org Data Fetched Successfully",
        organisations,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).send({
        success: false,
        message: "Error In ORG API",
        error,
      });
    }
  };
  // GET ORG for Hospital
  const getOrgnaisationForHospitalController = async (req, res) => {
    try {
      const hospital = req.body.userId;
      const orgId = await InventoryModel.distinct("organisation", { hospital });
      //find org
      const organisations = await User.find({
        _id: { $in: orgId },
      });
      return res.status(200).send({
        success: true,
        message: "Hospital Org Data Fetched Successfully",
        organisations,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).send({
        success: false,
        message: "Error In Hospital ORG API",
        error,
      });
    }
  };
  
export {
    createInventoryController,
    getInventoryController,
    getDonarsController,
    getHospitalController,
    getOrgnaisationController,
    getOrgnaisationForHospitalController,
    getInventoryHospitalController,
    getRecentInventoryController,
  };