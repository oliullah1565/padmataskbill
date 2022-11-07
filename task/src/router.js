import { createRouter,createWebHistory } from "vue-router";
import AppHome from './pages/AppHome.vue'
import AppCustomer from './pages/AppCustomer.vue'
import AppCustomerAdd from './pages/AppCustomerAdd.vue'
import AppCustomerEdit from './pages/AppCustomerEdit.vue'
import AppBill from './pages/AppBill.vue'
import AppBillAdd from './pages/AppBillAdd.vue'
import AppLogin from './pages/AppLogin.vue'
import AppRegister from './pages/AppRegister.vue'


const routes = [
    { 
        path:"/", 
        component:AppHome,
        meta: {FrontendLogin: false}
    },
    { 
        path:"/customerlist", 
        component:AppCustomer,
        meta: {FrontendLogin: true} 
    },
    { 
        path:"/customer/add", 
        component:AppCustomerAdd,
        meta: {FrontendLogin: true}
 
    },
    { 
        path:"/customer/edit/:id", 
        component:AppCustomerEdit,
        meta: {FrontendLogin: true}
 
    },

    { 
        path:"/billlist", 
        component:AppBill,
        meta: {FrontendLogin: true} 
    },
    { 
        path:"/bill/add", 
        component:AppBillAdd,
        meta: {FrontendLogin: true}
 
    },
 
    { 
        path:"/login", 
        component:AppLogin,
        meta: {FrontendLogin: false} 
    },
    { 
        path:"/register", 
        component:AppRegister,
        meta: {FrontendLogin: false}
    },

    { 
        path:"/billdelete/:id", 
        component:AppBill,
        meta: {FrontendLogin: false}
    },
]

const router = createRouter({

    history: createWebHistory(),
    routes,
})

router.beforeEach((to, from, next) => {
    if(to.meta.FrontendLogin){
        if(!localStorage.getItem('UserId')){
            next({
                path:'/login',
            });
        }else{
            next();
        }
    }else{
        next();
    }
})


export default router;
