   M S B A M L   `   `   `  ����M  IInstaDataProcessor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:InstaDataProcessorInstaDataProcessor  5   	   #    InstaDataProcessor.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:InstaDataProcessor     5   	     � Title$  InstaData Processor��5   	    � WindowStartupLocation$ CenterScreen=�6%   $	��850��6J   $	��900��6W   $	��350��6c   $	��900��6s   .��5	      � $��24,14,24,24q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��40 �6   �� 5      $��1* �6   �� 5      $��25 �6   �� 5      $��10 �6   �� 5      $��30 �6   .+�5   
   �� $��0��6   $��0,0,0,4q�6!   $��InstaData Processor��62   $��22(�6M   $
��Bold"�6[   �� 5   
   $��0��6   $��Bottom=�6!   �� 5   
   $��1��6    �� Orientation$ 
Horizontal=�6"   .+�5      �� $��Following: ��6   $��Center=�6+   $��13(�6F   �� 5      -   5         ��Name$ cboFollowing��5      $��Center=�6-   $	��110��6H   .@�5      �� $	��All��6    �� 
IsSelected$
 True��6-   �� 5      $��Only following��6   �� 5      $��No following��6   5      �� 5      $��Follows you: ��6   $��Center=�6-   $��13(�6H   $��20,0,0,0q�6V   �� 5       -   5        $ cboFollowsYou��5       $��Center=�6.   $	��120��6I   .@�5!      �� $	��All��6   $
 True��6-   �� 5"      $��Only follows you��6   �� 5#      $��No follows you��6   5$      �� 5&      $��	Checked: ��6   $��Center=�6)   $��13(�6D   $��20,0,0,0q�6R   �� 5'      -   5        $ 
cboChecked��5'      $��Center=�6+   $	��120��6F   .@�5(      �� $	��All��6   $
 True��6-   �� 5)      $��Only checked��6   �� 5*      $��Only unchecked��6   5+      �� 5-      $��White list: ��6   $��Center=�6,   $��13(�6G   $��20,0,0,0q�6U   �� 5.      -   5        $ cboWhiteList��5.      $��Center=�6-   $	��125��6H   .@�5/      �� $	��All��6   �� 50      $��Only white listed��6   �� 51      $��No white listed��6   $
 True��69   52      53      &   System.Windows.Controls.DataGrid  55   
   -   5          Name$ 
grdIgUsers��55      $��2��6'      HeadersVisibility$ Column=�64      CanUserAddRows$ False��6O   	   CanUserDeleteRows$	 False��6f   
   SelectionMode$
 Extended=�6�      AutoGenerateColumns$ False��56         HorizontalGridLinesBrush
 �����   VerticalGridLinesBrush
 �����   RowHeaderWidth$ 0Q�57       � 	Resources 5:      =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� 
TargetType �� Property �� Value   DataGridContextMenu��%>  '        &	  L     �� 5;      "  6   .�5<      ��  � ��$ Center=�6C   5=      �� 5?      .@�5@      m� -   5        $��Copy link and username��5@      6?   m� 5A      -   5        $��Set checked��5A      64   m� 5B      -   5        $��Set white listed��5B      69   5C      5D         	CellStyle 5F      �� 5G      *  $System.Windows.Controls.DataGridCell"  6    �� Triggers 5H      P� 5I       P� Property �@ 
IsSelected P� Value$
 True��68   . �5J      ��  � ��
 ��iA�6;   �� 5K       � ��
 �����6;   �� 5L       � ��
 ��iA�6<   5M      P� 5N       �@J�	IsFocused$
 True��67   . �5O      ��  � ��
 �   �6<   5P      5R         RowStyle 5U      �� 5V      )  #System.Windows.Controls.DataGridRow"  6   .�5W      ��  �@�ContextMenu# [  64   5X         Columns 5[      0  *System.Windows.Controls.DataGridTextColumn  5\      ,  &System.Windows.Controls.DataGridColumn   Header$
 Link��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 63      
IsReadOnly$
 True��6?   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6Q   �� *Link+  5]      $ Username��6%   $ 1* 67   $
 True��6B    6T   �� *
Username+4	  .System.Windows.Controls.DataGridCheckBoxColumn	  5^      $ 	Following��6)   $	 100 6<   $
 True��6H    6Z   �� *	Following+	  5_      $ Follows You��6)   $	 100 6>   $
 True��6J    6\   �� *
FollowsYou+	  5`      $ Checked��6)   $	 100 6:   $ False��6F    6Y   �� *UserChecked+	  5a      $ White Listed��6)   $	 100 6?   $ False��6K    6^   �� *WhiteListed+5c      �� 5e   
   $��3��6   $ 
Horizontal=�6"   $��Right=�6;   $��Center=�6W   .+�5f      �� $��
Row Count:��6   $��0,0,5,0q�6*   �� 5g      -	   5         ��Name$ txtRowCount��5g      $��0��6-   5h      � 5j   
   $��5��6   .+�5k      �� $ 
Horizontal=�6   .+�5l      �� -
   5         ��Name$ btnFollowingsFollowers��5l      $��Followings & Followers��69   $	��155��6^   $
��Left=�6j   
��� d �
�������$
��Bold"�6�   6�   �� 5m      -   5         ��Name$ chkOldMethod��5m      $��
Old Method��61   $��Italic$�6F   $��10,0,0,0q�6Z   $��Center=�6l   5n      �� 5o      -   5        $ btnSaveChanges��5o      $	��130��6-   $��Right=�69   $
��Bold"�6U   .��5p      �� $ 
Horizontal=�6   .+�5q      �� $��Save Changes��6    $��0,0,7,0q�64   $��Center=�6E   �� 5r      $	��0,4q�6   $��/Resources/diskette.png��6)   5s      5t      5u      5v      5w      