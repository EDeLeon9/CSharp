   M S B A M L   `   `   `  ����b  ^PresentationFramework.Aero2, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35hKclr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.Aero2Microsoft.Windows.Themes  5      O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem 5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089  �� MergedDictionaries �� Source   ComboBox.Static.Background �� Color  ComboBox.Static.Border  ComboBox.Static.Glyph ' #ComboBox.Static.Editable.Background # ComboBox.Static.Editable.Border . *ComboBox.Static.Editable.Button.Background * &ComboBox.Static.Editable.Button.Border ! ComboBox.MouseOver.Background  ComboBox.MouseOver.Border 	 ComboBox.MouseOver.Glyph *
 &ComboBox.MouseOver.Editable.Background & "ComboBox.MouseOver.Editable.Border 1 -ComboBox.MouseOver.Editable.Button.Background �� EndPoint �� 
StartPoint � Color � Offset - )ComboBox.MouseOver.Editable.Button.Border  ComboBox.Pressed.Background  ComboBox.Pressed.Border  ComboBox.Pressed.Glyph ( $ComboBox.Pressed.Editable.Background $  ComboBox.Pressed.Editable.Border / +ComboBox.Pressed.Editable.Button.Background + 'ComboBox.Pressed.Editable.Button.Border   ComboBox.Disabled.Background  ComboBox.Disabled.Border  ComboBox.Disabled.Glyph ) %ComboBox.Disabled.Editable.Background % !ComboBox.Disabled.Editable.Border 0 ,ComboBox.Disabled.Editable.Button.Background , (ComboBox.Disabled.Editable.Button.Border  comboBoxButtonWidth  Button.Pressed.Background  ComboBoxToggleButton �� 
TargetType �� Property	 �� Value
 �� 
TargetType ��Name J� SnapsToDevicePixels F�Name �� Triggers P� Property P� Value �� 
TargetName  comboBoxTemplate �Name � ColumnDefinitions �Name � AllowsTransparency �� Mode �� RelativeSource5    /Microsoft.Windows.Themes.SystemDropShadowChrome   Name    Color �� MaxDropDownHeight �� ElementName ��Name � 	Resources   scrollBarStyle �� BasedOn �� ClearTypeHint  ��Name! ��Name" ��Name-  'System.Windows.Input.KeyboardNavigation#   DirectionalNavigation$ d�Name% d� 	IsChecked& ��Name' �� SelectionBoxItemTemplate( �� SelectionBoxItem#) �� SelectionBoxItemStringFormat* �� ContentStringFormat+ J� IsHitTestVisible, P� 
SourceName- ]� 
Conditions. �� Property/ �� Value ! TextBox.Static.Background " ComboBoxEditableTextBox # comboBoxEditableTemplate0 ��Name1 �� 
IsReadOnly�� 5      F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     :x,http://schemas.microsoft.com/winfx/2006/xaml     5      UthemeKclr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.Aero2  5      1system&clr-namespace:System;assembly=mscorlib  5        5      �� 5   
   $ ScrollBarStyle.xaml?�6   %&  &	        &	 !     &	 C     &	 b     &	 �     &	 �     &	 �     &	 �     &	     &		 6    &	
 Y    &	 |    &	 �    &	 ;    &	 ^    &	     &	 �    &	 �    &	 �    &	     &	 �    &	 �    &	 �    &	     &	 3    &	 V    &	 y    &	 �    &	 �    &	 �    &	 u    7   7  7  7 	 7 	 7  7  7  7  &	 �    7  7   7   7  7  7  7  7  &	! i    &	" �    &	# �    7  7   7   7  7 ! 7 " 7  7  7  7  �� 5      $ #303030��69   �� 5      $ DarkGray��65   �� 5      $ White��64   �� 5      $ 	#FFFFFFFF��6B   �� 5      $ 	#FFABADB3��6>   �� 5      $ Transparent��6I   �� 5      $ Transparent��6E   �� 5      $ #303030��6<   �� 5      $ 	#FF7EB4EA��68   �� 5      $ 	#FF7EB4EA��67   �� 5      $ 	#FFFFFFFF��6E   �� 5       $ 	#FF7EB4EA��6A   �� 5!      $	 0,1&�6P   $	 0,0&�6_   .��5"   
   � $ 	#FFEBF4FC��6   $	 0.0Q�6)   � 5#   
   $ 	#FFDCECFC��6   $	 1.0Q�6)   5$      �� 5%      $ 	#FF7EB4EA��6H   �� 5*      $ #303030��6:   �� 5+      $ 	#FF569DE5��66   �� 5-      $ 	#FF569DE5��65   �� 5.      $ 	#FFFFFFFF��6C   �� 5/      $ 	#FF569DE5��6?   �� 50      $	 0,1&�6N   $	 0,0&�6]   .��51   
   � $ 	#FFDAEBFC��6   $	 0.0Q�6)   � 52   
   $ 	#FFC4E0FC��6   $	 1.0Q�6)   53      �� 54      $ 	#FF569DE5��6F   �� 55      $ 	#FFF0F0F0��6;   �� 56      $ 	#FFD9D9D9��67   �� 57      $ 	#FFBFBFBF��66   �� 58      $ 	#FFFFFFFF��6D   �� 59      $ 	#FFBFBFBF��6@   �� 5:      $ Transparent��6K   �� 5;      $ Transparent��6G   X�5>      20Q�64   �� 5A      $ 0.5,0&�6<   $ 0.5,1&�6O   .��5B   
   � $ #1A1A1A��6   $ 0Q�6'   � 5C   
   $ #3B3B3B��6   $ 1Q�6'   5D      �� 5F      " d�6)   .�5G   
   ��  �@�OverridesDefaultStyle$
	 true��62   �� 5H   
    � ��$	 false��6&   �� 5I   
    � |�$	 false��6&   �� 5J   
    �@��	ClickMode$	 Press=�6&   �� 5K   
    � ��	 5L      �� 5M      "
 d�6"   .R�5N      �� $ templateRoot��6   8��  #��z��6l   8�� $
 true��6�   ._�5P      �� $ splitBorder��6!   $��1q�66   
������ $��Right=�6d   $��0q�6�   $
 true��6�   8�� ._�5T      � .+�5V   "   �� $ border��6)   #��z��69   #��z��6c   #��z��6�   $
 true��6�   �� 5W   "   $��1,1,0,0q�6)   ���	#64FFFFFF6C   �� 5X   "   $��0,0,1,1q�6)   ���	#7F0000006C   � 5Y   "   $��1q�6'   .+�5Z   &   �� $��1,1,0,0q�6-   ���	#20FFFFFF6G   �� 5[   &   $��0,0,1,1q�6-   ���	#200000006G   5\   #   �� 5]   "   $ layer��6)   
������ #��z��6Q   $��1q�6}   F� 5_   "   $ arrow��6'   F����        ���( ��( јaQ     јaQ P����̰( � �    P����        #��z��6�   $��Center=�6�   $��0q�6�   $��Center=�6�   5`      5a      5b       5c      P� 5p       �@J�IsMouseOver$
 true��69   . �5q      �� $ arrow��65   8	   � ��6H   �� 5s      $ layer��6;    � ��	 �	#28569DE56N   �� 5t      $ layer��6<   8	   � ��6O   5u      P� 5�       � ��$
 true��67   . �5�      �� $ arrow��65   8	   � ��6H   �� 5�      $ border��6;   8	   � ��6O   �� 5�      $ layer��6<   8	   � ��6O   5�      P� 5�       � {�$ false��67   . �5�      �� $ arrow��65   8	   � ��6H   5�      5�      5�      5�      �� 5�      "
 ��6/   .R�5�   
   � $ templateRoot��6   $
 true��6%    5�      �� 5�      $��* �6#   �� 5�      8��  $��0 �6S   .+�5�      � $ 
PART_Popup��6   $
 true��6(   $��2��6B   $��1q�6�   $��Bottom=�6�   #��� .�6�   ��6V   �� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+.��5�         $ shadow��6/   $ Transparent��6?   #��z 6�   ��6S   �� *ActualWidth+$ templateRoot��._�5�      �� $ dropDownBorder��6   8�� $��1q�6n   #��� ��6�   ._�5�      �� $ DropDownScrollViewer��6'    5�      ���� 5�   "   '��       " ��6(   8  6?   5�      .��5�      � $
 grid��6#   $ Enabled=�61   .+�5�   "   �� $  canvas��6)   $
��Left=�69   $��0��6T   $	��Top=�6_   $��0��6w   .+�5�   &   �� $! 
opaqueRect��60   ��6D   �� *
Background+$ dropDownBorder����6|   �� *ActualHeight+$ dropDownBorder����6�   �� *ActualWidth+$ dropDownBorder��5�   #   �� 5�   "   $" ItemsPresenter��61   $# 	Contained=�6I   # z 6~   5�      5�      5�      5�      5�      d� 5�      $$ toggleButton��6   #��z��61   #��z��6[   #��z��6�   $��2��6�   8�� % 6�   �� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+62  �� 5�      $& contentPresenter��6   #��z' 69   #��z( 6v   #��z��6�   #* z) 6�   #��z��6)  $+ false��6l  #��z��6�  # z 6�  #��z��6�  5�       5�   
   P� 5�      $, 
PART_Popup��6/    �@�HasDropShadow$
 true��6G   . �5�      �� $ shadow��6+    � ��$	 0,0,5,5q�6?   �� 5�      $ shadow��6*    �@  Color$	 	#71000000��6>   5�      P� 5�       �@��HasItems$ false��6*   . �5�      �� $ dropDownBorder��6+    � ��$	 95��6G   5�      ]� 5�      - 5�      �� 5�      . �@��
IsGrouping$
/ true��66   �� 5�      ". �@%�IsVirtualizingWhenGrouping$/ false��6X   ./�5�      ��  � ��$	 false��6B   5�      P� 5�      $, DropDownScrollViewer��6?    � ��$ false��6a   . �5�      �� $ 
opaqueRect��6/   	 6G   �� *VerticalOffset+$ DropDownScrollViewer�� �@��Top�� 5�      $ 
opaqueRect��60   	 6H   �� *HorizontalOffset+$ DropDownScrollViewer�� �@��Left5�      P� 5�      $, 
PART_Popup��6(    � ��$
 True��6@   . �5�      �� $ toggleButton��6   8	   � ��6I   �� 5�      $ toggleButton��6   8	   � ��6I   �� 5�      $ toggleButton��6   8	   � ��6J   5�      P� 5�       � {�$ False��6+   . �5�      �� $ toggleButton��6,    �@J�Opacity$
	 0.56Q�6F   �� 5�      8	   � ��6;   5�      5�      �� 5�      $ #303030��68   �� 5�      " ��6,   .�5   
   ��  �@�OverridesDefaultStyle$
	 true��62   �� 5  
    �@J�	AllowDrop$
	 true��6&   �� 5  
    � ��$	 0��6%   �� 5  
    � ��$	 0��6&   �� 5  
    �@�FocusVisualStyle	 6-   Z� �� 5  
    �@��PanningMode$	 VerticalFirst=�65   �� 5  
    �@��IsFlicksEnabled$	 False��63   �� 5  
    �@��
CaretBrush
	 �����6'   �� 5	  
    � ��	 5
     �� 5     "
 ��6"   .R�5     �� $ PART_ContentHost��6#   
������ $|�false��6V   $��Hidden=�6h   $��Hidden=�6�   5     5     5     �� 5     "
 ��67   .R�5  
   � $ templateRoot��6   $
 true��6%    5     �� 5     $��* �6#   �� 5     8��  $��0 �6S   .+�5     � $ 
PART_Popup��6   $
 true��6(   $��2��6B   $��Bottom=�6�   #��� .�6�   ��6V   �� *IsDropDownOpen+ �� *TemplatedParent+.��5        $ shadow��6/   $ Transparent��6?   #��z 6�   ��6S   �� *ActualWidth+$ templateRoot��._�5     �� $ dropDownBorder��6   8�� $��1q�6n   #��� ��6�   ._�5     �� $ DropDownScrollViewer��6'    5     ���� 5   "   '��       " ��6(   8  6?   5!     .��5"     � $
 grid��6#   $ Enabled=�61   .+�5#  "   �� $  canvas��6)   $
��Left=�69   $��0��6T   $	��Top=�6_   $��0��6w   .+�5$  &   �� $! 
opaqueRect��60   ��6D   �� *
Background+$ dropDownBorder����6|   �� *ActualHeight+$ dropDownBorder����6�   �� *ActualWidth+$ dropDownBorder��5%  #   �� 5&  "   $" ItemsPresenter��61   $# 	Contained=�6I   # z 6~   5'     5(     5)     5*     5+     d� 5,     $$ toggleButton��6   #��z��61   #��z��6[   #��z��6�   $��2��6�   8�� % 6�   �� *IsDropDownOpen+$ TwoWay=� �� *TemplatedParent+62  �� 5-     $ border��6   8�� #��z��6]   ._�5.     �� $0 PART_EditableTextBox��6   #��z��68   #��z��6�   8�� #��z��6)  1 6�   �� *
IsReadOnly+ �� *TemplatedParent+6)  5/     50      51  
   P� 55      �@J�IsKeyboardFocusWithin$
 true��67   . �57     ��  � ��
	 �����6/   58     P� 59     $, 
PART_Popup��6/    �@�HasDropShadow$
 true��6G   . �5:     �� $ shadow��6+    � ��$	 0,0,5,5q�6?   �� 5;     $ shadow��6*    �@  Color$	 	#71000000��6>   5<     P� 5=      �@��HasItems$ false��6*   . �5>     �� $ dropDownBorder��6+    � ��$	 95��6G   5?     ]� 5@     - 5A     �� 5B     . �@��
IsGrouping$
/ true��66   �� 5C     ". �@%�IsVirtualizingWhenGrouping$/ false��6X   ./�5E     ��  � ��$	 false��6B   5F     P� 5G     $, DropDownScrollViewer��6?    � ��$ false��6a   . �5H     �� $ 
opaqueRect��6/   	 6G   �� *VerticalOffset+$ DropDownScrollViewer�� �@��Top�� 5I     $ 
opaqueRect��60   	 6H   �� *HorizontalOffset+$ DropDownScrollViewer�� �@��Left5J     P� 5L     $, 
PART_Popup��6(    � ��$
 True��6@   . �5M     �� $ toggleButton��6   8	   � ��6I   �� 5N     $ toggleButton��6   8	   � ��6I   �� 5O     $ toggleButton��6   8	   � ��6J   5P     P� 5R      � {�$ False��6+   . �5S     �� $ toggleButton��6,    �@J�Opacity$
	 0.56Q�6F   �� 5T     $ border��6/    � ��
	 ���� 6C   �� 5U     8	 	  � ��6;   5V     5X     5\     