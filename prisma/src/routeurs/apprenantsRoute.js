const express = require('express') ;
const apprenantRouter = express.Router();
const { PrismaClient } = require("@prisma/client");
const {creatingApprenant,getingApprenant} = require('../controler/apprenantsControler');

const {Apprenant} = new PrismaClient();
   
apprenantRouter.post("/", creatingApprenant);
  
apprenantRouter.get("/", getingApprenant);
  
  




module.exports = apprenantRouter ;