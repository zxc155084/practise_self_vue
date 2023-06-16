<template>
    <div class="sign-up-list-root">
        <el-descriptions :title="item.studentName" v-for="item in props.formList" border style="margin-bottom:20px">
            <el-descriptions-item label="報名區域">{{ item.activityRegion }}</el-descriptions-item>
            <el-descriptions-item label="生日">{{ timeUtils.to_YYYY_MM_DD(item.birthday) }}</el-descriptions-item>
            <el-descriptions-item label="需要午餐">{{ item.needLunch }}</el-descriptions-item>
            <el-descriptions-item label="需要晚餐">{{ item.needDinner }}</el-descriptions-item>
            <el-descriptions-item label="現在心情">{{ item.nowMood }}</el-descriptions-item>
            <el-descriptions-item label="如何知道本活動">{{ item.howToKnowActivity }}</el-descriptions-item>
            <el-descriptions-item label="備註">
                {{ item.memo }}
            </el-descriptions-item>
        </el-descriptions>
    </div>
</template>

<script setup lang="ts">
import timeUtils from '@/utils/timeUtils'

const props = defineProps(['formList'])

</script>

<style  scoped>
.sign-up-list-root {
    width: 100%;
    height: 100%;
}
</style>