<template>
  <div>
    <svg-icon icon-class="link" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'RuoYiDoc',
  data() {
    return {
      url: 'https://www.zty-f.fun/'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
