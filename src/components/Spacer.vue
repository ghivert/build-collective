<template lang="html">
  <div :style="{ paddingTop: `${size}px`, paddingRight: `${size}px` }"></div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'Spacer',
  props: {
    size: Number,
  },
})
</script>

<style lang="css" scoped></style>
