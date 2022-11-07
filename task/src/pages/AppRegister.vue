<template>
    <div class="_form _two register">
        <div class="card">
            <div class="header">
                <h2>User Register {{get_data}}</h2>
            </div>
            <div class="body">
                <form action="" @submit.prevent="Register">
                    <div class="group">
                        <label>Name</label>
                        <input type="text" v-model="name" placeholder="joe">
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
                    <button type="submit" class="button">Register</button>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
// import router from '@/router';
import { ref } from 'vue';
import API from './composible/api.js'

export default {
    setup(){
        const get_data = ref('');
        const name = ref('');
        const email = ref('');
        const address = ref('');
        const password = ref('');


        const Register = async() => {
            const form  = new FormData();
            form.append('name', name.value);
            form.append('email', email.value);
            form.append('address', address.value);
            form.append('password', password.value);

            const result = await API.register(form);
            // get_data.value = result.data;
            if(result){
                localStorage.setItem("UserId",result.data.user.id);
                localStorage.setItem("UserName",result.data.user.name);
                localStorage.setItem("UserEmail",result.data.user.email);
                localStorage.setItem("UserAddress",result.data.user.address);

                // router.push('/');
                window.location.href='/login';
            }
        }

        return {
            get_data,
            name,
            email,
            address,
            password,
            Register
        }
    },
}
</script>