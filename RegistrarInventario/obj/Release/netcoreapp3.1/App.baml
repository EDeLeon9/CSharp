   M S B A M L   `   `   `  ���� N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario      RegistrarInventario.App   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     3local!clr-namespace:RegistrarInventario       �� 	Resources   �� MergedDictionaries �� Source   mainBackground �� Color  windowRectangleBackground $  defaultGradientControlBackground �� 
StartPoint �� EndPoint � Color � Offset+   %RegistrarInventario.DateTimeConverter  dateTimeConverter-   'RegistrarInventario.InvertBoolConverter  invertBoolConverter4   .RegistrarInventario.AddStringToDoubleConverter  addStringToDoubleConverter@   :RegistrarInventario.IntegerIsGreaterThanOneToBoolConverter * &integerIsGreaterThanOneToBoolConverter �� 
TargetType	 �� Property
 �� Value  comboBoxTemplate �� Triggers P� Property P� Value  comboBoxEditableTemplate 	 checkBoxTemplate 
 buttonTemplate  toggleButtonTemplate  tabItemTemplate&   System.Windows.Controls.DataGrid=  7System.Windows.Controls.Primitives.DataGridColumnHeader �� TextAlignment)  #System.Windows.Controls.DataGridRow  dataGridCellStyle*  $System.Windows.Controls.DataGridCell �� 
TargetType  listBoxItemMouseUpSelection  ElementStyleCenter  ElementStyleWrapping��  �� $. (StylesAndTemplates\ComboBoxTemplate.xaml?��� $. (StylesAndTemplates\CheckBoxTemplate.xaml?��� $, &StylesAndTemplates\ButtonTemplate.xaml?��� $2 ,StylesAndTemplates\ToggleButtonTemplate.xaml?��� $- 'StylesAndTemplates\TabItemTemplate.xaml?�%�	  &	        &	      &	 &     &	 |     &	 �     &	 �     &	 �     '�� �     '�� �     7   '�� '    7  '�� �    '��     7   '�� N    7  'd� �    7  '�� �    '      7   '  �    7  7   '  �    7   &	 '    '�� @    7   &	 w    &	 �    &	 �    �� $ #303030���� $ #505050���� $ 0.5,0&�$ 0.5,1&�.��� $ #8B8B8B��$ 0Q�� $ #606060��$ 1Q�        �� " ��.��� 	 � ��

 ������� " ��.��� 	 � ��

 ������� 	 � ��8
   �� 	 � ��

 ������� 	 �@��
CaretBrush

 ������� " ��.��� 	 � ��#
 �  �� 	 � ��

 ������� 	 � ��8
    P�  �@��
IsEditable$
 true��. ��� 	 � ��$
 false���� 	 � ��$
 2q��� 	 � ��#
 �  �� " ��.��� 	 � ��

 ������� " ��.��� 	 � ��#
 � 	 �� 	 � ��8
   �� 	 � ��

 ������� " ��.��� 	 � ��#
 � 
 �� 	 � ��8
   �� 	 � ��

 ������� " d�.��� 	 � ��#
 �  �� 	 � ��8
   �� 	 � ��

 ������� " ��.��� 	 � ��#
 �  �� "  .��� 	 � ��8
   �� 	 �@ HeadersVisibility$
 Column=��� 	 �@ 
IsReadOnly$

 True���� 	 �@ CanUserAddRows$
 False���� 	 �@ CanUserDeleteRows$
 False���� 	 �@ SelectionMode$
 Single=��� 	 �@ AutoGenerateColumns$
 False���� 	 �@ EnableRowVirtualization$

 True���� 	 �@%�IsVirtualizing$

 True���� "	 �@%�IsVirtualizingWhenGrouping$

 True���� 	 �@%�VirtualizationMode$
 	Recycling=��� 	 �@ RowHeaderWidth$
 0Q��� "  .��� 	 � ��$
 Center=��� 	 � ��

 ������� 	 � ��8
   �� 	 � ��8
  �� 	 � ��$
 0,0,1,0q��� 	 � ��
 �� .R��� $
��Wrap=�$ Center=�$	��0,3q�����  P�  �@J�IsMouseOver$
 True��. ��� 	 � ��
 �	#50569DE5P�  � ��$
 True��. ��� 	 � ��
 �� $ 0.5,0&�$ 0.5,1&�.��� $ 	#D00E141B��$ 0Q�� $ 	#D024313E��$ 1Q��� "  .��� 	 � ��8
   �� 	 � ��

 ����� P�  �@J�IsMouseOver$
 True��. ��� 	 � ��
 �	#282979A0�� 	 � ��

 ������� "  .��� 	 � ��
 �� "  .R��� #��z��#��z��#��z��._��� $��Center=�$��2q� P�  �@ 
IsSelected$
 True��. ��� 	 � ��
 �#2979A0�� 	 � ��

 ������� 	 � ��
 �#2979A0P�  �@J�	IsFocused$
 True��. ��� 	 � ��

 �   ��� " ��.��� 	 � ��8
   �� 	 � ��

 ������� " ��.�-   �� " ��.��� 	 � ��$
 Center=��� " ��.��� 	 � ��$

 Wrap=�