<?php
require_once("veritabanibaglantisi.php");
?>
<!DOCTYPE html>
 <html>
<head>
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
   <body background="red">
   		<p><a href="login.php" class="geri">GERİ</a></p>
   	<div id="fotografkaydet">
        <div id="img">
            <img class="img" src="img/images2.jpg">
        </div>
        </div>
   	<form id="formekle">
   		<p><h2>KAYIT SAYFASI</h2></p>
   		<table border="0">
		<tr>
	    	<td><label for="tc">TC kimlik no:</label></td>
	      	<td><input type="text" name="tc" required="required" ></td>
	    </tr>
		<tr>
	    	<td><label for="adi">Adı:</label></td>
	      	<td><input type="text" class="harf" name="gorevli_ad" required="required" ></td>
	    </tr>
		<tr>
	    	<td><label for="soyadi">Soyadı:</label></td>
	      	<td><input type="text" class="harf" name="gorevli_soyad" required="required" ></td>
	    </tr>
	    <tr>
	    	<td><label for="kod">Yetki Kodu:</label></td>
	      	<td><input type="text" class="harf" name="gorevli_kod" required="required" ></td>
	    </tr>
	    <tr>
	    	<td><button class="button" name="scmkaydet">KAYDET</button></td>
	    </tr>
   		</table>

  
 <?php
if(isset($_REQUEST["scmkaydet"]))
{
	$tc=$_REQUEST["tc"];
	$ad=ucfirst($_REQUEST["gorevli_ad"]);
	$soyad=ucfirst($_REQUEST["gorevli_soyad"]);
	$kod=$_REQUEST["gorevli_kod"];
	     $ozettc=hash('sha256',$tc);
	      $ozetkod=hash('sha256',$kod);
	$ekle="INSERT INTO gorevli (tc,ad,soyad,kod)
						VALUES('$ozettc','$ad','$soyad','$ozetkod')";
		$sorgucalistir=$baglanti->query($ekle);
		if($sorgucalistir==true)
		{
		 echo "<h4>İşlem başarıyla gerçekleştirildi.</h4>";
		}
		else{
			echo "<h4>Kaydetme işlemi gerçekleştirilemedi.</h4>";
		}

}
 ?>
 </form>
  </body>
</html>
