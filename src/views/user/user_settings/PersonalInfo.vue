<template>
  <div class="profile_wrapper">
    <form class="profile-form" @submit.prevent = "save">
      <h1 style="text-align:center;">Osobné údaje</h1>

      <div class="inputs">
        <label for="name">Meno:
          <input type="text" @input = "touched.name = true" id="name" v-model="name" :class="{bad_input: !isName && touched.name, good_input: isName && touched.name}">
        </label>

        <label for="surname">Priezvisko:
          <input type="text" id="surname" v-model="surname" @input = "touched.surname = true" :class="{bad_input: !isSurnameValid && touched.surname, good_input: isSurnameValid && touched.surname}">
        </label>

         <label for="telephone">Telefónne číslo:
          <input type="text" id="telephone" v-model="telephone" @input = "touched.telephone_number = true" :class="{bad_input: !isTelephoneValid && touched.telephone_number, good_input: isTelephoneValid && touched.telephone_number}">
        </label>

        
        <label for="email">E-mail:
          <input type="email" id="email" v-model="email" @input = "touched.email = true" :class="{bad_input: !isEmailValid && touched.email, good_input: isEmailValid && touched.email}">
        </label>

        <h1>Adresa</h1>

        <label for="city">Mesto:
          <input type="text" id="city" v-model="city" @input = "touched.city = true" :class="{bad_input: !isCityValid && touched.city, good_input: isCityValid && touched.city}">
        </label>

        <label for="street">Ulica:
          <input type="text" id="street" v-model="street" @input = "touched.street = true" :class="{bad_input: !isStreetValid && touched.street, good_input: isStreetValid && touched.street}">
        </label>

        <label for="postal_code">Poštové číslo:
          <input type="text" id="postal_code" v-model="postal_code" @input = "touched.postal_code = true"  :class="{bad_input: !isPostalValid && touched.postal_code, good_input: isPostalValid && touched.postal_code}">
        </label>

        <input type="submit" value="Upraviť údaje" :disabled = "!isFormValid" :class = "{not_valid: !isFormValid}">
      </div>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: '',
      surname: '',
      email: '',
      city: '',
      street: '',
      postal_code: '',
      telephone: '',
      userStore: null,
      res: {},

      touched: {
        email: false,
        name: false,
        surname: false,
        city: false,
        street: false,
        postal_code: false,
        telephone_number: false,
      },
    };
  },

  methods: {
    async save() {
      try {
        const response = await this.$axios.post(
          "http://localhost/GameSpace/endpoints/update/save_user.php",
          {
            name: this.name,
            surname: this.surname,
            email: this.email,
            city: this.city,
            street: this.street,
            postal_code: this.postal_code,
            mobile_number: this.telephone,
          },
          { withCredentials: true }
        );

        if (response.data.message === 'success') {
          alert("Vaše údaje boli úspešne upravené!");
        } else {
          alert("Nastala chyba pri úprave vašich údajov!");
        }
      } catch (error) {
        alert("Nastala chyba pri úprave vašich údajov!");
      }
    },

    async fetchUserData() {
      try {
        const response = await this.$axios.post(
          "http://localhost/GameSpace/endpoints/fetch/fetch_user_data.php",
          {},
          { withCredentials: true }
        );

        this.res = response.data;
        this.name = this.res.name || '';
        this.surname = this.res.last_name || '';
        this.email = this.res.email || '';
        this.city = this.res.city || '';
        this.street = this.res.street || '';
        this.postal_code = this.res.postal_code || '';
        this.telephone = this.res.mobile_number || '';
      } catch (error) {

      }
    },

    checkTelephoneNumber(number) {
      if (!number) return false;

      let plusCount = 0;
      let digitCount = 0;

      for (let i = 0; i < number.length; i++) {
        const char = number[i];

        if (char === '+') {
          plusCount++;
          if (i !== 0) return false;
        } else if (char >= '0' && char <= '9') {
          digitCount++;
        } else if (char === ' ') {
          continue;
        } else {
          return false;
        }
      }

      if (plusCount > 1) return false;
      if (digitCount < 5 || digitCount > 15) return false;

      return true;
    },

    isFirstLetterUpper(str) {
      if (!str) return false;
      const firstChar = str.charAt(0);
      return firstChar === firstChar.toUpperCase();
    },

    checkPostalCode(postal_code) {
      if (!postal_code) return false;
      let digitCount = 0;
      let isDigit = true;

      for (let i = 0; i < postal_code.length; i++) {
        const char = postal_code[i];
        if (!(char >= '0' && char <= '9') && char !== ' ') {
          isDigit = false;
          break;
        }
        if (char >= '0' && char <= '9') digitCount++;
      }

      return isDigit && digitCount === 5;
    },

    checkEmail(email) {
      if (!email) return false;
      return email.includes('@');
    },
  },

  computed: {
    isFormValid() {
      return (
        (!this.touched.name || this.isName) &&
        (!this.touched.surname || this.isSurnameValid) &&
        (!this.touched.city || this.isCityValid) &&
        (!this.touched.street || this.isStreetValid) &&
        (!this.touched.postal_code || this.isPostalValid) &&
        (!this.touched.telephone_number || this.isTelephoneValid) &&
        (!this.touched.email || this.isEmailValid)
      );
    },

    isTelephoneValid() {
      return this.checkTelephoneNumber(this.telephone);
    },

    isEmailValid() {
      return this.checkEmail(this.email);
    },

    isName() {
      return this.name && this.isFirstLetterUpper(this.name);
    },

    isSurnameValid() {
      return this.surname && this.surname.length >= 2 && this.isFirstLetterUpper(this.surname);
    },

    isCityValid() {
      return this.city && this.city.length >= 2 && this.isFirstLetterUpper(this.city);
    },

    isStreetValid() {
      return this.street && this.street.length >= 2 && this.isFirstLetterUpper(this.street);
    },

    isPostalValid() {
      return this.checkPostalCode(this.postal_code);
    },
  },

  mounted() {
    this.fetchUserData();
  },
};
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

      &.bad_input{
          border: 3px solid red;
      }

      &.good_input{
           border: 3px solid rgb(0, 255, 81);
      }

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

    &.not_valid{
      cursor: not-allowed;
      background-color: grey;

      &:hover{
         background-color: grey;
      }
    }

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