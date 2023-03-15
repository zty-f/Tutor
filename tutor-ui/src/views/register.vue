<template>
  <div class="register">
    <!--头部-->
    <div class="el-register-header">
      <el-switch
        v-model="registerForm.parentRegister"
        active-color="blue"
        inactive-color="green"
        active-text="学员注册"
        @change="clearForm()"
        inactive-text="学生注册">
      </el-switch>
    </div>
    <!--学生注册表单-->
    <el-form ref="registerForm" :model="registerForm" :rules="registerRules" class="register-form" v-if="!registerForm.parentRegister">
      <h3 class="title">家教一体化平台[学生注册]</h3>
      <el-form-item label="头像">
        <image-upload v-model="registerForm.avatar"/>
      </el-form-item>
      <el-form-item prop="username">
        <el-input v-model="registerForm.username" type="text" auto-complete="off" placeholder="账号">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          v-model="registerForm.password"
          type="password"
          auto-complete="off"
          placeholder="密码"
          @keyup.enter.native="handleRegister"
          show-password
        >
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="confirmPassword">
        <el-input
          v-model="registerForm.confirmPassword"
          type="password"
          auto-complete="off"
          placeholder="确认密码"
          @keyup.enter.native="handleRegister"
          show-password
        >
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="deptId">
        <el-select v-model="registerForm.deptId" placeholder="请选择教学职级">
          <el-option
            v-for="dict in dict.type.sys_dept_name"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
          <svg-icon slot="prefix" icon-class="dept" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <el-form-item prop="postIds">
        <el-select v-model="registerForm.postIds" multiple placeholder="请选择科目" style="width: 360px">
          <el-option
            v-for="item in dict.type.sys_post_list"
            :key="item.value"
            :label="item.label"
            :value="item.value"
            :disabled="item.status == 1"
          ></el-option>
          <svg-icon slot="prefix" icon-class="post" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <el-form-item  prop="email">
        <el-input v-model="registerForm.email" placeholder="请输入个人邮箱" >
          <svg-icon slot="prefix" icon-class="email" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item  prop="phonenumber">
        <el-input v-model="registerForm.phonenumber" placeholder="请输入个人手机号码" >
          <svg-icon slot="prefix" icon-class="phone" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item  prop="sex">
        <el-select v-model="registerForm.sex" placeholder="请选择性别">
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
          <svg-icon slot="prefix" icon-class="sex" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <el-form-item  prop="university">
        <el-input v-model="registerForm.university" placeholder="请输入就读学校">
          <svg-icon slot="prefix" icon-class="school" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item  prop="major">
        <el-input v-model="registerForm.major" placeholder="请输入所学专业">
          <svg-icon slot="prefix" icon-class="major" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <span>
        <svg-icon slot="prefix" icon-class="location"/>请选择所在地：
      </span>
      <el-form-item prop="area">
        <v-distpicker
          :province="registerForm.province"
          :city="registerForm.city"
          :area="registerForm.area"
          @province="onChangeProvince"
          @city="onChangeCity"
          @area="onChangeArea"
        ></v-distpicker>
      </el-form-item>
      <el-form-item prop="teachWay" label="">
        <el-select v-model="registerForm.teachWay" placeholder="请选择授课方式">
          <el-option
            v-for="dict in dict.type.sys_teach_way"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
          <svg-icon slot="prefix" icon-class="teachway" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <el-form-item prop="salaryExpect" label="">
        <el-select v-model="registerForm.salaryExpect" placeholder="请选择期望报酬">
          <el-option
            v-for="dict in dict.type.sys_salary_dict"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
          <svg-icon slot="prefix" icon-class="salary" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <el-form-item prop="background">
        <el-input v-model="registerForm.background" type="textarea" placeholder="请输入个人详细情况"></el-input>
      </el-form-item>
      <el-form-item prop="code" v-if="captchaEnabled">
        <el-input
          v-model="registerForm.code"
          auto-complete="off"
          placeholder="验证码"
          style="width: 63%"
          @keyup.enter.native="handleRegister"
        >
          <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon" />
        </el-input>
        <div class="register-code">
          <img :src="codeUrl" @click="getCode" class="register-code-img"/>
        </div>
      </el-form-item>
      <el-form-item style="width:100%;">
        <el-button
          :loading="loading"
          size="medium"
          type="primary"
          style="width:100%;"
          @click.native.prevent="handleRegister"
        >
          <span v-if="!loading">注 册</span>
          <span v-else>注 册 中...</span>
        </el-button>
        <div style="float: right;">
          <router-link class="link-type" :to="'/login'">使用已有账户登录</router-link>
        </div>
      </el-form-item>
    </el-form>
    <!--学员注册表单-->
    <el-form ref="registerForm" :model="registerForm" :rules="registerRules" class="register-form" v-if="registerForm.parentRegister">
      <h3 class="title">家教一体化平台[学员注册]</h3>
      <el-form-item label="头像">
        <image-upload v-model="registerForm.avatar"/>
      </el-form-item>
      <el-form-item prop="username">
        <el-input v-model="registerForm.username" type="text" auto-complete="off" placeholder="账号">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          v-model="registerForm.password"
          type="password"
          auto-complete="off"
          placeholder="密码"
          @keyup.enter.native="handleRegister"
          show-password
        >
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="confirmPassword">
        <el-input
          v-model="registerForm.confirmPassword"
          type="password"
          auto-complete="off"
          placeholder="确认密码"
          @keyup.enter.native="handleRegister"
          show-password
        >
          <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item prop="deptId">
        <el-select v-model="registerForm.deptId" placeholder="请选择求教职级">
          <el-option
            v-for="dict in dict.type.sys_dept_name"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
          <svg-icon slot="prefix" icon-class="dept" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <el-form-item prop="postIds">
        <el-select v-model="registerForm.postIds" multiple placeholder="请选择学科" style="width: 360px">
          <el-option
            v-for="item in dict.type.sys_post_list"
            :key="item.value"
            :label="item.label"
            :value="item.value"
            :disabled="item.status == 1"
          ></el-option>
          <svg-icon slot="prefix" icon-class="post" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <el-form-item  prop="email">
        <el-input v-model="registerForm.email" placeholder="请输入个人邮箱" >
          <svg-icon slot="prefix" icon-class="email" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item  prop="phonenumber">
        <el-input v-model="registerForm.phonenumber" placeholder="请输入个人手机号码" >
          <svg-icon slot="prefix" icon-class="phone" class="el-input__icon input-icon" />
        </el-input>
      </el-form-item>
      <el-form-item  prop="sex">
        <el-select v-model="registerForm.sex" placeholder="请选择性别">
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
          <svg-icon slot="prefix" icon-class="sex" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <span>
        <svg-icon slot="prefix" icon-class="location"/>请选择所在地：
      </span>
      <el-form-item prop="area">
        <v-distpicker
          :province="registerForm.province"
          :city="registerForm.city"
          :area="registerForm.area"
          @province="onChangeProvince"
          @city="onChangeCity"
          @area="onChangeArea"
        ></v-distpicker>
      </el-form-item>
      <el-form-item prop="salaryExpect" label="">
        <el-select v-model="registerForm.salaryExpect" placeholder="请选择教学报酬">
          <el-option
            v-for="dict in dict.type.sys_salary_dict"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
          <svg-icon slot="prefix" icon-class="salary" class="el-input__icon input-icon" />
        </el-select>
      </el-form-item>
      <el-form-item >
        <el-input v-model="registerForm.background" type="textarea" placeholder="请输入个人详细情况">
        </el-input>
      </el-form-item>
      <el-form-item prop="code" v-if="captchaEnabled">
        <el-input
          v-model="registerForm.code"
          auto-complete="off"
          placeholder="验证码"
          style="width: 63%"
          @keyup.enter.native="handleRegister"
        >
          <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon" />
        </el-input>
        <div class="register-code">
          <img :src="codeUrl" @click="getCode" class="register-code-img"/>
        </div>
      </el-form-item>
      <el-form-item style="width:100%;">
        <el-button
          :loading="loading"
          size="medium"
          type="primary"
          style="width:100%;"
          @click.native.prevent="handleRegister"
        >
          <span v-if="!loading">注 册</span>
          <span v-else>注 册 中...</span>
        </el-button>
        <div style="float: right;">
          <router-link class="link-type" :to="'/login'">使用已有账户登录</router-link>
        </div>
      </el-form-item>
    </el-form>
    <!--  底部  -->
    <div class="el-register-footer">
      <span>Copyright ©2022-2023 tutor - zty</span>
    </div>
  </div>
</template>

<script>
import { getCodeImg, register } from "@/api/login";
import {deptTreeSelect} from "@/api/system/user";

export default {
  name: "Register",
  dicts: [ 'sys_salary_dict','sys_user_sex','sys_dept_name','sys_teach_way','sys_post_list'],
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.registerForm.password !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    return {
      // 科目选项
      postOptions: [],
      codeUrl: "",
      registerForm: {
        parentRegister: false,
        username: "",
        password: "",
        confirmPassword: "",
        code: "",
        uuid: "",
        email: "",
        phonenumber: "",
        deptId: "",
        postIds: [],
        province: "",
        city: "",
        area: "",
      },
      registerRules: {
        email: [
          { required: false, message: "邮箱地址不能为空", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        phonenumber: [
          { required: false, message: "手机号码不能为空", trigger: "blur" },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        deptId: [
          { required: true, message: "所属职级不能为空", trigger: "blur" }
        ],
        postIds: [
          { required: true, message: "选择不能为空", trigger: "blur" }
        ],
        university: [
          { required: true, message: "就读学校不能为空", trigger: "blur" }
        ],
        major: [
          { required: true, message: "所学专业不能为空", trigger: "blur" }
        ],
        location: [
          { required: true, message: "所在地不能为空", trigger: "blur" }
        ],
        teachWay: [
          { required: true, message: "授课方式不能为空", trigger: "blur" }
        ],
        salaryExpect: [
          { required: true, message: "报酬选择不能为空", trigger: "blur" }
        ],
        sex: [
          { required: true, message: "性别不能为空", trigger: "blur" }
        ],
        username: [
          { required: true, trigger: "blur", message: "请输入您的账号" },
          { min: 2, max: 20, message: '用户账号长度必须介于 2 和 20 之间', trigger: 'blur' }
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入您的密码" },
          { min: 5, max: 20, message: '用户密码长度必须介于 5 和 20 之间', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, trigger: "blur", message: "请再次输入您的密码" },
          { required: true, validator: equalToPassword, trigger: "blur" }
        ],
        code: [{ required: true, trigger: "change", message: "请输入验证码" }],
        area: [
          { required: true, message: "所在省、市、区都必须选择清楚~", trigger: ["blur","change"] }
        ],
      },
      loading: false,
      captchaEnabled: true
    };
  },
  created() {
    this.getCode();
  },
  methods: {
    onChangeProvince(a){
      this.registerForm.province = a.value;
      this.registerForm.city = null;
      this.registerForm.area = null;
    },
    onChangeCity(a){
      this.registerForm.city = a.value;
    },
    onChangeArea(a){
      this.registerForm.area = a.value;
    },
    clearForm(){
      this.$refs.registerForm.clearValidate();
    },
    getCode() {
      getCodeImg().then(res => {
        this.captchaEnabled = res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.registerForm.uuid = res.uuid;
        }
      });
    },
    handleRegister() {
      this.$refs.registerForm.validate(valid => {
        if (valid) {
          this.loading = true;
          this.registerForm.location = this.registerForm.province+"-"+this.registerForm.city+"-"+this.registerForm.area;
          register(this.registerForm).then(res => {
            const username = this.registerForm.username;
            this.$alert("<font color='red'>恭喜你，您的账号 " + username + " 注册成功！</font>", '系统提示', {
              dangerouslyUseHTMLString: true,
              type: 'success'
            }).then(() => {
              this.$router.push("/login");
            }).catch(() => {});
          }).catch(() => {
            this.loading = false;
            if (this.captchaEnabled) {
              this.getCode();
            }
          })
        }
      });
    }
  }
};
</script>

<style rel="stylesheet/scss" lang="scss">
.register {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 1300px;
  background-image: url("../assets/images/login-background.jpg");
  background-size: auto 1500px;
}
.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}

.register-form {
  border-radius: 4px;
  background: #ffffff;
  width: 400px;
  padding: 20px 20px 5px 20px;
  .el-input {
    height: 38px;
    input {
      height: 38px;
    }
  }
  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}
.register-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}
.register-code {
  width: 33%;
  height: 38px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
  }
}
.el-register-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}
.el-register-header {
  height: 40px;
  line-height: 40px;
  position: absolute;
  top: 0;
  width: 100%;
  text-align: center;
  font-family: '微软雅黑';
  font-size: 20px;
  letter-spacing: 1px;
  background: #ffffff;
}
.register-code-img {
  height: 38px;
}
</style>
