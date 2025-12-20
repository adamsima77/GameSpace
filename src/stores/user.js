import { defineStore } from 'pinia'
import axios from 'axios'

export const useUserStore = defineStore('user', {
  state: () => ({
      name:  null,
      surname: null,
      email: null,
      role: null,
      user_id: null
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

      cleanStore(){
          this.name = null;
          this.surname = null;
          this.email = null;
          this.role = null;
          this.user_id = null;
      },

      async checkIfAdmin(){
          try{
               const response = await axios.post("http://localhost/GameSpace/endpoints/fetch/check_if_admin.php",
                    {},  
                    { withCredentials: true }
               );
                const res = response.data;
                if(res.state === 'success'){
                      return true;
                } else{
                  return false;
                }
          } catch(error){
                 return false;
          }
      },

      async logout(){
          try{ 
             const response = await axios.post("http://localhost/GameSpace/endpoints/fetch/logout.php",
                 {},  
                 { withCredentials: true }
             );        
          } catch(error){

          } finally{
               this.cleanStore();   
          }
      }
  },
  persist: true
});