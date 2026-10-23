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
	Private str(10) As String

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
	toplabel.Text="دسته بندی"
	
	Lists.Left=0
	Lists.Top=tops.Height-3dip
	Lists.Width=100%x
	Lists.Height=100%y-tops.Height

	add
End Sub

Sub Activity_Resume
	If codes.Finishe=True Then
		StartActivity(sends)
		Activity.Finish
	End If

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
Sub sidebar_Click
	Activity.Finish
End Sub
Sub add
	Dim i As Int
	Dim t As Int=5dip
	str(1)="طراحی داخلی"
	str(2)="طراحی بنا"
	str(3)="طراحی منظر"
	str(4)="طراحی نما"
	str(5)="بازسازی"
	
	For i=1 To 5
		YasMenu.Initialize("menu")
		Lists.Panel.AddView(YasMenu,0,t,100%x,100dip)
		YasMenu.Gravity=Gravity.FILL
		YasMenu.Bitmap=LoadBitmapSample(File.DirAssets,"menu.png",YasMenu.Width,YasMenu.Height)
		YasMenu.Tag=i
		t=YasMenu.Top+YasMenu.Height+10dip
	
		txt.Initialize("")
		Lists.Panel.AddView(txt,0,YasMenu.Top,100%x,YasMenu.Height)
		txt.Typeface=font
		txt.Gravity=Gravity.CENTER
		txt.TextSize=20
		txt.TextColor=Colors.Black
		txt.Text=str(i)
	Next
	
	Lists.Panel.Height=t+10dip
End Sub
Sub menu_Click
	Dim menus As ImageView
	menus=Sender
	File.WriteString(File.DirInternal,"cat",menus.tag)
	File.WriteString(File.DirInternal,"catTop",str(menus.tag))
	StartActivity(category2)
End Sub