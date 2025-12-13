import { defineStore } from 'pinia'
import axios from 'axios'

export const useUserStore = defineStore('user', {
  state: () => ({
      name:  '',
      surname: '',
      email: '',
      role: '',
      user_id: ''
  }),

  getters: {
       getName: (state) => state.name,
       getSurname: (state) => state.surname,
       getEmail: (state) => state.email,
       getRole: (state) => state.role,
       getID: (state) => state.user_id
  },

  actions: {
      setName(value){
           this.name = value;
      },

      setSurname(value){
           this.surname = value;
      },

      setEmail(value){
           this.email = value;
      },

      setRole(value){
           this.role = value;
      },

      setID(value){
           this.user_id = value;
      },

      async checkIfAdmin(){
          try{
               const response = await this.$axios.post("http://localhost/GameSpace/endpoints/fetch/check_if_admin.php",
                {
                     id: this.user_id    
                });
                const res = response.data;
                if(res.state === 'success'){
                      return true;
                } else{
                  return false;
                }
          } catch(error){
                 return false;
          }
      }
  },
  persist: true
});