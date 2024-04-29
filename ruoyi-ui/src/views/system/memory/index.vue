<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="回忆名" prop="memoryName">
        <el-input
          v-model="queryParams.memoryName"
          placeholder="请输入回忆名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="持续时间">
        <el-time-picker
          is-range
          v-model="daterangeMemoryTime"
          range-separator="至"
          start-placeholder="开始时间"
          end-placeholder="结束时间"
          placeholder="选择时间范围">
        </el-time-picker>
      </el-form-item>
      <el-form-item label="创建者" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入创建者"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间">
        <el-date-picker
          v-model="daterangeCreateTime"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
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
          v-hasPermi="['system:memory:add']"
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
          v-hasPermi="['system:memory:edit']"
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
          v-hasPermi="['system:memory:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:memory:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="memoryList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="回忆名" align="center" prop="memoryName" />
      <el-table-column label="回忆图片" align="center" prop="memoryImg" width="150">
        <template slot-scope="scope">
          <image-preview :src="scope.row.memoryImg" :width="150" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="持续时间" align="center" prop="memoryTime" width="180">
        <template slot-scope="scope">
          <span>{{ scope.row.memoryTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="回忆录" align="center" prop="recollectionName" />
      <el-table-column label="创建者" align="center" prop="createByName">
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark">
        <template slot-scope="scope">
          <el-button type="text" @click="openRemark(scope.row.remark)">点击查看</el-button>
        </template>
<!--        <template slot-scope="scope">-->
<!--          <el-collapse v-model="scope.row.activeNames">-->
<!--            <el-collapse-item title="点击展开" name="1">-->
<!--              {{ scope.row.remark }}-->
<!--            </el-collapse-item>-->
<!--          </el-collapse>-->
<!--        </template>-->
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:memory:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:memory:remove']"
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

    <!-- 添加或修改回忆对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="回忆名" prop="memoryName">
          <el-input v-model="form.memoryName" placeholder="请输入回忆名" />
        </el-form-item>
        <el-form-item label="回忆录" prop="recollectionId">
          <el-select v-model="form.recollectionId" placeholder="请选择回忆录id">
            <el-option
              v-for="item in recollectionList"
              :key="item.recollectionId"
              :label="item.recollectionName"
              :value="item.recollectionId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="回忆图片" prop="memoryImg">
          <image-upload v-model="form.memoryImg"/>
        </el-form-item>
        <el-form-item label="持续时间" prop="memoryTime">
          <el-time-picker
            v-model="form.memoryTime"
            value-format="HH:mm:ss"
            placeholder="时长">
          </el-time-picker>
        </el-form-item>
        <el-form-item label="创建者">
          <el-select v-model="form.createBy" placeholder="请选择创建者">
            <el-option
              v-for="dict in dict.type.we"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
import { listMemory, getMemory, delMemory, addMemory, updateMemory } from "@/api/system/memory";
import {listRecollections} from "@/api/system/recollections";
export default {
  name: "Memory",
  // 字典
  dicts: [ 'we'],
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
      // 回忆表格数据
      memoryList: [
        { remark: '备注1', activeNames: ['1'] }
      ],
      recollectionList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 备注时间范围
      daterangeMemoryTime: [],
      // 备注时间范围
      daterangeCreateTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        memoryName: null,
        memoryTime: null,
        recollectionId: null,
        createBy: null,
        createTime: null,
        remark: null
      },
      // 表单参数
      form: {
        memoryTime: new Date(2024, 3, 26, 17, 52,41)
      },
      // 表单校验
      rules: {
        memoryName: [
          { required: true, message: "回忆名不能为空", trigger: "blur" }
        ],
        recollectionId: [
          { required: true, message: "回忆录id不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /*打开备注预览*/
    openRemark(remarkContent) {
      // 在控制台输出内容，以便验证
      console.log(remarkContent);
      this.$alert(remarkContent, '备注', {
        confirmButtonText: '确定',
        callback: action => {
          this.$message({
            type: 'success',
            message: `祝你天天开心嗷，我超喜欢你！`
          });
        }
      });
    },
    /** 查询回忆列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeMemoryTime && '' != this.daterangeMemoryTime) {
        this.queryParams.params["beginMemoryTime"] = this.daterangeMemoryTime[0];
        this.queryParams.params["endMemoryTime"] = this.daterangeMemoryTime[1];
      }
      if (null != this.daterangeCreateTime && '' != this.daterangeCreateTime) {
        this.queryParams.params["beginCreateTime"] = this.daterangeCreateTime[0];
        this.queryParams.params["endCreateTime"] = this.daterangeCreateTime[1];
      }
      listRecollections(null).then(response => {
        this.recollectionList = response.rows;

      });
      listMemory(this.queryParams).then(response => {
        this.memoryList = response.rows;
        this.total = response.total;
        this.loading = false;
        console.log("这是memory列表")
        console.log(this.queryParams)
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        memoryId: null,
        memoryName: null,
        memoryImg: null,
        memoryTime: null,
        recollectionId: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeMemoryTime = [];
      this.daterangeCreateTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.memoryId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加回忆";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const memoryId = row.memoryId || this.ids

      getMemory(memoryId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改回忆";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.memoryId != null) {
            updateMemory(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              console.log(this.form)
              this.getList();
            });
          } else {
            addMemory(this.form).then(response => {
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
      const memoryIds = row.memoryId || this.ids;
      this.$modal.confirm('是否确认删除回忆编号为"' + memoryIds + '"的数据项？').then(function() {
        return delMemory(memoryIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/memory/export', {
        ...this.queryParams
      }, `memory_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

