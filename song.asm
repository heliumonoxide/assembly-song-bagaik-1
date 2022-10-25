.model small 
.stack 0E000h           
.data

  sii dw 2415       ;nada si oktaf 1  (7)
  la  dw 2711       ;nada la oktaf 1  (6)
  sol dw 3043       ;nada sol oktaf 1 (5)
  fa  dw 3416       ;nada fa oktaf 1 (4)
  mi  dw 3619       ;nada mi oktaf 1 (3)
  re  dw 4061       ;2
  do  dw 4560       ;1 
  
  F_low dw 6833
  Fsh_low dw 6449
  Gsh_low dw 5746
  Ash_low dw 5119

  C dw 4560
  Csh dw 4304
  D dw 4063
  Dsh dw 3834
  E dw 3619
  F dw 3416
  Fsh dw 3224
  G dw 3043
  Gsh dw 2873
    
  clock equ es:6Ch  ; clock pada es 
  tone dw ?         ; deklarasi variabel tone yang kosong
    
.code
  
  delay proc                  ; untuk memberikan delay pada lagu
    push ax               
    mov ax,40h               
    mov es,ax                 
    mov ax,[clock]
    
    Ketukawal:
      cmp ax, [clock]
      mov cx, 1               
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

  part_1 macro
    pencet Fsh_low
    call delay
    call delay
    call matisuara

    pencet C
    call delay
    call matisuara

    pencet Csh
    call delay
    call matisuara

    pencet Gsh
    call delay
    call matisuara
    call delay

    pencet Csh
    call delay
    call delay
    call matisuara

    pencet Gsh_low
    call delay
    call matisuara
    call delay

    pencet C
    call delay
    call matisuara

    pencet Csh
    call delay
    call matisuara
    call delay
    
    pencet Gsh_low
    call delay
    call matisuara
    call delay
  endm

.startup 

  ; First part

  part_1

  ; Second part

  pencet Ash_low
  call delay
  call delay
  call matisuara

  pencet C
  call delay
  call matisuara

  pencet Csh
  call delay
  call matisuara

  pencet Gsh
  call delay
  call matisuara
  call delay

  pencet Csh
  call delay
  call matisuara

  pencet F_low
  call delay
  call delay
  call matisuara

  pencet C
  call delay
  call matisuara

  pencet Csh
  call delay
  call matisuara
  call delay
  
  pencet Gsh_low
  call delay
  call matisuara

  pencet Ash_low
  call delay
  call matisuara

  ; Third part

  part_1

  ; Fourth part 

  pencet Ash_low
  call delay
  call delay
  call matisuara

  pencet C
  call delay
  call matisuara

  pencet Csh
  call delay
  call matisuara

  pencet Gsh
  call delay
  call matisuara
  call delay

  pencet Csh
  call delay
  call matisuara

  pencet F_low
  call delay
  call delay
  call matisuara

  pencet C
  call delay
  call matisuara

  pencet Csh
  call delay
  call matisuara

  pencet C
  call delay
  call matisuara
  
  pencet Gsh_low
  call delay
  call matisuara

  pencet Ash_low
  call delay
  call matisuara
  
.exit

end   