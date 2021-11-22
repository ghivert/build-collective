import { createStore } from 'vuex'
import * as Ethereum from '../services/ethereum'

export default createStore({
  state: {
    contract: null,
    account: {
      address: null,
      nbETH: 0,
    },
  },
  //It takes values from smart contracts to send it to the front end
  mutations: {
    updateEthereum(state, { address, contract, balance }) {
      state.contract = contract
      state.account.address = address
      state.account.nbETH = balance
    },
  },
  // les infos viennent d'ici (ici on récupère les infos depuis le smart contract) et elle sont envvoye à mutation 
  actions: {
    async ethereumConnect(context) {
      const response = await Ethereum.connect()
      if (response) {
        const { address, contract, balance } = response
        // On appelle la mutation avec le nom de la mutation et le paramètres à modifier
        context.commit('updateEthereum', { address, contract, balance })
      }
    },
  },
  modules: {},
})
