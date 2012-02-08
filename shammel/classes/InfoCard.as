﻿package shammel.classes{	import flash.display.*;	import flash.events.*;	import flash.net.*;	import flash.text.*;		public class InfoCard extends Sprite	{		[Embed(source="../../fonts/HelveticaNeueLTStd-Roman.otf", embedAsCFF="false", fontWeight="roman", fontName="dieHaasNeueGrotesk", mimeType="application/x-font", unicodeRange="U+0020-U+007D, U+00BB")]		private var dieHaasNeueGrotesk:Class;				[Embed(source="../../resources/images/portfolio_logo.png")]		private var Logo:Class;						private var pData:Object;		private var leadingLetterSpacing:TextFormat;		private var format1:TextFormat;		private var format2:TextFormat;		private var format3:TextFormat;		private var txtField:TextField;		private var background:Sprite;		private var chevron:Sprite;		private var txtfieldMargin:Number = 30;		private var logo:Bitmap;				//public var				public function InfoCard(prjData:Object, createChevron:Boolean = false):void		{			pData =							prjData;						if(createChevron)			{				plotChevron();			}else			{				logo = new Logo();				addChildAt(logo, this.numChildren);			}									Font.registerFont(dieHaasNeueGrotesk);						leadingLetterSpacing =					new TextFormat();			leadingLetterSpacing.leading =			pData.textfieldLeading;			leadingLetterSpacing.letterSpacing =	pData.textfieldLetterSpacing;						format1 =								new TextFormat();			format1.font =							"dieHaasNeueGrotesk";			format1.color =							pData.color1;			format1.size =							pData.fontSize;						format2 =								new TextFormat();			format2.font =							"dieHaasNeueGrotesk";			format2.color =							pData.color2;			format2.size =							pData.fontSize;						format3 =								new TextFormat();			format3.font =							"dieHaasNeueGrotesk";			format3.color =							pData.color3;			format3.size =							pData.fontSize;						txtField =								new TextField();			txtField.defaultTextFormat =			leadingLetterSpacing;			txtField.embedFonts =					true;			txtField.multiline =					true;			txtField.autoSize =						TextFieldAutoSize.LEFT;			txtField.width =						pData.textfieldWidth;			//txtField.border = true;			txtField.wordWrap =						true;			txtField.selectable =					false;			txtField.antiAliasType = 				AntiAliasType.ADVANCED;			txtField.defaultTextFormat =			format2;						txtField.htmlText =						pData.artistName;			if(pData.artistCo)			{				txtField.htmlText +=				pData.artistCo;			}			txtField.htmlText +=					"<a href='mailto:" + pData.artistEmail + "'>" + pData.artistEmail + "</a>";			txtField.htmlText +=					pData.artistPhone;			txtField.htmlText +=					"\n" + pData.artistBio;			txtField.setTextFormat(format3, txtField.length - pData.artistBio.length, txtField.length);			txtField.htmlText +=					"\n";			txtField.htmlText +=					"<a href='" + pData.resumeURL + "' target='_blank'>" + pData.resumeLabel + "</a>";			txtField.setTextFormat(format1, txtField.length - pData.resumeLabel.length, txtField.length);						txtField.x = pData.textfieldLeftMargin;			txtField.y = pData.portfolioHeight - txtField.height - pData.textfieldBottomMargin;						drawBackground();			if(createChevron)			{				addChild(chevron);			}			addChild(txtField);			addChildAt(background, 0);		}				private function plotChevron():void		{			chevron = new Sprite();			with(chevron.graphics)			{				moveTo(0,0);				beginFill(pData.color1);				lineTo(90,0);				lineTo(250,162);				lineTo(90,326);				lineTo(0,326);				lineTo(160,162);				lineTo(0,0);				endFill();			}		}				private function drawBackground():void		{			background = new Sprite();			with(background.graphics)			{				beginFill(0x0000FF, 0);				drawRect(pData.textfieldLeftMargin,0,pData.textfieldWidth, pData.portfolioHeight);				endFill();			}		}	}}