let i = 1 ;
function addForm() {
  const input_data = document.createElement('input');
  input_data.type = 'text';
  input_data.id = 'cook_' + i;
  const parent = document.getElementById('cook_form');
  parent.appendChild(input_data);
  i++ ;
}

onclick="addForm()"