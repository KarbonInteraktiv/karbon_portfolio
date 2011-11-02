﻿package shammel.classes{	import flash.display.*;	import flash.events.*;	import caurina.transitions.*;		public class ScrollbarH extends Sprite	{		private var scrollbar:Sprite;		private var track:Sprite;		private var thumb:Sprite;		private var thumbHit:Sprite;		private var thumbRadius:Number;		private var scrollContent:DisplayObject;		private var scrollContentX:Number;		private var scrollbarWidth:Number;		private var scrollbarHeight:Number;		private var thumbWidth:Number;		private var trackColor:uint;		private var thumbColor:uint;		private var thumbOffset:Number;		private var scrollNormal:Boolean;		private var scrollMin:Number;		private var scrollMax:Number;		private var scrollDist:Number;		private var thumbPos:Number = 	0;				public var tweenSpd:Number;						public function ScrollbarH(sbWidth:Number = 500, sbHeight:Number = 20, thWidth:Number = 66, trColor:uint = 0xC9AE52, thColor:uint = 0x000000, thRadius:Number = 0, twnSpd:Number = 1, sbGlide:Number = .8):void		{			//process class arguments			thumbRadius = thRadius;			scrollbarWidth = sbWidth;			scrollbarHeight = sbHeight;			thumbWidth = thWidth;			trackColor = trColor;			thumbColor = thColor;			tweenSpd = twnSpd;			init();		}				private function init():void		{			//draw scrollbar			track = new Sprite();			with(track.graphics)			{				lineStyle();				beginFill(trackColor);				drawRect(0,0,scrollbarWidth,scrollbarHeight);				endFill();			}			addChild(track);			thumb = new Sprite();			with(thumb.graphics)			{				lineStyle();				beginFill(thumbColor);				drawRect(0,0,thumbWidth,scrollbarHeight);				endFill();			}			addChild(thumb);			thumbHit = new Sprite();			with(thumbHit.graphics)			{				lineStyle();				beginFill(0xFF0000, 0);				drawRect(0,0, thumb.width + (thumbRadius * 2), thumb.height + (thumbRadius * 2));				endFill();			}			//center thumbHit on thumb			thumbHit.x = thumb.x - thumbRadius;			thumbHit.y = thumb.y - thumbRadius;			thumbHit.buttonMode = true;			addChild(thumbHit);						//add event listeners			thumbHit.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);			track.addEventListener(MouseEvent.MOUSE_DOWN, trackClicked);						//mouseDown function			function mouseDown(e:MouseEvent):void			{				//trace(scrollContent.width);				//vx =			0;				//isDragging =	true;				scrollMin =		track.x;				scrollMax =		track.width - thumb.width;				thumbOffset =	mouseX - thumb.x;				stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);				stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp)			}						//trackClicked function			function trackClicked(e:MouseEvent):void			{								//follow mouse				thumb.x = mouseX;				thumbHit.x = thumb.x - thumbRadius;								//set thumb bounds				if(thumb.x <= track.x)				{					thumb.x = track.x;					thumbHit.x = thumb.x - thumbRadius;				}				if(thumb.x >= track.width - thumb.width)				{					thumb.x = track.width - thumb.width;					thumbHit.x = thumb.x - thumbRadius;				}								thumbPos = thumb.x/scrollMax;								//scroll content				Tweener.addTween(scrollContent, {x:(-(thumb.x/scrollMax) * (scrollContent.width - stage.stageWidth + (scrollContentX * 2)) + scrollContentX), time:tweenSpd});								//update screen				e.updateAfterEvent();			}						//mouseMove function			function mouseMove(e:MouseEvent):void			{				//follow mouse				thumb.x = mouseX - thumbOffset;				thumbHit.x = thumb.x - thumbRadius;								//set thumb bounds				if(thumb.x <= track.x)				{					thumb.x = track.x;					thumbHit.x = thumb.x - thumbRadius;				}				if(thumb.x >= track.width - thumb.width)				{					thumb.x = track.width - thumb.width;					thumbHit.x = thumb.x - thumbRadius;				}								thumbPos = thumb.x/scrollMax;								//scroll content				Tweener.addTween(scrollContent, {x:(-(thumb.x/scrollMax) * (scrollContent.width - stage.stageWidth + (scrollContentX * 2)) + scrollContentX), time:tweenSpd});												//scrollContent.x = (-(thumb.x/scrollMax) * (scrollDist) + scrollContentX);								//update screen				e.updateAfterEvent();			}						//mouseUp function			function mouseUp(e:MouseEvent):void			{				stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);				thumbPos =		thumb.x/scrollMax;			}		}				//scrollObject function		public function scrollObject(content:DisplayObject, scrollX:Number = 0):void		{			scrollNormal = true;			scrollContent = content;			scrollContentX = scrollX;		}				//scrollTo function		public function scrollTo(endOffset:Number, content:DisplayObject, scrollX:Number = 0):void		{			try			{				scrollNormal = false;				scrollDist = content.width - endOffset;				scrollContent = content;				scrollContentX = scrollX;			}catch(e:Error)			{				trace("caught error 1");			}		}				//resizeScrollbar function		public function resizeScrollbar(width:Number = 0):void		{			with(track.graphics)			{				clear();				lineStyle();				beginFill(trackColor);				drawRect(0,0,width,scrollbarHeight);				endFill();			}			scrollMin = track.x;			scrollMax = track.width - thumb.width;			Tweener.addTween(thumb, {x:thumbPos * scrollMax, time:tweenSpd/1.5});			Tweener.addTween(thumbHit, {x:(thumbPos * scrollMax) - thumbRadius, time:tweenSpd/1.5});			//trace(thumbPos * scrollMax);		}		public function alignContent():void		{			try			{				scrollContent.x = (-(thumb.x/scrollMax) * (scrollContent.width - stage.stageWidth + (scrollContentX * 2)) + scrollContentX);				//Tweener.addTween(scrollContent, {x:-(thumb.x/scrollMax) * (scrollDist) + scrollContentX, time:tweenSpd});			}catch(e:Error)			{				trace("caught error 2");			}		}	}}