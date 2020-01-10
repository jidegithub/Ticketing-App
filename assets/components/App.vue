<template>
  <div class="container">
    <section v-if="tableStatus">
      <div class="columns col-gapless">
        <div class="navy-col column aside-width col-1">
          <aside class="">
            <div class="icon-container">
              <span><img class="width-42" src="/images/folder.svg" alt=""></span>
              <span><img class="width-42" src="/images/dot.svg" alt=""></span>
              <span> <img class="width-42" src="/images/folder.svg" alt=""></span>
              <span><img class="width-42" src="/images/folder.svg" alt=""></span>
            </div>
          </aside>
        </div>
        
        <div class="the-otherside-width column col-11">
          <div class=" mTP white-col pt-2 info-tab flex-around">
            <h3 class="mL">Tickets</h3><span class="posExtreme">{{tickets.length}} total</span>
            <select name="" id="" class="mR">
              <option value="1">Viewing Most Recent</option>
              <option value="2">2</option>
              <option value="3">3</option>
            </select>
          </div>

          <div class="table-container white-col">
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
                  
                  <button class="btn white-text navy-col" @click="toggleForm">Create New Ticket</button>

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
                      <td><a @click="viewDetails(ticket.id)" >{{ticket.refNo}}</a></td>
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
          </div>
        </div>
      </div>
      <div v-bind:class="[activeClass, modalStatus]" id="modal-id">
        <a href="#close" class="modal-overlay" aria-label="Close"></a>
        <div class="modal-container">
          <div class="modal-header">
            <a href="#close" @click="toggleModal" class="btn btn-clear float-right" aria-label="Close"></a>
            <div class="modal-title h5">Ticket Details</div>
          </div>
          <div class="modal-body">
            <div class="content">
              <span>{{details.refNo}}</span>
              <p>{{details.name}}</p>
              <p>{{details.assignee}}</p>
              <p>{{details.subject}}</p>
              <p>{{details.status}}</p>
              <p>{{details.created}}</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <div>
      <Form v-if="formStatus" ref="form"></Form>
    </div>  
  </div>
</template>

<script>
import axios from 'axios';
import Form from "./Form.vue"
export default {
  name: "Details",
  components:{
    Form
  },
  data(){
    return{
      tickets: [],
      findTicket: "",
      tableStatus: true,
      formStatus: false,
      activeClass: "modal",
      modalStatus: "",
      details: []
    }
  },
  methods:{
    toggleModal(){
      this.modalStatus = ""
    },
    loadTicket(){
    axios.get("api/tickets")
    .then((response => {
      this.tickets = response.data.data
      }))
    },
    toggleForm: function(){
      this.formStatus = true,
      this.tableStatus = false
    },
    viewDetails(id){
      axios.get(`/api/tickets/` + id)
      .then((response) => {
        this.details = response.data.data
      })
      this.modalStatus = "active"
    }
  },
  mounted() {
    this.loadTicket()
  },
  // updated(){
  //   console.log(this.tickets.length)
  // },
  computed:{
    filteredTickets(){
      let filter = new RegExp(this.findTicket, 'i')
      return this.tickets.filter(el => el.name.match(filter))
    }
  }
}
</script>

<style scoped>
  .aside-width{
    width: 4.333333%;
    height: 100vh!important;
  }
  .the-otherside-width{
    width: 95.666667%;
  }
  .aside-width aside{
    width: 100%;
    height: 100%;
  }
  .navy-col{
    background-color: #021f35;
  }
  .table-container{
    margin: 20px 35px;
    padding: 20px;
  }
  .icon-container{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .width-42{
    width: 32px;
  }
  span img.width-42{
    margin-top: 45px;
  }
  .mL{
  margin-left: 32px;
  }
  .mR{
    margin-right: 32px;
  } 
  .imgspan{
    width: 100%;
    display: flex;
    justify-content: center;
  }
</style>