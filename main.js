const express = require('express')
const app = express();

const PORT = process.env.PORT || 8000
app.get("/", (req,res)=>{
    return res.json({message: "Hey I am Node.js in Container"})
});

app.listen(PORT, () => console.log(`Server started on Port ${PORT}`))