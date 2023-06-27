<template>
  <div class="sign-up-root">
    <el-table
      :data="tableData"
      empty-text="暫無數據"
      style="width: 100%; margin-bottom: 20px"
    >
      <el-table-column prop="c" label="股票代號" width="100" />
      <el-table-column prop="n" label="簡稱" width="120" />
      <el-table-column prop="nf" label="公司全名" width="180" />
      <el-table-column prop="z" label="成交價" width="120">
        <template #default="scope">
          <span v-if="scope.row.z > scope.row.y" style="color: red">
            {{ currency(scope.row.z) }}
          </span>
          <span v-if="scope.row.z < scope.row.y" style="color: green">
            {{ currency(scope.row.z) }}
          </span>
          <span v-if="scope.row.z == scope.row.y" style="color: black">
            {{ currency(scope.row.z) }}
          </span>
        </template>
      </el-table-column>
      <el-table-column prop="tv" label="成交量" width="120" />
      <el-table-column prop="v" label="累積成交量" width="150" />
      <el-table-column prop="o" label="開盤價" width="120">
        <template #default="scope">
          <span> {{ currency(scope.row.o) }} </span>
        </template>
      </el-table-column>
      <el-table-column prop="h" label="最高價" width="120">
        <template #default="scope">
          <span> {{ currency(scope.row.h) }} </span>
        </template>
      </el-table-column>
      <el-table-column prop="l" label="最低價" width="120">
        <template #default="scope">
          <span> {{ currency(scope.row.l) }} </span>
        </template>
      </el-table-column>
      <el-table-column prop="y" label="昨收價" width="120">
        <template #default="scope">
          <span> {{ currency(scope.row.y) }} </span>
        </template>
      </el-table-column>
      <el-table-column prop="tlong" label="資料更新時間">
        <template #default="scope">
          <span> {{ scope.row.tlong }} </span>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted } from "vue";
import axios from "axios";

const tableData = ref([]);

function getQuotes() {
  const url = `https://script.google.com/macros/s/AKfycbyTcr3FO86Ljiyxx1TNsgLuIFq2csxj7v9AJ1HGP19iV1VXVVwOx0hCy8RoQO1Bxu4o/exec`;
  axios.get(`${url}`).then(
    (response) => {
      const msg = response.data;
      //   console.log(JSON.stringify(msg));
      //   console.log(msg.msgArray);
      tableData.value = msg.msgArray;
    },
    (error) => {}
  );
}

const currency = function (inputNumber: any) {
  return new Intl.NumberFormat("zh-Hant", {
    style: "currency",
    currency: "TWD",
    minimumFractionDigits: 2,
  }).format(inputNumber);
};

const convertTime = function (timeStamp: number) {
  var dateFormat = new Date(timeStamp);
  console.log(
    "Date: " +
      dateFormat.getDate() +
      "/" +
      (dateFormat.getMonth() + 1) +
      "/" +
      dateFormat.getFullYear() +
      " " +
      dateFormat.getHours() +
      ":" +
      dateFormat.getMinutes() +
      ":" +
      dateFormat.getSeconds()
  );
  return `${
    dateFormat.getDate() +
    "/" +
    (dateFormat.getMonth() + 1) +
    "/" +
    dateFormat.getFullYear() +
    " " +
    dateFormat.getHours() +
    ":" +
    dateFormat.getMinutes() +
    ":" +
    dateFormat.getSeconds()
  }`;
};

onMounted(() => {
  // 取得初始資料
  getQuotes();
});
</script>

<style scoped>
.sign-up-root {
  width: 100%;
  height: 100%;
}
</style>
