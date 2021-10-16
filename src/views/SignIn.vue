<template>
  <div class="home">
    <Card
      v-if="!address"
      title="It looks like you're not connected."
      subtitle="Please connect to use the app."
    >
      <Button transparent="true" @click="connect">Connect</Button>
    </Card>
    <Card title="You're connected!" subtitle="Hooray" v-if="address">
      <Button transparent="true" @click="goToAccount">Go to account</Button>
    </Card>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { useStore } from 'vuex'
import Card from '@/components/Card.vue'
import Button from '@/components/Button.vue'

export default defineComponent({
  name: 'SignIn',
  components: { Card, Button },
  setup() {
    const store = useStore()
    const { address } = store.state
    const connectEthereum = () => store.dispatch('ethereumConnect')
    return { address, connectEthereum }
  },
  methods: {
    goToAccount() {
      this.$router.push({ name: 'Account' })
    },
    async connect() {
      await this.connectEthereum()
      this.$router.push({ name: 'Account' })
    },
  },
})
</script>

<style lang="css" scoped>
.home {
  padding: 24px;
  margin: auto 0;
  display: grid;
  align-items: center;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  grid-gap: 24px;
}
</style>
