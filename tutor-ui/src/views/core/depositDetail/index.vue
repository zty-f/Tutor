<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户ID" prop="userId" v-if="isManager">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="操作状态" prop="action">
        <el-select v-model="queryParams.action" placeholder="请选择操作状态" clearable>
          <el-option
            v-for="dict in dict.type.deposit_action_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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


    <el-descriptions :column="2" border :labelStyle="rowCenter" style="width: 600px;margin: auto">
      <el-descriptions-item content-style="width: 150px">
        <template slot="label">
          <i class="el-icon-user"></i>
          用户编号
        </template>
        {{ deposit.userId }}
      </el-descriptions-item>
      <el-descriptions-item content-style="width: 150px">
        <template slot="label">
          <i class="el-icon-set-up"></i>
          押金状态
        </template>
        <dict-tag :options="dict.type.sys_deposit_status" :value="deposit.status"/>
      </el-descriptions-item>
      <el-descriptions-item  content-style="background: #ea5548;">
        <template slot="label">
          <i class="el-icon-s-finance"></i>
          押金余额
        </template>
        {{ deposit.balance }}
      </el-descriptions-item>
      <el-descriptions-item>
        <template slot="label">
          <i class="el-icon-time"></i>
          最近操作时间
        </template>
        {{ deposit.updateTime }}
      </el-descriptions-item>
    </el-descriptions>
    <el-row :gutter="10" class="mb8" :style="{marginTop:'20px'}">
      <el-col :span="1.5" style="float: left">
        <el-button
          type="info"
          plain
          icon="el-icon-refresh"
          size="mini"
          @click="handleReset"
        >重置交易密码</el-button>
      </el-col>
      <el-col :span="1.5" style="float: right">
        <el-button
          type="success"
          plain
          icon="el-icon-minus"
          size="mini"
          @click="handleFetch"
        >取出</el-button>
      </el-col>
      <el-col :span="1.5" style="float: right">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleStore"
        >存入</el-button>
      </el-col>
    </el-row>

    <el-row :gutter="10" class="mb8" :style="{marginTop:'20px'}">
      <el-col :span="1.5">
        <el-button
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

    <el-table v-loading="loading" :data="detailList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户ID" align="center" prop="userId" />
      <el-table-column label="操作状态" align="center" prop="action">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.deposit_action_status" :value="scope.row.action"/>
        </template>
      </el-table-column>
      <el-table-column label="金额数量" align="center" prop="amount" />
      <el-table-column label="押金余额" align="center" prop="balance" />
      <el-table-column label="创建时间" align="center" prop="createTime">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
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

    <!-- 开通交易账户 -->
    <el-dialog title="交易系统还未开通，请先存入余额并设置交易密码开通交易功能~" :visible.sync="isOpenDeal" width="700px" append-to-body>
      <h3 :style="{textAlign:'center',marginBottom:'20px'}">未开通会使得本页面功能异常，请尽快开通~</h3>
      <h3 :style="{textAlign:'center',marginBottom:'20px'}">刷新网页可以重新调出该开通页面~</h3>
      <div :style="{textAlign:'center',marginBottom:'20px'}">
        <image-preview :src="src" style="width: 100px;height: 100px;"/>
      </div>
      <el-form ref="dForm" :model="deposit" :rules="rules" label-width="80px">
        <el-form-item label="存入余额" prop="balance">
          <el-input v-model="deposit.balance" placeholder="请输入存入押金余额" />
        </el-form-item>
        <el-form-item label="交易密码" prop="password">
          <el-input v-model="deposit.password" placeholder="请输入后续交易密码" type="password" show-password/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="openDeal">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 存取钱交易窗口 -->
    <el-dialog :title="title" :visible.sync="openAction" width="400px" append-to-body>
      <el-form :model="tmp" label-width="80px" >
        <el-form-item label="存取余额">
          <el-input v-model="tmp.balance" placeholder="请输入存取押金余额"/>
        </el-form-item>
        <el-form-item label="交易密码">
          <el-input v-model="tmp.password" placeholder="请输入交易密码" type="password" show-password/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="action">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--重置交易密码页面-->
    <el-dialog title="重置交易密码页面" :visible.sync="openReset" width="400px" append-to-body>
      <el-form ref="deal" :model="deal" :rules="rules" label-width="80px">
        <el-form-item label="旧密码" prop="oldPassword">
          <el-input v-model="deal.oldPassword" placeholder="请输入旧密码" type="password" show-password/>
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
          <el-input v-model="deal.newPassword" placeholder="请输入新密码" type="password" show-password/>
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input v-model="deal.confirmPassword" placeholder="请确认新密码" type="password" show-password/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" size="mini" @click="submit">确 认</el-button>
          <el-button type="danger" size="mini" @click="cancel">关 闭</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

  </div>
</template>

<script>
import {
  listDetail,
  getDetail,
  delDetail,
  addDetail,
  updateDetail,
  getDeposit,
  addDeposit,
  storeDeposit, fetchDeposit, updateDelPwd
} from "@/api/core/deposit";
import store from "@/store";

export default {
  name: "Detail",
  dicts: ['deposit_action_status','sys_deposit_status'],
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.deal.newPassword !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    return {
      deal: {
        oldPassword: undefined,
        newPassword: undefined,
        confirmPassword: undefined
      },
      src: "/profile/weixin/weixin.png",
      rowCenter:{
        "text-align":"center",
        "width": "130px",
      },
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
      // 用户押金操作信息表格数据
      detailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      isManager: false,
      isOpenDeal: false,
      openAction: false,
      isStore: false,
      openReset: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        amount: null,
        balance: null,
        action: null,
      },
      // 表单参数
      form: {},
      deposit: {
        userId: null,
        status: '',
        balance: '',
        password: '',
        updateTime: '',
      },
      tmp: {
        balance: '',
        password: '',
      },
      // 表单校验
      rules: {
        oldPassword: [
          { required: true, message: "旧密码不能为空", trigger: "blur" }
        ],
        newPassword: [
          { required: true, message: "新密码不能为空", trigger: "blur" },
          { min: 6, max: 20, message: "长度在 6 到 20 个字符", trigger: "blur" }
        ],
        confirmPassword: [
          { required: true, message: "确认密码不能为空", trigger: "blur" },
          { required: true, validator: equalToPassword, trigger: "blur" }
        ],
        password: [
          { required: true, message: "新密码不能为空", trigger: "blur" },
          { min: 6, max: 20, message: "长度在 6 到 20 个字符", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getDeposit();
    this.getList();
  },
  methods: {
    /** 查询用户押金操作信息列表 */
    getList() {
      let role = store.getters.roles[0];
      if (role!=="student"&&role!=="parent"){
        this.isManager = true;
      }
      listDetail(this.queryParams).then(response => {
        this.detailList = response.rows;
        this.total = response.total;
      });
    },
    getDeposit(){
      this.loading = true;
      let userId = store.getters.userId;
      getDeposit(userId).then(response => {
        this.deposit = response.data===undefined?{}:response.data;
        if (this.deposit.status==="0"||this.deposit.status==="1"){
          this.isOpenDeal = false;
        }else {
          this.isOpenDeal = true;
        }
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.isOpenDeal = false;
      this.openAction = false;
      this.openReset = false;
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        userId: null,
        amount: null,
        balance: null,
        action: "0",
        createTime: null
      };
      this.deposit = {};
      this.resetForm("form");
    },
    openDeal(){
      this.$refs["dForm"].validate(valid => {
        if (valid) {
          this.deposit.userId = store.getters.userId;
          this.deposit.status = 0;
          addDeposit(this.deposit).then(response => {
            if (response.code === 200){
              this.$modal.msgSuccess("交易系统开通成功~");
              this.isOpenDeal = false;
            }else {
              this.$modal.msgError("交易系统开通失败~");
            }
          });
          setTimeout(() => {
            this.getDeposit();
            this.getList();
          }, 1000);
        }
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
    /** 重置交易密码 */
    handleReset(){
       this.deal = {};
       this.openReset = true;
    },
    /** 存入按钮操作 */
    handleStore() {
      this.tmp = {};
      this.openAction = true;
      this.isStore = true;
      this.title = "押金存入窗口";
    },
    /** 取出按钮操作 */
    handleFetch() {
      this.tmp = {};
      this.openAction = true;
      this.isStore = false;
      this.title = "押金取出窗口";
    },
    action(){
      if (this.isStore){
        storeDeposit(this.tmp).then(res => {
          if (res.code === 200){
            this.$modal.msgSuccess("存入押金成功");
            this.openAction = false;
          }else {
            this.$modal.error(res.msg);
          }
        });
      }else {
        fetchDeposit(this.tmp).then(res => {
          if (res.code === 200){
            this.$modal.msgSuccess("取出押金成功");
            this.openAction = false;
          }else {
            this.$modal.error(res.msg);
          }
        });
      }
      setTimeout(() => {
        this.tmp.password = '';
        this.getDeposit();
        this.getList();
      }, 500);
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除用户押金操作信息编号为"' + ids + '"的数据项？').then(function() {
        return delDetail(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/detail/export', {
        ...this.queryParams
      }, `detail_${new Date().getTime()}.xlsx`)
    },
    submit() {
      this.$refs["deal"].validate(valid => {
        if (valid) {
          updateDelPwd(this.deal.oldPassword, this.deal.newPassword).then(response => {
            this.$modal.msgSuccess("修改交易密码成功~");
            this.openReset = false;
          });
        }
      });
    },
  }
};
</script>

<style>
.my-content {
  background: #ea5548;
}
</style>
