<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
<!--        <blockquote class="text-warning" style="font-size: 14px">-->
<!--          领取阿里云通用云产品1888优惠券-->
<!--          <br />-->
<!--          <el-link-->
<!--            href="https://www.aliyun.com/minisite/goods?userCode=brki8iof"-->
<!--            type="primary"-->
<!--            target="_blank"-->
<!--            >https://www.aliyun.com/minisite/goods?userCode=brki8iof</el-link-->
<!--          >-->
<!--          <br />-->
<!--          领取腾讯云通用云产品2860优惠券-->
<!--          <br />-->
<!--          <el-link-->
<!--            href="https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=198c8df2ed259157187173bc7f4f32fd&from=console"-->
<!--            type="primary"-->
<!--            target="_blank"-->
<!--            >https://cloud.tencent.com/redirect.php?redirect=1025&cps_key=198c8df2ed259157187173bc7f4f32fd&from=console</el-link-->
<!--          >-->
<!--          <br />-->
<!--          阿里云服务器折扣区-->
<!--          <el-link href="http://aly.ruoyi.vip" type="primary" target="_blank"-->
<!--            >>☛☛点我进入☚☚</el-link-->
<!--          >-->
<!--          &nbsp;&nbsp;&nbsp; 腾讯云服务器秒杀区-->
<!--          <el-link href="http://txy.ruoyi.vip" type="primary" target="_blank"-->
<!--            >>☛☛点我进入☚☚</el-link-->
<!--          ><br />-->
<!--          <h4 class="text-danger">-->
<!--            云产品通用红包，可叠加官网常规优惠使用。(仅限新用户)-->
<!--          </h4>-->
<!--        </blockquote>-->

        <hr />
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>一个极其简陋但是能用的memory管理系统</h2>
        <p>
          有人说想要记录一下微信通话记录，但是微信不具有通话信息都查询功能，所以就写了，后续会慢慢根据当前学的知识不断完善
        </p>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
        <p>
          <el-button
            type="primary"
            size="mini"
            icon="el-icon-cloudy"
            plain
            @click="goTarget('https://github.com/Phoenix-Forhy/record-of-memories')"
            >访问github</el-button
          >
        </p>
      </el-col>
    </el-row>

    <el-divider />
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>联系信息</span>
          </div>
          <div class="body">
            <p>
              <i class="el-icon-s-promotion"></i> 官方联系方式：
              <span>打开你的微信就能找到啦</span>
            </p>
            <p>
              <a class="el-icon-user-solid" href="tencent://AddContact/?fromId=45&fromSubId=1&subcmd=all&uin=230318364&website=www.oicqzone.com" target="_blank">或者你想通过 QQ找到他？点一下我试试！</a>
            </p>
          </div>
        </el-card>
      </el-col>
<!--      更新日志-->
      <el-col :xs="24" :sm="24" :md="12" :lg="8">
        <el-card class="update-log">
          <div slot="header" class="clearfix">
            <span>更新日志</span>
          </div>
          <el-collapse accordion>
            <el-collapse-item title="v1.0.0 - 2024-3-26">
              <ol>
                <li>栖凰memory management正式发布！</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="v1.0.1 - 2024-4-17">
              <ol>
                <li>小小地修改了一下备注的查看样式，便于亲爱的小朋友的阅读，保护眼睛</li>
              </ol>
            </el-collapse-item>
            <el-collapse-item title="v1.0.2 - 2024-4-29">
              <ol>
                <li>再次修改备注样式，还是需要格式</li>
              </ol>
            </el-collapse-item>
          </el-collapse>
        </el-card>
      </el-col>
<!--    捐赠支持  -->
<!--      <el-col :xs="24" :sm="24" :md="12" :lg="8">-->
<!--        <el-card class="update-log">-->
<!--          <div slot="header" class="clearfix">-->
<!--            <span>捐赠支持</span>-->
<!--          </div>-->
<!--          <div class="body">-->
<!--            <img-->
<!--              src="@/assets/images/pay.png"-->
<!--              alt="donate"-->
<!--              width="100%"-->
<!--            />-->
<!--            <span style="display: inline-block; height: 30px; line-height: 30px"-->
<!--              >你可以请作者喝杯咖啡表示鼓励</span-->
<!--            >-->
<!--          </div>-->
<!--        </el-card>-->
<!--      </el-col>-->
    </el-row>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "1.0.1"
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

