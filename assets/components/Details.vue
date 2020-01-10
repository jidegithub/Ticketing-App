<template>
   <div class="columns">
      <div class="column col-12">
        <div class="flex-around">
          <span class="flex">
            <span class="algolia-autocomplete" style="position: relative; display: inline-block; direction: ltr;"><input class="docs-search form-input ds-input" v-model="findTicket" type="text" placeholder="Search" autocomplete="off" spellcheck="false" role="combobox" aria-autocomplete="list" aria-expanded="false" aria-label="search input" aria-owns="algolia-autocomplete-listbox-0" dir="auto" style="position: relative; vertical-align: top;"><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: normal; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre><span class="ds-dropdown-menu" role="listbox" id="algolia-autocomplete-listbox-0" style="position: absolute; top: 100%; z-index: 100; display: none; left: 0px; right: auto;"><div class="ds-dataset-1"></div></span></span>
          
            <div class="mL-10">
              <select class="form-select ">
                <option>All Types</option>
                <option>Slack</option>
                <option>Skype</option>
                <option>Hipchat</option>
              </select>
            </div>
          </span>
          
          <button class="btn white-text navy-col" @click="showForm()">Create New Ticket</button>

          <span class="flex flexAlignCenter">
            <p class="pR-10">viewing <span>1-20</span> of <span>36</span></p>
            <button class="btn btn-action btn-lg"><i class="icon icon-arrow-left"></i></button>
            <button class="btn btn-action btn-lg"><i class="icon icon-arrow-right"></i></button>
          </span>
        </div>
        <table class="mt-2 table table-striped table-hover">
          <thead>
            <tr>
              <th>Ref. No.</th>
              <th>Subject</th>
              <th>Name</th>
              <th>Assignee</th>
              <th>Status</th>
              <th>Created</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="ticket in filteredTickets" v-bind:key="ticket.id" >
              <td>{{ticket.refNo}}</td>
              <td>{{ticket.subject}}</td>
              <td>{{ticket.name}}</td>
              <td>{{ticket.assignee}}</td>
              <td>{{ticket.status}}</td>
              <td>{{ticket.created}}</td>
            </tr>
          </tbody>
        </table>    
      
      </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
  name: "Details",
  data(){
    return{
      tickets: [],
      findTicket: "",
      toggleForm: true,
      toggleTable: false
    }
  },
  methods:{
      loadTicket(){
      axios.get("api/tickets")
      .then((response =>{
        this.tickets = response.data.data
      }))
    },
    showForm(){
      console.log(true)
      this.$emit()
    }
  },
  mounted() {
    this.loadTicket()
  },
  updated(){
    console.log(this.tickets)
  },
  computed:{
    filteredTickets(){
      let filter = new RegExp(this.findTicket, 'i')
      return this.tickets.filter(el => el.name.match(filter))
    }
  }

}
</script>

<style>

</style>