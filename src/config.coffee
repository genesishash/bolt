VERSION = 'furious-fish'
STAGING = true

config = {
  version: VERSION 
  staging: false
  algo: 'scrypt'
  minFee: 0.0001
  maxBlockSize: 1024 * 1024 
  maxContractStateSize: 1024 * 1024 
  maxTransactionsPerBlock: 4000
  maxTransactionCommentSize: 32
  maxBlockCommentSize: 32
  maxContractCommentSize: 32
  rewardDefault: 50
  rewardHalvingInterval: 210000 # blocks
  blockInterval: 60 * 60 # 1hr 
  difficultyDefault: 1000
  difficultyChangePercent: 1
  difficultyChangePercentDrastic: 25
  difficultyChangeBlockConsideration: 3
  confirmations: 6
  storage: {
    mongo: 'mongodb://127.0.0.1:27017/prod-' + VERSION 
    redis: 'redis://127.0.0.1:6379/'
  }
  ports: {
    ws: 12121
    http: 12120
  }
}

configStaging = {
  version: 'stage-' + config.version
  staging: true
  blockInterval: 10
  rewardHalvingInterval: 50 
  storage: { 
    mongo: 'mongodb://127.0.0.1:27017/stage-' + config.version
    redis: 'redis://127.0.0.1:6379/'
  }
}

if STAGING 
  config[k] = v for k,v of configStaging

config.genesisBlock = {
  _id: 0
  transactions: []
  hash_previous: '0000000000000000000000000000000000000000000000000000000000000000'
  difficulty: config.difficultyDefault 
  comment: 'genesis'
}

module.exports = config
