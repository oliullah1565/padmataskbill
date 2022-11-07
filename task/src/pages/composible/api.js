import Axios from 'axios';
const RESOURCE_NAME = 'http://127.0.0.1:8000/api';

export default{
     
      login(data) {
        return Axios.post(`${RESOURCE_NAME}/login`, data);
      },

      register(data) {
        return Axios.post(`${RESOURCE_NAME}/register`, data);
      },

     customerall() {
        return Axios.get(`${RESOURCE_NAME}/customerlist`);
      },
      getCustomerInfo(id) {
        return Axios.get(`${RESOURCE_NAME}/customeredit/${id}`);
      },
      customer(data) {
        return Axios.post(`${RESOURCE_NAME}/customerstore`, data);
      },
      customerUpdate(data) {
        return Axios.post(`${RESOURCE_NAME}/customerupdate/`, data);
      },
      customerdelete(id) {
        return Axios.get(`${RESOURCE_NAME}/customerdelete/${id}`);
      },
      billall() {
        return Axios.get(`${RESOURCE_NAME}/billlist`);
      },
      bill(data) {
          return Axios.post(`${RESOURCE_NAME}/billstore`, data);
      },
      customerbill(id) {
        return Axios.get(`${RESOURCE_NAME}/customerbill/${id}`);
      },

      billdelete(id) {
        return Axios.get(`${RESOURCE_NAME}/billdelete/${id}`);
      },
      billupdate(id) {
        return Axios.get(`${RESOURCE_NAME}/billstatuschange/${id}`);
      },
      
}
