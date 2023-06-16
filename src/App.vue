
<template>
  <div class="app-root">
    <el-container>
      <el-header>
        <el-tabs v-model="tabName" @tab-click="handleClick">
          <el-tab-pane label="報名列表" name="報名列表"></el-tab-pane>
          <el-tab-pane label="新增報名" name="新增報名"></el-tab-pane>
          <el-tab-pane label="VueTest" name="VueTest"></el-tab-pane>
        </el-tabs>
      </el-header>
      <el-container>
        <el-main>
          <SignUp v-if="tabName == '新增報名'" class="form-region" @onSubmit="onSubmit" />
          <SignUpList v-if="tabName == '報名列表'" :formList="signUpList" :test="1" />
          <VueTest v-if="tabName == 'VueTest'"  />
      
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>


<script setup lang="ts">
import { ref } from 'vue'
import SignUp from '@/components/SignUp.vue'
import SignUpList from '@/components/SignUpList.vue'
import VueTest from '@/components/VueTest.vue'
import type { TabsPaneContext } from 'element-plus'

const tabName = ref('新增報名')

/// 已報名的列表
const signUpList = ref<any>([])

const handleClick = (tab: TabsPaneContext, event: Event) => {
  /// 如果想偵測tab點擊事件可以加在這邊
  console.log(tab, event)
}

function onSubmit(form: any) {

  console.log('receive event!!!')
  console.log(form)
  console.log('receive event!!!!!!')



  /// 接收到報名的表單，這邊不審核直接加入已報名列表
  signUpList.value.push(form);
  tabName.value = '報名列表'
}

</script>

<style scoped>
.app-root {
  text-align: center;
}

.form-region {
  margin-top: 40px;
  display: inline-block;
  width: 500px;
}
</style>
