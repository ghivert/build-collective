<template lang="html">
  <button @click="$emit('click', $event)" class="button" :class="className">
    <div class="button-body">
      <slot></slot>
    </div>
  </button>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'CollectiveButton',
  props: { transparent: Boolean },
  computed: {
    className(): string {
      return this.transparent ? 'transparent' : 'visible'
    },
  },
})
</script>

<style lang="css" scoped>
.button {
  color: white;
  border: none;
  appearance: none;
  cursor: pointer;
  font-family: inherit;
  font-size: 1.2rem;
  font-weight: inherit;
  padding: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
}

.button-body {
  font-variant: small-caps;
}

.transparent {
  background: transparent;
}

.visible {
  background: rgb(62, 41, 74);
}
</style>
