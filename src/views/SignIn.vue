<template>
  <div class="home-wrapper">
    <card
      v-if="!address"
      title="It looks like you're not connected."
      subtitle="Please connect to use the app."
      :blue="true"
    >
      <collective-button :transparent="true" @click="connect">
        Connect
      </collective-button>
    </card>
    <card title="You're connected!" subtitle="Hooray" :blue="true" v-else>
      <collective-button :transparent="true" @click="goToAccount">
        Go to account
      </collective-button>
    </card>
    <spacer :size="24" />
    <div class="home">
      <card
        v-for="(link, index) in links"
        :key="index"
        :title="link.title"
        subtitle="To never be lost"
      >
        <a class="card-body" :href="link.link"> Find it here </a>
      </card>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue'
import { useStore } from 'vuex'
import Card from '@/components/Card.vue'
import CollectiveButton from '@/components/CollectiveButton.vue'
import Spacer from '@/components/Spacer.vue'

export default defineComponent({
  name: 'SignIn',
  components: { Card, CollectiveButton, Spacer },
  setup() {
    const store = useStore()
    const address = computed(() => store.state.account.address)
    const connect = () => store.dispatch('ethereumConnect')
    return { address, connect }
  },
  computed: {
    links() {
      const link = (title_: string, link: string) => {
        const title = `${title_} Documentation`
        return { title, link }
      }
      const vue = 'https://v3.vuejs.org/guide/introduction.html'
      const vuex = 'https://vuex.vuejs.org/fr/api/'
      const web3 = 'https://web3js.readthedocs.io/en/v1.2.11/index.html'
      const solidity = 'https://docs.soliditylang.org/en/v0.8.9/'
      const metamask = 'https://docs.metamask.io/guide/'
      const gridGarden = 'https://cssgridgarden.com/'
      const flexboxFroggy = 'https://flexboxfroggy.com/'
      const mdn = 'https://developer.mozilla.org/fr/'
      return [
        link('Vue.js', vue),
        link('Vuex', vuex),
        link('Web3', web3),
        link('Solidity', solidity),
        link('MetaMask', metamask),
        { title: 'MDN', link: mdn },
        { title: 'Flexbox Froggy', link: flexboxFroggy },
        { title: 'Grid Garden', link: gridGarden },
      ]
    },
  },
  methods: {
    goToAccount() {
      this.$router.push({ name: 'Account' })
    },
  },
})
</script>

<style lang="css" scoped>
.home-wrapper {
  margin: auto 24px auto 24px;
}

.home {
  display: grid;
  align-items: center;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  grid-gap: 24px;
}

.card-body {
  padding: 12px;
  display: block;
  font-family: inherit;
  font-size: 1.2rem;
  font-weight: inherit;
  text-align: center;
  color: inherit;
  text-decoration: none;
  font-variant: small-caps;
}
</style>
