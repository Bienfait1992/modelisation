require("dotenv").config();
const express = require("express");
const { PrismaClient } = require("@prisma/client");
const apprenantRouter = require("./prisma/src/routeurs/apprenantsRoute");
const PORT = process.env.PORT || 3000;
const app = express();
app.use(express.json());


const {machines, cohorte, session, coaches} = new PrismaClient();

// app.post("/", async (req, res) => {
  
//   try {
//     const newApprenant = req.body;
//     console.log(newApprenant);
//     const addedApprenant = await Apprenant.create({ data: newApprenant });
//     res.status(200).send(addedApprenant);
//   } catch (error) {
//     console.log(error.message);
//     res.status(500).send(error.message);
//   }
// });

// app.get("/", async(req, res) =>{
// try{
//   const data = await Apprenant.findMany();
//   res.status(500).send(data);
// }catch(error){
//   res.status(500).send(error.message);
// }
  
// });
app.get("/machines", async (req, res) => {
  try {
    const machines = await machines.findMany({
      include: {
        apprenants: {
          select: {
            nom: true,
          },
        },
      },
    });
    res.send(machines);
  } catch (error) {
    console.log(error.message);
    res.status(500).send("Nous avons un probleme technique");
  }
});

app.post("/machines", async (req, res) => {
  try {
    const newMachine = req.body;
    const addedMachine = await machines.create({ data: newMachine });
    res.status(200).send(addedMachine);
  } catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }
});
app.get("/machines", async (req , res) => {
  try{
    const data = await machines.findMany({
      include:{
        apprenant:{
          select:{
            Nom: true
          }
        }
      }
    });
    res.send(data)
  }catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }

});
app.post("/Session", async (req , res) =>{
  try{
    const newSession = req.body;
    const AddedSession = await session.create({ data: newSession});
    res.status(200).send(AddedSession);
  }catch(error){
    console.log(error.message);
    res.status(500).send(error.message);
  }
});

app.get("/Session", async (req , res) =>{
  try{
    const data = await session.findMany();
    res.send(data)
  }catch(error){
    res.status(500).send(error.message);
  }
});

app.post("/cohorte", async (req , res) =>{
try{
  const newCohorte = req.body;
  const AddedCohorte = await cohorte.create({ data: newCohorte});
  res.status(200).send(AddedCohorte);
}catch(error){
  console.log(error.message);
  res.status(500).send(error.message);
}

});

app.get("/cohorte", async (req , res) =>{
  try{
    const data = await cohorte.findMany({
      include:{
        apprenant:true,
      }
    });
    res.send(data)
  }catch(error){
    res.status(500).send(error.message);
  }

});




app.post("/coaches", async (req, res) => {
  try {
    const newCoaches = req.body;
    const addedCoaches = await coaches.create({ data: newCoaches });
    res.status(200).send(addedCoaches);
  } catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }
});

app.get("/coaches", async (req, res) =>{
  try{
    const data= await coaches.findMany();
    res.status(500).send(data);
  }catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }
  
});

app.get("/coaches/:id", async (req, res) =>{
  try{
    const {id} = req.params
    const data= await coaches.findUnique({
      where :{
        id : +id
      },
    });
    res.status(500).send(data);
  }catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }
  
});

app.put("/coaches/:id", async (req, res) =>{
  try{
    const {id} = req.params
    const data= await coaches.update({
      where :{
        id : +id
      },
      data:req.body,
    });
    res.status(500).send(data);
  }catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }
  
});

app.delete("/coaches/:id", async (req, res) =>{
  try{
    const {id} = req.params
    const data= await coaches.delete({
      where :{
        id : +id
      },
    });
    res.status(500).send(data);
  }catch (error) {
    console.log(error.message);
    res.status(500).send(error.message);
  }
  
});


app.use('/apprenant',apprenantRouter )

app.listen(PORT, () => {
  console.log(`le serveur écoute sur le port ${PORT}`);
});


// const express= require("express");
// const PORT= 3002;
// const app = express();

// const data = require("./data.json");
// app.use(express.json());

// function findArticleById(id){
// return data.find((article)=> article.id === +id);
// }


// app.get("/", (req,res)=>{
//   res.send("tres bien l'applicaion fonction");
// });
// app.get("/articles", (req,res)=>{
//   res.send(data);
// });
// // // app.delete("/articles":Id, (req,res)=>{

// // })
// app.get("/articles/:id", (req, res)=>{
//   const {id}= req.params;
//   const article = findArticleById(id);
  
//   if(article){
//     return  res.send(article);
//   }
//  res.status(404).send(`l'article pour l(ID ${id}`)
// });



// app.listen(PORT, ()=>{
// console.log(`le serveur ecoute sur le port ${PORT}`)
// });


































// const express = require("express");
// const PORT = 3002;
// const app = express();

// const data = require("./data.json");

// app.use(express.json());

// function findArticleById(id) {
//   return data.find((article) => article.id === +id);
// }

// function findArticleIndex(id) {
//   return data.findIndex((article) => article.id === +id);
// }

// app.get("/", (req, res) => {
//   res.send("l'application marche tres bien");
// });
// // app.get("/articles", (req, res) =>{
// //   res.send(data);
// // });
// app.get("/articles/:id", (req, res) =>)
// // app.get("/", (req, res) => {
// //   res.send("L'application fonctionne");
// // });

// // app.get("/articles", (req, res) => {
// //   res.send(data);
// // });

// // app.get("/articles/:id", (req, res) => {
// //   const { id } = req.params;
// //   const article = findArticleById(id);
// //   if (article) {
// //     return res.send(article);
// //   }

// //   res.status(404).send(`L'article avec l'id : ${id} n'existe pas`);
// // });

// // app.post("/articles", (req, res) => {
// //   const newArticle = req.body;

// //   data.push(newArticle);

// //   res.status(201).send(data[data.length - 1]);
// // });

// // app.put("/articles/:id", (req, res) => {
// //   const article = req.body;
// //   const { id } = req.params;
// //   const articleIndex = findArticleIndex(id);
// //   if (articleIndex < 0) {
// //     data.push(article);
// //     return res.status(201).send(data[data.length - 1]);
// //   } else {
// //     data[articleIndex] = article;
// //     return res.status(200).send(data[articleIndex]);
// //   }
// // });

// // app.delete("/articles/:id", (req, res) => {
// //   const { id } = req.params;
// //   const articleIndex = findArticleIndex(id);
// //   const article = findArticleById(id);
// //   if (articleIndex < 0) {
// //     res.status(404).send(`L'article avec l'id ${id} n'existe pas`);
// //   } else {
// //     data.splice(articleIndex, 1);
// //     res.status(202).send(article);
// //   }
// // });
// // app.patch("/articles/:id", (req, res) => {
// //   const article = req.body;
// //   const { id } = req.params;
// //   const articleIndex = findArticleIndex(id);
// //   if (articleIndex < 0) {
// //     data.push(article);
// //     return res.status(201).send(data[data.length - 1]);
// //   } else {
// //     data[articleIndex] = article;
// //     return res.status(200).send(data[articleIndex]);
// //   }
// // });
// // app.get("/articles", (req, res) => {
// //   const page = req.query.page || 1;
// //   const pageSize = 5;
// //   const startIndex = (page - 1) * pageSize;
// //   const endIndex = page * pageSize;
// //   const pageArticles = data.slice(startIndex, endIndex);
// //   res.send(pageArticles);
// // });
// app.delete("/delete/articles", (req,res)=>{
//   const selectAll = req.body.select;
//   let articlesAfterDelete= []
// })
// app.listen(PORT, () => {
//   console.log(`Le serveur écoute sur le port ${PORT}`);
// });
