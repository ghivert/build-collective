import { createStore } from 'vuex'
import * as Ethereum from '../services/ethereum'

export default createStore({
  state: {
    account: null,
    contract: null,
  },
  mutations: {
    updateEthereum(state, { account, contract }) {
      state.account = account
      state.contract = contract
    },
  },
  actions: {
    async ethereumConnect(context) {
      const response = await Ethereum.connect()
      if (response) {
        const { account, contract } = response
        context.commit('updateEthereum', { account, contract })
      }
    },
  },
  modules: {},
})
