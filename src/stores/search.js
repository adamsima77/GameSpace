import { defineStore } from 'pinia'
import axios from 'axios'

export const useSearchStore = defineStore('search', {
  state: () => ({
    search_value: '',
    searchResult: [],
    filter: null
  }),

  getters: {
    getSearch: (state) => state.search_value,
    getResult: (state) => state.searchResult
  },

  actions: {
    setSearch(value) {
      this.search_value = value;
    },
    
    setFilter(filter){
      this.filter = filter;
    },

    async fetchSearch() { 
      try {
        const response = await axios.get("http://localhost/GameSpace/endpoints/fetch/search_items.php",
          {
            params: { value: this.search_value, filter: this.filter

            },
            withCredentials: false
          } 
        );

        this.searchResult = response.data;

      } catch (error) {
        console.error("Fetch search failed:", error);
      }
    }
  },
  persist: true
});