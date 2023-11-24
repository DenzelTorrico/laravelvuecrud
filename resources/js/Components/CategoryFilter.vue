<template>
    <div class="modal-overlay">
      <div class="modal-container">
        <div class="modal-content">
          <h2>Crear nueva categoría</h2>
          <form @submit.prevent="handleSubmit">
            <div class="form-group">
              <label for="nombre">Nombre:</label>
              <input type="text" id="nombre" v-model="nombre" required>
            </div>
            <div class="form-group">
              <button class="bg-green-700" type="submit">Guardar</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        nombre: '',
      };
    },
    methods: {
      handleSubmit() {
        // Aquí puedes agregar la lógica para guardar la categoría
        console.log('Categoría guardada:', this.nombre);
  
        // Reiniciar el formulario
        this.nombre = '';
  
        // Cerrar el modal
        this.$emit('close');
      },
    },
  };
  </script>
  
  <style>
  .modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .modal-container {
    background-color: white;
    padding: 20px;
    border-radius: 4px;
  }
  
  .modal-content {
    margin-bottom: 20px;
  }
  
  .form-group {
    margin-bottom: 10px;
  }
  
  label {
    display: block;
    font-weight: bold;
  }
  
  input[type="text"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  
  button {
    padding: 8px 16px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  </style>
  