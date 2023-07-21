<template>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Perfil de Usuário</title>
    </head>
    <body>
        <div class="profile">
      <!-- <button @click="create()"></button>  -->
          
      <button class="btn" @click="public" v-show="owner">Publicar</button>
      <img src="https://via.placeholder.com/150" alt="Foto de perfil">
        
        <h1>{{name}}</h1>


        <ul>
            <li><strong>Email:</strong> {{email}}</li>
            <li v-show=false><strong>Empresa:</strong> {{ company }}</li>
        </ul>
        </div>
    </body>
    </html>

</template>

<script>
    // const token = localStorage.getItem('token');
    import axios from './axiosConfig.ts'//arquivo de configuração do axios
    export default{
      name:'Perfil',
        data(){
            return{

                // perfil:this.perfil
            }
        },
        props:{
          id: {
              type: Number,
              required: true
            },
            name: String,
            email: String,
            company:String,
            owner:Boolean,
        },
        methods:{
          create(){
              axios.put('http://localhost:3000/login',{//verifica login
              email: this.email,
              password: this.password,
            })
          },
          public(){
            axios.put('http://localhost:3000/publicar/${this.id}', { public: true })
            .then(response => {
              console.log(response.data);
            })
            .catch(error => {
              console.error(error);
            });
          }
        }
    }
    
</script>

<style scoped>
    body {
  background-color: #ffffff;
  font-family: Arial, sans-serif;
}

.profile {
  margin: 0 auto;
  width: 50%;
  text-align: center;
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 20px #dcdcdc;
  position: relative;
  margin-bottom: 100px;
}

.profile img {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  object-fit: cover;
  object-position: center;
  margin-bottom: 20px;
}

.profile h1 {
  margin: 0;
  font-size: 36px;
  color: #333;
}

.profile p {
  margin-top: 0;
  font-size: 18px;
  color: #666;
}

.profile ul {
  list-style: none;
  padding: 0;
  margin-top: 20px;
}

.profile li {
  margin-bottom: 10px;
  font-size: 18px;
  color: #666;
}

.profile li strong {
  font-weight: bold;
  margin-right: 10px;
  color: #333;
}

.btn {
      position: absolute;
      top: 10px;
      right: 10px;
      padding: 10px 20px;
      background-color: #333;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
</style>