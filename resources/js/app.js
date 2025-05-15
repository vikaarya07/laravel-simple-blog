import "./bootstrap";

import Alpine from "alpinejs";
window.Alpine = Alpine;
Alpine.start();

import Swal from "sweetalert2";

document.addEventListener("DOMContentLoaded", function () {
    const session = window.sessionData || {};

    if (session.loginSuccess) {
        const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener("mouseenter", Swal.stopTimer);
                toast.addEventListener("mouseleave", Swal.resumeTimer);
            },
        });
        Toast.fire({
            icon: "success",
            title: session.loginSuccess,
        });
    }

    if (session.errors) {
        Swal.fire({
            icon: "error",
            title: "Terjadi Kesalahan!",
        });
    }

    if (session.success) {
        Swal.fire({
            position: "top-end",
            icon: "success",
            title: session.success,
            showConfirmButton: false,
            timer: 1500,
        });
    }

    if (session.error) {
        Swal.fire({
            icon: "error",
            title: session.error,
        });
    }

    document.querySelectorAll(".btn-delete").forEach((button) => {
        button.addEventListener("click", function (e) {
            e.preventDefault();

            Swal.fire({
                title: "Yakin ingin hapus?",
                text: "Data yang dihapus tidak bisa dikembalikan!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Ya, hapus!",
                cancelButtonText: "Batal",
            }).then((result) => {
                if (result.isConfirmed) {
                    button.closest("form").submit();
                }
            });
        });
    });
});
