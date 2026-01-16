<template>
  <div class="table-wrapper">
    <table>
      <thead>
        <tr>
          <th v-for="(col, index) in columns" :key="index">{{ col.label }}</th>
          <td>Akcia:</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(row, rowIndex) in records" :key="rowIndex">
          <td v-for="(col, colIndex) in columns" :key="colIndex">
       <div v-if="Array.isArray(row[col.key])">
           <p v-for="(value, i) in row[col.key]" :key="i">{{ value }}</p>
       </div>
      <img v-else-if="col.key === 'img'" :src="row[col.key]" :alt="row.alt" loading="lazy">
      <p v-else>{{ row[col.key] }}</p>
</td>
          <td><button @click = "$emit('update', row.id)">Editovať</button> <button @click = "$emit('delete',row.id)">Vymazať</button></td>
        </tr>
      </tbody>
    </table>
    <div class = "pagination">
        <p @click = "$emit('page', index)" :class = "{active: index === actual_page}"
        v-for = "index in pageNumber" :key = "index">{{ index }}</p>
    </div>
  </div>
</template>



<script>
export default{
    props: {
        columns: { type: Array, required: true }, 
        records: { type: Array, required: true },
        total_pages: {type: Number, required: true},
        limit: {type: Number, required: true},
        actual_page: {type: Number, required: true}
    },


  computed: {
  pageNumber() {
    const total = Math.ceil(this.total_pages / this.limit) - 1; 
    
    const visible = 5;
    let pages = [];

    if (this.actual_page < visible) {
      for (let i = 1; i <= Math.min(visible, total); i++) {
        pages.push(i);
        
      }
    } else if (this.actual_page + Math.floor(visible / 2) < total) {
     
      const start = this.actual_page - Math.floor(visible / 2);
      for (let i = start; i < start + visible; i++) {
        pages.push(i);
        
      }
    } else {
      for (let i = total - visible + 1; i <= total; i++) {
        if (i > 0) pages.push(i); 
        
      }
    }

    return pages;
  }
}
}
</script>


<style scoped lang = "scss">

  .table-wrapper::-webkit-scrollbar {
  height: 8px;
}

.table-wrapper::-webkit-scrollbar-track {
  background: transparent;
}

.table-wrapper::-webkit-scrollbar-thumb {
  background-color: rgba(0, 123, 255, 0.5);
  border-radius: 10px;
  transition: background-color 0.3s;
}

.table-wrapper::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 123, 255, 0.8);
}
    .table-wrapper {
  display: flex;
  justify-content: center;
  flex-direction: column;
  width: 100%;
  overflow-x: auto;

  .pagination{
         display: flex;
         flex-direction: row;
         gap: 15px;
         justify-content: center;
         align-items: center;
         margin-top: 55px;
         margin-bottom: 50px;
      p{
        background-color: white;
        box-shadow: $box_sh_boxes;
        padding: 10px;
        border-radius: 50%;
        width: 25px;
        height: 25px;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease-in-out;

        &.active{
          background-color: $blue;
          color: white;
          &:hover{
            background-color: rgb(170, 170, 170);
            color: $dark_blue;
          }
        }

        &:hover{
           background-color: $dark_blue;
           color: white;
        }
      }
  }
 
}

table {
  width: 100%;
 
  border-collapse: collapse;
  margin: 0 auto;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  background-color: white;

  thead {
    background-color: #007bff; 
    color: white;
  }

  th, td {
    padding: 12px 20px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    max-width: 250px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;

  img{
    display: block;
    width: 150px;
    height: 150px;
    border-radius: 15px;
    object-fit: cover;
  }

  button:nth-child(1){
      background-color: rgb(146, 230, 20);
      border-radius: 15px;
      padding: 15px;
      color: white;
      box-shadow: $box_sh_boxes;
      transition: background-color 0.5s ease-in-out;
      &:hover{
        background-color: green;
      }
  }

   button:nth-child(2){
      background-color: red;
      border-radius: 15px;
      padding: 15px;
      color: white;
      box-shadow: $box_sh_boxes;
      transition: background-color 0.5s ease-in-out;

      &:hover{
        background-color: rgb(129, 5, 5);
      }
  }
  }

  tbody tr:hover {
    background-color: #f5f5f5;
  }

  th:last-child, td:last-child {
    text-align: center; 
  }
}
</style>