<template>
  <nav class="navbar">
    <div class="logo">
      <img alt="Vue logo" src="./assets/logo.svg" class="logo-img" />
      <div class="logo-name">Build Collective</div>
    </div>
    <template v-if="store.state.address">
      <router-link to="/">Home</router-link> |
      <router-link to="/account">Account</router-link>
    </template>
  </nav>
  <router-view />
</template>

<script lang="ts">
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

<style lang="css">
body {
  margin: 0;
}

html {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-weight: 600;
  background: rgb(26, 18, 31);
  color: rgb(255, 255, 255);
}

.navbar {
  display: flex;
  background: rgb(30, 22, 36);
  border-bottom: 2px solid;
  border-image: linear-gradient(
      to right,
      rgba(45, 31, 54, 0.5),
      rgba(167, 79, 236, 0.5)
    )
    1;
}

.logo {
  display: flex;
  align-items: center;
  padding: 12px;
}

.logo-img {
  width: 30px;
  margin-right: 12px;
}

.logo-name {
  font-size: 24px;
}

#app {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}
</style>
