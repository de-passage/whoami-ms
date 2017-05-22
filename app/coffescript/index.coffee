express = require 'express'
app = express()
path = require 'path'

port = process.argv[2] || 8000

app.use '/static', express.static path.join __dirname, 'public'

app.get '/', (req, res) ->
  ip = (req.headers['x-forwarded-for'] || res.connection.remoteAddress).split(':')
  ip = ip[ip.length - 1]
  lang = req.headers['accept-language'].split(',')[0]
  soft = req.headers['user-agent'].match(/\((.+?)\)/)[1]
  res.json
    ipaddress: ip
    language: lang
    software: soft

app.listen port
