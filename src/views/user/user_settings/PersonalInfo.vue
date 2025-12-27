<template>
  <div class="profile_wrapper">
    <form class="profile-form" @submit.prevent = "save">
      <h1 style="text-align:center;">Osobné údaje</h1>

      <div class="inputs">
        <label for="name">Meno:
          <input type="text" id="name" v-model="name">
        </label>

        <label for="surname">Priezvisko:
          <input type="text" id="surname" v-model="surname">
        </label>

        <label for="email">E-mail:
          <input type="email" id="email" v-model="email">
        </label>

        <h1>Adresa</h1>

        <label for="city">Mesto:
          <input type="text" id="city" v-model="city">
        </label>

        <label for="street">Ulica:
          <input type="text" id="street" v-model="street">
        </label>

        <label for="postal_code">Poštové číslo:
          <input type="text" id="postal_code" v-model="postal_code">
        </label>

        <input type="submit" value="Upraviť údaje">
      </div>
    </form>
  </div>
</template>

<script>
    export default{
        data(){
            return{
                name: '',
                surname: '',
                email: '',
                city: '',
                street: '',
                postal_code: '',
                userStore: null,
                res: {}
            }
        },

        methods:{
            async save(){
                const response = await this.$axios.post("http://localhost/GameSpace/endpoints/update/save_user.php",
                {
                    name: this.name,
                    surname: this.surname,
                    email: this.email,
                    city: this.city,
                    street: this.street,
                    postal_code: this.postal_code
                },
                {withCredentials: true});
            },

            async fetchUserData(){
                const response = await this.$axios.post("http://localhost/GameSpace/endpoints/fetch/fetch_user_data.php",
                {},
                {withCredentials: true})
                this.res = response.data;
                console.log(this.res);
                this.name = this.res.name;
                this.surname = this.res.last_name;
                this.email = this.res.email;
                this.city = this.res.city;
                this.street = this.res.street;
                this.postal_code = this.res.postal_code;
            }
        },

        mounted(){
            this.fetchUserData();
        }
    }
</script>
<style scoped lang="scss">
.profile_wrapper {
  display: flex;
  justify-content: center;
  padding: 5px;
  width: 80%;
  margin: 0 auto;
}

.profile-form {
  width: 80%;
  background-color: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
  border: 2px solid #ccc;
}

.inputs {
  display: flex;
  flex-direction: column;
  gap: 15px;

  label {
    display: flex;
    flex-direction: column;
    gap: 5px;

    input {
      padding: 10px 14px;
      border-radius: 8px;
      border: 1.5px solid #b5d1ff;
      background-color: #ffffff;
      color: #1a1a1a;
      transition: border-color 0.2s ease, background-color 0.2s ease;

      &:hover {
        border-color: #2979ff;
        box-shadow: 0 0 6px rgba(0, 0, 0, 0.08);
      }

      &:focus {
        outline: none;
        border-color: #2979ff;
        background-color: #e6f0ff;
      }
    }
  }

  input[type="submit"] {
    background-color: #2979ff;
    color: white;
    border-radius: 10px;
    padding: 12px;
    margin-top: 20px;
    transition: background-color 0.3s ease;
    width: 100%;
    cursor: pointer;
    border: 1px solid white;

    &:hover {
      background-color: blue;
    }
  }
}

@media only screen and (max-width: 850px) {
  .profile_wrapper{
    width: 100%;
  .profile-form {
    width: 100%;
  }
  }
}
</style>