   M S B A M L   `   `   `  ���� M  IInstaDataProcessor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:InstaDataProcessorInstaDataProcessor  #    InstaDataProcessor.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     2local clr-namespace:InstaDataProcessor       � Title$  InstaData Processor�� � WindowStartupLocation$ CenterScreen=�$	��850��$	��900��$	��350��$	��900��.��� $��24,14,24,24q� � RowDefinitions �� $
��Auto ��� $��40 ��� $��1* ��� $��25 ��� $��10 ��� $��30 �.+��� $��0��$��0,0,0,4q�$��InstaData Processor��$��22(�$
��Bold"��� $��0��$��Bottom=��� $��1�� �� Orientation$ 
Horizontal=�.+��� $��Following: ��$��Center=�$��13(��� -    ��Name$ cboFollowing��$��Center=�$	��110��.@��� $	��All�� �� 
IsSelected$
 True���� $��Only following���� $��No following���� $��Follows you: ��$��Center=�$��13(�$��20,0,0,0q��� -   $ cboFollowsYou��$��Center=�$	��120��.@��� $	��All��$
 True���� $��Only follows you���� $��No follows you���� $��	Checked: ��$��Center=�$��13(�$��20,0,0,0q��� -   $ 
cboChecked��$��Center=�$	��120��.@��� $	��All��$
 True���� $��Only checked���� $��Only unchecked���� $��White list: ��$��Center=�$��13(�$��20,0,0,0q��� -   $ cboWhiteList��$��Center=�$	��125��.@��� $	��All���� $��Only white listed���� $��No white listed��$
 True��&   System.Windows.Controls.DataGrid  -     Name$ 
grdIgUsers��$��2��   HeadersVisibility$ Column=�   CanUserAddRows$ False��	   CanUserDeleteRows$	 False��
   SelectionMode$
 Extended=�   AutoGenerateColumns$ False��   HorizontalGridLinesBrush
 �����   VerticalGridLinesBrush
 �����   RowHeaderWidth$ 0Q� � 	Resources =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� 
TargetType �� Property �� Value   DataGridContextMenu��%�   '        &	  '     �� "  .���  � ��$ Center=��� .@�m� -   $��Copy link and username��m� -   $��Set checked��m� -   $��Set white listed��   	CellStyle �� *  $System.Windows.Controls.DataGridCell"   �� Triggers P�  P� Property �@ 
IsSelected P� Value$
 True��. ���  � ��
 ��iA���  � ��
 �������  � ��
 ��iA�P�  �@J�	IsFocused$
 True��. ���  � ��
 �   �   RowStyle �� )  #System.Windows.Controls.DataGridRow"  .���  �@�ContextMenu# [     Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$
 Link��   Width5  /System.Windows.Controls.DataGridLengthConverter$	 100    
IsReadOnly$
 True��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Link+  $ Username��$ 1* $
 True�� �� *
Username+4	  .System.Windows.Controls.DataGridCheckBoxColumn	  $ 	Following��$	 100 $
 True�� �� *	Following+	  $ Follows You��$	 100 $
 True�� �� *
FollowsYou+	  $ Checked��$	 100 $ False�� �� *UserChecked+	  $ White Listed��$	 100 $ False�� �� *WhiteListed+�� $��3��$ 
Horizontal=�$��Right=�$��Center=�.+��� $��
Row Count:��$��0,0,5,0q��� -	    ��Name$ txtRowCount��$��0��� $��5��.+��� $ 
Horizontal=�.+��� -
    ��Name$ btnFollowingsFollowers��$��Followings & Followers��$	��155��$
��Left=�
��� d �
�������$
��Bold"��� -    ��Name$ chkOldMethod��$��
Old Method��$��Italic$�$��10,0,0,0q�$��Center=��� -   $ btnSaveChanges��$	��130��$��Right=�$
��Bold"�.���� $ 
Horizontal=�.+��� $��Save Changes��$��0,0,7,0q�$��Center=��� $	��0,4q�$��/Resources/diskette.png��