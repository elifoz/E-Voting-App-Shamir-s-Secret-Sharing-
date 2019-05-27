<!DOCTYPE html>
<html>
<head>
</head>

<?php
if(!isset($_SESSION)) {
       session_start();
}     
if(!isset($_SESSION['secmen_id']))
    {
        header("location:login.php");
    }

    ?>
<body>

	<p><b>BİLGİLENDİRME</b></p>
	<p>ELEKTRONİK SEÇİM SİSTEMİNE HOŞGELDİNİZ!</p>
	<p>LÜTFEN SİSTEME GİRİŞ YAPTIKTAN SONRA SİZE AİT  OLAN GİZLİ DEĞERİ VE DİĞER GÖREVLİLERE AİT GİZLİ DEĞERLERİ<b>"SONUÇLAR"</b> KISMINDAN GİRİŞ YAPARAK SONUÇLARI ELDE EDİNİZ!</p>
	

</body>
</html>


