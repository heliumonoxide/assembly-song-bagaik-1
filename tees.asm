;MID-TERM PROJECT
;Bagaikan Langit - Potret
;Melly Goeslaw

;Kelompok 23 : Natasya Dewi Nuraini Sasongko (2006531680)
;              Bryan Indarto Giovanni Firjatulloh (2006531996)

.model small ;deklarasi model yang dipakai
.stack 0E000h
.data

;inisialisasi nada lagu menggunakan nilai frekuensi
  sii dw 2415       
  la  dw 2711       
  sol dw 3043       
  fa  dw 3416       
  mi  dw 3619       
  re  dw 4063       
  do  dw 4560       
  
  do_high dw 2280
  re_high dw 2031
  mi_high dw 1809
  fa_high dw 1715
  sol_high dw 1521
  la_high dw 1355
  sii_high dw 1207
    
  clock equ es:6Ch  ; clock pada es 
  tone dw ?         ; deklarasi variabel tone yang kosong
    
.code
  
  delay proc                  ; untuk memberikan delay pada lagu
    push ax               
    mov ax,40h               
    mov es,ax                 
    mov ax,[clock]
    
    Ketukawal:      ; Menghitung per berapa ketukan 
      cmp ax, [clock]
      mov cx, 3           
      je Ketukawal
    
    Loopdelay:
      mov ax, [clock]
      ketuk:
        cmp ax,[clock]
        je ketuk
        loop Loopdelay
        pop ax
      ret
  delay endp   

  ; untuk membunyikan suara oleh sound card  
  sounder proc
    push ax
    in al, 61h
    or al, 00000011b          ; mengakses soundcard
    out 61h, al 	            ; mengirim control word untuk ganti frekuensi
    mov al, 0B6h
    out 43h, al
    mov ax, [tone]            ; tone merupakan acuan untuk mengambil nada dari acuan
    out 42h, al               ; mengirim lower byte
    mov al, ah
    out 42h, al               ; mengirim upper  byte
    pop ax
    ret
  sounder endp

  ;agar suaranya mati
  matisuara proc             
      in al,61h
      and al, 11111100b       ; menutup soundcard (invers dari akses soundcard)
      out 61h, al
      ret
  matisuara endp 

  pencet macro p1
      push bx
      mov bx,[p1]             ; memasukkan parameter berupa not yang ditekan ke bx
      mov [tone],bx           ; memasukkan bx ke tone agar bisa dibunyikan
      pop bx
      call sounder            ; memanggil sounder agar hasil insertion ke bx dapat dibunyikan
  endm 

  ; Penyusunan masing-masing bagian reff, intro, dan newReff

  reff macro

    pencet do_high
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet mi_high
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    
    pencet fa_high
    call delay
    call matisuara

    pencet mi_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sii
    call delay
    call delay
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara
    
    pencet do_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sol
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay

    pencet mi
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call delay
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara
    
    pencet re_high
    call delay
    call matisuara

    pencet mi_high
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara
    
    pencet fa_high
    call delay
    call matisuara

    pencet mi_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sii
    call delay
    call delay
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara
    
    pencet do_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sol
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay

    pencet mi
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay

  endm

  intro macro

    pencet la
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara
    
    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet sii
    call delay
    call delay
    call matisuara
    call delay

    pencet sii
    call delay
    call matisuara
    call delay

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sol
    call delay
    call delay
    call matisuara
    call delay

    pencet sol
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet mi
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara
    
    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet sii
    call delay
    call delay
    call matisuara
    call delay

    pencet sii
    call delay
    call matisuara
    call delay

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sol
    call delay
    call delay
    call matisuara
    call delay
  
    pencet sol
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet mi
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay
    call delay
    call delay

  endm

  reffbaru macro

    pencet do_high
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet mi_high
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call delay
    call matisuara
    call delay

    pencet la
    call delay
    call matisuara
    
    pencet fa_high
    call delay
    call matisuara

    pencet mi_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sii
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sol
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet mi
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet do_high
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet do_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet mi_high
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call delay
    call matisuara

    pencet la
    call delay
    call matisuara

    pencet la
    call delay
    call matisuara
    
    pencet fa_high
    call delay
    call matisuara

    pencet mi_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sii
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara
    
    pencet do_high
    call delay
    call matisuara

    pencet re_high
    call delay
    call matisuara

    pencet sol
    call delay
    call delay
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet mi
    call delay
    call matisuara

    pencet sol
    call delay
    call matisuara

    pencet sii
    call delay
    call matisuara
    
     pencet do_high
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara

    pencet la
    call delay
    call delay
    call delay
    call delay
    call delay
    call delay
    call matisuara
    call delay
    call delay

  endm


;start lagu
.startup 

  ; First part
  intro
  call delay
  call delay
  call delay
  intro

  ; second part
  reff
  
  ; third part
  call delay
  call delay
  call delay
  intro

  ; fourth part
  reff

  ; fifth part
  reffbaru
  
.exit

end