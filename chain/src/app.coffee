config = require './lib/globals'

tor = require 'tor-request'

express = require 'express'
bodyParser = require 'body-parser'
compression = require 'compression'
morgan = require 'morgan'
cors = require 'cors'

app = express()
app.disable 'x-powered-by'

# Middleware
app.use bodyParser.json()
app.use bodyParser.urlencoded({ extended: true })
app.use morgan('dev')
app.use compression()
app.use cors()

app.use ((req, res, next) ->
  next()
)

# Route files
blockchainRoutes = require './routes/blockchain'
transactionsRoutes = require './routes/transactions'
walletsRoutes = require './routes/wallets'
miningRoutes = require './routes/mining'
networkRoutes = require './routes/network'
contractsRoutes = require './routes/contracts'
statsRoutes = require './routes/stats'

# Setup versioned API
apiRouterV1 = express.Router()

apiRouterV1.use '/blockchain', blockchainRoutes
apiRouterV1.use '/transactions', transactionsRoutes
apiRouterV1.use '/wallets', walletsRoutes
apiRouterV1.use '/mining', miningRoutes
apiRouterV1.use '/network', networkRoutes
apiRouterV1.use '/contracts', contractsRoutes
apiRouterV1.use '/stats', statsRoutes

apiRouterV1.get '/', ((req, res, next) ->
  res.json version.info()
)

app.use '/api/v1', apiRouterV1

# Handle errors
app.use (err, req, res, next) ->
  console.error err.stack
  res.status(500).json({ error: 500 })

# Graceful shutdown handling
require('process').on 'exit', process.exit

main = (->
  bulk =  require('fs').readFileSync(__dirname + '/../.ascii.art','utf8')

  lines = _.map bulk.split('\n'), (line) ->

    line = line.split('_algo_').join(config.algo)
    line = line.split('_version_').join(config.package.version)
    line = line.split('_versionInt_').join(config.version)

    while line.length < (maxLen = 44)
      line += ' '

    while line.length > maxLen
      line = line.substr(0, line.length - 1)

    line

  bulk = lines.join '\n'

  randomColor = _.sample [
    colors.inverse.yellow
    colors.inverse.green
    colors.inverse.blue
  ]

  log randomColor(bulk) + '\n'

  L 'initializing node'

  app.listen config.ports.http, (e) ->
    if e then throw e
    L "http listening on #{config.ports.http}"
)

main()
