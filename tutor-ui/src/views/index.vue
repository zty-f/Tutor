<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :span="10">
        <el-card  shadow="hover"  style="width: 100%;">
          <div slot="header" class="clearfix">
            <span>文嘉《明日歌》</span>
          </div>
          <div style="font-size: 18px;text-align: center; " >明日复明日</div>
          <div style="font-size: 18px;text-align: center;" >明日何其多</div>
          <div style="font-size: 18px;text-align: center;" >我生待明日</div>
          <div style="font-size: 18px;text-align: center;" >万事成蹉跎</div>
          <div style="margin-top: 40px;"></div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {

    };
  },
  methods: {
  }
};
</script>

<style scoped lang="scss">
.like {
  cursor: pointer;
  font-size: 25px;
  display: inline-block;
}
</style>

