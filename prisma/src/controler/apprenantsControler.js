const { PrismaClient } = require("@prisma/client");
const{Apprenant} = new PrismaClient;

const creatingApprenant = async (req, res) => {
    try {
        const newApprenant = req.body;
        console.log(newApprenant);
        const addedApprenant = await Apprenant.create({ data: newApprenant });
        res.status(200).send(addedApprenant);
    } catch (error) {
        console.log(error.message);
        res.status(500).send(error.message);
    }
  };
  const getingApprenant = async(req, res) =>{
    try{
      const data = await Apprenant.findMany();
      res.status(200).send(data);
    }catch(error){
      res.status(500).send(error.message);
    }
      
  }
module.exports ={creatingApprenant, getingApprenant} 
