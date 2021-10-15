<template>
  <div id="nav" v-if="store.state.address">
    <router-link to="/">Home</router-link> |
    <router-link to="/account">Account</router-link>
  </div>
  <router-view />
</template>

<script>
import { defineComponent } from 'vue'
import { useStore } from 'vuex'

export default defineComponent({
  name: 'App',
  setup() {
    const store = useStore()
    return { store }
  },
})
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
