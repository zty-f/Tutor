<template>
  <div>
    <el-empty description="您的收藏列表为空，快快去发现和探索吧！" v-if="openEmpty"></el-empty>
    <!--管理员收藏列表【收藏学生and学员信息】-->
    <el-row :gutter="20" v-if="isManager">
      <el-col :span="6" v-for="user in collectList" :key="user.userId" :style="{marginTop:'20px'}">
        <el-card class="box-card">
          <div>
            <div class="text-center">
              <image-preview :src="user.avatar" :width="80" :height="80"/>
            </div>
            <ul class="list-group list-group-striped">
              <li class="list-group-item">
                <svg-icon icon-class="user" />用户昵称
                <div class="pull-right">{{ user.nickName }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="phone" />手机号码
                <div class="pull-right">{{ user.phonenumber }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="email" />用户邮箱
                <div class="pull-right">{{ user.email }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="tree" />所属职级
                <div class="pull-right" v-if="user.dept">{{ user.dept.deptName }} / {{ user.postGroup }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="peoples" />所属角色
                <div class="pull-right">{{ user.roles[0].roleName }}</div>
              </li>
              <li class="list-group-item">
                <svg-icon icon-class="date" />创建日期
                <div class="pull-right">{{ user.createTime }}</div>
              </li>
            </ul>
          </div>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            class="pull-right"
            @click="handleDetail(user)"
          >详情</el-button>
        </el-card>
      </el-col>
    </el-row>

    <!--学员收藏列表【收藏学生信息】-->
    <div style="display:flex;justify-content:center;align-items:center;border:1px solid green;text-align:center;" v-if="isParent">
      <ol class="infinite-list" style="overflow:auto">
        <li v-for="form in collectStudentList" class="infinite-list-item">
          <el-card :style="{ margin: '40px',width:'800px'}" shadow="hover">
            <el-descriptions class="margin-top" :column="2" border :labelStyle="rowCenter">
              <template slot="title">
                <image-preview :src="form.student.avatar" :width="100" :height="100"/>
              </template>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-s-flag"></i>
                  学生编号
                </template>
                {{ form.student.userId }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-star-on"></i>
                  学生账号
                </template>
                {{ form.student.userName }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-user"></i>
                  学生昵称
                </template>
                {{ form.student.nickName }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-guide"></i>
                  学生性别
                </template>
                <dict-tag :options="dict.type.sys_user_sex" :value="form.student.sex"/>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <svg-icon slot="prefix" icon-class="dept" class="el-input__icon input-icon" />
                  学生职级
                </template>
                <dict-tag :options="dict.type.sys_dept_name" :value="form.student.deptId"/>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <svg-icon slot="prefix" icon-class="post" class="el-input__icon input-icon" />
                  胜任科目
                </template>
                <el-tag
                  v-for="post in form.posts"
                  effect="plain">
                  {{ post }}
                </el-tag>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-mobile-phone"></i>
                  手机号
                </template>
                {{ form.student.phonenumber }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-message"></i>
                  邮箱
                </template>
                {{ form.student.email }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-school"></i>
                  就读学校
                </template>
                {{ form.student.sysStudent.university }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-reading"></i>
                  所学专业
                </template>
                {{ form.student.sysStudent.major }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-location-information"></i>
                  所在地
                </template>
                {{ form.student.sysStudent.location }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-magic-stick"></i>
                  授课方式
                </template>
                <dict-tag :options="dict.type.sys_teach_way" :value="form.student.sysStudent.teachWay"/>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-s-finance"></i>
                  期望报酬
                </template>
                <dict-tag :options="dict.type.sys_salary_dict" :value="form.student.sysStudent.salaryExpect"/>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-time"></i>
                  最近上线
                </template>
                {{ form.student.loginDate }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-s-check"></i>
                  认证状态
                </template>
                <dict-tag :options="dict.type.sys_auth_status" :value="form.student.sysStudent.authStatus"/>
              </el-descriptions-item>
            </el-descriptions>
            <el-divider></el-divider>
            <el-descriptions border direction="vertical">
              <template slot="title">
                <i class="el-icon-info"></i>
                学生详细背景
              </template>
              <el-descriptions-item>
                {{  form.student.sysStudent.background }}
              </el-descriptions-item>
            </el-descriptions>
            <div :style="{height:'90px',marginTop:'20px',display:'flex',justifyContent: 'flex-start'}">
              <div @click="tLike(form.student.userId,form.like)"  :style="{width: '50px',height: '80px',textAlign: 'center',margin:'10px'}">
                <img src="@/assets/images/love-white.svg" v-if="!form.like" slot="footer">
                <img src="@/assets/images/love-red.svg" v-if="form.like" slot="footer">
                <span>{{form.likeNum}}</span>
              </div>
              <div @click="tCollect(form.student.userId,form.collect)" :style="{width: '50px',height: '80px',textAlign: 'center',margin:'10px'}">
                <img src="@/assets/images/collect-white.svg" v-if="!form.collect" slot="footer">
                <img src="@/assets/images/collect-black.svg" v-if="form.collect" slot="footer">
                <span>{{form.collectNum}}</span>
              </div>
            </div>
            <div :style="{marginLeft:'20px',marginTop: '20px'}">
              <el-button type="primary" round @click="toLeave(form.student)">在线留言</el-button>
            </div>
          </el-card>
        </li>
      </ol>
    </div>


    <!--学生收藏列表【收藏学员信息】-->
    <div style="display:flex;justify-content:center;align-items:center;border:1px solid green;text-align:center;" v-if="isStudent">
      <ol class="infinite-list" style="overflow:auto">
        <li v-for="form in collectParentList" class="infinite-list-item">
          <el-card :style="{ margin: '40px',width:'800px'}" shadow="hover">
            <el-descriptions class="margin-top" :column="2" border :labelStyle="rowCenter">
              <template slot="title">
                <image-preview :src="form.parent.avatar" :width="100" :height="100"/>
              </template>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-s-flag"></i>
                  学员编号
                </template>
                {{ form.parent.userId }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-star-on"></i>
                  学员账号
                </template>
                {{ form.parent.userName }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-user"></i>
                  学员昵称
                </template>
                {{ form.parent.nickName }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-guide"></i>
                  学员性别
                </template>
                <dict-tag :options="dict.type.sys_user_sex" :value="form.parent.sex"/>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <svg-icon slot="prefix" icon-class="dept" class="el-input__icon input-icon" />
                  学员现级
                </template>
                <dict-tag :options="dict.type.sys_dept_name" :value="form.parent.deptId"/>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <svg-icon slot="prefix" icon-class="post" class="el-input__icon input-icon" />
                  待补学科
                </template>
                <el-tag
                  v-for="post in form.posts"
                  effect="plain">
                  {{ post }}
                </el-tag>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-mobile-phone"></i>
                  手机号
                </template>
                {{ form.parent.phonenumber }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-message"></i>
                  邮箱
                </template>
                {{ form.parent.email }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-location-information"></i>
                  所在地
                </template>
                {{ form.parent.sysParent.location }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-s-finance"></i>
                  预计报酬
                </template>
                <dict-tag :options="dict.type.sys_salary_dict" :value="form.parent.sysParent.salaryReward"/>
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-time"></i>
                  最近上线
                </template>
                {{ form.parent.loginDate }}
              </el-descriptions-item>
              <el-descriptions-item>
                <template slot="label">
                  <i class="el-icon-s-check"></i>
                  认证状态
                </template>
                <dict-tag :options="dict.type.sys_auth_status" :value="form.parent.sysParent.authStatus"/>
              </el-descriptions-item>
            </el-descriptions>
            <el-divider></el-divider>
            <el-descriptions border direction="vertical">
              <template slot="title">
                <i class="el-icon-info"></i>
                学员详细背景
              </template>
              <el-descriptions-item>
                {{  form.parent.sysParent.background }}
              </el-descriptions-item>
            </el-descriptions>
            <div :style="{height:'90px',marginTop:'20px',display:'flex',justifyContent: 'flex-start'}">
              <div @click="tLike(form.parent.userId,form.like)"  :style="{width: '50px',height: '80px',textAlign: 'center',margin:'10px'}">
                <img src="@/assets/images/love-white.svg" v-if="!form.like" slot="footer">
                <img src="@/assets/images/love-red.svg" v-if="form.like" slot="footer">
                <span>{{form.likeNum}}</span>
              </div>
              <div @click="tCollect(form.parent.userId,form.collect)" :style="{width: '50px',height: '80px',textAlign: 'center',margin:'10px'}">
                <img src="@/assets/images/collect-white.svg" v-if="!form.collect" slot="footer">
                <img src="@/assets/images/collect-black.svg" v-if="form.collect" slot="footer">
                <span>{{form.collectNum}}</span>
              </div>
            </div>
            <div :style="{marginLeft:'20px',marginTop: '20px'}">
              <el-button type="primary" round @click="toLeave(form.parent)">在线留言</el-button>
            </div>
          </el-card>
        </li>
      </ol>
    </div>

    <!-- 查看每个学员详细信息描述列表 -->
    <el-dialog title="学员详细信息" :visible.sync="openParentDetail" width="800px" append-to-body>
      <el-descriptions class="margin-top" :column="2" border :labelStyle="rowCenter">
        <template slot="title">
          <image-preview :src="form.avatar" :width="100" :height="100"/>
        </template>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-s-flag"></i>
            学员编号
          </template>
          {{ form.userId }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-star-on"></i>
            学员账号
          </template>
          {{ form.userName }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-user"></i>
            学员昵称
          </template>
          {{ form.nickName }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-guide"></i>
            学员性别
          </template>
          <dict-tag :options="dict.type.sys_user_sex" :value="form.sex"/>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <svg-icon slot="prefix" icon-class="dept" class="el-input__icon input-icon" />
            学员现级
          </template>
          <dict-tag :options="dict.type.sys_dept_name" :value="form.deptId"/>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <svg-icon slot="prefix" icon-class="post" class="el-input__icon input-icon" />
            待补学科
          </template>
          <el-tag
            v-for="post in tPosts"
            effect="plain">
            {{ post }}
          </el-tag>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-mobile-phone"></i>
            手机号
          </template>
          {{ form.phonenumber }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-message"></i>
            邮箱
          </template>
          {{ form.email }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-location-information"></i>
            所在地
          </template>
          {{ sysParent.location }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-s-finance"></i>
            预计报酬
          </template>
          <dict-tag :options="dict.type.sys_salary_dict" :value="sysParent.salaryReward"/>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-time"></i>
            最近上线
          </template>
          {{ form.loginDate }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-s-check"></i>
            认证状态
          </template>
          <dict-tag :options="dict.type.sys_auth_status" :value="sysParent.authStatus"/>
        </el-descriptions-item>
      </el-descriptions>
      <el-divider></el-divider>
      <el-descriptions border direction="vertical">
        <template slot="title">
          <i class="el-icon-info"></i>
          学员详细背景
        </template>
        <el-descriptions-item>
          {{  sysParent.background }}
        </el-descriptions-item>
      </el-descriptions>
      <div :style="{height:'90px',marginTop:'20px',display:'flex',justifyContent: 'flex-start'}">
        <div @click="like(form.userId)"  :style="{width: '50px',height: '80px',textAlign: 'center',margin:'10px'}">
          <img src="@/assets/images/love-white.svg" v-if="!isLike" slot="footer">
          <img src="@/assets/images/love-red.svg" v-if="isLike" slot="footer">
          <span>{{likeNum}}</span>
        </div>
        <div @click="collect(form.userId)" :style="{width: '50px',height: '80px',textAlign: 'center',margin:'10px'}">
          <img src="@/assets/images/collect-white.svg" v-if="!isCollect" slot="footer">
          <img src="@/assets/images/collect-black.svg" v-if="isCollect" slot="footer">
          <span>{{collectNum}}</span>
        </div>
      </div>
      <div :style="{marginLeft:'20px',marginTop: '20px'}">
        <el-button type="primary" round @click="toLeave(form)">在线留言</el-button>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 查看每个学生详细信息描述列表 -->
    <el-dialog title="学生详细信息" :visible.sync="openStudentDetail" width="800px" append-to-body>
      <el-descriptions class="margin-top" :column="2" border :labelStyle="rowCenter">
        <template slot="title">
          <image-preview :src="form.avatar" :width="100" :height="100"/>
        </template>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-s-flag"></i>
            学生编号
          </template>
          {{ form.userId }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-star-on"></i>
            学生账号
          </template>
          {{ form.userName }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-user"></i>
            学生昵称
          </template>
          {{ form.nickName }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-guide"></i>
            学生性别
          </template>
          <dict-tag :options="dict.type.sys_user_sex" :value="form.sex"/>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <svg-icon slot="prefix" icon-class="dept" class="el-input__icon input-icon" />
            学生职级
          </template>
          <dict-tag :options="dict.type.sys_dept_name" :value="form.deptId"/>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <svg-icon slot="prefix" icon-class="post" class="el-input__icon input-icon" />
            胜任科目
          </template>
          <el-tag
            v-for="post in tPosts"
            effect="plain">
            {{ post }}
          </el-tag>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-mobile-phone"></i>
            手机号
          </template>
          {{ form.phonenumber }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-message"></i>
            邮箱
          </template>
          {{ form.email }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-school"></i>
            就读学校
          </template>
          {{ sysStudent.university }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-reading"></i>
            所学专业
          </template>
          {{ sysStudent.major }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-location-information"></i>
            所在地
          </template>
          {{ sysStudent.location }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-magic-stick"></i>
            授课方式
          </template>
          <dict-tag :options="dict.type.sys_teach_way" :value="sysStudent.teachWay"/>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-s-finance"></i>
            期望报酬
          </template>
          <dict-tag :options="dict.type.sys_salary_dict" :value="sysStudent.salaryExpect"/>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-time"></i>
            最近上线
          </template>
          {{ form.loginDate }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-s-check"></i>
            认证状态
          </template>
          <dict-tag :options="dict.type.sys_auth_status" :value="sysStudent.authStatus"/>
        </el-descriptions-item>
      </el-descriptions>
      <el-divider></el-divider>
      <el-descriptions border direction="vertical">
        <template slot="title">
          <i class="el-icon-info"></i>
          学生详细背景
        </template>
        <el-descriptions-item>
          {{  sysStudent.background }}
        </el-descriptions-item>
      </el-descriptions>
      <div :style="{height:'90px',marginTop:'20px',display:'flex',justifyContent: 'flex-start'}">
        <div @click="like(form.userId)"  :style="{width: '50px',height: '80px',textAlign: 'center',margin:'10px'}">
          <img src="@/assets/images/love-white.svg" v-if="!isLike" slot="footer">
          <img src="@/assets/images/love-red.svg" v-if="isLike" slot="footer">
          <span>{{likeNum}}</span>
        </div>
        <div @click="collect(form.userId)" :style="{width: '50px',height: '80px',textAlign: 'center',margin:'10px'}">
          <img src="@/assets/images/collect-white.svg" v-if="!isCollect" slot="footer">
          <img src="@/assets/images/collect-black.svg" v-if="isCollect" slot="footer">
          <span>{{collectNum}}</span>
        </div>
      </div>
      <div :style="{marginLeft:'20px',marginTop: '20px'}">
        <el-button type="primary" round @click="toLeave(form)">在线留言</el-button>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel" >关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 在线留言对话框 -->
    <el-dialog title="在线留言" :visible.sync="openLeave" width="500px" append-to-body>
      <span>留言内容，仅对方可见，建议留下联系方式方便对方联系~</span>
      <editor v-model="leaveMsg.context" :min-height="192"/>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="leave">确 定 留 言</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <template>
      <el-backtop @click="getList">
        <div style="{
          height: 100%;
          width: 100%;
          background-color: #f2f5f6;
          box-shadow: 0 0 6px rgba(0,0,0, .12);
          text-align: center;
          line-height: 40px;
          color: #1989fa;
        }"
        >
          UP
        </div>
      </el-backtop>
    </template>
  </div>
</template>

<script>
import {addCollect, addLeave, addLike, delCollect, delLike, getCollectList} from "@/api/core/common";
import {getStudent} from "@/api/core/student";
import {getParent} from "@/api/core/parent";
import store from "@/store";

export default {
  name: "Like",
  dicts: ['sys_teach_way','sys_auth_status','sys_salary_dict', 'sys_delete_status', 'sys_user_sex', 'sys_normal_disable','sys_dept_name'],
  data() {
    return {
      rowCenter:{
        "text-align":"center",
        "width": "130px"
      },
      isLike: false,
      likeNum: '',
      isCollect: false,
      openLeave: false,
      collectNum: '',
      // 学员信息表格数据
      collectList: [],
      collectStudentList: [],
      collectParentList: [],
      // 学员家教信息表格数据
      sysStudent: {},
      sysParent: {},
      openStudentDetail: false,
      openParentDetail: false,
      openEmpty: false,
      isManager: false,
      isStudent: false,
      isParent: false,
      form: {},
      leaveMsg: {},
      tPosts: "",
    };
  },
  created() {
    this.getList();
  },
  methods:{
    getList(){
      getCollectList().then(response=>{
        if (response.rows.length<=0){
          this.openEmpty = true;
          this.$modal.alertSuccess("您的收藏列表为空，快快去发现和探索吧！");
        }
        var role = store.getters.roles[0];
        if (role!=="student"&&role!=="parent"){
          this.collectList = response.rows;
          this.isManager = true;
        }else if (role==="student"){
          this.collectParentList = response.rows;
          this.isStudent = true;
        }else if (role==="parent"){
          this.collectStudentList = response.rows;
          this.isParent = true;
        }
      })
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
        remark: null
      };
      this.leaveMsg = {};
      this.sysStudent = {};
      this.resetForm("form");
      this.resetForm("leave");
    },
    /** 详情按钮操作 */
    handleDetail(user) {
      const role = user.roles[0].roleName;
      if (role==="学生"){
        getStudent(user.userId).then(response => {
          this.form = response.data;
          this.tPosts = user.postGroup.split(",");
          this.sysStudent = response.data.sysStudent==null?{}:response.data.sysStudent;
          this.openStudentDetail = true;
          this.isLike = response.isLike;
          this.likeNum = response.likeNum;
          this.isCollect = response.isCollect;
          this.collectNum = response.collectNum;
        });
      }else{
        getParent(user.userId).then(response => {
          this.form = response.data;
          this.tPosts = user.postGroup.split(",");
          this.sysParent = response.data.sysParent==null?{}:response.data.sysParent;
          this.openParentDetail = true;
          this.isLike = response.isLike;
          this.likeNum = response.likeNum;
          this.isCollect = response.isCollect;
          this.collectNum = response.collectNum;
        });
      }
    },
    // 取消按钮
    cancel() {
      this.openStudentDetail = false;
      this.openParentDetail = false;
      this.openLeave = false;
      this.getList();
      this.reset();
    },
    toLeave(form){
      this.leaveMsg.receivedId = form.userId;
      this.leaveMsg.receivedUsername = form.userName;
      this.openLeave = true;
    },
    leave(){
      addLeave(this.leaveMsg).then(response => {
        if (response.code === 200){
          this.$modal.msgSuccess("留言成功");
          this.openLeave = false;
        }else{
          this.$modal.msgError("留言失败");
        }
      });
    },
    // 点赞
    like(id) {
      var sysUserLike={
        userId: store.getters.userId,
        likeId: id,
      }
      if (!this.isLike){
        addLike(sysUserLike).then(response => {
          this.$modal.msgSuccess("点赞成功");
        });
        this.likeNum = this.likeNum + 1;
      }else {
        delLike(sysUserLike).then(response => {
          this.$modal.msgSuccess("取消点赞成功");
        });
        this.likeNum = this.likeNum===0?0:this.likeNum - 1;
      }
      this.isLike = !this.isLike;
    },
    // 点赞
    tLike(id,like) {
      var sysUserLike={
        userId: store.getters.userId,
        likeId: id,
      }
      if (!like){
        addLike(sysUserLike).then(response => {
          this.$modal.msgSuccess("点赞成功");
        });
      }else {
        delLike(sysUserLike).then(response => {
          this.$modal.msgSuccess("取消点赞成功");
        });
      }
      setTimeout(()=>{
        this.getList();
      },1000);
    },
    // 收藏
    collect(id) {
      var sysUserCollect={
        userId: store.getters.userId,
        collectId: id,
      }
      if (!this.isCollect){
        addCollect(sysUserCollect).then(response => {
          this.$modal.msgSuccess("收藏成功");
        });
        this.collectNum = this.collectNum + 1;
      }else {
        delCollect(sysUserCollect).then(response => {
          this.$modal.msgSuccess("取消收藏成功");
        });
        this.collectNum = this.collectNum===0?0:this.collectNum - 1;
      }
      this.isCollect = !this.isCollect;
    },
    // 收藏
    tCollect(id,collect) {
      var sysUserCollect={
        userId: store.getters.userId,
        collectId: id,
      }
      if (!collect){
        addCollect(sysUserCollect).then(response => {
          this.$modal.msgSuccess("收藏成功");
        });
      }else {
        delCollect(sysUserCollect).then(response => {
          this.$modal.msgSuccess("取消收藏成功");
        });
      }
      setTimeout(()=>{
        this.getList();
      },1000);
    },
  }
}
</script>

<style scoped>
.pull-right {
  float: right;
  margin-bottom: 10px;
}
</style>
