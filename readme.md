<img src="assets/bolt-reverse.svg" height="125" align="left" />
# bolt
bolt is a censorship-resistant, distributed proof-of-work blockchain designed 
to have bitcoin's best characteristics. The blockchain is built using using 
coffeescript and leverages it's [custom hashing function](bolthash/rust) for 
balanced performance between cpu and gpu mining. miners are rewarded in bolt,
the native currency of the chain.

the source of the chain itself and more information regarding it can be
found here in [blockchain/](blockchain).

## features

- **custom hashing function**: designed to attempt to provide similar performance between cpu and gpu mining.
- **native currency**: bolt has its native currency for rewarding miners.
- **bitcoin in sprit**: the blockchain is designed to inherit bitcoin's best characteristics, including.
  - automatic difficulty adjustments and target block times.
  - fixed supply cap and decreasing issuance of block rewards.

### structure

- `assets/`: contains static assets and brandables.
- `blockchain/`: contains the blockchain component written in coffeescript.
- `bolthash/rust/`: contains the custom hashing function that is written in rust.
  - note: this is ported to other language libraries like webasm for browsers and node.js for non-web node applications. examples are provided for each.

## @todo
- `wallet/`: contains different wallets for the project.
  - [ ] `browser-extension/`: browser extension wallet.
- `web/`: contains all web projects.
  - [ ] `explorer/`: contains a react-based block explorer.
  - [ ] `homepage/`: contains the homepage for bolt.

---

## fair distribution
bolt intends to launch with a fair distribution and without a premine and
without fundraising.

the configured block time and issuance schedule is designed to follow 
roughly the schedule and behviour of bitcoin. at the very least the features of 
digital scarcity and proof of work will remain constant. however, i'll reserve
the right the play with modern features such as a smart contract language, 
different hashing algos, and so on prior to launch.

