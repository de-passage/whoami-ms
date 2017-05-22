express = require 'express'
app = express()
path = require 'path'

port = process.argv[2] || 8000

app.use '/static', express.static path.join __dirname, 'public'



app.listen port
