# 📱 Quiz App Frontend – Flutter Project

Aplikasi Flutter ini merupakan bagian dari pengembangan **aplikasi e-learning interaktif** berbasis kuis. Pengguna dapat mengikuti kursus, menjawab pertanyaan, melihat skor akhir, dan mengelola profil mereka dengan UI yang responsif dan mendukung berbagai platform (Android, iOS, Web, Desktop).

---

## 🧩 Fitur Utama

- 📚 Tampilan materi kursus berdasarkan kategori (accounting, english, marketing, dll.)
- ❓ Halaman kuis (soal pilihan ganda)
- ✅ Evaluasi skor kuis dan halaman hasil
- 🧑‍💻 Halaman profil pengguna
- 🔐 Fitur login, register, lupa password
- 🎨 Mode gelap (Dark Mode Support)
- 📅 Date picker untuk data profil
- 🧠 State management menggunakan Provider
- ⚙️ Modularisasi berdasarkan folder `page/`, `provider/`, dan `coursehall_2/`

---

## 📂 Struktur Folder Penting

```bash
lib/
 ┣ 📁 page/
 ┃ ┣ 📁 coursehall_2/          # Semua materi kursus (accounting, marketing, etc.)
 ┃ ┣ 📁 provider/              # Provider untuk dark mode, user, score, dll
 ┃ ┣ 📄 Mainmenu.dart          # Menu utama
 ┃ ┣ 📄 about_us.dart          # Tentang aplikasi
 ┃ ┣ 📄 loginpage.dart         # Halaman login
 ┃ ┣ 📄 register_page.dart     # Halaman registrasi
 ┃ ┣ 📄 quiz_page.dart         # Halaman kuis
 ┃ ┣ 📄 final_score_page.dart  # Halaman skor akhir
 ┃ ┗ 📄 profile_page.dart      # Halaman profil pengguna
 ┗ 📄 main.dart                # Entry point aplikasi
🚀 Cara Menjalankan Proyek
Pastikan kamu sudah menginstal Flutter SDK. Kemudian jalankan:

bash
Copy
Edit
flutter pub get
flutter run
