        ��  ��                  �  `   ��
 J V C S M A K P L U G I N _ C S _ S R C _ A S S E M B L Y I N F O       0         {$IFDEF BLOCKHEADER}
(------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: template_cs_AssemblyInfo.cs

The Initial Developer of the original code (JEDI VCS) is:
  Uwe Schuster (jedivcs@bitcommander.de)

Componentes and used code which is used in this code are explictly stated to
be copyright of the respective author(s).

Last Modified: see History

Known Issues:
-----------------------------------------------------------------------------

Unit history:

2005/03/14  USchuster - ported template to C#

------------------------------------------------------------------------------)
{$ENDIF BLOCKHEADER}
using System.Reflection;
using System.Runtime.CompilerServices;

//
// Die allgemeinen Assemblierungsinformationen werden durch die folgenden 
// Attribute gesteuert. �ndern Sie die Attributwerte, um die zu einer
// Assemblierung geh�renden Informationen zu modifizieren.
//
[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("")]
[assembly: AssemblyProduct("")]
[assembly: AssemblyCopyright("")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]		

//
// Die Versionsinformation einer Assemblierung enth�lt die folgenden vier Werte:
//
//      Hauptversion
//      Nebenversion 
//      Build-Nummer
//      Revision
//
// Sie k�nnen alle vier Werte festlegen oder f�r Revision und Build-Nummer die  
// Standardwerte mit von '*' - wie nachfolgend gezeigt - verwenden:

[assembly: AssemblyVersion("1.0.*")]

//
// Zum Signieren einer Assembly m�ssen Sie einen Schl�ssel angeben. Weitere 
// Informationen �ber das Signieren von Assemblierungen finden Sie in der 
// Microsoft .NET Framework-Dokumentation.
// 
// Mit den folgenden Attributen steuern Sie, welcher Schl�ssel f�r die Signatur  
// verwendet wird.
// 
// Hinweise: 
//   (*) Wenn kein Schl�ssel angegeben wird, ist die Assemblierung nicht 
//       signiert.
//   (*) KeyName verweist auf einen Schl�ssel, der im Crypto Service Provider 
//       (CSP) auf Ihrem Rechner installiert wurde. KeyFile verweist auf eine 
//       Datei, die einen Schl�ssel enth�lt.
//   (*) Wenn sowohl der KeyFile- als auch der KeyName-Wert angegeben ist, wird
//       die folgende Verarbeitung durchgef�hrt:
//       (1) Wenn KeyName in dem CSP gefunden wird, wird dieser Schl�ssel 
//           verwendet.
//       (2) Wenn KeyName nicht, aber KeyFile vorhanden ist, wird der Schl�ssel 
//           in KeyFile im CSP installiert und verwendet.
//   (*) Eine KeyFile k�nnen Sie mit dem Utility sn.exe (Starker Name) erzeugen.
//       Der Speicherort von KeyFile sollte relativ zum Projektausgabeverzeichnis
//       %Projektverzeichnis%\bin\<Konfiguration> angegeben werden. Wenn sich Ihr 
//       KeyFile z.B. im Projektverzeichnis befindet, w�rden Sie das Attriut
//       AssemblyKeyFile folgenderma�en festlegen:
//       [assembly: AssemblyKeyFile("..\\..\\mykey.snk")]
//   (*) Verz�gerte Signatur ist eine erweiterte Option; n�here Informationen 
//       dazu finden Sie in der Microsoft .NET Framework-Dokumentation.
//
[assembly: AssemblyDelaySign(false)]
[assembly: AssemblyKeyFile("")]
[assembly: AssemblyKeyName("")]
Y$  H   ��
 J V C S M A K P L U G I N _ C S _ S R C         0         {$IFDEF BLOCKHEADER}
(------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: template_cs_JVCSMakPlugin.cs

The Initial Developer of the original code (JEDI VCS) is:
  Uwe Schuster (jedivcs@bitcommander.de)

Componentes and used code which is used in this code are explictly stated to
be copyright of the respective author(s).

Last Modified: see History

Known Issues:
Mar/05
- USc: - AxHostPublic lets the IDE think this a form
       - strange EOleException "Overflow or underflow in the arithmetic operation"
         in JVCSMak
ToDo
- real icons(how to store, modify and retrieve icons from resources?)
-----------------------------------------------------------------------------

Unit history:

2005/03/14  USchuster - ported template to C#

------------------------------------------------------------------------------)
{$ENDIF BLOCKHEADER}
using System;
using System.Threading;

using System.Runtime.InteropServices;
using Jvcsmak;
using System.Drawing;
using System.Windows.Forms;

using System.Resources;
using stdole;

namespace %PLUGINIDENTIFIER%
{

	public class Vars
	{
		static public JApplication jvcsmak = null;
		static public bool FCanceled = false;

		public const string struPluginName = "%PLUGINNAME%";
		public const string struPluginAuthor = "%PLUGINAUTHOR%";
		public const string struPluginHint = "%PLUGINHINT%";
		public const string stCategory = "%PLUGINCATEGORY%";
	}

	public class Plugin%COMMANDIDENTIFIER%: Jvcsmak.ICommand
	{
	   string FCaption = "%COMMANDNAME%";
	   {$IFDEF BLOCKSAMPLEVAR}
	   string FTestValue = "%SAMPLEVARVALUE%";
	   {$ENDIF BLOCKSAMPLEVAR}

	   public bool DrawItem(int Handle, int Left, int Top, int Right, int Bottom, bool Selected, bool BriefView, uint BkColor)
	   {
	   	  {$IFNDEF BLOCKSAMPLEPAINTCODE}
  		  return true;
  		  {$ELSE}
  		  //----------------------------- Example ------------------------
		  Graphics newGraphics = Graphics.FromHdc((IntPtr) Handle);
		  Rectangle Rect = new Rectangle(Left, Top, Right - Left, Bottom - Top);
		  Brush brush = null;
		  if (Selected)
		  {
			brush = new SolidBrush(SystemColors.Highlight);
			newGraphics.FillRectangle(brush, Rect);
		  }
		  else
		  {
			brush = new SolidBrush(SystemColors.Window);
			newGraphics.FillRectangle(brush, Rect);
		  }
		  int Offset = 2;
		  System.Drawing.Font stringFont = new System.Drawing.Font("MS Sans Serif", 8, System.Drawing.FontStyle.Bold);
		  if (Selected)
		  {
			brush = new SolidBrush(SystemColors.HighlightText);
		  }
		  else
		  {
			brush = new SolidBrush(SystemColors.WindowText);
		  }
		  {$IFDEF BLOCKSAMPLEVAR}
		  newGraphics.DrawString(FCaption + " " + FTestValue, stringFont, brush,
			Rect.Left + 2, Rect.Top + Offset);
		  {$ENDIF BLOCKSAMPLEVAR}
		  if (!BriefView)
		  {
			Offset = (int)(newGraphics.MeasureString(FCaption, stringFont).Height) + 2;
			stringFont = new System.Drawing.Font("MS Sans Serif", 8);
			brush = new SolidBrush(Color.Blue);
			newGraphics.DrawString("only for testing", stringFont, brush,
			  Rect.Left + 10, Rect.Top + Offset);
		  }
		  return false;
		  {$ENDIF ~BLOCKSAMPLEPAINTCODE}
	   }

	   public bool EditItem()
	   {
		  WinForm EditForm = new WinForm();
		  {$IFDEF BLOCKSAMPLEVAR}
		  EditForm.textBox1.Text = FTestValue;
		  {$ENDIF BLOCKSAMPLEVAR}
		  if (EditForm.ShowDialog() == DialogResult.OK)
		  {
		        {$IFDEF BLOCKSAMPLEVAR}
			FTestValue = EditForm.textBox1.Text;
			{$ENDIF BLOCKSAMPLEVAR}
		  }
		  return true;
	   }

	   public bool ExecuteItem()
	   {
          Vars.FCanceled = false;
                  {$IFDEF BLOCKSAMPLEVAR}
		  Vars.jvcsmak.LogMessage(FCaption + " " + FTestValue);
		  {$ENDIF BLOCKSAMPLEVAR}
		  Vars.jvcsmak.LogMessage("Executing %COMMANDNAME%...");
		  return true;
	   }

	   public int MeasureItem(int Handle, bool BriefView)
	   {
		  {$IFNDEF BLOCKSAMPLEPAINTCODE}
		  return -1; //auto
		  {$ELSE}
		  //----------------------------- Example ------------------------
		  Graphics newGraphics = Graphics.FromHdc((IntPtr) Handle);
		  int Result = 2;
		  System.Drawing.Font stringFont = new System.Drawing.Font("MS Sans Serif", 8, System.Drawing.FontStyle.Bold);
		  Result += (int)(newGraphics.MeasureString(FCaption, stringFont).Height) + 2;
		  if (!BriefView)
		  {
			stringFont = new System.Drawing.Font("MS Sans Serif", 8);
			Result += (int)(newGraphics.MeasureString(FCaption, stringFont).Height) + 2;
		  }
		  return Result;
		  {$ENDIF ~BLOCKSAMPLEPAINTCODE}
	   }

	   public void SetFilename(string Filename)
	   {
		 //Setting the Filename - used by the host at drag&drop
         //enter your code here
	   }

	   public string Caption {

			get
			{
				return FCaption;
			}

			set
			{
			   FCaption = value;
			}

	   }

	   public int ParamCount{
			get
			{
				{$IFDEF BLOCKSAMPLEVAR}
				return 1;
				{$ELSE}
				return 0;
				{$ENDIF BLOCKSAMPLEVAR}
			}
	   }

	   public string get_ParamNames(int Index)
	   {
		   {$IFDEF BLOCKSAMPLEVAR}
		   return "%SAMPLEVARNAME%";
		   {$ELSE}
		   return "";
		   {$ENDIF BLOCKSAMPLEVAR}
	   }

	   public void set_ParamValues(string ParamName, string Value)
	   {
	           {$IFDEF BLOCKSAMPLEVAR}
		   if (ParamName == "%SAMPLEVARNAME%")
		   {
		   		FTestValue = Value;
		   }
		   {$ENDIF BLOCKSAMPLEVAR}
	   }

	   public string get_ParamValues(string ParamName)
	   {
	           {$IFDEF BLOCKSAMPLEVAR}
		   if (ParamName == "%SAMPLEVARNAME%")
		   {
				return FTestValue;
		   }
		   else
		   {$ENDIF BLOCKSAMPLEVAR}
		   {
				return "";
		   }
	   }

	}

	public class AxHostPublic: AxHost
	{
		public AxHostPublic(): base(null)
		{
		}
		public new static IPicture GetIPictureDispFromPicture(Image image)
		{
			return (IPicture)AxHost.GetIPictureFromPicture(image);
		}
	}

	public class Plugin%COMMANDIDENTIFIER%Callback: Jvcsmak.ICommandCallback
	{

     	public const string IDPlugin%COMMANDIDENTIFIER% = "%PLUGINIDENTIFIER%.%COMMANDIDENTIFIER%";
		Plugin%COMMANDIDENTIFIER% PluginTest = new Plugin%COMMANDIDENTIFIER%();

		public Object CreateCommand()
		{
			return PluginTest;
		}
		
		public void SetCanceled(bool aCanceled)
		{
			Vars.FCanceled = aCanceled; //set by the server if the user press "Cancel" oder "Stop"
		}

		public string GetIdentifier()
		{
			return IDPluginTestmodule;
		}

	}

	public class TestAction: Jvcsmak.IActionCallback
	{
	   public void Execute(string Action)
	   {
		  ActionTest TestForm = new ActionTest();
		  TestForm.ShowDialog();
	   }
	}

	public class Plugin: Jvcsmak.IPlugin
	{
	  Plugin%COMMANDIDENTIFIER%Callback Plugin%COMMANDIDENTIFIER%CB = new Plugin%COMMANDIDENTIFIER%Callback();
	  TestAction TestActionCB = new TestAction();

	  public string Name {
			get
			{
				return Vars.struPluginName;
			}
	  }

	  public string Author {
			get
			{
				return Vars.struPluginAuthor;
			}
	  }

	  public string Description {
			get
			{
				return Vars.struPluginHint;
			}
	  }

	  public string RequiredPlugins {
			get
			{
				return "";
			}
	  }

	  public int RegisterPlugin(JApplication AJVCSMakApp)
	  {
		Vars.jvcsmak = AJVCSMakApp;

		Bitmap bmp = new Bitmap(16, 16);
		for(int x = 0; x < 16; x++)
		{
		  for(int y = 0; y < 16; y++)
		  {
			bmp.SetPixel(x, y, Color.Green);
		  }
		}

		stdole.StdPicture p = (stdole.StdPicture)AxHostPublic.GetIPictureDispFromPicture(bmp);
                {$IFDEF BLOCKMENUACTION}
                
                //--- add actions --------------------------------------------------------
		AJVCSMakApp.AddMenuAction("FormActions_acTestaction1_Name",
		  "%MENUACTIONPATH%" + "%TESTACTIONCAPTION%",
		  "FormActions.acTestaction1.Hint", p, TestActionCB);
                {$ENDIF BLOCKMENUACTION}		  

		//--- add modules --------------------------------------------------------
		AJVCSMakApp.LogMessage("C# Register Plugin");

		AJVCSMakApp.AddCommandType("%COMMANDNAME%", "", Vars.stCategory, p, "txt", -1,
		  Plugin%COMMANDIDENTIFIER%CB);

		//Credits
		AJVCSMakApp.AddCreditInfo(Vars.struPluginName + " by " + Vars.struPluginAuthor);

		//Additional Info
		AJVCSMakApp.AddAdditionalInfo(Vars.struPluginHint);

		return 0;
	  }

	  public int UnregisterPlugin()
	  {
        return 0;
	  }

	  public int MinorVersion {
			get
			{
				return 0;
			}
	  }

	  public int MajorVersion {
			get
			{
				return 1;
			}
	  }

	  public Guid OptionsPageGUID {
			get
			{
				return new Guid();
			}
	  }

	  public void AfterAllPluginsLoaded()
	  {

	  }

	}
}
   P  X   ��
 J V C S M A K P L U G I N _ C S _ U N I T S R C _ E D I T       0         {$IFDEF BLOCKHEADER}
(------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: template_cs_Edit.cs

The Initial Developer of the original code (JEDI VCS) is:
  Uwe Schuster (jedivcs@bitcommander.de)

Componentes and used code which is used in this code are explictly stated to
be copyright of the respective author(s).

Last Modified: see History

Known Issues:
-----------------------------------------------------------------------------

Unit history:

2005/03/14  USchuster - ported template to C#

------------------------------------------------------------------------------)
{$ENDIF BLOCKHEADER}
using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;

namespace %PLUGINIDENTIFIER%
{
	/// <summary>
	/// Zusammenfassende Beschreibung f�r WinForm
	/// </summary>
	public class WinForm : System.Windows.Forms.Form
	{
		/// <summary>
		/// Erforderliche Designervariable
		/// </summary>
		private System.ComponentModel.Container components = null;
		public System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Label label1;

		public WinForm()
		{
			//
			// Erforderlich f�r die Unterst�tzung des Windows Forms-Designer
			//
			InitializeComponent();

			//
			// TODO: F�gen Sie nach dem Aufruf von InitializeComponent() Konstruktorcode hinzu.
			//
			FormBorderStyle = FormBorderStyle.FixedDialog;
			StartPosition = FormStartPosition.CenterParent;
			ShowInTaskbar = false;
			MinimizeBox = MaximizeBox = false;
		}

		/// <summary>
		/// Ressourcen nach der Verwendung bereinigen
		/// </summary>
		protected override void Dispose (bool disposing)
		{
			if (disposing)
			{
				if (components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}

		#region Vom Windows Form-Designer erzeugter Code
		/// <summary>
		/// Erforderliche Methode zur Unterst�tzung des Designers -
		/// �ndern Sie die Methode nicht mit dem Quelltext-Editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// textBox1
			// 
			this.textBox1.Location = new System.Drawing.Point(24, 40);
			this.textBox1.Name = "textBox1";
			this.textBox1.Size = new System.Drawing.Size(296, 20);
			this.textBox1.TabIndex = 0;
			this.textBox1.Text = "textBox1";
			// 
			// button1
			// 
			this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.button1.Location = new System.Drawing.Point(80, 80);
			this.button1.Name = "button1";
			this.button1.TabIndex = 1;
			this.button1.Text = "Ok";
			// 
			// button2
			// 
			this.button2.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			this.button2.Location = new System.Drawing.Point(168, 80);
			this.button2.Name = "button2";
			this.button2.TabIndex = 2;
			this.button2.Text = "Abbrechen";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(24, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(100, 16);
			this.label1.TabIndex = 3;
			this.label1.Text = "label1";
			// 
			// WinForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(344, 125);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.textBox1);
			this.Name = "WinForm";
			this.Text = "FormEditParams";
			this.ResumeLayout(false);
		}
		#endregion
	}
}
�  X   ��
 J V C S M A K P L U G I N _ C S _ F O R M S R C _ E D I T       0         ﻿<?xml version="1.0" encoding="utf-8"?>
<root>
  <!-- 
    Microsoft ResX Schema 
    
    Version 1.3
    
    The primary goals of this format is to allow a simple XML format 
    that is mostly human readable. The generation and parsing of the 
    various data types are done through the TypeConverter classes 
    associated with the data types.
    
    Example:
    
    ... ado.net/XML headers & schema ...
    <resheader name="resmimetype">text/microsoft-resx</resheader>
    <resheader name="version">1.3</resheader>
    <resheader name="reader">System.Resources.ResXResourceReader, System.Windows.Forms, ...</resheader>
    <resheader name="writer">System.Resources.ResXResourceWriter, System.Windows.Forms, ...</resheader>
    <data name="Name1">this is my long string</data>
    <data name="Color1" type="System.Drawing.Color, System.Drawing">Blue</data>
    <data name="Bitmap1" mimetype="application/x-microsoft.net.object.binary.base64">
        [base64 mime encoded serialized .NET Framework object]
    </data>
    <data name="Icon1" type="System.Drawing.Icon, System.Drawing" mimetype="application/x-microsoft.net.object.bytearray.base64">
        [base64 mime encoded string representing a byte array form of the .NET Framework object]
    </data>
                
    There are any number of "resheader" rows that contain simple 
    name/value pairs.
    
    Each data row contains a name, and value. The row also contains a 
    type or mimetype. Type corresponds to a .NET class that support 
    text/value conversion through the TypeConverter architecture. 
    Classes that don't support this are serialized and stored with the 
    mimetype set.
    
    The mimetype is used forserialized objects, and tells the 
    ResXResourceReader how to depersist the object. This is currently not 
    extensible. For a given mimetype the value must be set accordingly:
    
    Note - application/x-microsoft.net.object.binary.base64 is the format 
    that the ResXResourceWriter will generate, however the reader can 
    read any of the formats listed below.
    
    mimetype: application/x-microsoft.net.object.binary.base64
    value   : The object must be serialized with 
            : System.Serialization.Formatters.Binary.BinaryFormatter
            : and then encoded with base64 encoding.
    
    mimetype: application/x-microsoft.net.object.soap.base64
    value   : The object must be serialized with 
            : System.Runtime.Serialization.Formatters.Soap.SoapFormatter
            : and then encoded with base64 encoding.

    mimetype: application/x-microsoft.net.object.bytearray.base64
    value   : The object must be serialized into a byte array 
            : using a System.ComponentModel.TypeConverter
            : and then encoded with base64 encoding.
    -->
  <xsd:schema id="root" xmlns="" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
    <xsd:element name="root" msdata:IsDataSet="true">
      <xsd:complexType>
        <xsd:choice maxOccurs="unbounded">
          <xsd:element name="data">
            <xsd:complexType>
              <xsd:sequence>
                <xsd:element name="value" type="xsd:string" minOccurs="0" msdata:Ordinal="1" />
                <xsd:element name="comment" type="xsd:string" minOccurs="0" msdata:Ordinal="2" />
              </xsd:sequence>
              <xsd:attribute name="name" type="xsd:string" msdata:Ordinal="1" />
              <xsd:attribute name="type" type="xsd:string" msdata:Ordinal="3" />
              <xsd:attribute name="mimetype" type="xsd:string" msdata:Ordinal="4" />
            </xsd:complexType>
          </xsd:element>
          <xsd:element name="resheader">
            <xsd:complexType>
              <xsd:sequence>
                <xsd:element name="value" type="xsd:string" minOccurs="0" msdata:Ordinal="1" />
              </xsd:sequence>
              <xsd:attribute name="name" type="xsd:string" use="required" />
            </xsd:complexType>
          </xsd:element>
        </xsd:choice>
      </xsd:complexType>
    </xsd:element>
  </xsd:schema>
  <resheader name="resmimetype">
    <value>text/microsoft-resx</value>
  </resheader>
  <resheader name="version">
    <value>1.3</value>
  </resheader>
  <resheader name="reader">
    <value>System.Resources.ResXResourceReader, System.Windows.Forms, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</value>
  </resheader>
  <resheader name="writer">
    <value>System.Resources.ResXResourceWriter, System.Windows.Forms, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</value>
  </resheader>
  <data name="textBox1.Locked" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="textBox1.Modifiers" type="System.CodeDom.MemberAttributes, System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>Public</value>
  </data>
  <data name="button1.Locked" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="button1.Modifiers" type="System.CodeDom.MemberAttributes, System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>Private</value>
  </data>
  <data name="button2.Locked" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="button2.Modifiers" type="System.CodeDom.MemberAttributes, System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>Private</value>
  </data>
  <data name="label1.Locked" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="label1.Modifiers" type="System.CodeDom.MemberAttributes, System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>Private</value>
  </data>
  <data name="$this.TrayLargeIcon" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="$this.TrayHeight" type="System.Int32, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>80</value>
  </data>
  <data name="$this.Localizable" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="$this.SnapToGrid" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>True</value>
  </data>
  <data name="$this.DrawGrid" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>True</value>
  </data>
  <data name="$this.Locked" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="$this.GridSize" type="System.Drawing.Size, System.Drawing, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a">
    <value>8, 8</value>
  </data>
  <data name="$this.Language" type="System.Globalization.CultureInfo, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>(Default)</value>
  </data>
</root>   �  d   ��
 J V C S M A K P L U G I N _ C S _ U N I T S R C _ A C T I O N T E S T       0         {$IFDEF BLOCKHEADER}
(------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: template_cs_ActionTest.cs

The Initial Developer of the original code (JEDI VCS) is:
  Uwe Schuster (jedivcs@bitcommander.de)

Componentes and used code which is used in this code are explictly stated to
be copyright of the respective author(s).

Last Modified: see History

Known Issues:
-----------------------------------------------------------------------------

Unit history:

2005/03/14  USchuster - ported template to C#

------------------------------------------------------------------------------)
{$ENDIF BLOCKHEADER}
using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;

namespace %PLUGINIDENTIFIER%
{
	/// <summary>
	/// Zusammenfassende Beschreibung f�r WinForm
	/// </summary>
	public class ActionTest : System.Windows.Forms.Form
	{
		/// <summary>
		/// Erforderliche Designervariable
		/// </summary>
		private System.ComponentModel.Container components = null;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button button1;

		public ActionTest()
		{
			//
			// Erforderlich f�r die Unterst�tzung des Windows Forms-Designer
			//
			InitializeComponent();

			//
			// TODO: F�gen Sie nach dem Aufruf von InitializeComponent() Konstruktorcode hinzu.
			//
			FormBorderStyle = FormBorderStyle.Sizable;
			StartPosition = FormStartPosition.CenterParent;
			ShowInTaskbar = false;
		}

		/// <summary>
		/// Ressourcen nach der Verwendung bereinigen
		/// </summary>
		protected override void Dispose (bool disposing)
		{
			if (disposing)
			{
				if (components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}

		#region Vom Windows Form-Designer erzeugter Code
		/// <summary>
		/// Erforderliche Methode zur Unterst�tzung des Designers -
		/// �ndern Sie die Methode nicht mit dem Quelltext-Editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.label1 = new System.Windows.Forms.Label();
			this.button1 = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.label1.Location = new System.Drawing.Point(24, 48);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(224, 40);
			this.label1.TabIndex = 0;
			this.label1.Text = "Testaction";
			// 
			// button1
			// 
			this.button1.DialogResult = System.Windows.Forms.DialogResult.OK;
			this.button1.Location = new System.Drawing.Point(104, 168);
			this.button1.Name = "button1";
			this.button1.TabIndex = 1;
			this.button1.Text = "Ok";
			// 
			// ActionTest
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(352, 333);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.label1);
			this.Name = "ActionTest";
			this.Text = "FormActionTest";
			this.ResumeLayout(false);
		}
		#endregion
	}
}
�  d   ��
 J V C S M A K P L U G I N _ C S _ F O R M S R C _ A C T I O N T E S T       0         ﻿<?xml version="1.0" encoding="utf-8"?>
<root>
  <!-- 
    Microsoft ResX Schema 
    
    Version 1.3
    
    The primary goals of this format is to allow a simple XML format 
    that is mostly human readable. The generation and parsing of the 
    various data types are done through the TypeConverter classes 
    associated with the data types.
    
    Example:
    
    ... ado.net/XML headers & schema ...
    <resheader name="resmimetype">text/microsoft-resx</resheader>
    <resheader name="version">1.3</resheader>
    <resheader name="reader">System.Resources.ResXResourceReader, System.Windows.Forms, ...</resheader>
    <resheader name="writer">System.Resources.ResXResourceWriter, System.Windows.Forms, ...</resheader>
    <data name="Name1">this is my long string</data>
    <data name="Color1" type="System.Drawing.Color, System.Drawing">Blue</data>
    <data name="Bitmap1" mimetype="application/x-microsoft.net.object.binary.base64">
        [base64 mime encoded serialized .NET Framework object]
    </data>
    <data name="Icon1" type="System.Drawing.Icon, System.Drawing" mimetype="application/x-microsoft.net.object.bytearray.base64">
        [base64 mime encoded string representing a byte array form of the .NET Framework object]
    </data>
                
    There are any number of "resheader" rows that contain simple 
    name/value pairs.
    
    Each data row contains a name, and value. The row also contains a 
    type or mimetype. Type corresponds to a .NET class that support 
    text/value conversion through the TypeConverter architecture. 
    Classes that don't support this are serialized and stored with the 
    mimetype set.
    
    The mimetype is used forserialized objects, and tells the 
    ResXResourceReader how to depersist the object. This is currently not 
    extensible. For a given mimetype the value must be set accordingly:
    
    Note - application/x-microsoft.net.object.binary.base64 is the format 
    that the ResXResourceWriter will generate, however the reader can 
    read any of the formats listed below.
    
    mimetype: application/x-microsoft.net.object.binary.base64
    value   : The object must be serialized with 
            : System.Serialization.Formatters.Binary.BinaryFormatter
            : and then encoded with base64 encoding.
    
    mimetype: application/x-microsoft.net.object.soap.base64
    value   : The object must be serialized with 
            : System.Runtime.Serialization.Formatters.Soap.SoapFormatter
            : and then encoded with base64 encoding.

    mimetype: application/x-microsoft.net.object.bytearray.base64
    value   : The object must be serialized into a byte array 
            : using a System.ComponentModel.TypeConverter
            : and then encoded with base64 encoding.
    -->
  <xsd:schema id="root" xmlns="" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
    <xsd:element name="root" msdata:IsDataSet="true">
      <xsd:complexType>
        <xsd:choice maxOccurs="unbounded">
          <xsd:element name="data">
            <xsd:complexType>
              <xsd:sequence>
                <xsd:element name="value" type="xsd:string" minOccurs="0" msdata:Ordinal="1" />
                <xsd:element name="comment" type="xsd:string" minOccurs="0" msdata:Ordinal="2" />
              </xsd:sequence>
              <xsd:attribute name="name" type="xsd:string" msdata:Ordinal="1" />
              <xsd:attribute name="type" type="xsd:string" msdata:Ordinal="3" />
              <xsd:attribute name="mimetype" type="xsd:string" msdata:Ordinal="4" />
            </xsd:complexType>
          </xsd:element>
          <xsd:element name="resheader">
            <xsd:complexType>
              <xsd:sequence>
                <xsd:element name="value" type="xsd:string" minOccurs="0" msdata:Ordinal="1" />
              </xsd:sequence>
              <xsd:attribute name="name" type="xsd:string" use="required" />
            </xsd:complexType>
          </xsd:element>
        </xsd:choice>
      </xsd:complexType>
    </xsd:element>
  </xsd:schema>
  <resheader name="resmimetype">
    <value>text/microsoft-resx</value>
  </resheader>
  <resheader name="version">
    <value>1.3</value>
  </resheader>
  <resheader name="reader">
    <value>System.Resources.ResXResourceReader, System.Windows.Forms, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</value>
  </resheader>
  <resheader name="writer">
    <value>System.Resources.ResXResourceWriter, System.Windows.Forms, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089</value>
  </resheader>
  <data name="label1.Locked" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="label1.Modifiers" type="System.CodeDom.MemberAttributes, System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>Private</value>
  </data>
  <data name="button1.Locked" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="button1.Modifiers" type="System.CodeDom.MemberAttributes, System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>Private</value>
  </data>
  <data name="$this.TrayLargeIcon" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="$this.TrayHeight" type="System.Int32, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>80</value>
  </data>
  <data name="$this.SnapToGrid" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>True</value>
  </data>
  <data name="$this.DrawGrid" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>True</value>
  </data>
  <data name="$this.Locked" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="$this.GridSize" type="System.Drawing.Size, System.Drawing, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a">
    <value>8, 8</value>
  </data>
  <data name="$this.Localizable" type="System.Boolean, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>False</value>
  </data>
  <data name="$this.Language" type="System.Globalization.CultureInfo, mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
    <value>(Default)</value>
  </data>
</root>