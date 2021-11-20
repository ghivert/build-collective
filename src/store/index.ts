import { createStore } from 'vuex'
import * as Ethereum from '../services/ethereum'

export default createStore({
  state: {
    contract: null,
    account: {
      address: null,
      balance: 0,
    },
  },
  //Elle prends les paramètres et elle les ajoutes dans le state
  mutations: {
    updateEthereum(state, { address, contract, balance }) {
      state.contract = contract
      state.account.address = address
      state.account.balance = balance
    },
  },
  // attendre la réponse du server
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
