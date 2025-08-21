<?php
$target = '../storage/app/public';
$link = 'storage';

if (symlink($target, $link)) {
    echo "Symlink berhasil dibuat!";
} else {
    echo "Gagal membuat symlink.";
}
?>
