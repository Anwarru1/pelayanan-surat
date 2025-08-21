// Fungsi untuk menambah input syarat
function tambahSyarat() {
    const container = document.getElementById('syarat-container');
    const count = container.children.length + 1;
    
    const div = document.createElement('div');
    div.className = 'input-group mb-2';
    
    const input = document.createElement('input');
    input.type = 'text';
    input.className = 'form-control';
    input.name = 'syarat[]';
    input.required = true;
    
    const appendDiv = document.createElement('div');
    appendDiv.className = 'input-group-append';
    
    const button = document.createElement('button');
    button.className = 'btn btn-outline-danger hapus-syarat';
    button.type = 'button';
    button.innerHTML = '<i class="fe fe-trash-2"></i>';
    button.onclick = function() {
        if (container.children.length > 1) {
            container.removeChild(div);
        }
    };
    
    appendDiv.appendChild(button);
    div.appendChild(input);
    div.appendChild(appendDiv);
    container.appendChild(div);
}

// Inisialisasi saat dokumen siap
document.addEventListener('DOMContentLoaded', function() {
    // Tombol tambah syarat
    document.getElementById('tambah-syarat')?.addEventListener('click', tambahSyarat);
    
    // Tampilkan nama file template
    document.querySelectorAll('.custom-file-input').forEach(input => {
        input.addEventListener('change', function() {
            const label = this.nextElementSibling;
            const fileName = this.files[0]?.name || 'Pilih file';
            label.textContent = fileName;
        });
    });
});