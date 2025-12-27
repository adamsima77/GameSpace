<template>
    <div class = "order_history">
        <table v-if = "orders.length > 0">
            <tr>
                <th>#ID Objednávky</th>
                <th>Dátum vytvorenia objednávky</th>
                <th>Status</th>
                <th>Cena</th>
                <th>Detail</th>
            </tr>
            <tr v-for = "(order,index) in orders" :key = "order.id_Orders">
                 <td>{{ order.id_Orders }}</td>
                 <td>{{ order.creation_date }}</td>
                 <td>{{ order.status }}</td>
                 <td>{{ order.total_price }}€</td>
                 <td class = "detail"><RouterLink :to = "{name: 'order-detail', params:{id: order.id_Orders}}">Detail</RouterLink></td>
            </tr>
            
        </table>
        <p v-else>Vaša história nákupov je prázdna</p>
    </div>
</template>

<script>
export default{
    data(){
        return{
            orders: []
        }
    },
    
    methods: { 
        async fetchOrders(){
            try{
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_orders.php",
                {withCredentials: true});
                this.orders = response.data;
                console.log("Orders from backend:", response.data);
            } catch(error){
                   if (error.response?.status === 401) {
                     console.log("Používateľ nie je prihlásený");
                   }
            }
        }
    },

    mounted(){
        this.fetchOrders();
    }
}
</script>


<style scoped lang = "scss">
.order_history {
    display: flex;
    justify-content: center;
    

    p{
        text-align: center;
    }

    table {
        width: 100%;
        max-width: 1000px;
        border-collapse: collapse;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        border-radius: 10px;
        overflow: hidden;

        tr {
            display: table-row; 

           
              .detail{
                  color: $blue;            
                  text-decoration: underline;   
             }
            
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: $blue;
            color: white;
            font-weight: 600;
            border-bottom: 2px solid #ddd;
            border-right: 1px solid white;
        }

        td {
            border-bottom: 1px solid #eee;
            border-right: 1px solid black;
            font-size: 1rem;
        }

        td:last-child {
            border-right: none;
        }

        tr:hover td {
            background-color: #f9f9f9;
        }

        td:last-child {
            text-align: center; 
        }

    }
}

@media only screen and (max-width: 810px) {
  .order_history {
    width: 100%;

    table {
      width: 100%;
      max-width: 100%;
    }

    tr {
      display: block;
      width: 100%;

       th,
    td {
      display: block;
      width: 100%;
      box-sizing: border-box;
      border-right: none;
    }

    th {
      border-right: none;
    }

    td {
      border-right: none;
    }
    }

   
  }
}

</style>