import Web3 from 'web3'
import ContractInterface from '../build/contracts/BuildCollective.json'

export const connect = async () => {
  const win: any = window
  if (win.ethereum) {
    const web3 = new Web3(win.ethereum)
    try {
      const method = 'eth_requestAccounts'
      const [account] = await win.ethereum.request({ method })
      const abi: any = ContractInterface.abi
      const address = ContractInterface.networks['5777'].address
      const contract = new web3.eth.Contract(abi, address, { from: account })
      return { account, contract }
    } catch (error) {
      console.error(error)
    }
  } else {
    console.log('Not Dapp browser.')
  }
}
