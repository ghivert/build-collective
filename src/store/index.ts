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
  mutations: {
    updateEthereum(state, { address, contract, balance }) {
      state.account.address = address
      state.account.balance = balance
      state.contract = contract
    },
  },
  actions: {
    async ethereumConnect(context) {
      const response = await Ethereum.connect()
      if (response) {
        const { address, contract, balance } = response
        context.commit('updateEthereum', { address, contract, balance })
      }
    },
  },
  modules: {},
})
