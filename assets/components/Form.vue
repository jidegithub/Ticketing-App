<template>
<div class="centerer">
  <form v-on:submit.prevent>
    <div class="columns">
      <div class="form-group column col-6">
        <label class="form-label" for="input-name">Name</label>
        <input class="btn-borderless form-input" v-model="name" type="text" name="name" id="input-name" />
      </div>

      <div class=" column col-6 form-group">
        <label class="form-label" for="input-email">Email Address</label>
        <input class="btn-borderless form-input" v-model="email_address" type="email_address" name="email_address" id="input-email" />
      </div>
    </div>
  
  <div class="form-group">
    <label class="form-label" for="input-name">Subject</label>
    <input class="btn-borderless form-input" v-model="subject" type="text" name="subject" id="input-subject" />
  </div>

  <div class="form-group">
    <label class="form-label" for="input-email">Department</label>
    <select class="btn-borderless w-316 form-select" name="department" v-model="department">
      <option>Customer Support</option>
      <option>Facebook</option>
      <option>Twitter</option>
      <option>Pinterest</option>
    </select>
  </div>

    <div class="form-group">
      <label class="form-label" for="input-example-20">Message</label>
      <textarea class="btn-borderless form-input" id="input-example-20" name="message" v-model="message" placeholder="type something" rows="7"></textarea>
    </div>

 
  <div class="form-group flex-end mTop-35">
    <button class="btn-borderless navy-text btn w-113_4">Cancel</button>
    <button class="btn-borderless btn w-113_4 white-text navy-col" @click="processForm" type="submit">Submit</button>
  </div>
</form>
</div>

</template>

<script>
import axios from 'axios';

export default {
name:  "Form",

data(){
  return{
      name: "",
      subject: "",
      department: "",
      email_address: "",
      message: "",
      assignee: "",
      status: "",
      identifier:""
    }
  },
  methods:{
      uuidv4() {
      return 'ABC-xxxx-ABC-yxxx-xxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        const id = v.toString(16);
        id = this.identifier
        return id
      });
    },
    processForm(){
      // axios.put( url, data, { headers: {'Content-Type': 'application/json', 'x-csrf-token': csrf}})

      var url = '/api/tickets'
      let csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content")

      var ticky = {      
        ticket: {
          name: this.name,
          subject: this.subject,
          department: this.department,
          email_address: this.email_address,
          message: this.message,
          assignee: "quadri",
          status: "done",
          refNo: this.identifier
        }
      }
    console.log(ticky, csrf)
      axios.post( url, ticky, { headers: {'Content-Type': 'application/json', '_csrf_token': csrf }})
      .then((response) =>{
        // console.log(response.data)
      })

      // axios.get("api/tickets")
      // .then((res)=>{
      //   console.log(res)
      // })
      // .catch(err=>{
      //   console.log(err)
      // })
    }
  },
  mounted() {
    this.uuidv4()
    console.log('yaay!')
  } 
}
</script>

<style scoped>
.centerer{
width: 716px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.centerer form{
  padding: 26px 26px;
}
.w-316{
  width: 316px;
}
.w-113_4{
  width: 113.4px;
}
.btn-borderless{
  border: none;
}
.btn{
  border-radius: 0;
}
.mTop-35{
  margin-top: 35px;
}    
</style>