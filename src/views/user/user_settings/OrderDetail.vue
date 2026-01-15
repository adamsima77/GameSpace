<template>
  <div class="order_detail">
    <section class="personal_info">
      <h1>Osobné údaje</h1>
      <p><strong>Meno:</strong> {{ detail.name }}</p>
      <p><strong>Priezvisko:</strong> {{ detail.last_name }}</p>
      <p><strong>E-mail:</strong> {{ detail.email }}</p>
      <p><strong>Mobilné číslo:</strong> {{ detail.mobile_number }}</p>
    </section>

    <section class="address">
      <h1>Fakturačná adresa</h1>
      <p><strong>Mesto:</strong> {{ detail.city }}</p>
      <p><strong>Ulica:</strong> {{ detail.street }}</p>
      <p><strong>Poštové číslo:</strong> {{ detail.postal_code }}</p>
    </section>

    <section class="shipping_payment">
      <h1>Doprava a platba</h1>
      <p><strong>Transport:</strong> {{ detail.transport_name }}</p>
      <p><strong>Platba:</strong> {{ detail.payment_name }}</p>
    </section>

    <section class="items">
      <h1>Položky</h1>
      <ul>
        <li v-for="item in items" :key="item.slug" class="item">
          <img :src="item.image" :alt="item.alt" />
          <div class="item_info">
            <p class="item_name">{{ item.name }}</p>
            <p class="item_quantity">Množstvo: {{ item.quantity }}</p>
            <p>Platforma: {{ item.platform }}</p>
            <p class="item_price">Cena: {{ item.price * item.quantity }}€</p>
          </div>
        </li>
      </ul>
      <p class = "total">Celková cena: {{ detail.total_price }}€</p>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      detail: {},
      items: [],
    }
  },
  methods: {
    async fetchOrderDetail() {
      try {
        const id = this.$route.params.id;
        const response = await this.$axios.get(
          "http://localhost/GameSpace/endpoints/fetch/fetch_order_detail.php",
          { params: { id }, withCredentials: true }
        );
        this.detail = response.data.order;
        this.items = response.data.items;
      } catch (error) {
        console.error(error);
      }
    },
  },
  mounted() {
    this.fetchOrderDetail();
    document.title = this.$route.params.id;
  }
}
</script>

<style scoped lang="scss">
.order_detail {
  width: 80%;
  margin: 40px auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  font-family: 'Arial', sans-serif;
  color: #333;

  section {
    margin-bottom: 30px;

    h1 {
      font-size: 1.5rem;
      margin-bottom: 12px;
      color: #2979ff;
      border-bottom: 2px solid #2979ff;
      display: inline-block;
      padding-bottom: 4px;
    }

    p {
      margin: 6px 0;
      line-height: 1.5;

      strong {
        color: #555;
      }
    }
  }

  .items ul {
    list-style: none;
    padding: 0;
    margin: 0;

    .item {
      display: flex;
      align-items: center;
      padding: 12px;
      margin-bottom: 12px;
      border-radius: 10px;
      border: 1px solid #e0e0e0;
      background-color: #f9f9f9;
      transition: box-shadow 0.2s ease;

      &:hover {
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      }

      img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 8px;
        margin-right: 16px;
      }

      .item_info {
        display: flex;
        flex-direction: column;

        .item_name {
          font-weight: bold;
          font-size: 1.1rem;
          margin-bottom: 4px;
        }

        .item_quantity,
        .item_price {
          font-size: 0.95rem;
          color: #555;
        }
      }
    }
  }

  .total{
    color: $blue;
    font-weight: 700;
  }

  @media (max-width: 600px) {
    padding: 15px;

    .items ul .item {
      flex-direction: column;
      align-items: flex-start;

      img {
        margin-bottom: 8px;
      }
    }
  }
}
</style>
