   M S B A M L   `   `   `  ���� N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  )    #RegistrarInventario.LabeledComboBox   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     3local!clr-namespace:RegistrarInventario     -     >�Name$  uCLabeledComboBox�� � 	Resources    comboBoxMainStyle �� 
TargetType �� Property �� Value  multipleColumnsStyle �� BasedOn �� 
TargetType ��Name �� UpdateSourceTrigger	 �� ElementName
 �� Triggers P� Property P� Value �� 
TargetName ]� 
Conditions �� Property �� Value��%  &	        &	 '     7   �� " ��.���  � ��$ Center=��� " ��8   .���  � �� �� " ��.R�� .+��� $ templateBorder��$��1q�
������ �� ���� *CboControlTemplateItems+$ PropertyChanged=�$	 uCLabeledComboBox��
 P�  �@��IsHighlighted$
 True��. ��� $ templateBorder�� � �� �#26A0DAP�  �@J�IsMouseOver$
 True��. ��� $ templateBorder�� � �� �	#5526A0DA�� $ templateBorder�� � �� �#26A0DA]�  ��  �@��
IsSelected$
 True����  �@��IsHighlighted$ False��./��� $ templateBorder�� � �� �	#55FFFFFF�� $ templateBorder�� � �� �#FFFFFF]�  ��  �@��
IsSelected$
 True����  �@��IsHighlighted$
 True��./��� $ templateBorder�� � �� �	#5526A0DA�� $ templateBorder�� � �� �#26A0DA]�  ��  �@J�IsMouseOver$
 True����  �@��
IsSelected$
 True��./��� $ templateBorder�� � �� �	#55135495�� $ templateBorder�� � �� �#135495.��]� .+��� -    ��Name$ lblLabel��$��Center=����� *
LblContent+$ PropertyChanged=�$	 uCLabeledComboBox�� �� FallbackValue$ LabeledComboBox:������ *
LblWidth+$ PropertyChanged=�$	 uCLabeledComboBox���� -    ��Name$ cboComboBox��$��Center=� � IsSharedSizeScope$
 True��#��[  ���� *CboItemsSource+$ PropertyChanged=�$	 uCLabeledComboBox�� �� SelectedValuePath �� *CboSelectedValuePath+$ PropertyChanged=�$	 uCLabeledComboBox�� �� DisplayMemberPath �� *CboDisplayMemberPath+$ PropertyChanged=�$	 uCLabeledComboBox�� �� SelectedValue �� *CboSelectedValue+$ PropertyChanged=�$	 uCLabeledComboBox�� �� SelectedItem �� *CboSelectedItem+$ PropertyChanged=�$	 uCLabeledComboBox�� �� Text �� *	CboText+$ PropertyChanged=�$	 uCLabeledComboBox������ *CboItemTemplate+$ PropertyChanged=�$	 uCLabeledComboBox�� �� 
IsEditable �� *CboIsEditable+$ PropertyChanged=�$	 uCLabeledComboBox��