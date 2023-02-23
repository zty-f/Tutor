<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="12" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>学员个人信息</span>
          </div>
          <div>
            <div class="text-center">
              <userAvatar :user="user" />
            </div>
            <ul class="list-group list-group-striped">
              <li class="list-group-item">
                <i class="el-icon-s-flag"/>用户ID
                <div class="pull-right">{{ user.userId }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="user" />个人昵称
                <div class="pull-right" >{{user.nickName}}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="phone" />手机号码
                <div class="pull-right">{{ user.phonenumber }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="email" />个人邮箱
                <div class="pull-right"  >{{user.email}}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="tree" />所属职级
                <div class="pull-right" v-if="user.dept">{{ user.dept.deptName }} / {{ postGroup }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="peoples" />所属角色
                <div class="pull-right">{{ roleGroup }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="location" />所在地
                <div class="pull-right">{{ location }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="date" />创建日期
                <div class="pull-right">{{ user.createTime }}</div>
              </li>
              <li class="list-group-item">
                <i class="el-icon-s-check"></i>认证状态
                <div class="pull-right">
                  <dict-tag :options="dict.type.sys_auth_status" :value="authStatus"/>
                </div>
              </li>
            </ul>
          </div>
          <el-button
            size="mini"
            type="primary"
            icon="el-icon-edit"
            @click="handleUpdate(user)"
          >修改个人信息</el-button>
          <el-button
            v-if="authStatus===0"
            size="mini"
            type="success"
            icon="el-icon-s-check"
            @click="handleAuth(user)"
            class="pull-right"
          >在线认证</el-button>
        </el-card>
      </el-col>
      <el-col :span="12" :xs="24">
        <el-card>
          <div slot="header" class="clearfix">
            <span>修改密码</span>
          </div>
              <resetPwd />
        </el-card>
      </el-col>
    </el-row>

    <el-dialog title="在线认证" :visible.sync="authOpen" width="700px" append-to-body>
      <el-divider content-position="center">以下信息仅用于本网站在线认证，请放心填写~</el-divider>
      <el-form ref="authForm" :model="authForm" :rules="authRules" label-width="80px" :style="{width:'300px',margin:'auto'}">
        <el-form-item label="个人邮箱" prop="email">
          <el-input v-model="authForm.email" placeholder="请输入个人邮箱" />
        </el-form-item>
        <el-form-item label="手机号码" prop="phonenumber">
          <el-input v-model="authForm.phonenumber" placeholder="请输入手机号码" />
        </el-form-item>
        <el-form-item label="姓名" prop="trueName">
          <el-input v-model="authForm.trueName" placeholder="请输入个人真实姓名" />
        </el-form-item>
        <el-form-item label="身份证号" prop="idCard">
          <el-input v-model="authForm.idCard" placeholder="请输入个人身份证号" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="onlineAuth">认 证</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <el-dialog title="修改个人信息" :visible.sync="open" width="550px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属职级" prop="deptId">
          <el-select v-model="form.deptId" placeholder="请选择个人职级">
            <el-option
              v-for="dict in dict.type.sys_dept_name"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="待补学科" prop="postIds">
          <el-select v-model="form.postIds" multiple placeholder="请选择待补科目">
            <el-option
              v-for="item in postOptions"
              :key="item.postId"
              :label="item.postName"
              :value="item.postId"
              :disabled="item.status == 1"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="个人昵称" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入个人昵称" />
        </el-form-item>
        <el-form-item label="个人邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入个人邮箱" />
        </el-form-item>
        <el-form-item label="手机号码" prop="phonenumber">
          <el-input v-model="form.phonenumber" placeholder="请输入手机号码" />
        </el-form-item>
        <el-form-item label="个人性别" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择个人性别">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="头像地址">
          <image-upload v-model="form.avatar"/>
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"></el-input>
        </el-form-item>
        <el-divider content-position="center">学生家教信息</el-divider>
        <el-form-item label="所在地点" prop="area">
          <v-distpicker
            :province="form.province"
            :city="form.city"
            :area="form.area"
            @province="onChangeProvince"
            @city="onChangeCity"
            @area="onChangeArea"
          ></v-distpicker>
        </el-form-item>
        <el-form-item label="学生详细背景">
          <el-input v-model="sysParent.background" type="textarea" placeholder="请输入个人详细情况"></el-input>
        </el-form-item>
        <el-form-item label="期望报酬">
          <el-select v-model="sysParent.salaryReward" placeholder="请选择期望报酬">
            <el-option
              v-for="dict in dict.type.sys_salary_dict"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import userAvatar from "./userAvatar";
import resetPwd from "./resetPwd";
import { getUserProfile } from "@/api/system/user";
import {addParent, getAuthStatus, getParent, updateParent} from "@/api/core/parent";
import store from "@/store";
import {onlineAuth} from "@/api/core/common";
import Vue from "vue";

export default {
  name: "Profile",
  dicts: ['sys_auth_status', 'sys_delete_status', 'sys_user_sex', 'sys_normal_disable', 'sys_teach_way','sys_dept_name','sys_salary_dict'],
  components: { userAvatar, resetPwd },
  data() {
    return {
      open: false,
      authOpen: false,
      user: {},
      sysParent: {},
      roleGroup: {},
      postGroup: {},
      postOptions: [],
      postId: [],
      location: "",
      // 表单参数
      form: {},
      authForm: {},
      // 表单校验
      rules: {
        deptId: [
          { required: true, message: "所属职级不能为空", trigger: "blur" }
        ],
        postIds: [
          { required: true, message: "科目不能为空", trigger: "blur" }
        ],
        nickName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        area: [
          { required: true, message: "所在省、市、区都必须一次性选择清楚再确认，否则需要关闭该窗口重新修改~", trigger: ["blur","change"] }
        ],
      },
      authRules: {
        phonenumber: [
          {
            required: true,
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: ["blur", "change"]
          }
        ],
        email: [
          {
            required: true,
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        trueName: [
          { required: true, message: "真实姓名不能为空", trigger: "blur" }
        ],
        idCard: [
          { required: true,pattern: /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
            , message: "请输入正确的身份证号", trigger: ["blur", "change"] }
        ],
      },
      authStatus: '',
    };
  },
  created() {
    this.getUser();
    this.getAuth();
  },
  methods: {
    onChangeProvince(a){
      this.form.province = a.value;
      Vue.delete(this.form,'area');
    },
    onChangeCity(a){
      this.form.city = a.value;
    },
    onChangeArea(a){
      this.form.area = a.value;
    },
    // 表单重置
    reset() {
      this.form = {
        userId: null,
        deptId: null,
        userName: null,
        nickName: null,
        userType: null,
        email: null,
        phonenumber: null,
        sex: null,
        avatar: null,
        password: null,
        status: "0",
        delFlag: "0",
        loginIp: null,
        loginDate: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        province: null,
        city: null,
        area: null,
      };
      this.authForm = {
        email: null,
        phonenumber: null,
        trueName: null,
        idCard: null,
      };
      this.sysParent = {};
      this.resetForm("form");
      this.resetForm("authForm");
    },
    getUser() {
      getUserProfile().then(response => {
        this.user = response.data;
        this.roleGroup = response.roleGroup;
        this.postGroup = response.postGroup;
        this.postOptions = response.posts;
        this.postId = response.postIds;
        this.location = response.location;
      });
    },
    getAuth(){
      var userId = store.getters.userId
      getAuthStatus(userId).then(response => {
        this.authStatus = response.data;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(user) {
      this.reset();
      const userId = user.userId;
      getParent(userId).then(response => {
        this.form = response.data;
        this.form.deptId = this.form.deptId.toString(); //解决不能显示字段问题，后端传值为Long类型
        this.$set(this.form, "postIds", this.postId);
        this.sysParent = response.data.sysParent==null?{}:response.data.sysParent;
        let loc = this.sysParent.location.split('-');
        this.form.province = loc[0];
        this.form.city = loc[1];
        this.form.area = loc[2];
        this.open = true;
      });
    },
    /** 在线认证按钮操作 */
    handleAuth(user) {
      this.reset();
      this.authForm.userId = user.userId;
      this.authForm.role = this.roleGroup;
      this.authForm.email = user.email;
      this.authForm.phonenumber = user.phonenumber;
      this.authOpen = true;
    },
    onlineAuth(){
      this.$refs["authForm"].validate(valid => {
        if (valid) {
          onlineAuth(this.authForm).then(response => {
            if (response.code===200){
              this.$modal.msgSuccess(response.msg);
              this.$modal.alertWarning("**********一周后认证状态未改变表示认证失败*********请修改个人信息再次进行在线认证或者联系管理员咨询")
            }else{
              this.$modal.msgError(response.msg);
            }
          });
          this.authOpen = false;
          setTimeout(() => {
            this.getUser();
            this.getAuth();
          }, 1000);
        }
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.openDetail = false;
      this.authOpen = false;
      this.reset();
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.sysParent.location = this.form.province+"-"+this.form.city+"-"+this.form.area;
          this.form.sysParent = this.sysParent;
          if (this.form.userId != null) {
            updateParent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.reset();
            });
          }
          setTimeout(() => {
            this.getUser();
            this.getAuth();
          }, 1000);
        }
      });
    },
  }
};
</script>
