Type=Activity
Version=7.3
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub
Sub Globals
	Dim onoff As Boolean
	Dim drawable As ColorDrawable
	Private tops As ImageView
	Private sidebar As ImageView
	Private toplabel As Label
	Private b(10) As Label
	Private Lists As ScrollView
	Private ttt,tttt As EditText
	Private font As Typeface
	Private tags,Ss,SelectPic(10) As String
End Sub
Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("category")
	font=Typeface.LoadFromAssets("font.ttf")
	codes.Finishe=False

	tops.Left=0
	tops.Top=0
	tops.Width=100%x
	tops.Height=74dip
	tops.Gravity=Gravity.FILL
	tops.Bitmap=LoadBitmapSample(File.DirAssets,"tops.png",tops.Width,tops.Height)
	
	sidebar.Top=tops.Top+3dip
	sidebar.Height=tops.Height-10dip
	sidebar.Width=sidebar.Height
	sidebar.Left=100%x-sidebar.Width-5dip
	
	toplabel.Top=0
	toplabel.Width=100%x
	toplabel.Height=tops.Height
	toplabel.Left=0
	toplabel.Gravity=Gravity.CENTER
	toplabel.Text="ارسال اطلاعات"
	
	Lists.Left=0
	Lists.Top=tops.Height-3dip
	Lists.Width=100%x
	Lists.Height=100%y-tops.Height

	add
End Sub
Sub Activity_Resume
	If onoff=True Then
		onoff=False
		If File.Exists(File.DirRootExternal, "shot" & tags & ".jpg")=True Then
			Dim Out As OutputStream
			Dim bmp As Bitmap
			bmp.Initialize(File.DirRootExternal, "shot" & tags & ".jpg")
			Out = File.OpenOutput(File.DirRootExternal, "shot" & tags & ".jpg", False)
			bmp.WriteToStream(Out,20,"JPEG")
			Out.Close
			DoEvents

			SelectPic(tags)=image_to_base64(File.DirRootExternal, "shot" & tags & ".jpg")
			b(tags).Text="حذف عکس"
			b(tags).TextColor=Colors.Red
			ToastMessageShow("عکس انتخاب شد.",True)
		Else
			Msgbox("اشکال در انتخاب عکس." & CRLF & "لطفا عکس را از گالری انتخاب کنید نه از قسمتهای دیگر.","")
			ProgressDialogHide
		End If
	End If

End Sub
Sub Activity_Pause (UserClosed As Boolean)

End Sub
Sub sidebar_Click
	Activity.Finish
End Sub
Sub add

	Dim Bits,Bits2 As Bitmap
	Bits.Initialize(File.DirAssets,"txt.png")
	Bits2.Initialize(File.DirAssets,"txt2.png")

	ttt.Initialize("")
	Lists.Panel.AddView(ttt,0,10dip,90%x,1dip)
	ttt.Height=(83dip*ttt.Width)/642dip
	ttt.Left=(100%x/2)-(ttt.Width/2)
	ttt.SingleLine=True
	ttt.Typeface=font
	ttt.Gravity=Gravity.LEFT
	ttt.TextSize=14
	ttt.TextColor=Colors.Black
	ttt.InputType=ttt.INPUT_TYPE_PHONE
	ttt.Hint="همراه"
	ttt.SetBackgroundImage(Bits)

	tttt.Initialize("")
	Lists.Panel.AddView(tttt,ttt.Left,ttt.Top+ttt.Height+10dip,ttt.Width,ttt.Height*3)
	tttt.Typeface=font
	tttt.Gravity=Gravity.RIGHT
	tttt.TextSize=14
	tttt.TextColor=Colors.Black
	tttt.Hint="توضیحات"
	tttt.SetBackgroundImage(Bits2)
	
	b(1).Initialize("b")
	Lists.Panel.AddView(b(1),tttt.Left,tttt.top+tttt.Height+10dip,ttt.Width,ttt.Height)
	drawable.Initialize(Colors.RGB(69,173,100),5dip)
	b(1).Background=drawable
	b(1).Typeface=font
	b(1).Gravity=Gravity.CENTER
	b(1).TextSize=14
	b(1).TextColor=Colors.White
	b(1).Text="انتخاب عکس"
	b(1).Tag=1
	
	b(2).Initialize("b")
	Lists.Panel.AddView(b(2),tttt.Left,b(1).top+b(1).Height+10dip,ttt.Width,ttt.Height)
	drawable.Initialize(Colors.RGB(69,173,100),5dip)
	b(2).Background=drawable
	b(2).Typeface=font
	b(2).Gravity=Gravity.CENTER
	b(2).TextSize=14
	b(2).TextColor=Colors.White
	b(2).Text="انتخاب عکس"
	b(2).Tag=2
	
	b(3).Initialize("b")
	Lists.Panel.AddView(b(3),tttt.Left,b(2).top+b(2).Height+10dip,ttt.Width,ttt.Height)
	drawable.Initialize(Colors.RGB(69,173,100),5dip)
	b(3).Background=drawable
	b(3).Typeface=font
	b(3).Gravity=Gravity.CENTER
	b(3).TextSize=14
	b(3).TextColor=Colors.White
	b(3).Text="انتخاب عکس"
	b(3).Tag=3
	
	b(4).Initialize("b")
	Lists.Panel.AddView(b(4),tttt.Left,b(3).top+b(3).Height+10dip,ttt.Width,ttt.Height)
	drawable.Initialize(Colors.RGB(69,173,100),5dip)
	b(4).Background=drawable
	b(4).Typeface=font
	b(4).Gravity=Gravity.CENTER
	b(4).TextSize=14
	b(4).TextColor=Colors.White
	b(4).Text="انتخاب عکس"
	b(4).Tag=4
	
	b(5).Initialize("b")
	Lists.Panel.AddView(b(5),tttt.Left,b(4).top+b(4).Height+10dip,ttt.Width,ttt.Height)
	drawable.Initialize(Colors.RGB(69,173,100),5dip)
	b(5).Background=drawable
	b(5).Typeface=font
	b(5).Gravity=Gravity.CENTER
	b(5).TextSize=14
	b(5).TextColor=Colors.White
	b(5).Text="انتخاب عکس"
	b(5).Tag=5
	
	b(6).Initialize("save")
	Lists.Panel.AddView(b(6),tttt.Left,b(5).top+b(5).Height+50dip,ttt.Width,ttt.Height)
	drawable.Initialize(Colors.RGB(69,173,100),5dip)
	b(6).Background=drawable
	b(6).Typeface=font
	b(6).Gravity=Gravity.CENTER
	b(6).TextSize=14
	b(6).TextColor=Colors.White
	b(6).Text="ارسال"

	Lists.Panel.Height=b(6).Top+b(6).Height+20dip
End Sub
Sub image_to_base64(dir As String,filename As String) As String
	Dim Base64Con As Base64Image
	Dim b64Str As String
	Base64Con.Initialize
	b64Str = Base64Con.EncodeFromImage(dir,filename)
	Return b64Str
End Sub
Sub b_Click
	Dim img As Label
	img=Sender
	tags=img.Tag

	If img.Text="حذف عکس" Then
		Dim result As Int
		result = Msgbox2("آیا عکس مورد نظر حذف شود؟","","بله","خیر","",Null)
		If result=-1 Then
			img.TextColor=Colors.White
			img.Text="انتخاب عکس"
			SelectPic(tags)=""
		End If
		Return
	End If

	If File.Exists(File.DirRootExternal, "shot1.jpg")=True Then File.Delete(File.DirRootExternal, "shot1.jpg")
	If File.Exists(File.DirRootExternal, "shot2.jpg")=True Then File.Delete(File.DirRootExternal, "shot2.jpg")
	If File.Exists(File.DirRootExternal, "shot3.jpg")=True Then File.Delete(File.DirRootExternal, "shot3.jpg")
	If File.Exists(File.DirRootExternal, "shot4.jpg")=True Then File.Delete(File.DirRootExternal, "shot4.jpg")
	If File.Exists(File.DirRootExternal, "shot5.jpg")=True Then File.Delete(File.DirRootExternal, "shot5.jpg")

	Galeria(File.DirRootExternal, "shot" & tags & ".jpg")
End Sub
Sub save_Click
	Dim tt4 As String=""

	ttt.Text=ttt.Text.Trim
	tttt.Text=tttt.Text.Trim

	If ttt.Text="" Then
		Msgbox("تلفن همراه را وارد کنید.","")
		Return
	Else If tttt.Text="" Then
		Msgbox("توضیحات را وارد کنید.","")
		Return
	End If
	
	Ss=""
	For i=1 To 5
		If SelectPic(i)<>"" Then Ss="1"
	Next
	If Ss="" Then
		Msgbox("حداقل یک عکس باید انتخاب کنید.","")
		Return
	End If

	ProgressDialogShow2("در حال ارسال اطلاعات...",False)

	Dim job As HttpJob
	job.Initialize("job", Me)
	job.GetRequest.Timeout=120000
	job.PostString("http://golbazzar.ir/niki/sends.php",File.ReadString(File.DirInternal,"catTop") & "," & File.ReadString(File.DirInternal,"cat2") & "," & "        " & tttt.Text & "," & ttt.Text & "," & SelectPic(1) & "," & SelectPic(2) & "," & SelectPic(3) & "," & SelectPic(4) & "," & SelectPic(5))
End Sub
Sub Galeria(Directory As String,PictureName As String)
	Dim Galery1 As Intent
	onoff = True
	Galery1.Initialize(Galery1.ACTION_PICK, "")
	Galery1.SetType("image/*")
	Galery1.PutExtra("output", ParseUri("file://" & File.Combine(Directory, PictureName)))
	Galery1.PutExtra("crop","false")
	StartActivity(Galery1)
End Sub
Sub ParseUri(FileName As String) As Object
	Dim r As Reflector
	Return r.RunStaticMethod("android.net.Uri", "parse", Array As Object(FileName), Array As String("java.lang.String"))
End Sub
Sub JobDone(job As HttpJob)
	ProgressDialogHide

	If job.Success Then
		Dim res As String
		res = job.GetString

		If res="0" Then
			job.Release
			ToastMessageShow("خط شلوغ است دوباره امتحان کنید.", True)
			Return
		Else If res="﻿" Then
			ToastMessageShow("خط شلوغ است دوباره امتحان کنید.", True)
			job.Release
			Return
		Else If res="NULL" Then
			ToastMessageShow("خط شلوغ است دوباره امتحان کنید.", True)
			job.Release
			Return
		Else If res.IndexOf("html")=1 Then
			ToastMessageShow("اینترنت تمام شده.", True)
			job.Release
			Return
		else If res.IndexOf("null")=1 Then
			ToastMessageShow("لیست خالی است.",True)
			job.Release
			Return
		else If res.IndexOf("<save>")=1 Then
			Msgbox("اطلاعات ارسال شد.","")
			Activity.Finish
			job.Release
			Return
		else If res.IndexOf("<save>")<>-1 Then
			Msgbox("اطلاعات ارسال شد.","")
			Activity.Finish
			job.Release
			Return
		else If res.IndexOf("[]")=1 Then
			ToastMessageShow("لیست خالی است.",True)
			job.Release
			Return
		else If res.IndexOf("[]")<>-1 Then
			ToastMessageShow("لیست خالی است.",True)
			job.Release
			Return
		else If res.IndexOf("<noImg>")=1 Then
			Msgbox("فرمت یکی از عکس ها قابل قبول نیست.","")
			job.Release
			Return
		else If res.IndexOf("<noImg>")<>-1 Then
			Msgbox("فرمت یکی از عکس ها قابل قبول نیست.","")
			job.Release
			Return
		else If res.IndexOf("<no>")=1 Then
			ToastMessageShow("مشکل در اینترنت شما. دوباره سعی کنید.", True)
			job.Release
			Return
		else If res.IndexOf("<no>")<>-1 Then
			ToastMessageShow("مشکل در اینترنت شما. دوباره سعی کنید.", True)
			job.Release
			Return
		Else If res.IndexOf("[{")=-1 Then
			If res="" Then
				ToastMessageShow("مشکل در اینترنت شما. دوباره سعی کنید.", True)
				job.Release
				Return
			End If
		else If res.IndexOf("Warning:")=1 Then
			job.Release
			Msgbox("اشکال بوجود آمده از طرف سرور. درصورت امکان برنامه را بروز رسانی کنید.","")
			Return
		End If

	Else
		Ss=job.ErrorMessage
		If Ss.IndexOf("timed out")<>-1 Then
			ToastMessageShow("خط شلوغ است دوباره امتحان کنید.", True)
		Else
			ToastMessageShow("زمان آپلود طولانی شد.", True)
		End If
	End If
	job.Release
End Sub