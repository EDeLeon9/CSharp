   M S B A M L   `   `   `  ���� W  SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   FocusVisual  �� Property �� Value �� StrokeDashArray J� SnapsToDevicePixels  ScrollBar.Static.Background �� Color  ScrollBar.Static.Border  ScrollBar.Static.Glyph  ScrollBar.Static.Thumb �� 
StartPoint �� EndPoint � Color � Offset " ScrollBar.MouseOver.Background  ScrollBar.MouseOver.Border  ScrollBar.MouseOver.Glyph  ScrollBar.MouseOver.Thumb  	 ScrollBar.Pressed.Background 
 ScrollBar.Pressed.Border  ScrollBar.Pressed.Thumb  ScrollBar.Pressed.Glyph ! ScrollBar.Disabled.Background  ScrollBar.Disabled.Border  ScrollBar.Disabled.Glyph  RepeatButtonTransparent	 �� 
TargetType
 �� 
TargetType  ScrollBarButton ��Name ��Name �� Triggers P� Property P� Value �� 
TargetName  thumbTemplate ��Name  ScrollBarThumbVertical  ScrollBarThumbHorizontal  scrollBarStyle �Name � RowDefinitions ��Name �� LineUpCommand F�Name �� Stretch ]�Name J� IsMouseOver ]� DecreaseRepeatButton �� PageUpCommand ]� IncreaseRepeatButton �� PageDownCommand ]� Thumb �� LineDownCommand  ^� 
Conditions! �� Binding" �� ElementName# �� Value$ �� Triggers% � ColumnDefinitions& �� LineLeftCommand' �� PageLeftCommand( �� PageRightCommand) �� LineRightCommand�� F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      :x,http://schemas.microsoft.com/winfx/2006/xaml      %�  &	        &	 R     &	 e     &	 x     &	 �     &	 �     &	 �     &	     &	     &		 +    &	
 >    &	 Q    &	 d    &	 w    &	 �    &	 �    &	 �    &	 k    7   7  7  7  7 	 7 
 7  7  &	 �    7  7  7  &	     &	 �    &	     7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  7  �� .���   � �� �� .R��� $��2q�$	 1 2R�$
 true��$��1��#��� ���� $ #303030���� $ #696969���� $ White���� $ 0.5,0&�$ 0.5,1&�.��� $ #6F6F6F��$ 0Q�� $ #4F4F4F��$ 1Q��� $ #A6A6A6���� $ #A6A6A6���� $ #000000���� $ #A6A6A6���� $ #606060���� $ #606060���� $ #606060���� $ #FFFFFF���� $ #303030���� $ #696969���� $ White���� "	 ��.���   �@�OverridesDefaultStyle$
 true����   � ��
 ���� ��   � |�$ false����   � ��$ false����   � �� �� "
 ��.R��� #��z��#��z��#��z���� "	 ��.���   �@�FocusVisualStyle8   ��   � ��$ 1q���   � ��$ Center=���   � ��$ Center=���   � ��$ 1q���   � |�$ false����   � ��$ false����   � �� �� "
 ��.R�� .+��� $ border��8�� $��1q�8�� $
 true��._��� $ contentPresenter��$|�False��#��z��#��z��# z #��z��� $��1q�.+��� $��1,1,0,0q����	#54FFFFFF�� $��0,0,1,1q����	#6F000000� $��1q�.+��� $��1,1,0,0q����	#10FFFFFF�� $��0,0,1,1q����	#10000000 P�  �@J�IsMouseOver$
 true��. ��� $ border��8    � ��P�  � ��$
 true��. ��� $ border��8    � ���� $ border��8    � ��P�  � {�$ false��. ��� $ border��  �@J�Opacity$
 0.44Q��� $ border��8    � ���� $ border��8    � ���� "
 n�.R�� .+��� $ 	rectangle��8��  #��z��$
 True��#��z���� $��1,1,0,0q����	#54FFFFFF�� $��0,0,1,1q����	#6F000000� $��1q�.+��� $��1,1,0,0q����	#10FFFFFF�� $��0,0,1,1q����	#10000000 P�  �@J�IsMouseOver$
 true��. ��� $ 	rectangle��8    � ��P�  �@n�
IsDragging$
 true��. ��� $ 	rectangle��8    � ���� "	 n�.���   �@�OverridesDefaultStyle$
 true����   � ��$ false����   � ��# �  ��   � ��$	 1,0q��� "	 n�.���   �@�OverridesDefaultStyle$
 true����   � ��$ false����   � ��# �  ��   � ��$	 0,1q��� "	 ��.���   �@��IsPressAndHoldEnabled$ false����   �@��IsFlicksEnabled$ false����   � ��8   ��   � ��8  ��   � ��# � ����   � ��$	 1,0q���   � ��# � r���   � ��# � r���   � �� �� "
 ��.R�� $ Bg��$
 true�� �� #��� q��� $��0.00001* ��� #��� q�.+��� #��z��#��z��#��z��$��1���� $ PART_LineUpButton��#��Z #{�z{�8�� .��F� $ ArrowTop�������     	= �     	= ��[ ��[ �    ��[ �g5 �%& �g5 �%& ��g5 �%& ��j ��[ ��j ��[ ���j ��[ ��j  	= ��j  	= ���j  	= �g5  � �g5  � ��g5  �  	=  	= 	8�� $��3,4,3,3q�$ Uniform=�]� $ 
PART_Track��#{�z $
��true��$��1�� �� #��Z 8��  �� #��Z 8��  n� 8�� �� $ PART_LineDownButton��#��Z #{�z{�$��2��8�� .��F� $ ArrowBottom�������    �%& �    �%&  �  � �     � �g5  	= �g5  	= ��g5  	= ��j  � ��j  � ���j  � ��j �%& ��j �%& ���j �%& �g5 ��[ �g5 ��[ ��g5 ��[ �%& �%& 	8�� $��3,4,3,3q�$ Uniform=� ^�   �� ! �� *IsMouseOver+$" PART_LineDownButton��# true�� ! �� *	IsPressed+$" PART_LineDownButton��# true.0��� $ ArrowBottom��8 	   � ��^�   �� ! �� *IsMouseOver+$" PART_LineUpButton��# true�� ! �� *	IsPressed+$" PART_LineUpButton��# true.0��� $ ArrowTop��8 
   � ��^�   �� ! �� *IsMouseOver+$" PART_LineDownButton��# true�� ! �� *	IsPressed+$" PART_LineDownButton��	# false.0��� $ ArrowBottom��8    � ��^�   �� ! �� *IsMouseOver+$" PART_LineUpButton��# true�� ! �� *	IsPressed+$" PART_LineUpButton��	# false.0��� $ ArrowTop��8    � ��P�  � {�$ false��. ��� $ ArrowTop��8    � ���� $ ArrowBottom��8    � ���� $ 
PART_Track��  �@J�Opacity$
 0.44Q�$ P�  �@��Orientation$ 
Horizontal=�. ���   � ��$
 Auto����   � ��$ 0����   � ��# � ����   � ��# � ����   � ��$	 0,1q���   � �� �� "
 ��.R�� $ Bg��$
 true��% �� #��� ���� $��0.00001* ��� #��� ��.+��� #��z��#��z��#��z��$��1���� $ PART_LineLeftButton��#��Z& #{�z{�8�� .��F� $ 	ArrowLeft���������0 ��j ���0 ��j @KL ��j @KL ��j �@KL ��j P� �g5 P� �g5 �P� �g5 @KL @KL �@KL     ��0 ��0 ���0     �g5 �g5 �    �g5 ��0 ��j ��0 ��j 	8�� $��3q�$ Uniform=�]� $ 
PART_Track��$��1��#{�z  �� #��Z' 8��  �� #��Z( 8��  n� 8�� �� $ PART_LineRightButton��#��Z) $��2��#{�z{�8�� .��F� $ 
ArrowRight�������P� ��j �P� ��j ��j ��j �    ��j ��0 �g5 ��0 �g5 ���0 �g5 �        P� P� �P�     @KL �g5 @KL �g5 �@KL �g5 P� ��j P� ��j 	8�� $��3q�$ Uniform=� ^�   �� ! �� *IsMouseOver+$" PART_LineRightButton��# true�� ! �� *	IsPressed+$" PART_LineRightButton��# true.0��� $ 
ArrowRight��8    � ��^�   �� ! �� *IsMouseOver+$" PART_LineLeftButton��# true�� ! �� *	IsPressed+$" PART_LineLeftButton��# true.0��� $ 	ArrowLeft��8    � ��^�   �� ! �� *IsMouseOver+$" PART_LineRightButton��# true�� ! �� *	IsPressed+$" PART_LineRightButton��	# false.0��� $ 
ArrowRight��8    � ��^�   �� ! �� *IsMouseOver+$" PART_LineLeftButton��# true�� ! �� *	IsPressed+$" PART_LineLeftButton��	# false.0��� $ 	ArrowLeft��8    � ��P�  � {�$ false��. ��� $ 	ArrowLeft��8    � ���� $ 
ArrowRight��8    � ���� $ 
PART_Track��  �@J�Opacity$
 0.44Q�