const dotenv = require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');
const con = require('./db/config');
const swaggerDocument = YAML.load('./swagger.yaml');
const port = process.env.PORT || 5000
const app = express();
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ limit: '50mb', extended: true }));
app.use(express.json());
app.use(cors());

app.use("/api/auth", require("./routes/authRoutes"));


// checkToken

app.listen(port, (req, resp) => {
    console.log(`Server Run Port ${port}`);
})