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
	Private tops As ImageView
	Private sidebar,YasMenu As ImageView
	Private toplabel As Label
	Private toplabel As Label
	Private Lists As ScrollView
	Private txt As Label
	Private font As Typeface
	Dim str(30) As String
	Dim sstr As String

End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	Activity.LoadLayout("category2")
	font=Typeface.LoadFromAssets("font.ttf")
	codes.Finishe=False

	sstr=File.ReadString(File.DirInternal,"cat")

	Select sstr
		Case "1"
			str(1)="آشپزخانه"
			str(2)="سقف"
			str(3)="کف"
			str(4)="جداره ها"
			str(5)="کمد"
			str(6)="کتابخانه"
			str(7)="کنسول تلویزیون"
			str(8)="شومینه"
			str(9)="طراحی کلی"
		Case "2"
			str(1)="اداری"
			str(2)="تجاری"
			str(3)="مسکونی"
			str(4)="آموزشی"
		Case "3"
			str(1)="آب نما"
			str(2)="آلاچیق"
			str(3)="فضای سبز"
			str(4)="کف سازی حیاط"
		Case "4"
			str(1)="کلاسیک"
			str(2)="مدرن"
			str(3)="ایرانی"
		Case "5"
			str(1)="مرمت"
			str(2)="باز طراحی"
	End Select
	
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
	toplabel.Text=File.ReadString(File.DirInternal,"catTop")
	
	Lists.Left=0
	Lists.Top=tops.Height-3dip
	Lists.Width=100%x
	Lists.Height=100%y-tops.Height

	add
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
Sub sidebar_Click
	Activity.Finish
End Sub
Sub add
	Dim i As Int
	Dim t As Int=5dip
	
	For i=1 To str.Length-1
		If str(i)<>"" Then
			YasMenu.Initialize("menu")
			Lists.Panel.AddView(YasMenu,0,t,100%x,100dip)
			YasMenu.Gravity=Gravity.FILL
			YasMenu.Bitmap=LoadBitmapSample(File.DirAssets,"menu.png",YasMenu.Width,YasMenu.Height)
			YasMenu.Tag=str(i)
			t=YasMenu.Top+YasMenu.Height+10dip
		
			txt.Initialize("")
			Lists.Panel.AddView(txt,0,YasMenu.Top,100%x,YasMenu.Height)
			txt.Typeface=font
			txt.Gravity=Gravity.CENTER
			txt.TextSize=20
			txt.TextColor=Colors.Black
			txt.Text=str(i)
		End If
	Next
	
	Lists.Panel.Height=t+10dip
End Sub
Sub menu_Click
	Dim menus As ImageView
	menus=Sender
	
	File.WriteString(File.DirInternal,"cat2",menus.Tag)
	
	codes.Finishe=True
	Activity.Finish
End Sub