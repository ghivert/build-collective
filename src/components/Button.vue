<template lang="html">
  <button
    @click="$emit('click', $event)"
    type="button"
    class="button"
    :class="className"
  >
    <div>
      <slot></slot>
    </div>
  </button>
</template>

<script lang="ts">
export default {
  props: {
    transparent: Boolean,
  },
  computed: {
    className(): string {
      return this.transparent ? 'transparent' : 'visible'
    },
  },
}
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

.transparent {
  background: transparent;
}

.visible {
  background: rgb(62, 41, 74);
}
</style>
