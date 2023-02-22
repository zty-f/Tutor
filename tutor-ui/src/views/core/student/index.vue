<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学生ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入学生ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生昵称" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入学生昵称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学生性别" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择学生性别" clearable>
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="学生职级" prop="deptId">
        <el-select v-model="queryParams.deptId" placeholder="请选择学生职级" clearable>
          <el-option
            v-for="dict in dict.type.sys_dept_name"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="学生岗位" prop="postIds">
        <el-select v-model="queryParams.postIds" multiple placeholder="请选择岗位">
          <el-option
            v-for="item in postOptions"
            :key="item.postId"
            :label="item.postName"
            :value="item.postId"
            :disabled="item.status === 1"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="登录时间" prop="loginDate">
        <el-date-picker clearable
                        v-model="queryParams.loginDate"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择最后登录时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="所在地点">
        <v-distpicker
          :province="loc.province"
          :city="loc.city"
          :area="loc.area"
          @province="onChangeProvince1"
          @city="onChangeCity1"
          @area="onChangeArea1"
        ></v-distpicker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['core:student:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['core:student:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['core:student:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="studentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学生ID" align="center" prop="student.userId" />
      <el-table-column label="头像" align="center" prop="student.avatar" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.student.avatar" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="昵称" align="center" prop="student.nickName" />
      <el-table-column label="性别" align="center" prop="student.sex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.student.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="角色" align="center" prop="roleName" />
      <el-table-column label="职级" align="center" prop="deptName" />
      <el-table-column label="岗位" align="center" width="100px">
        <template slot-scope="scope">
          <el-card class="box-card" shadow="hover">
            <div v-for="post in scope.row.posts" :key="post" class="text item">
              {{post}}
            </div>
          </el-card>
        </template>
      </el-table-column>
      <el-table-column label="邮箱" align="center" prop="student.email" width="120px"/>
      <el-table-column label="手机号码" align="center" prop="student.phonenumber" width="120px"/>

      <el-table-column label="认证状态" align="center" prop="authStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_auth_status" :value="scope.row.authStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="最后登录时间" align="center" prop="student.loginDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.student.loginDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="student.remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetail(scope.row)"
          >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row.student)"
            v-hasPermi="['core:student:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row.student)"
            v-hasPermi="['core:student:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 查看每个学生详细信息描述列表 -->
    <el-dialog :title="title" :visible.sync="openDetail" width="800px" append-to-body>
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
            胜任岗位
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

    <!-- 添加或修改学生信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属职级" prop="deptId">
          <el-select v-model="form.deptId" placeholder="请选择用户职级">
            <el-option
              v-for="dict in dict.type.sys_dept_name"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="胜任岗位" prop="postIds">
          <el-select v-model="form.postIds" multiple placeholder="请选择岗位">
            <el-option
              v-for="item in postOptions"
              :key="item.postId"
              :label="item.postName"
              :value="item.postId"
              :disabled="item.status === 1"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="用户昵称" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入用户昵称" />
        </el-form-item>
        <el-form-item label="用户邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入用户邮箱" />
        </el-form-item>
        <el-form-item label="手机号码" prop="phonenumber">
          <el-input v-model="form.phonenumber" placeholder="请输入手机号码" />
        </el-form-item>
        <el-form-item label="用户性别" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择用户性别">
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
        <el-form-item label="帐号状态">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.sys_normal_disable"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="删除标志">
          <el-radio-group v-model="form.delFlag">
            <el-radio
              v-for="dict in dict.type.sys_delete_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
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
        <el-form-item label="就读学校" prop="university">
          <el-input v-model="sysStudent.university" placeholder="请输入就读学校" />
        </el-form-item>
        <el-form-item label="专业" prop="major">
          <el-input v-model="sysStudent.major" placeholder="请输入所学专业" />
        </el-form-item>
        <el-form-item label="学生详细背景">
          <el-input v-model="sysStudent.background" type="textarea" placeholder="请输入个人详细情况"></el-input>
        </el-form-item>
        <el-form-item label="授课方式">
          <el-radio-group v-model="sysStudent.teachWay">
            <el-radio
              v-for="dict in dict.type.sys_teach_way"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="期望报酬">
          <el-select v-model="sysStudent.salaryExpect" placeholder="请选择期望报酬">
            <el-option
              v-for="dict in dict.type.sys_salary_dict"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="认证状态">
          <el-radio-group v-model="sysStudent.authStatus">
            <el-radio
              v-for="dict in dict.type.sys_auth_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
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
import { listStudent, getStudent, delStudent, addStudent, updateStudent } from "@/api/core/student";
import {addCollect, addLeave, addLike, delCollect, delLike} from "@/api/core/common";
import store from "@/store";
import {listPost} from "@/api/system/post";

export default {
  name: "Student",
  dicts: ['sys_auth_status', 'sys_delete_status', 'sys_user_sex', 'sys_normal_disable', 'sys_teach_way','sys_dept_name','sys_salary_dict'],
  data() {
    return {
      rowCenter:{
        "text-align":"center",
        "width": "130px"
      },
      isLike: false,
      likeNum: '',
      isCollect: false,
      collectNum: '',
      tPosts: "",
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      postOptions: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 学生信息表格数据
      studentList: [],
      // 学生家教信息表格数据
      sysStudent: {},
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetail: false,
      openLeave: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        nickName: null,
        loginDate: null,
        sex: null,
        deptId: null,
        postIds: null,
        location: null,
      },
      // 表单参数
      form: {},
      loc: {},
      leaveMsg: {},
      // 表单校验
      rules: {
        deptId: [
          { required: true, message: "所属职级不能为空", trigger: "blur" }
        ],
        userName: [
          { required: true, message: "用户账号不能为空", trigger: "blur" }
        ],
        nickName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        postIds: [
          { required: true, message: "岗位不能为空", trigger: "blur" }
        ],
        area: [
          { required: true, message: "所在省、市、区都必须选择清楚~", trigger: ["blur","change"] }
        ],
      },
      query:{}
    };
  },
  created() {
    this.getList();
    this.getPosts();
  },
  methods: {
    /** 查询学生信息列表 */
    getList() {
      this.loading = true;
      this.queryParams.location = this.loc.province+"-"+this.loc.city+"-"+this.loc.area;
      listStudent(this.queryParams).then(response => {
        this.studentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getPosts(){
      listPost(this.query).then(response => {
        this.postOptions = response.rows;
      });
    },
    onChangeProvince(a){
      this.form.province = a.value;
      this.form.city = null;
      this.form.area = null;
    },
    onChangeCity(a){
      this.form.city = a.value;
    },
    onChangeArea(a){
      this.form.area = a.value;
    },
    onChangeProvince1(a){
      this.loc.province = a.value;
      this.loc.city = null;
      this.loc.area = null;
    },
    onChangeCity1(a){
      this.loc.city = a.value;
    },
    onChangeArea1(a){
      this.loc.area = a.value;
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.openDetail = false;
      this.openLeave = false;
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
      this.sysStudent = {};
      this.leaveMsg = {};
      this.resetForm("form");
      this.resetForm("leave");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.loc = {};
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.userId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加学生信息";
    },
    /** 详情按钮操作 */
    handleDetail(row) {
      this.reset();
      const userId = row.student.userId || this.ids
      getStudent(userId).then(response => {
        this.form = response.data;
        this.tPosts = row.posts;
        this.sysStudent = response.data.sysStudent==null?{}:response.data.sysStudent;
        this.openDetail = true;
        this.title = "学生详细信息";
        this.isLike = response.isLike;
        this.likeNum = response.likeNum;
        this.isCollect = response.isCollect;
        this.collectNum = response.collectNum;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const userId = row.userId || this.ids
      getStudent(userId).then(response => {
        this.form = response.data;
        this.form.deptId = this.form.deptId.toString(); //解决不能显示字段问题，后端传值为Long类型
        this.sysStudent = response.data.sysStudent==null?{}:response.data.sysStudent;
        let loc = this.sysStudent.location.split('-');
        this.form.province = loc[0];
        this.form.city = loc[1];
        this.form.area = loc[2];
        this.$set(this.form, "postIds", row.postIds);
        this.open = true;
        this.title = "修改学生信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      console.log(this.form.province+"-"+this.form.city+"-"+this.form.area)
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.sysStudent.location = this.form.province+"-"+this.form.city+"-"+this.form.area;
          this.form.sysStudent = this.sysStudent;
          if (this.form.userId != null) {
            updateStudent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
              this.reset();
            });
          } else {
            addStudent(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
              this.reset();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const userIds = row.userId || this.ids;
      this.$modal.confirm('是否确认删除学生信息编号为"' + userIds + '"的数据项？').then(function() {
        return delStudent(userIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('core/student/export', {
        ...this.queryParams
      }, `student_${new Date().getTime()}.xlsx`)
    }
  },
};
</script>
