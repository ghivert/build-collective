const BuildCollective = artifacts.require('BuildCollective')

module.exports = function (deployer) {
  deployer.deploy(BuildCollective)
}
