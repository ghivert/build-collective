<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <button @click="connect">Connect</button>
    <div v-if="store.state.address">Connected</div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { useStore } from 'vuex'

export default defineComponent({
  name: 'Home',
  components: {},
  setup() {
    const store = useStore()
    return { store }
  },
  methods: {
    async connect() {
      await this.store.dispatch('ethereumConnect')
      this.$router.push({ name: 'Account' })
    },
  },
})
</script>
