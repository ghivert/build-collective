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
    <card title="You're connected!" :blue="true" v-else>
      <collective-button :transparent="true" @click="goToAccount">
        Go to account
      </collective-button>
    </card>
    <spacer :size="24" />
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
    const connect = () => store.dispatch('ethereumConnect') //il appelle la fonction dans store pour se connecter à ganache(eterium)
    return { address, connect }
  },
  methods: {
    goToAccount() {
      this.$router.push({ name: 'Account' }) // Avec cette commande on peut changer de page en utilisant le nom de la page  
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
