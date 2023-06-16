<template>
    <div class="sign-up-root">
        <el-form :model="form" label-width="180px" :rules="rules">
            <el-form-item label="活動名稱">
                很厲害的提升營 2023
            </el-form-item>
            <el-form-item label="姓名" prop="studentName">
                <el-input v-model="form.studentName" :maxlength="20" />
            </el-form-item>
            <el-form-item label="活動區域" prop="activityRegion">
                <el-select v-model="form.activityRegion" placeholder="請輸入您想報名的區域">
                    <el-option label="台北場" value="Taipei" />
                    <el-option label="桃園場" value="Taoyuan" />
                    <el-option label="新竹場" value="Hsinchu" />
                    <el-option label="台中場" value="Taichung" />
                    <el-option label="台南場" value="Tainan" />
                </el-select>
            </el-form-item>
            <el-form-item label="生日" prop="birthday">
                <el-date-picker v-model="form.birthday" type="date" placeholder="選擇您的生日" />
            </el-form-item>
            <el-form-item label="我要吃午餐(50塊)">
                <el-switch v-model="form.needLunch" />
            </el-form-item>
            <el-form-item label="我要吃晚餐(100塊)">
                <el-switch v-model="form.needDinner" />
            </el-form-item>
            <el-form-item label="現在的心情">
                <el-checkbox-group v-model="form.nowMood">
                    <div style="text-align: left;"> <el-checkbox label="興奮～" />
                        <el-checkbox label="無感..." />
                        <el-checkbox label="有點緊張" />
                        <el-checkbox label="開心^^" />
                        <el-checkbox label="累累Orz" />
                        <el-checkbox label="需要關懷QQ" />
                        <el-checkbox label="窩不知道" />
                    </div>

                </el-checkbox-group>
            </el-form-item>
            <el-form-item label="我怎麼知道這個活動？">
                <el-radio-group v-model="form.howToKnowActivity">
                    <el-radio label="看到海報" />
                    <el-radio label="親友推薦" />
                    <el-radio label="FB粉專" />
                    <el-radio label="Line群" />
                    <el-radio label="恰巧得知" />
                    <el-radio label="窩不知道" />
                </el-radio-group>
            </el-form-item>
            <el-form-item label="其他想說的～">
                <el-input v-model="form.memo" type="textarea" :maxlength="500"/>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit">提交報名</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'

const emit = defineEmits(['onSubmit'])

const form = reactive({
    studentName: '',
    activityRegion: '',
    birthday: '',
    needLunch: false,
    needDinner: false,
    nowMood: [],
    howToKnowActivity: '',
    memo: '',
})



const rules = reactive({
    studentName: [
        { required: true, message: '' },
    ],
    activityRegion: [
        {
            required: true,
            message: ''
        },
    ],
    birthday: [
        {
            required: true,
            message: ''
        },
    ]
})


function onSubmit() {
    rules.studentName[0].message = '';
    rules.activityRegion[0].message = '';
    rules.birthday[0].message = '';
    var isPassed = true;
    if (!form.studentName) {
        rules.studentName[0].message = '請輸入姓名';
        isPassed = false;
    }
    if (!form.activityRegion) {
        rules.activityRegion[0].message = '請輸入報名區域';
        isPassed = false;
    }
    if (!form.birthday) {
        rules.birthday[0].message = '請輸入生日';
        isPassed = false;
    }
    if (!isPassed) {
        return;
    }
    emit('onSubmit', form)
}


</script>

<style  scoped>
.sign-up-root {
    width: 100%;
    height: 100%;
}
</style>