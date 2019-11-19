const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const { pool } = require('./config')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors())

const verHoteles = (request, response) => {
  pool.query('SELECT * from public.Hotel', [], (error, results) => {
    if (error) {
      console.log(error)
      response.status(201).json({ status: 'unsuccess', message: 'Cannot fetch data.' })
    } else {
      response.status(200).json(results.rows)
    }
  })
}

const verHotelHorario = (request, response) => {
  const { idhorario } = request.query
  pool.query('SELECT * from public.Horario WHERE idhorario = $1', [idhorario], (error, results) => {
    if (error) {
      console.log(error)
      response.status(201).json({ status: 'unsuccess', message: 'Cannot delete product. Check de product id.' })
    } else {
      response.status(200).json(results.rows)
    }
  })
}


app.get('/hoteles/',verHoteles);
app.get('/hoteles/getHorario/', verHotelHorario);

//app.use(clientErrorHandler);
/*

app.get('/products/getProducts/',getProducts)
app.get('/products/getProductById/:idalimento', getProductById)
app.post('/products/createProduct/:idalimento/:nombre/:foto/:cantidad/:fechacaducidad', createProduct)
app.patch('/products/updateProduct/:idalimento/:nombre/:foto/:cantidad/:fechacaducidad', updateProduct)
app.delete('/products/deleteProduct/:idalimento', deleteProduct)*/

// Start server
app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening`)
})