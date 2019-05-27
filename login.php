<?php
date_default_timezone_set('Europe/Istanbul');
if(!isset($_SESSION)) {
       session_start();
}
?>
<!DOCTYPE html>
<html>
<head>
	  <link rel="stylesheet" href="css/login.css">
</head>
<body>  
    <div id="fotograflogin">
        <div id="img">
            <img class="img" src="img/images2.jpg">
        </div>
        </div>
	<form action="login.php" method="post" id="formlogin">
<p><h2>E-SEÇİME HOŞGELDİNİZ!</h2></p>
<p>
	<input  type="password" name="kod" placeholder="Mevcut Kodu Giriniz" required="required">
</p>
<p><h4><button name="girisbtn" class="button">GİRİŞ YAP</button></h4></p>
<!--<p><a href="ekle.php" class="button">EKLE</a></p>-->
<!--<p><a href="gorevli_ekle.php" class="button"> GÖREVLİ EKLE</a></p>-->
  
</form>
<?php require_once("veritabanibaglantisi.php");?>
	<?php
if(isset($_POST["girisbtn"]))
{
    $kod=$_REQUEST["kod"];

    $ozetkod=hash('sha256',$kod);

    $sorgu1="select * from secmen where tc='$ozetkod'";
    $sorgu2="select * from gorevli where kod='$ozetkod'";

    $sorgucalistir=$baglanti->query($sorgu1);
    $sorgucalistir2=$baglanti->query($sorgu2);
    
    $toplam = $sorgucalistir->rowCount();
    $toplam2 = $sorgucalistir2->rowCount();
    if($sorgucalistir==true  and $toplam==1)
    {
    	foreach ($sorgucalistir as $key => $value) {
             	$secmen_id=$value['secmen_id'];
             	$secmen_adi=$value['ad'];
             	$secmen_soyadi=$value['soyad'];
        }
        			$_SESSION['tc']=$kod;
                    $_SESSION['secmen_id']=$secmen_id;
        			$_SESSION['secmen_adi']=$secmen_adi;
        			$_SESSION['secmen_soyadi']=$secmen_soyadi;
        			$_SESSION['secmen_ip']=$_SERVER['REMOTE_ADDR'];
        			$_SESSION['sisttarih']=date("d.m.Y");
        			$_SESSION['sistsaat']=date("H:i:s");
        				header("location:mainpage.php");
    }
    else if($sorgucalistir2==true  and $toplam2==1)
    {
        foreach ($sorgucalistir2 as $key => $value) 
        {
            $gorevli_id=$value['gorevli_id'];
            $ad=$value['ad'];
            $soyad=$value['soyad'];
        }
        $_SESSION['tc']=$kod;
        $_SESSION['secmen_id']=$gorevli_id;
        $_SESSION['secmen_adi']=$ad;
        $_SESSION['secmen_soyadi']=$soyad;
        header("location:gorevli.php");
    }
    else
    {
 	    echo "<h4>Böyle bir kod ile kayıtlı kişi sistemde bulunamamıştır.<br/> Lütfen tekrar deneyiniz!</h4>";
    }
 
}

?>
</body>
</html>