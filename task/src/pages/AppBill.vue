<template>
    <div class="pdt-display section_padding">
        <div class="pdt-container pdt_lists">
            <div class="pdt_add"  v-if="UserId && UserType == 'user'">
                <router-link to="/bill/add" class="link">Bill Add</router-link>
            </div>
            <div class="items" v-if="UserId">
                        <table id="customers">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Month</th>
                                <th>Year</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th v-if="UserId && UserType == 'user'">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(data,index) in get_data" :key="index">
                                    <td>{{ index+1 }}</td>
                                    <td>{{ data?.customer?.name }}</td>
                                    <td>{{ data.bill_month }}</td>
                                    <td>{{ data.year }}</td>
                                    <td>{{ data.amount }}</td>
                                    <td>{{ data.status }}</td>
                                    <td v-if="UserId && UserType == 'user'">
                                        <button v-if="data.status=='Due'" class="button" @click="updateBill(data.id)">Paid</button>
                                        <button class="button1" @click="deleteBill(data.id)">Delete</button>
                                    </td>
                                  
                                </tr>
                            </tbody>
                        </table>
                
            </div>
        </div>
    </div>
</template>

<script>
import { onMounted, ref } from 'vue';
import API from './composible/api.js'

export default {
    setup(){
        const UserId = localStorage.getItem("UserId");
        const UserType = localStorage.getItem("UserType");
        const get_data = ref([]);

        onMounted(async() => {
            if(UserType=='user'){
                const result = await API.billall();
                console.log(result.data);
                get_data.value = result.data;
            }else{
                const result = await API.customerbill(UserId);
                console.log(result.data);
                get_data.value = result.data;
            }
           
           
                
        })


       const deleteBill = async (productId) => {
                await API.billdelete(productId);

            const result = await API.billall();
            console.log(result.data);
            get_data.value = result.data;
        }
        const updateBill = async (productId) => {
                await API.billupdate(productId);

            const result = await API.billall();
            console.log(result.data);
            get_data.value = result.data;
        }

        return {
            UserId,
            get_data,
            UserType,
            deleteBill,
            updateBill

        }
    },





   
}
</script>
