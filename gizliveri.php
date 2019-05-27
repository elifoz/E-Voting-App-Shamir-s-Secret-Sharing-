
<!DOCTYPE html>
<html>
<head>
	  <link rel="stylesheet" href="css/aday.css">
	 
	  <link rel="stylesheet" href="css/login.css">
</head>

<body>
<?php
$servername = "localhost";
$username = "elif";
$password = "123456";
$dbadi="e_voting";
 try{
    $baglanti = new PDO("mysql:host=$servername;dbname=$dbadi;charset=utf8", $username, $password);

    //set the PDO error mode to exception
    $baglanti->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
}
catch(PDOException $e)
{
    echo "Connection failed: " . $e->getMessage();
}

		$toplam1 = 0;
		$toplam2 = 0;
		$toplam3 = 0;

		$query="SELECT cc1 from sonuc";
        $cc1=$baglanti->query($query);
        
        foreach ($cc1 as $key => $value) {
        	$toplam1 += $value['cc1'];
        }
		$scc1 =  $toplam1 % 524309;
		//Veri tabanından cc1 verileri alınıp hesi toplanıp bu değişkene atanacak. Verilen değer örnek amaçlı
		$query	="SELECT cc2 from sonuc";
		 $cc2=$baglanti->query($query);//Veri tabanından cc2 verileri alınıp hesi toplanıp bu değişkene atanacak. Verilen değer örnek amaçlı
		foreach ($cc2 as $key => $value) {
        	$toplam2 += $value['cc2'];
        }
		$scc2 =  $toplam2 % 524309;
		$query="SELECT cc3  from sonuc";
		 $cc3=$baglanti->query($query);//Veri tabanından cc3 verileri alınıp hesi toplanıp bu değişkene atanacak. Verilen değer örnek amaçlı
		foreach ($cc3 as $key => $value) {
        	$toplam3 += $value['cc3'];
        }
		$scc3 =  $toplam3 % 524309;
?>
<form action="gorevli.php?link=5" method="post">
		   <table>
		   <tr>
			   <td><label >Gizli Değer 1:</label></td>
			   <td><input type="text" name="scc1" required="required" ></td>
		   </tr>
		   <tr>
			   <td><label >Gizli Değer 2:</label></td>
			   <td><input type="text" class="harf" name="scc2" required="required" ></td>
		   </tr>
		   <tr>
			   <td><label >Gizli Değer 3:</label></td>
			   <td><input type="text" class="harf" name="scc3" required="required" ></td>
		   </tr>
		   <tr>
			   <td><button name="sonuclar"  class="icbutton" >SONUÇLARI GETİR</button></td>
		   </tr>
		   </table>
	   </form>

      <?php if(isset($_REQUEST["sonuclar"])){

      	$gizli1=$_REQUEST["scc1"];
      	$gizli2=$_REQUEST["scc2"];
      	$gizli3=$_REQUEST["scc3"];

      	if ($gizli1==$scc1  and $gizli2==$scc2  and $gizli3==$scc3){
 				include("sonuc.php");
      	}
      	
 		echo "<h4>Girdiğiniz Değerler Yanlıştır!</br>Lütfen Tekrar Deneyiniz.</h4>";
}
?>
</body>