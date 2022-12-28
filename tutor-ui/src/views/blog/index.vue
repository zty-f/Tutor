<template>
  <i-frame :src="url" />
</template>
<script>
import iFrame from "@/components/iFrame/index";
export default {
  name: "blog",
  components: { iFrame },
  data() {
    return {
      url: "https://www.zty-f.fun/"
    };
  },
};
</script>
