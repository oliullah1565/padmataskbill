<template>
    <div class="pdt-display section_padding">
        <div class="pdt-container pdt_lists">
            <div class="pdt_add"  v-if="UserId && UserType == 'user'">
                <router-link to="/customer/add" class="link">Customer Add</router-link>
            </div>
            <div class="items"  v-if="UserId && UserType == 'user'">
                <table id="customers">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(data,index) in get_data" :key="index">
                                    <td>{{ index+1 }}</td>
                                    <td>{{ data.name }}</td>
                                    <td>{{ data.email }}</td>
                                    <td>{{ data.address }}</td>
                                    <td>
                                        <div class="pdt_add">
                                            <router-link :to="'/customer/edit/'+data.id" class="link1">Edit</router-link>
                                        </div>
                                       
                                        <button class="button1" @click="deleteCustomer(data.id)">Delete</button>
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
            const result = await API.customerall();
            get_data.value = result.data;
                
        })
        const deleteCustomer = async (customerId) => {
                await API.customerdelete(customerId);

            const result = await API.customerall();
            console.log(result.data);
            get_data.value = result.data;
        }
      


        return {
            UserId,
            get_data,
            UserType,
            deleteCustomer

        }
    }
}
</script>
