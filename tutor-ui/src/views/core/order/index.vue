<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
      <el-form-item label="ID①" prop="studentId" label-width="30px">
        <el-input
          v-model="queryParams.studentId"
          placeholder="请输入大学生用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="ID②" prop="parentId" label-width="30px">
        <el-input
          v-model="queryParams.parentId"
          placeholder="请输入家长（学员）用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态①" prop="studentStatus" label-width="55px">
        <el-select v-model="queryParams.studentStatus" placeholder="请选择大学生方订单状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_order_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="状态②" prop="parentStatus" label-width="55px">
        <el-select v-model="queryParams.parentStatus" placeholder="请选择家长（学员）方订单状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_order_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="发起方" prop="status" label-width="60px">
        <el-select v-model="queryParams.status" placeholder="请选择订单发起方" clearable>
          <el-option
            v-for="dict in dict.type.sys_order_start"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建时间" prop="orderTime" label-width="68px">
        <el-date-picker clearable
                        v-model="queryParams.orderTime"
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >在线下单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-if="isManager"
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >删除</el-button>
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

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="20" align="center" />
      <el-table-column label="大学生ID" align="center" prop="studentId" />
      <el-table-column label="家长(学员)ID" align="center" prop="parentId" />
      <el-table-column label="大学生方状态" align="center" prop="studentStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_order_status" :value="scope.row.studentStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="家长(学员)方状态" align="center" prop="parentStatus" width="150">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_order_status" :value="scope.row.parentStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="订单金额" align="center" prop="amount" />
      <el-table-column label="订单双方约定" align="center" prop="promise" width="150"/>
      <el-table-column label="订单发起方" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_order_start" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="orderTime">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.openConfirm"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleConfirm(scope.row)"
          >确认</el-button>
          <el-button
            v-if="scope.row.openCancel"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleCancel(scope.row)"
          >取消</el-button>
          <el-button
            v-if="scope.row.openFinish"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleFinish(scope.row)"
          >完成</el-button>
          <el-button
            v-if="scope.row.openLegal"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleLegal(scope.row)"
          >维权</el-button>
          <el-button
            v-if="!isManager&&scope.row.openConfirm"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >修改</el-button>
          <el-button
            v-if="isManager"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
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

    <!-- 添加或修改用户下单信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="150px">
        <el-form-item label="大学生ID" prop="studentId" v-if="isManager||isParent">
          <el-input v-model="form.studentId" placeholder="请输入大学生用户ID" />
        </el-form-item>
        <el-form-item label="家长(学员)ID" prop="parentId" v-if="isManager||isStudent">
          <el-input v-model="form.parentId" placeholder="请输入家长(学员)用户ID" />
        </el-form-item>
        <el-form-item label="订单金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入订单金额" />
        </el-form-item>
        <el-form-item label="订单双方约定" prop="promise">
          <el-input v-model="form.promise" type="textarea" placeholder="[请写出双方详细约定，方便后续订单完成~]" rows="4"/>
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
import {listOrder, getOrder, delOrder, addOrder, updateOrder, updateStatus} from "@/api/core/deposit";
import store from "@/store";
export default {
  name: "Order",
  dicts: ['sys_order_status','sys_order_start'],
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
      // 用户下单信息表格数据
      orderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      isManager: false,
      isStudent: false,
      isParent: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        studentId: null,
        parentId: null,
        studentStatus: null,
        parentStatus: null,
        amount: null,
        promise: null,
        status: null,
        orderTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        studentId: [
          { required: true, message: "大学生用户ID不能为空", trigger: "blur" }
        ],
        parentId: [
          { required: true, message: "家长(学员)用户ID不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "订单约定金额不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getRole();
  },
  methods: {
    /** 查询用户下单信息列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        console.log(this.orderList)
        this.total = response.total;
        this.loading = false;
      });
    },
    getRole(){
      let role = store.getters.roles[0];
      if (role==='parent'){
        this.isParent = true;
      }else if (role==='student'){
        this.isStudent = true;
      }else {
        this.isManager = true;
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        studentId: null,
        parentId: null,
        studentStatus: "0",
        parentStatus: "0",
        amount: null,
        promise: null,
        status: "0",
        orderTime: null
      };
      this.resetForm("form");
    },
    handleConfirm(row){
      updateStatus(row.id,1).then(res => {
        this.$modal.msgSuccess("单方确认订单成功");
        this.getList();
        this.getRole();
      });
    },
    handleCancel(row){
      updateStatus(row.id,2).then(res => {
        this.$modal.msgSuccess("单方取消订单成功");
        this.getList();
        this.getRole();
      });
    },
    handleFinish(row){
      updateStatus(row.id,3).then(res => {
        this.$modal.msgSuccess("单方完成订单成功");
        this.getList();
        this.getRole();
      });
    },
    handleLegal(row){
      updateStatus(row.id,4).then(res => {
        this.$modal.msgSuccess("单方维权订单成功");
        this.getList();
        this.getRole();
      });
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "在线下单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改用户下单信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
              this.$modal.msgSuccess("在线下单成功~");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除用户下单信息编号为"' + ids + '"的数据项？').then(function() {
        return delOrder(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
