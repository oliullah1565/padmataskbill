
<template>
    <div class="_form _two product_add">
        <div class="card">
            <div class="header">
                <h2>Customer Add</h2>
            </div>
            <div class="body">
                <form action="" @submit.prevent="CustomerEdit">
                    <div class="group">
                        <label>Name</label>
                        <input type="text" v-model="name" placeholder="Name">
                    </div>
                    <div class="group">
                        <label>Email</label>
                        <input type="email" v-model="email" placeholder="Email">
                    </div>
                    <div class="group">
                        <label>Address</label>
                        <input type="text" v-model="address" placeholder="Dhaka">
                    </div>
                    
                    <button type="submit" class="button">Update</button>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
import router from '@/router';
import { ref, onMounted } from 'vue';
import API from './composible/api.js';
import {useRoute} from 'vue-router';
export default {
    setup(){
        const get_data = ref('');
        const name = ref('');
        const email = ref('');
        const address = ref('');
        const password = ref('');

        const route = useRoute();
        const customer_info = ref('');

        onMounted(async()=>{
            const datas = await API.getCustomerInfo(route.params.id);
            customer_info.value = datas.data;
            name.value =   customer_info.value.name;
            email.value =   customer_info.value.email;
            address.value =   customer_info.value.address;
        
            console.log(datas)
            
        })


        const CustomerEdit = async() => {
            const form  = new FormData();
            form.append("id", route.params.id);
            form.append('name', name.value);
            form.append('email', email.value);
            form.append('address', address.value);
            form.append('password', password.value);

            const result = await API.customerUpdate(form);
             get_data.value = result.data;
             router.push('/customerlist')
           
        }

        return {
            get_data,
            name,
            email,
            address,
            password,
            CustomerEdit
        }
    },
}


</script>