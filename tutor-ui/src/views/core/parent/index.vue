<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学员ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入学员ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学员昵称" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入学员昵称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学员性别" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择学员性别" clearable>
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="学员现级" prop="deptId">
        <el-select v-model="queryParams.deptId" placeholder="请选择学员现级" clearable>
          <el-option
            v-for="dict in dict.type.sys_dept_name"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
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
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['core:parent:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['core:parent:edit']"
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
          v-hasPermi="['core:parent:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['core:parent:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="parentList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学员ID" align="center" prop="parent.userId" />
      <el-table-column label="头像" align="center" prop="parent.avatar" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.parent.avatar" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="昵称" align="center" prop="parent.nickName" />
      <el-table-column label="性别" align="center" prop="parent.sex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.parent.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="角色" align="center" prop="roleName" />
      <el-table-column label="现级" align="center" prop="deptName" />
      <el-table-column label="学科" align="center" width="100px">
        <template slot-scope="scope">
          <el-card class="box-card" shadow="hover">
            <div v-for="post in scope.row.posts" :key="post" class="text item">
              {{post}}
            </div>
          </el-card>
        </template>
      </el-table-column>
      <el-table-column label="邮箱" align="center" prop="parent.email" width="120px"/>
      <el-table-column label="手机号码" align="center" prop="parent.phonenumber" width="120px"/>

      <el-table-column label="帐号状态" align="center" prop="parent.status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.parent.status"/>
        </template>
      </el-table-column>
      <el-table-column label="最后登录时间" align="center" prop="parent.loginDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.parent.loginDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="parent.remark" />
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
            @click="handleUpdate(scope.row.parent)"
            v-hasPermi="['core:parent:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row.parent)"
            v-hasPermi="['core:parent:remove']"
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

    <!-- 查看每个学员详细信息描述列表 -->
    <el-dialog :title="title" :visible.sync="openDetail" width="800px" append-to-body>
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
          期望报酬
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
      <div @click="like(form.userId)" slot="footer" :style="{width: '50px',height: '80px',textAlign: 'center'}">
        <img src="@/assets/images/love-white.svg" v-if="!isLike" slot="footer">
        <img src="@/assets/images/love-red.svg" v-if="isLike" slot="footer">
        <span :style="{margin:'auto'}">{{ likeNum }}</span>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">关 闭</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改学员信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学员现级" prop="deptId">
          <el-select v-model="form.deptId" placeholder="请选择学员现级">
            <el-option
              v-for="dict in dict.type.sys_dept_name"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="学员昵称" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入学员昵称" />
        </el-form-item>
        <el-form-item label="学员邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入学员邮箱" />
        </el-form-item>
        <el-form-item label="手机号码" prop="phonenumber">
          <el-input v-model="form.phonenumber" placeholder="请输入手机号码" />
        </el-form-item>
        <el-form-item label="学员性别" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择学员性别">
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
        <el-divider content-position="center">学员家教信息</el-divider>
        <el-form-item label="所在地点" prop="location">
          <el-input v-model="sysParent.location" placeholder="请输入所在地" />
        </el-form-item>
        <el-form-item label="教学报酬">
          <el-select v-model="sysParent.salaryReward" placeholder="请选择教学报酬">
            <el-option
              v-for="dict in dict.type.sys_salary_dict"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="学员详细背景">
          <el-input v-model="sysParent.background" type="textarea" placeholder="请输入学员详细情况"></el-input>
        </el-form-item>
        <el-form-item label="认证状态">
          <el-radio-group v-model="sysParent.authStatus">
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
import { listParent, getParent, delParent, addParent, updateParent } from "@/api/core/parent";
import {addLike, delLike} from "@/api/core/common";
import store from "@/store";

export default {
  name: "Parent",
  dicts: ['sys_auth_status','sys_salary_dict', 'sys_delete_status', 'sys_user_sex', 'sys_normal_disable','sys_dept_name'],
  data() {
    return {
      rowCenter:{
        "text-align":"center",
        "width": "130px"
      },
      isLike: false,
      likeNum: '',
      tPosts: "",
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 学员信息表格数据
      parentList: [],
      // 学员家教信息表格数据
      sysParent: {},
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetail: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        deptId: null,
        nickName: null,
        sex: null,
        loginDate: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        email: [
          { required: true, message: "邮箱地址不能为空", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        phonenumber: [
          { required: true, message: "手机号码不能为空", trigger: "blur" },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ],
        deptId: [
          { required: true, message: "所属现级不能为空", trigger: "blur" }
        ],
        userName: [
          { required: true, message: "学员账号不能为空", trigger: "blur" }
        ],
        nickName: [
          { required: true, message: "学员昵称不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询学员信息列表 */
    getList() {
      this.loading = true;
      listParent(this.queryParams).then(response => {
        this.parentList = response.rows;
        this.total = response.total;
        this.loading = false;
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
    // 取消按钮
    cancel() {
      this.open = false;
      this.openDetail = false;
      this.reset();
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
      this.sysParent = {};
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
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
      this.title = "添加学员信息";
    },
    /** 详情按钮操作 */
    handleDetail(row) {
      this.reset();
      const userId = row.parent.userId || this.ids
      getParent(userId).then(response => {
        this.form = response.data;
        this.tPosts = row.posts;
        this.sysParent = response.data.sysParent==null?{}:response.data.sysParent;
        this.openDetail = true;
        this.title = "学员详细信息";
        this.isLike = response.isLike;
        this.likeNum = response.likeNum;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const userId = row.userId || this.ids
      getParent(userId).then(response => {
        this.form = response.data;
        this.form.deptId = this.form.deptId.toString(); //解决不能显示字段问题，后端传值为Long类型
        this.sysParent = response.data.sysParent==null?{}:response.data.sysParent;
        this.open = true;
        this.title = "修改学员信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.sysParent = this.sysParent;
          if (this.form.userId != null) {
            updateParent(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addParent(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const userIds = row.userId || this.ids;
      this.$modal.confirm('是否确认删除学员信息编号为"' + userIds + '"的数据项？').then(function() {
        return delParent(userIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('core/parent/export', {
        ...this.queryParams
      }, `parent_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
