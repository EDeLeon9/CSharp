   M S B A M L   `   `   `  ����B  >Workath, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WorkathWorkath  5      b ^PresentationFramework.Aero2, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35hKclr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.Aero2Microsoft.Windows.Themes 5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   ComboBox.Static.Background  �� Color  ComboBox.Static.Border  ComboBoxToggleButton �� 
TargetType �� Property �� Value �� 
TargetType ��Name J� SnapsToDevicePixels F�Name �� Path	 �� RelativeSource
 �� AncestorType  ComboBoxTemplate �Name � ColumnDefinitions �Name � AllowsTransparency �� Mode5   /Microsoft.Windows.Themes.SystemDropShadowChrome   Name    Color �� MaxDropDownHeight �� ElementName ��Name �� ClearTypeHint ��Name ��Name ��Name-  'System.Windows.Input.KeyboardNavigation   DirectionalNavigation d�Name d� 	IsChecked ��Name �� SelectionBoxItemTemplate �� SelectionBoxItem# �� SelectionBoxItemStringFormat  �� ContentStringFormat! J� IsHitTestVisible" �� Triggers# P� 
SourceName$ P� Property% P� Value& �� 
TargetName' ]� 
Conditions( �� Property) �� Value  ComboBoxItemContainerStyle  DataGridComboBoxStyle�� 5      H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      :x,http://schemas.microsoft.com/winfx/2006/xaml     5      localclr-namespace:Workath  5      UthemeKclr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.Aero2  5      %  &	        &	 %     &	 H     7   7  7  &	 #    7  &	 �    &	 1    7   7  7  �� 5      $  Transparent��69   �� 5      $  	#FFACACAC��65   �� 5	      " d�6)   .�5
   
   ��  �@�OverridesDefaultStyle$
 true��62   �� 5   
    � ��$ false��6&   �� 5   
    � |�$ false��6&   �� 5   
    �@��	ClickMode$ Press=�6&   �� 5   
    � �� 5      �� 5      " d�6"   .R�5      �� $ templateRoot��6   8��  #��z��6l   8�� $
 true��6�   ._�5      �� $ splitBorder��6!   $��0q�66   8�� $��Right=�6�   $	��0,2q�6�   $
 true��6�   #��� r�6�   ._�5      F� $ arrow��6#   F����        ���( ��( јaQ     јaQ P����̰( � �    P����        $��Center=�6�   $��0q�6  $��Center=�6  ��6�   �� $ 
Foreground�	 �� 
 DataGridCell6  5      5      5      5      5      �� 5      " ��6/   .R�5   
   � $ templateRoot��6   $
 true��6%    5      �� 5      $��* �6#   �� 5      #��� r�6#   $��0 �6v   .+�5!      � $ 
PART_Popup��6   $
 true��6(   $��2��6B   $��1q�6�   $��Bottom=�6�   #��� .�6�   ��6V   �� *IsDropDownOpen+$ TwoWay=�	 �� *TemplatedParent+.��5"         $ shadow��6/   $ Transparent��6?   #��z 6�   ��6S   �� *ActualWidth+$ templateRoot��._�5#      �� $ dropDownBorder��6   #��� ��65   $��1q�6{   #��� ��6�   ._�5$      �� $ DropDownScrollViewer��6'   .��5%      � $
 grid��6#   $ Enabled=�61   .+�5&   "   �� $ canvas��6)   $
��Left=�69   $��0��6T   $	��Top=�6_   $��0��6w   .+�5'   &   �� $ 
opaqueRect��60   ��6D   �� *
Background+$ dropDownBorder����6|   �� *ActualHeight+$ dropDownBorder����6�   �� *ActualWidth+$ dropDownBorder��5(   #   �� 5)   "   $ ItemsPresenter��61   $ 	Contained=�6I   # z 6~   5*      5+      5,      5-      5.      d� 5/      $ toggleButton��6   #��z��61   #��z��6[   #��z��6�   $��2��6�   8��   6�   �� *IsDropDownOpen+$ TwoWay=�	 �� *TemplatedParent+62  �� 50      $ contentPresenter��6   #��z 69   #��z 6v   #��z��6�   #  z 6�   #��z��6)  $! false��6l  #��z��6�  # z 6�  #��z��6�  51      " 52   
   P� 53      $# 
PART_Popup��6/   $ �@�HasDropShadow$
% true��6G   . �54      �� $& shadow��6+    � ��$ 0,0,5,5q�6?   �� 55      $& shadow��6*    �@  Color$ 	#71000000��6>   56      P� 57      $ �@��HasItems$% false��6*   . �58      �� $& dropDownBorder��6+    � ��$ 95��6G   59      ]� 5:      ' 5;      �� 5<      ( �@��
IsGrouping$
) true��66   �� 5=      "( �@%�IsVirtualizingWhenGrouping$) false��6X   ./�5?      ��  � ��$ false��6B   5@      P� 5A      $# DropDownScrollViewer��6?   $ � ��$% false��6a   . �5B      �� $& 
opaqueRect��6/    6G   �� *VerticalOffset+$ DropDownScrollViewer�� �@��Top�� 5C      $& 
opaqueRect��60    6H   �� *HorizontalOffset+$ DropDownScrollViewer�� �@��Left5D      5F      �� 5H      " ��6/   .�5I   
   ��  � ��
 �   �6'   5J      �� 5L      " ��6*   .�5M   
   ��  � ��8   6'   �� 5N   
    � �� 6'   �� $ 
Foreground�	 �� 
 DataGridCell�� 5O   
    � ��8  6/   �� 5P   
    � ��$ 0q�6,   �� 5Q   
    � ��$
 Auto=�6G   �� 5R   
    � ��$
 Auto=�6E   �� 5S   
    � ��$	 3,0q�6$   �� 5T   
    � ��$
 true��6:   �� 5U   
    �@��PanningMode$
 Both=�65   �� 5V   
    �@��IsFlicksEnabled$ False��63   �� 5W   
    � ��8  6%   5^      5`      