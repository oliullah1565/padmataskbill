
<template>
    <div class="_form _two product_add">
        <div class="card">
            <div class="header">
                <h2>Customer Add {{get_data}}</h2>
            </div>
            <div class="body">
                <form action="" @submit.prevent="CustomerAdd">
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
                    <div class="group">
                        <label>Password</label>
                        <input type="password" v-model="password" placeholder="***">
                    </div>
                    <button type="submit" class="button">Add</button>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
import router from '@/router';
import { ref } from 'vue';
import API from './composible/api.js'
export default {
    setup(){
        const get_data = ref('');
        const name = ref('');
        const email = ref('');
        const address = ref('');
        const password = ref('');


        const CustomerAdd = async() => {
            const form  = new FormData();
            form.append('name', name.value);
            form.append('email', email.value);
            form.append('address', address.value);
            form.append('password', password.value);

            const result = await API.customer(form);
             get_data.value = result.data;
             router.push('/customerlist')
           
        }

        return {
            get_data,
            name,
            email,
            address,
            password,
            CustomerAdd
        }
    },
}

// export default {
//     setup(){
//         const get_data = ref('');
//         const name = ref('');
//         const price = ref('');
//         const category = ref('');
//         const file_path = ref('');

//         const ImgChange = (event) => {
//             file_path.value = event.target.files[0];
//         }

//         const ProductAdd = async() => {
//             const form  = new FormData();
//             form.append('name', name.value);
//             form.append('price', price.value);
//             form.append('category', category.value);
//             form.append('file', file_path.value);

//             const result = await API.product(form);
//             get_data.value = result.data;

//             router.push('/products')
            
//         }

//         return {
//             get_data,
//             name,
//             price,
//             category,
//             file_path,
//             ImgChange,
//             ProductAdd
//         }
//     },
// }
</script>