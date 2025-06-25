import './bootstrap';
import './jenis-surat';
import { initJenisSuratForm } from './jenis-surat';

window.initJenisSuratForm = initJenisSuratForm;

try {
    window.$ = window.jQuery = require('jquery');
    console.log('jQuery loaded successfully'); // Untuk verifikasi
} catch (e) {
    console.error('jQuery failed to load', e);
}