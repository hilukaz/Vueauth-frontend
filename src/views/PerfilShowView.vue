<template>
    <div>
        <h1>Usuarios públicos</h1>
        <PerfilUser  v-for="perfil in perfis" :key="perfil.id" :name="perfil.name" :email="perfil.email" :company="perfil.company"/>
        <!-- {{ perfis[0] }} -->
    </div>
    
</template>

<script>
    const token = localStorage.getItem('token');
    import axios from '../components/axiosConfig.ts'//arquivo de configuração do axios
    import PerfilUser from '../components/Perfil.vue'
    export default{
        name:'perfilall',
        components:{
            PerfilUser,
        },
        data(){
            return{
                name: '',
                email: '',
                company: '',
                perfis: []
            }
        },
        mounted () {
            axios
            .get('http://localhost:3000/perfilpublic'
            )
            .then(response => {
                // this.perfil=response.data,//response.data[0] ele pega apenas o primeiro objeto

                this.perfis = response.data.map(perfil => ({//para cada item do array, faça //iterar
                id: perfil.id,
                name: perfil.name,
                email: perfil.email,
                company: perfil.company
                }));
            })
            //retorna o objeto inteiro
            .catch((error) => {
                console.log(error);
            });
            // console.log('aa')
            console.log(this.perfil)
        }
    }
</script>