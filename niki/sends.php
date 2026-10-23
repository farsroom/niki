<?
	$query = file_get_contents("php://input");
	$a=explode(",",$query);

	$b8[]=$a['4'];//pic1
	$b8[]=$a['5'];//pic2
	$b8[]=$a['6'];//pic3
	$b8[]=$a['7'];//pic4
	$b8[]=$a['8'];//pic5


	$id=time();
	require 'Api.php';
	use Gap\SDP\Api;
	$token = "81885c9741cefdd0c0f420f49469be29f00f6373eb11cb40f87b8a0257eaf133";  // HERE YOUR TOKEN
	$gm = new Api($token);
	$chat_id = '@nikstudio';
	$replyKeyboard = $gm->replyKeyboard([[['yes' => 'Like'], ['no' => 'unLike']], [['cancel' => 'Cancel']]]);

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
	
			$txt=$a['0'].'-'.$a['1'].'-'.$a['2'].'-'.$a['3'];
			$gm->sendImage($chat_id,$nam.$nams,$txt, $replyKeyboard);
			sleep(1);
			@unlink($nam.$nams);
		}
	}

	header('Content-type: text/html');
	echo '<save>';
?>