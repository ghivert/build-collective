import { createStore } from 'vuex'
import * as Ethereum from '../services/ethereum'

export default createStore({
  state: {
    address: null,
    contract: null,
  },
  mutations: {
    updateEthereum(state, { address, contract }) {
      state.address = address
      state.contract = contract
    },
  },
  actions: {
    async ethereumConnect(context) {
      const response = await Ethereum.connect()
      if (response) {
        const { address, contract } = response
        context.commit('updateEthereum', { address, contract })
      }
    },
  },
  modules: {},
})
