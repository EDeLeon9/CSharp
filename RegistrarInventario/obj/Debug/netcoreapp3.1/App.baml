   M S B A M L   `   `   `  ����N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5          RegistrarInventario.App   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      3local!clr-namespace:RegistrarInventario     5        �� 	Resources  5       �� MergedDictionaries �� Source   mainBackground �� Color  windowRectangleBackground $  defaultGradientControlBackground �� 
StartPoint �� EndPoint � Color � Offset+   %RegistrarInventario.DateTimeConverter  dateTimeConverter-   'RegistrarInventario.InvertBoolConverter  invertBoolConverter4   .RegistrarInventario.AddStringToDoubleConverter  addStringToDoubleConverter@   :RegistrarInventario.IntegerIsGreaterThanOneToBoolConverter * &integerIsGreaterThanOneToBoolConverter �� 
TargetType	 �� Property
 �� Value  comboBoxTemplate �� Triggers P� Property P� Value  comboBoxEditableTemplate 	 checkBoxTemplate 
 buttonTemplate  toggleButtonTemplate  tabItemTemplate&   System.Windows.Controls.DataGrid=  7System.Windows.Controls.Primitives.DataGridColumnHeader �� TextAlignment)  #System.Windows.Controls.DataGridRow  dataGridCellStyle*  $System.Windows.Controls.DataGridCell �� 
TargetType  listBoxItemMouseUpSelection  ElementStyleCenter  ElementStyleWrapping�� 5   
    5
      �� 5      $. (StylesAndTemplates\ComboBoxTemplate.xaml?�6%   �� 5      $. (StylesAndTemplates\CheckBoxTemplate.xaml?�6%   �� 5      $, &StylesAndTemplates\ButtonTemplate.xaml?�6%   �� 5      $2 ,StylesAndTemplates\ToggleButtonTemplate.xaml?�6%   �� 5      $- 'StylesAndTemplates\TabItemTemplate.xaml?�6%   %�  &	        &	 !     &	 B     &	 �     &	 �     &	      &	     '�� &    '�� p    7   '�� 1    7  '�� s    '�� �    7   '�� I    7  'd� �    7  '�� a    '  �    7   '  Z    7  7   '  >    7   &	 E    '�� J    7   &	 �    &	 �    &	 ;    �� 5      $ #303030��65   �� 5      $ #505050��6@   �� 5      $ 0.5,0&�6K   $ 0.5,1&�6^   .��5      � $ #8B8B8B��6   $ 0Q�6/   � 5      $ #606060��6   $ 1Q�6/   5        5      6&     5      6(     5      6/     5      6;   �� 5      " ��6   .�5      �� 	 � ��

 �����6/   5       �� 5"      " ��6   .�5#      �� 	 � ��

 �����60   �� 5$      	 � ��8
   6/   �� 5%      	 � ��

 �����6/   �� 5&      	 �@��
CaretBrush

 �����6/   5'      �� 5)      " ��6   .�5*      �� 	 � ��#
 �  6-   �� 5+      	 � ��

 �����6/   �� 5-      	 � ��8
   6/    5/      P� 50       �@��
IsEditable$
 true��64   . �51      �� 	 � ��$
 false��66   �� 52      	 � ��$
 2q�64   �� 53      	 � ��#
 �  65   54      56      �� 58      " ��6   .�59      �� 	 � ��

 �����6/   5:      �� 5<      " ��6   .�5=      �� 	 � ��#
 � 	 6-   �� 5?      	 � ��8
   6/   �� 5@      	 � ��

 �����60   5A      �� 5C      " ��6   .�5D      �� 	 � ��#
 � 
 6-   �� 5F      	 � ��8
   6/   �� 5G      	 � ��

 �����6/   5H      �� 5J      " d�6   .�5K      �� 	 � ��#
 �  6-   �� 5M      	 � ��8
   6/   �� 5N      	 � ��

 �����6/   5O      �� 5Q      " ��6   .�5R      �� 	 � ��#
 �  6-   5S      �� 5U      "  6   .�5V      �� 	 � ��8
   6/   �� 5W      	 �@ HeadersVisibility$
 Column=�66   �� 5X      	 �@ 
IsReadOnly$

 True��6/   �� 5Y      	 �@ CanUserAddRows$
 False��63   �� 5Z      	 �@ CanUserDeleteRows$
 False��66   �� 5[      	 �@ SelectionMode$
 Single=�62   �� 5\      	 �@ AutoGenerateColumns$
 False��68   �� 5]      	 �@ EnableRowVirtualization$

 True��6<   �� 5^      	 �@%�IsVirtualizing$

 True��6E   �� 5_      "	 �@%�IsVirtualizingWhenGrouping$

 True��6Q   �� 5`      	 �@%�VirtualizationMode$
 	Recycling=�6I   �� 5b      	 �@ RowHeaderWidth$
 0Q�63   5c      �� 5e      "  6   .�5f      �� 	 � ��$
 Center=�6?   �� 5g      	 � ��

 �����6/   �� 5h      	 � ��8
   6/   �� 5i      	 � ��8
  60   �� 5j      	 � ��$
 0,0,1,0q�64   �� 5k      	 � ��
 5l      �� 5m      .R�5n      �� $
��Wrap=�69   $ Center=�6M   $	��0,3q�6d   ��6(   �� 6d   5o      5q       5s      P� 5t       �@J�IsMouseOver$
 True��65   . �5u      �� 	 � ��
 �	#50569DE567   5v      P� 5w       � ��$
 True��63   . �5x      �� 	 � ��
 5y      �� 5z   "   $ 0.5,0&�66   $ 0.5,1&�6I   .��5{   &   � $ 	#D00E141B��63   $ 0Q�6E   � 5|   &   $ 	#D024313E��63   $ 1Q�6E   5}   #   5      5�      5�      �� 5�      "  6   .�5�      �� 	 � ��8
   6/   �� 5�      	 � ��

 �����6/    5�      P� 5�       �@J�IsMouseOver$
 True��65   . �5�      �� 	 � ��
 �	#282979A067   �� 5�      	 � ��

 �����67   5�      5�      �� 5�      "  6.   .�5�      �� 	 � ��
 5�      �� 5�      "  6*   .R�5�      �� #��z��6%   #��z��6O   #��z��6{   ._�5�   "   �� $��Center=�63   $��2q�6N   5�      5�      5�       5�      P� 5�       �@ 
IsSelected$
 True��64   . �5�      �� 	 � ��
 �#2979A067   �� 5�      	 � ��

 �����67   �� 5�      	 � ��
 �#2979A068   5�      P� 5�       �@J�	IsFocused$
 True��63   . �5�      �� 	 � ��

 �   �68   5�      5�      �� 5�      " ��6   .�5�      �� 	 � ��8
   6/   �� 5�      	 � ��

 �����6/   5�      �� 5�      " ��68   .�5�      -   5        5�      �� 5�      " ��60   .�5�      �� 	 � ��$
 Center=�68   5�      �� 5�      " ��61   .�5�      �� 	 � ��$

 Wrap=�61   5�      5�      5�      