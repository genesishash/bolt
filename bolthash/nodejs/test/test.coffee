# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2
{ log } = console
{ exit } = process

boltHash = require(__dirname + '/../native')

log boltHash.encode('hello world')

