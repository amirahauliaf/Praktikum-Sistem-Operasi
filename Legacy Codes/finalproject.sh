i=0;
declare -a tiket
declare -a kendaraan
declare -a jenis
declare -a bobot
declare -a tujuan

manipulasi(){
    ls -l
    echo -e "\nProgram ini namanya finalproject.sh\n"
    echo "Ketikkan nama program yang ingin kamu ubah: "
    read ubah

    echo "--penjelasan--"
    echo "*hak akses untuk owner, group, dan other"
    echo "*r = 4 (read-Mengizinkan membaca berkas)"
    echo "*w = 2 (write-Mengizinkan mengedit berkas)"
    echo "*x = 1 (executable-Mengizinkan mengeksekusi berkas binary)"
    echo "masukkan angkanya: "
    read angka
    
    echo -e "\nOke anda memilih $ubah"
    sudo chmod $angka $ubah
    echo -e "\nManipulasi berkas sudah selesai "
    ls -l
    read
    clear
    menu
     
}

cari(){
    if (( i == 0 ))
    then
        clear
        echo "Data Penumpang Tidak Ada"
        read
        clear
    else
        clear
        echo "Masukkan nomor tiket penumpang yang ingin dicari : "
        read cari

        c=0
        while (($cari != ${tiket[$c]}))
        do
            c=`expr $c + 1`
        done

        if (( $cari == ${tiket[$c]} ))
        then
            echo "Nomor Tiket Penumpang:${tiket[$c]}"
            echo "Nomor Kendaraan Penumpang: ${kendaraan[$c]}"
            echo "Jenis Kendaraan Penumpang: ${jenis[$c]}"
            echo "Bobot Kendaraan Penumpang: ${bobot[$c]}"
            echo "Tujuan Pelabuhan Penumpang: ${tujuan[$c]}"
        else
            clear
            echo -e "Data tidak ditemukan"
        fi
        read
        clear
    fi
    menu
}

ubah(){

    if (( i == 0 ))
  	then
   		clear
   		echo "Tidak Ada Data Penumpang"
   		read
   		clear
  	else  
   		clear
		echo -e "Data Penumpang yang telah dimasukkan : \n"			
        for (( q=0; q<i;q++ ))
        do
            echo -e "Data ke $[q+1]\n"
            echo "Nomor Tiket Penumpang: ${tiket[$q]}"
            echo "Nomor Kendaraan Penumpang: ${kendaraan[$q]}"
            echo "Jenis Kendaraan Penumpang: ${jenis[$q]}"
            echo "Bobot Kendaraan Penumpang: ${bobot[$q]}"
            echo "Tujuan Pelabuhan Penumpang: ${tujuan[$q]}"
        done
      		echo -e -n "\nMasukkan nomor Tiket Penumpang yang ingin diubah : "
      		read perbarui
   
      		p=0
      		while (( $perbarui != ${tiket[$p]} ))
      		do
    			p=`expr $p + 1`
      		done
      
   		    if (( $perbarui == ${tiket[$p]} ))
   		    then
			    echo -n "masukkan nomor tiket: "
                read tiket[$p]
                echo -n "masukkan nomor kendaraan: "
                read kendaraan[$p]
                echo "---Jenis Kendaraan---"
                echo "1. Truk"
                echo "2. Bus"
                echo "3. Mini Bus "
                echo "4. Mobil"
                echo "5. Motor"
                echo -n "pilih jenis kendaraan:"
                read jenis[$p]
                echo -n "masukkan bobot kendaraan (dalam ton): "
                read bobot[$p]
                echo "---Tujuan Pelabuhan---"
                echo "1. Ketapang"
                echo "2. Padang "
                echo "3. Bali"
                echo "4. Lembar"
                echo "5. Tanjung Perak"
                echo -n "pilih tujuan: "
                read tujuan[$p]

 	 		    clear
   		    else
    			clear    
    			echo -e "Data tidak ditemukan"
			    read
   		    fi
      		clear
  	fi
    menu
}

lihat() {
    if (( i == 0 ))
    then
        clear
        echo "Data Penumpang Tidak Ada"
        read
        clear
    else
        clear
        echo -e "Data Penumpang yang telah dimasukkan : \n"			
        for (( q=0; q<i;q++ ))
        do
            echo -e "Data ke $[q+1]\n"
            echo "Nomor Tiket Penumpang:${tiket[$q]}"
            echo "Nomor Kendaraan Penumpang: ${kendaraan[$q]}"
            echo "Jenis Kendaraan Penumpang: ${jenis[$q]}"
            echo "Bobot Kendaraan Penumpang: ${bobot[$q]}"
            echo "Tujuan Pelabuhan Penumpang: ${tujuan[$q]}"
        done        
    fi
    
} 


input(){
    clear
    echo -n "masukkan nomor tiket: "
    read tiket[$i]
    echo -n "masukkan nomor kendaraan: "
    read kendaraan[$i]
    echo "---Jenis Kendaraan---"
    echo "1. Truk"
    echo "2. Bus"
    echo "3. Mini Bus "
    echo "4. Mobil"
    echo "5. Motor"
    echo "6. Lainnya..."
    echo -n "pilih jenis kendaraan:"
    read jenis[$i]
    if (( jenis[$i] >= 7 ))
    then
        echo "Salah menginputkan Pilihan!!! ULANGI LAGI !"
        input
    else
        echo ""
    fi        
    
    echo -n "masukkan bobot kendaraan (dalam ton): "
    read bobot[$i]
    echo "---Tujuan Pelabuhan---"
    echo "1. Ketapang"
    echo "2. Padang "
    echo "3. Bali"
    echo "4. Lembar"
    echo "5. Tanjung Perak"
    echo -n "pilih tujuan: "
    read tujuan[$i]
    if (( tujuan[$i] >= 6 ))
    then
        echo "Salah menginputkan Pilihan!!! ULANGI LAGI !"
        input
    else
        echo ""
    fi   
    i=`expr $i + 1`

    if (("$i" >= 2))
	then
	    for (( g=0; g<i-1; g++ ))
	    do
	        if (( "${tiket[$i-1]}" == "${tiket[g]}" ))
	    	then
     		    echo -e "\nNomor Tiket ini sudah terdaftar!\nMasukan nomor yang lain!"
	    		read
	    		unset tiket[$i-1]
	    		unset kendaraan[$i-1]
	    		unset jenis[$i-1]
	    		unset bobot[$i-1]
	    		unset tujuan[$i-1]
	    		i=`expr $i - 1`
	    		break
	       	fi
	    done
    fi
    clear
    menu  
}

menu() {
    echo -e "======= APLIKASI PELABUHAN ========\n"
    echo "1. Masukkan Data Penumpang yang akan masuk ke kapal"
    echo "2. Lihat Data Penumpang"
    echo "3. Ubah Data Penumpang"
    echo "4. Cari Data Penumpang"
    echo "5. ingin memanipulasi hak akses program ini ??"
    echo "6. keluar dari program"
    echo "masukkan pilihan : "
    read pilih
    
    if [ $pilih == 1 ]
    then
        input
        read
    elif [ $pilih == 2 ]
    then
        lihat
        read
        clear
        menu
    elif [ $pilih == 3 ]
    then
        ubah
        read
    elif [ $pilih == 4 ]
    then
        cari
        read
    elif [ $pilih == 5 ]
    then
        manipulasi
        read
    elif [ $pilih == 6 ]
    then
        clear
        echo "Terima Kasih Telah Menggunakan program "
        exit
    else
        clear
        echo "Anda Salah Menginputkan ulangi lagi !!!"
        menu
    fi    
}

datadiri() {
    echo -e "===================================="
    echo -e "     PROGRAM AKHIR SISTEM OPERASI"
    echo -e "   AMIRAH AULIA FITRI [18081010029]"
    echo -e "====================================\n"
    echo -n "Apakah Anda ingin melanjutakan program[y/n]: "
    read lanjut
    if [ $lanjut == y ]
    then 
        clear
        menu
    elif [ $lanjut == n ]
    then 
        clear
        echo "Terima Kasih Telah Menggunakan program "
        exit
    else
        clear
        echo "Anda Salah Menginputkan ulangi lagi !!!"
        datadiri
    fi
}
clear
datadiri
clear
