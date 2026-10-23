<?
	$query = file_get_contents("php://input");
	$a=explode(",",$query);

	$b8[]=$a['4'];//pic1
	$b8[]=$a['5'];//pic2
	$b8[]=$a['6'];//pic3
	$b8[]=$a['7'];//pic4
	$b8[]=$a['8'];//pic5


	$id=time();
	//============================TELEGRAM=============================
	include			('telegram-bot-api.php');
	$chat_id		='256176178:AAH2noc2RQwA4J92nOv63UlsxlrqUtLTwos';
	$kanal			='@farsroom';
	$bot			=new telegram_bot($chat_id);
	//=================================================================

	for($i=0;$i<=4;$i++){
		if($b8[$i]!=''){
			$nam=$id.$i;
			$ifp=fopen($nam,'wb'); 
			fwrite($ifp,base64_decode($b8[$i])); 
			fclose($ifp); 

			$nams='.jpg';
			$typ="image/jpeg";

			header('Content-type: '.$typ);

			list($width,$height)=getimagesize($nam);
			$newwidth=500;
			$newheight=($width/$newwidth);
			$newheight=($height/$newheight);

			// Load
			$thumb=@imagecreatetruecolor($newwidth,$newheight);
			if($nams=='.jpg'){ $source=@imagecreatefromjpeg($nam);}

			// Resize
			@imagecopyresized($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
			if($nams=='.jpg'){ @Imagejpeg($thumb,$nam.$nams);}
			@unlink($nam);
	
			print_r($bot->send_photo($kanal,$nam.$nams,$a['0'].' -- '.$a['1'].chr(13).chr(10).$a['2'].chr(13).chr(10).$a['3']));
			print_r($bot->send_photo($kanal,$nam.$nams,$a['3']));
			sleep(1);
			@unlink($nam.$nams);
		}
	}

	header('Content-type: text/html');
	echo '<save>';
?>