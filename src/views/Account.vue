<template lang="html">
  <div class=""></div>
  <div class="" v-if="!account">
    <form @submit.prevent="signUp">
      <input type="text" v-model="username" />
      <input type="submit" />
    </form>
  </div>
  <div v-if="account">
    {{ JSON.stringify(account) }}
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { useStore } from 'vuex'

export default defineComponent({
  setup() {
    const store = useStore()
    const address = store.state.address
    const contract = store.state.contract
    return { address, contract }
  },
  data() {
    const account = null
    const username = ''
    return { account, username }
  },
  methods: {
    async signUp() {
      const { address, contract, username } = this
      await contract.methods.signUp(username).send()
      this.account = await contract.methods.user(address).call()
      this.username = ''
    },
  },
  async mounted() {
    const { address, contract } = this
    const account = await contract.methods.user(address).call()
    if (account.registered) this.account = account
  },
})
</script>

<style lang="css" scoped></style>
