   M S B A M L   `   `   `  ���� B  >Workath, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WorkathWorkath  b ^PresentationFramework.Aero2, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35hKclr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.Aero2Microsoft.Windows.Themes W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   ComboBox.Static.Background  �� Color  ComboBox.Static.Border  ComboBoxToggleButton �� 
TargetType �� Property �� Value �� 
TargetType ��Name J� SnapsToDevicePixels F�Name �� Path	 �� RelativeSource
 �� AncestorType  ComboBoxTemplate �Name � ColumnDefinitions �Name � AllowsTransparency �� Mode5   /Microsoft.Windows.Themes.SystemDropShadowChrome   Name    Color �� MaxDropDownHeight �� ElementName ��Name �� ClearTypeHint ��Name ��Name ��Name-  'System.Windows.Input.KeyboardNavigation   DirectionalNavigation d�Name d� 	IsChecked ��Name �� SelectionBoxItemTemplate �� SelectionBoxItem# �� SelectionBoxItemStringFormat  �� ContentStringFormat! J� IsHitTestVisible" �� Triggers# P� 
SourceName$ P� Property% P� Value& �� 
TargetName' ]� 
Conditions( �� Property) �� Value  ComboBoxItemContainerStyle  DataGridComboBoxStyle�� H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      :x,http://schemas.microsoft.com/winfx/2006/xaml     localclr-namespace:Workath  UthemeKclr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.Aero2  %�	  &	        &	      &	 ,     7   7  7  &	     7  &	 �    &	 #    7   7  7  �� $  Transparent���� $  	#FFACACAC���� " d�.���  �@�OverridesDefaultStyle$
 true����  � ��$ false����  � |�$ false����  �@��	ClickMode$ Press=���  � �� �� " d�.R��� $ templateRoot��8��  #��z��8�� $
 true��._��� $ splitBorder��$��0q�8�� $��Right=�$	��0,2q�$
 true��#��� r�._�F� $ arrow��F����        ���( ��( јaQ     јaQ P����̰( � �    P����        $��Center=�$��0q�$��Center=����� $ 
Foreground�	 �� 
 DataGridCell�� " ��.R�� $ templateRoot��$
 true�� �� $��* ��� #��� r�$��0 �.+�� $ 
PART_Popup��$
 true��$��2��$��1q�$��Bottom=�#��� .����� *IsDropDownOpen+$ TwoWay=�	 �� *TemplatedParent+.��   $ shadow��$ Transparent��#��z ���� *ActualWidth+$ templateRoot��._��� $ dropDownBorder��#��� ��$��1q�#��� ��._��� $ DropDownScrollViewer��.��� $
 grid��$ Enabled=�.+��� $ canvas��$
��Left=�$��0��$	��Top=�$��0��.+��� $ 
opaqueRect������ *
Background+$ dropDownBorder������ *ActualHeight+$ dropDownBorder������ *ActualWidth+$ dropDownBorder���� $ ItemsPresenter��$ 	Contained=�# z d� $ toggleButton��#��z��#��z��#��z��$��2��8��   �� *IsDropDownOpen+$ TwoWay=�	 �� *TemplatedParent+�� $ contentPresenter��#��z #��z #��z��#  z #��z��$! false��#��z��# z #��z��" P� $# 
PART_Popup��$ �@�HasDropShadow$
% true��. ��� $& shadow�� � ��$ 0,0,5,5q��� $& shadow�� �@  Color$ 	#71000000��P� $ �@��HasItems$% false��. ��� $& dropDownBorder�� � ��$ 95��]� ' �� ( �@��
IsGrouping$
) true���� "( �@%�IsVirtualizingWhenGrouping$) false��./���  � ��$ false��P� $# DropDownScrollViewer��$ � ��$% false��. ��� $& 
opaqueRect�� �� *VerticalOffset+$ DropDownScrollViewer�� �@��Top�� $& 
opaqueRect�� �� *HorizontalOffset+$ DropDownScrollViewer�� �@��Left�� " ��.���  � ��
 �   ��� " ��.���  � ��8   ��  � �� �� $ 
Foreground�	 �� 
 DataGridCell��  � ��8  ��  � ��$ 0q���  � ��$
 Auto=���  � ��$
 Auto=���  � ��$	 3,0q���  � ��$
 true����  �@��PanningMode$
 Both=���  �@��IsFlicksEnabled$ False����  � ��8  