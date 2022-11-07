
<template>
    <div class="_form _two product_add">
        <div class="card">
            <div class="header">
                <h2>Bill Add</h2>
            </div>
            <div class="body">
                <form action="" @submit.prevent="BillAdd">
                    <div class="group">
                        <label>Name</label>
                        <select v-model="cusid">
                            <option disabled value="">Please select one</option>
                            <option  v-for="(data,index) in get_data" :key="index"  :value="data.id">{{data.name}}</option>
                        </select>

                    </div>
                    <div class="group">
                        <label>Bill Month</label>
                        <select v-model="bill_month" >
                            <option disabled value="">Please select one</option>
                            <option selected value='Janaury'>Janaury</option>
                            <option value='February'>February</option>
                            <option value='March'>March</option>
                            <option value='April'>April</option>
                            <option value='May'>May</option>
                            <option value='June'>June</option>
                            <option value='July'>July</option>
                            <option value='August'>August</option>
                            <option value='September'>September</option>
                            <option value='October'>October</option>
                            <option value='November'>November</option>
                            <option value='December'>December</option>
                        </select>
                    </div>
                    <div class="group">
                        <label>Year</label>
                        <input type="text" v-model="year" placeholder="2022">
                    </div>
                    <div class="group">
                        <label>Amount</label>
                        <input type="text" v-model="amount" placeholder="***">
                    </div>
                    <div class="group">
                        <label>Status</label>
                        <select v-model="status" >
                            <option disabled value="">Please select one</option>
                            <option selected value='Paid'>Paid</option>
                            <option value='Due'>Due</option>
                           
                        </select>
                    </div>
                    <button type="submit" class="button">Add</button>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
import router from '@/router';
import {onMounted, ref } from 'vue';
import API from './composible/api.js'
export default {
    setup(){
        const get_data = ref('');
        const cusid = ref('');
        const bill_month = ref('');
        const year = ref('');
        const amount = ref('');
        const status = ref('');

        onMounted(async() => {
            const result = await API.customerall();
            get_data.value = result.data;
                
        })


        const BillAdd = async() => {
            const form  = new FormData();
            form.append('cusid', cusid.value);
            form.append('bill_month', bill_month.value);
            form.append('year', year.value);
            form.append('amount', amount.value);
            form.append('status', status.value);

            const result = await API.bill(form);
             get_data.value = result.data;
             router.push('/billlist')
           
        }

        return {
            get_data,
            cusid,
            bill_month,
            year,
            amount,
            status,
            BillAdd
        }
    },
}


</script>