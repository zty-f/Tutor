<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户ID" prop="sendId">
        <el-input
          v-model="queryParams.sendId"
          placeholder="请输入留言用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户账户" prop="sendUsername">
        <el-input
          v-model="queryParams.sendUsername"
          placeholder="请输入留言用户账户名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-date-picker clearable
                        v-model="queryParams.createTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
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
          type="success"
          plain
          icon="el-icon-success"
          size="mini"
          :disabled="multiple"
          @click="handleUpdate"
        >已读</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="leaveList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="45" align="center" />
      <el-table-column label="留言信息ID" align="center" prop="id" width="100px"/>
      <el-table-column label="留言用户ID" align="center" prop="sendId" width="100px"/>
      <el-table-column label="留言用户账户名" align="center" prop="sendUsername" width="150px"/>
      <el-table-column label="留言内容部分预览" align="center" prop="context" >
        <template slot-scope="scope">
          <div >
            <div v-html="scope.row.context" :style="{width:'200px',height:'80px'}"></div>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="读取状态" align="center" prop="status" width="80px">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_leave" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="100px">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-success"
            @click="handleUpdate(scope.row)"
          >已读</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-more"
            @click="handleDetail(scope.row)"
          >详情</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--留言详情查看-->
    <el-dialog title="留言内容详情" :visible.sync="openDetail" width="550px" append-to-body>
      <span>留言内容如下：</span>
      <editor v-model="this.detail" :min-height="192"/>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">关 闭</el-button>
      </div>
    </el-dialog>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import {receivedListLeave, updateStatus} from "@/api/core/common";

export default {
  name: "Received",
  dicts: ['sys_user_leave'],
  data() {
    return {
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
      // 用户留言信息表格数据
      leaveList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openDetail: false,
      detail: '',
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sendId: null,
        sendUsername: null,
        receivedId: null,
        receivedUsername: null,
        context: null,
        status: null,
        createTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        sendId: [
          { required: true, message: "留言用户ID不能为空", trigger: "blur" }
        ],
        sendUsername: [
          { required: true, message: "留言用户账户名不能为空", trigger: "blur" }
        ],
        receivedId: [
          { required: true, message: "被留言用户id不能为空", trigger: "blur" }
        ],
        receivedUsername: [
          { required: true, message: "被留言用户账户名不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户留言信息列表 */
    getList() {
      this.loading = true;
      receivedListLeave(this.queryParams).then(response => {
        this.leaveList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
        id: null,
        sendId: null,
        sendUsername: null,
        receivedId: null,
        receivedUsername: null,
        context: null,
        status: "0",
        createTime: null
      };
      this.detail = '';
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    handleDetail(row){
      this.detail = row.context;
      this.openDetail = true;
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 删除按钮操作 */
    handleUpdate(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认已读用户留言信息编号为"' + ids + '"的留言信息？').then(function() {
        return updateStatus(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('core/leave/exportReceivedList', {
        ...this.queryParams
      }, `leave_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
