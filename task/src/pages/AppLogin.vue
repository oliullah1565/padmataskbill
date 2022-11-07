<template>
    <div class="_form login">
        <div class="card">
            <div class="header">
                <h2>User Login {{get_data}}</h2>
            </div>
            <div class="body">
                <form action="" @submit.prevent="Login">
                    <div class="group">
                        <label>Email</label>
                        <input type="email" v-model="email" placeholder="Email">
                    </div>
                    <div class="group">
                        <label>Password</label>
                        <input type="password" v-model="password" placeholder="***">
                    </div>
                    <button type="submit" class="button">Login</button>
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
            const email = ref('');
            const password = ref('');
    
            const Login = async() => {
                const form  = new FormData();
                form.append('email', email.value);
                form.append('password', password.value);
    
                const result = await API.login(form);
                // get_data.value = result.data.user.id;
    
                localStorage.setItem("UserId",result.data.user.id);
                localStorage.setItem("UserName",result.data.user.name);
                localStorage.setItem("UserEmail",result.data.user.email);
                localStorage.setItem("UserType",result.data.user.usertype);
    
                // router.push('/');
                window.location.href='/';
            }
    
            return {
                get_data,
                email,
                password,
                Login
            }
        },
    }
    </script>