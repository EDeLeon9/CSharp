   M S B A M L   `   `   `  ����N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5      )    #RegistrarInventario.LabeledComboBox   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:RegistrarInventario     5      -   5          >�Name$  uCLabeledComboBox��5	       � 	Resources 5         comboBoxMainStyle �� 
TargetType �� Property �� Value  multipleColumnsStyle �� BasedOn �� 
TargetType ��Name �� UpdateSourceTrigger	 �� ElementName
 �� Triggers P� Property P� Value �� 
TargetName ]� 
Conditions �� Property �� Value��%  &	        &	 L     7   �� 5   
   " ��6*   .�5      ��  � ��$ Center=�69   5      �� 5   
   " ��6-   8   .�5      ��  � �� 5      �� 5      " ��6&   .R�5      � .+�5      �� $ templateBorder��6%   $��1q�6=   
������ 6Q   �� 5      ��6&   �� *CboControlTemplateItems+$ PropertyChanged=�$	 uCLabeledComboBox��5      
 5      P� 5       �@��IsHighlighted$
 True��6?   . �5   "   �� $ templateBorder��6P    � �� �#26A0DA5      P� 5       �@J�IsMouseOver$
 True��6=   . �5   "   �� $ templateBorder��6Q    � �� �	#5526A0DA�� 5   "   $ templateBorder��6P    � �� �#26A0DA5      ]� 5        5!   "   �� 5"   &    �@��
IsSelected$
 True��6F   �� 5#   &    �@��IsHighlighted$ False��6I   ./�5%   "   �� $ templateBorder��6Q    � �� �	#55FFFFFF�� 5&   "   $ templateBorder��6P    � �� �#FFFFFF5'      ]� 5(       5)   "   �� 5*   &    �@��
IsSelected$
 True��6F   �� 5+   &    �@��IsHighlighted$
 True��6I   ./�5-   "   �� $ templateBorder��6Q    � �� �	#5526A0DA�� 5.   "   $ templateBorder��6P    � �� �#26A0DA5/      ]� 50       51   "   �� 52   &    �@J�IsMouseOver$
 True��6G   �� 53   &    �@��
IsSelected$
 True��6F   ./�55   "   �� $ templateBorder��6Q    � �� �	#55135495�� 56   "   $ templateBorder��6P    � �� �#13549557      59      5;      5<      5=      .��5?      ]� .+�5A   
   �� -   5         ��Name$ lblLabel��5A      $��Center=�5B      ��5C      �� *
LblContent+$ PropertyChanged=�$	 uCLabeledComboBox�� �� FallbackValue$ LabeledComboBox:����5D      �� *
LblWidth+$ PropertyChanged=�$	 uCLabeledComboBox���� 5G   
   -   5         ��Name$ cboComboBox��5G      $��Center=�5H       � IsSharedSizeScope$
 True��5I      #��[  5J      ��5K      �� *CboItemsSource+$ PropertyChanged=�$	 uCLabeledComboBox�� �� SelectedValuePath 5L      �� *CboSelectedValuePath+$ PropertyChanged=�$	 uCLabeledComboBox�� �� DisplayMemberPath 5M      �� *CboDisplayMemberPath+$ PropertyChanged=�$	 uCLabeledComboBox�� �� SelectedValue 5N      �� *CboSelectedValue+$ PropertyChanged=�$	 uCLabeledComboBox�� �� SelectedItem 5O      �� *CboSelectedItem+$ PropertyChanged=�$	 uCLabeledComboBox�� �� Text 5P      �� *	CboText+$ PropertyChanged=�$	 uCLabeledComboBox����5Q      �� *CboItemTemplate+$ PropertyChanged=�$	 uCLabeledComboBox�� �� 
IsEditable 5R      �� *CboIsEditable+$ PropertyChanged=�$	 uCLabeledComboBox��5S      5U      5W      