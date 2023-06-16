<template>
    <div class="vue-test-root">
        <div class="display" v-for="n in 8">
            {{ displayValue }}
        </div>
        
        <div>
            <input type="text" v-model="textVariable">
        </div>
        <button class="button" @click="changeDisplayValue('Hello')">按這邊上面變成“Hello”</button>
        <button class="button" @click="changeDisplayValue('World')">按這邊上面變成“World”</button>
        <button class="button" @click="changeVariable()">變回初始值</button>
    </div>
</template>

<script setup lang="ts">
import { reactive, ref, computed, onMounted, watch } from 'vue'

const displayValue = ref('World')

const textVariable = ref('初始值')

function changeDisplayValue(newValue: string) {
    displayValue.value = newValue;
}

function changeVariable() {
    textVariable.value = '初始值';
}

watch(textVariable, (v) => {
    console.log('textVariable: ' + v)
})

</script>

<style  scoped>
.vue-test-root {
    width: 100%;
    height: 100%;
}

.display {
    margin: 10px 0;
    padding: 10px 0;
    font-size: 18px;
    font-weight: bold;
    color: rgb(59, 59, 247);
    background-color: rgb(202, 202, 202);
}

.button {
    width: 250px;
    height: 40px;
    margin: 20px;
    text-align: center;
    font-size: 20px;
}

input {
    font-size: 20px;
}
</style>