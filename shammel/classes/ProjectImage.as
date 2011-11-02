﻿package shammel.classes{	import flash.display.*;	import flash.events.*;	import flash.text.*;	import flash.net.*;		public class ProjectImage extends Sprite	{		//[Embed(source="../../fonts/HelveticaNeueLTStd-Roman.otf", embedAsCFF="false", fontName="dieHaasNeueGrotesk", mimeType="application/x-font", unicodeRange="U+0020-U+007D")]		//private var dieHaasNeueGrotesk:Class;		private var txtField:TextField;		private var format1:TextFormat;		private var format2:TextFormat;		private var leadingLetterSpacing:TextFormat;				public var imageLoader:Loader;				public function ProjectImage():void		{			imageLoader =							new Loader();			addChild(imageLoader);					}				public function addLabel(prjData:Object, prjTitle:String, prjDesc:String):void		{			addChild(imageLoader);						leadingLetterSpacing =					new TextFormat();			leadingLetterSpacing.leading =			prjData.textfieldLeading;			leadingLetterSpacing.letterSpacing =	prjData.textfieldLetterSpacing;						txtField =								new TextField();			txtField.defaultTextFormat =			leadingLetterSpacing;			format1 =								new TextFormat();			format1.font =							"dieHaasNeueGrotesk";			format1.color =							prjData.color2;			format1.size =							prjData.fontSize;						format2 =								new TextFormat();			//format2.font =							"dieHaasNeueGrotesk";			format2.color =							prjData.color3;			//format2.size =							prjData.fontSize;						//txtField.defaultTextFormat =			leadingLetterSpacing;			txtField.embedFonts =					true;			txtField.multiline =					true;			txtField.autoSize =						TextFieldAutoSize.LEFT;			txtField.width =						this.width - prjData.textfieldLeftMargin;			//txtField.border = true;			txtField.wordWrap =						true;			txtField.selectable =					false;			txtField.antiAliasType = 				AntiAliasType.ADVANCED;			txtField.defaultTextFormat =			format1;						txtField.htmlText =						prjTitle + ": " + prjDesc;			txtField.setTextFormat(format2, txtField.length - prjDesc.length, txtField.length);			txtField.x = prjData.textfieldLeftMargin;			txtField.y = prjData.portfolioHeight + prjData.projectLabelTopMargin;			txtField.visible = false;			addChild(txtField);									addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent):void			{				txtField.visible = true;			});						addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent):void			{				txtField.visible = false;			});		}				public function setURL(url:String):void		{			if(url.length > 0)			{				this.buttonMode = true;				addEventListener(MouseEvent.CLICK, function(e:MouseEvent):void				{					navigateToURL(new URLRequest(url), "_blank");				});			}		}	}}