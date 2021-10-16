<template>
  <div class="wrapper">
    <div class="card">
      <div>
        <div class="card-title" v-if="title">{{ title }}</div>
        <div class="card-subtitle" v-if="subtitle">{{ subtitle }}</div>
      </div>
      <div class="body">
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Card',
  props: {
    title: String,
    subtitle: String,
  },
}
</script>

<style lang="css" scoped>
.wrapper {
  background: linear-gradient(
    to bottom,
    rgba(26, 18, 31, 0),
    70%,
    rgba(167, 79, 236, 0.5)
  );
  border-radius: 22px;
  padding: 2px;
  display: flex;
}

.card {
  flex: 1;
  display: flex;
  flex-direction: column;
  background: rgb(42, 28, 50);
  border-radius: 20px;
  overflow: hidden;
}

.card-title,
.card-subtitle {
  background: rgb(53, 35, 64);
  padding: 18px;
}

.card-title {
  padding-bottom: 3px;
  font-size: 1.5rem;
  font-weight: bold;
}

.card-subtitle {
  padding-top: 0px;
  font-size: 1.2rem;
  font-weight: 500;
  color: rgb(240, 240, 240);
  white-space: pre;
}

.body {
  flex: 1;
}
</style>
