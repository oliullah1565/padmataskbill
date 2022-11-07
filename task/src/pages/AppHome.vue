<template>
     <div class="pdt-display section_padding">
        <div class="pdt-container pdt_lists">
            <div class="pdt_add">
                <h1>Welcome To Bill Management</h1>
            </div>
        </div>
    </div>
    <app-customer></app-customer>
     <app-bill></app-bill>
</template>

<script>
import AppCustomer from './AppCustomer.vue'
import AppBill from './AppBill.vue'


export default {
    components: { AppCustomer, AppBill},
}
</script>
