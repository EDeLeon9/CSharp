   M S B A M L   `   `   `  ����B  >Workath, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WorkathWorkath  5   	   3clr-namespace:Workath.ControlsWorkath.Controls  5   	       Workath.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Workath     5   	   3controlsclr-namespace:Workath.Controls     5   	   _ [Hardcodet.NotifyIcon.Wpf, Version=1.1.0.0, Culture=neutral, PublicKeyToken=682384a853a08aad)tb http://www.hardcodet.net/taskbar  5   	   -   5          � Title$  Workath��5
   	    � WindowStartupLocation$ CenterScreen=�6      DarkBGColor#��[  6>   $	��900��5   	   $
��1700��6   $	��500��6#   $	��750��63    � 	Resources 5       �� MergedDictionaries �� Source  WorkStampsViewSource �� Source �� GroupDescriptions2  ,System.Windows.Data.PropertyGroupDescription   PropertyName �� 
TargetType  BrownButtonStyle	 �� BasedOn�� 5   
    5      �� 5      $, &Controls/DataGridComboBoxTemplate.xaml?�6%   %�   &	       '�� g     7  �� 5       6@   �� *GridWorkStamps+ 5        5      $ DateText��6/   5      �� 5      " ��6   8	   6(   5      '  !System.Windows.Shell.WindowChrome
   WindowChrome
 5        5#   
      ResizeBorderThickness$ 7q�6      CaptionHeight$ 35Q�61      UseAeroCaptionButtons$ False��6D    � DataContext 5&         Workath.MainViewModel  5'   
   -   5        dtcMainViewModel��5'      .��5*      � .+�5,   
   3  -Hardcodet.Wpf.TaskbarNotification.TaskbarIcon  -   5          Name$ tbiTaskbarIcon��5,         NoLeftClickDelay$
 True��61      
IconSource$* $/Resources/workstamp_isopen_icon.ico��6I      ToolTipText$ Open Work Stamp��6{      LeftClickCommand 6�   �� *TaskbarIconClickCommand+��5.      �� 5/      "  6   .�50      ��  �� Property � y� �� Value$ 	Collapsed=�63    �� Triggers 51      �� 52       �� Binding 6&   �� *WorkStampIsOpen+ �� Value True6J   .a�53      ��  � y�$ Visible=�6;   54      56      58      $   Workath.Controls.WindowButtons  5:   
   -   5          Name$ ctrlWindowButtons��5:   !   $	��Top=�6<   $��Right=�6T   � 5<   
   $��17,14,17,17q�6    � RowDefinitions 5=      �� 5>      $
��Auto �6    �� 5?      .+�5B      �� $��0��6    �� Orientation$ 
Horizontal=�6&   .+�5C      �� $&�� /Resources/workath_logo_24px.png��6   $��Center=�6B   $��0,0,0,2q�6]   �� 5D      $��0��6   $
��Left=�6)   $��Center=�6D   $��2,-2,0,0q�6_   $	��100��6q   $��Workath��6}   $��22(�6�   $
��Bold"�6�   
�������6�   5E      � 5G      $��1��6   $��0,2,0,0q�6      LightBGColor#��[ 61   .+�5H      � $��14q�6    5I      �� 5J      $
��Auto �6(   �� 5K      $��10 �6(   �� 5L      $
��Auto �6(   �� 5M      $��13 �6(   �� 5N      $��26 �6(   �� 5O      $��10 �6(   �� 5P      �� 5Q      $��4 �6(   �� 5R      $
��Auto �6(   .+�5U      �� $��0��6    ]� 5W      $��2��6    .+�5X      �� $��Right=�6!   $��14(�68   $��Right=�6F   $��70��6b   $��Finish��6m   $��	10,0,0,10q�6~     BoolTrue#��[ 6�   ��6�   �� *FinishWorkStampCommand+6�   �� 5Z      $��Right=�6$   #��["�6;   $��0,0,0,10q�6y   ���#A0A0A06�   �� 5\      $ Vertical=�6%   .+�5]      �� $��	0,-10,0,4q�6(   $��Generate Work Stamp:��6;   $��Bottom=�6W   $��16(�6r   �� 5_      $
��Left=�6+   ��6A   �� *ProjectsForStamping+��5`   "   �� 5a   &   .R�5b   *   �  � Orientation$ 
Horizontal=�64   5c   '   ��5e   "   �� 5f   &   .R�5h   *   �� $��18(�61   $��35��6?   $��	0,0,10,10q�6K   ��6^   ��  �� Path$! GenerateNewWorkStampCommand� �� ElementName$ dtcMainViewModel����6�   �� *	IdProject+��5i   .   �� 5j   2   $	��7,0q�6Y   ��6<   �� *ProjectName+6Y   5l   +   5m   '   5o      5p      5q      �� 5s      $��3��6    $	��Top=�6-   � 5u      $��4��6   .+�5v      �� $ 
Horizontal=�6%   .+�5w      �� $��Year: ��6(   $��Center=�66   $��15(�6Q   �� 5x      -   5         ��Name$ cboYear��5x   '   $��70��68   $��Center=�6C   $��13(�6e   ��6s   �� *YearFilters+  �� SelectedItem  6�   �� *
FilterYear+�� 5z      $��Month: ��6(   $��20,0,0,0q�67   $��Center=�6I   $��15(�6d   �� 5{      -   5        $ cboMonth��5{   '   $	��100��69   $��Center=�6E   $��13(�6g   ��6u   �� *MonthFilters+  6�   �� *FilterMonth+�� 5}      $��	Project: ��6(   $��20,0,0,0q�69   $��Center=�6K   $��15(�6f   �� 5~      -   5        $ 
cboProject��5~   '   $	��220��6;   $��Center=�6G   $��13(�6i   ! �� DisplayMemberPath$! ProjectName��6�   ��6w   �� *ProjectFilters+  6�   �� *FilterProject+5      �� 5�      -   5        " ��Name$" 
btnRefresh��5�   !   $��Refresh��65   $��Right=�6G   $��70��6c   $��14(�6n   #��[ 6�   ��6|   �� *LoadWorkStampsCommand+6�   5�      &   System.Windows.Controls.DataGrid  5�      -	   5        #  Name$# grdWorkStamps��5�      $��6��66   $   HeadersVisibility$$ Column=�6C   %   CanUserAddRows$% False��6^   &   CanUserDeleteRows$& False��6u   '   CanUserSortColumns$' False��6�   (   SelectionMode$( Single=�6�   )   AutoGenerateColumns$) False��6�   *   HorizontalGridLinesBrush
* �����+   VerticalGridLinesBrush
+ �����!, %� IsVirtualizingWhenGrouping$
, True��5�      -   EnableRowVirtualization$
- True��6S   . %� IsVirtualizing$
. True��6r   / %� VirtualizationMode$/ 	Recycling=�6�   0   ClipboardCopyMode$
0 None=�5�   Y   1   RowHeaderWidth$1 0Q�5�      2   
IsReadOnly2 5�      �� *SelectedWorkStamp.IdWorkStamp+  ZeroIsTrueConverter3 �� 	Converter#3 [ ��6�   �� 4 �� Source#4 [   6�   �� *SelectedWorkStamp+ 5�        CenteredHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader5 �� TextAlignment  HourRateHeader  HeaderConverter6 �� ConverterParameter 	 DefaultCellStyle*  $System.Windows.Controls.DataGridCell7 P� Property8 P� Value9 ^� 
Conditions: �� Binding%	  System.Windows.Markup.Reference; �� Value< �� RelativeSource= �� Mode 
 RightTextStyle��%
  &	       &	 �     7  7  7  7  &		     7   7   &	
 h    7 	 �� 5�      "  6;   .�5�   "   ��  � ��$ Center=�6O   �� 5�   "    � �� 5�   &   �� 5�   *   .R�5�   .   �� $
��Wrap=�6I   $5 Center=�6]   ��68   �� 6]   5�   +   5�   #   5�      �� 5�      "  6;   8	   .�5�   "   ��  � �� 5�   &   �� 5�   *   .R�5�   .   �� $ Vertical=�69   .+�5�   2   �� $
��Wrap=�6�   $5 Center=�6�   ��6<   �� $ .�83  6�   �� 5�   2   $5 Center=�6�   $��11(�6�   ��6<   �� $ .�83  86  6�   5�   /   5�   +   5�   #   5�      �� 5�      "  6=   .�5�   "   -
   5         5�   "   �� 5�   &    62   �� *InvalidDates+ True6S   .a�5�   *   ��  � ��
 �  ��6G   �� 5�   *    � ��
 �����6G   �� 5�   *    � ��
 �  ��6H   5�   '   P� 5�   &   7 �@ 
IsSelected$
8 True��6D   . �5�   *   ��  � ��8   6G   �� 5�   *    � ��
 �����6G   �� 5�   *    � ��8  6H   5�   '   ^� 5�   &   9 5�   *   �� 5�   .   : 68   �� *EditingSelectedWorkStamp+4 	  *dtcMainViewModel+; True6�   �� 5�   .   : 68   �� $ 
IsSelected�< �� $
= Self=�; True6�   .0�5�   *   ��  � ��
 �   �6G   �� 5�   *    � ��
 �����6G   �� 5�   *    � ��
 �   �6H   5�   '   P� 5�   &   7 �@J�	IsFocused$
8 True��6C   . �5�   *   ��  � ��
 �   �6H   5�   '   ^� 5�   &   9 5�   *   �� 5�   .   : 68   �� *EditingSelectedWorkStamp+4 	  *dtcMainViewModel+; True6�   �� 5�   .   : 68   �� $ 	IsFocused�< �� $
= Self=�; True6�   .0�5�   *   ��  � ��
 �����6H   5�   '   5�      �� 5�      "  6;   8	   .�5�   "   ��  �@��TextAlignment$ Right=�6L   5�      5�      >   RowStyle> 5�      �� 5�      )
  #System.Windows.Controls.DataGridRow" 
 6$    5�   "   �� 5�   &    62   �� *IdWorkStamp+#3 [ 	 False6�   .a�5�   *   ��  �@�ContextMenu 5�   .   �� 5�   2    6>   �� 4 	  *dtcMainViewModel+.@�5�   6   m� $	��0,5q�6?   $��Show work stamp ID��6M   ? m� Command? 6i   �� *ShowWorkStampIdCommand+@ m� CommandParameter@ 6�   �� *SelectedWorkStamp.IdWorkStamp+A m� IconA 5�   :   �� 5�   >   $��/Resources/key.png��6D   5�   7   �� 5�   6   m� 5�   6   $	��0,5q�6?   ? 6M   �� *MergeWorkStampCommand+@ 6w   �� *SelectedWorkStamp+��5�   :   �� 5�   >   .+�5�   B   �� $(��"Merge with the previous work stamp��6L   �� 5�   B   $��with same project and day��6L   5�   ?   A 5�   :   �� 5�   >   $��/Resources/merge.png��6D   5�   7   �� 5�   6   m� 5�   6   $	��0,5q�6?   $��Delete work stamp��6M   ? 6h   �� *DeleteWorkStampCommand+@ 6�   �� *SelectedWorkStamp+A 5�   :   �� 5�   >   $��/Resources/delete.png��6D   5�   7   5�   3   5�   +   5�   '   �� 5�   &    62   �� *IdWorkStamp+ 06R   .a�5�   *   ��  � ��
 �����6G   �� 5�   *    � ��
 �����6G   �� 5�   *    � ��$ Medium"�6G   5�   '   5�      B   ColumnsB 5�      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumnC   
Visibility$C 	Collapsed=�61   D   Header$D Id��6H   E   HeaderStyle#E [ 6T   F   Width5  /System.Windows.Controls.DataGridLengthConverter$F 35 6�   G   
IsReadOnly$
G True��6�   1  +System.Windows.Controls.DataGridBoundColumnH   BindingH 6�   �� *IdWorkStamp+4  .System.Windows.Controls.DataGridComboBoxColumn  5     $D Project��65   #E [ 6F   $
F 0.9* 6t   $G False��6�   I   SelectedValuePath$I 	IdProject��6�   J   DisplayMemberPath$J ProjectName��6	    DataGridComboBoxStyleK   EditingElementStyle#K [ 6T  L   	CellStyle#L [	 6�  M   ItemsSourceM 6�   �� $ ProjectsForEditing�4 	  *dtcMainViewModel+N   SelectedValueBindingN 6)  �� *	IdProject+O   ElementStyleO 5  "   �� 5	  &   " ��6,   .�5
  *   ��  � ��$
 2,-1q�6C   5  '   5     4  .System.Windows.Controls.DataGridTemplateColumn  5     $D 
Start Time��65   #E [ 6I   $F 0.75* 6w   $G False��6�   #L [
 6�   P   CellTemplateP 5  "   �� 5  &   .R�5  *   �� Q �� Padding$	Q 2,0q�6�   ��64   �� $ 	StartTime�  DateTimeConverter#3 [ 6�   5  '   R   CellEditingTemplateR 5  "   �� 5  &   .R�5  *   !   Workath.DateTimeTextBoxCell  $��0q�6�   ��6D   �� $ 	StartTime�#3 [ 6�   5  '   5       5     $D End Time��65   #E [ 6G   $F 0.75* 6u   $G False��6�   #L [
 6�   P 5  "   �� 5   &   .R�5!  *   �� $	Q 2,0q�6�   ��64   �� $ EndTime�#3 [ 6�   5"  '   R 5$  "   �� 5%  &   .R�5&  *     $��0q�6�   ��6D   �� $ EndTime�#3 [ 6�   5'  '   5)       5,     $D Working Time��61   #E [ 6G   $F 0.35* 6u   $
G True��6�   #L [
 6�   H 6�   �� $ WorkingTime�  TimeSpanConverter#3 [ 6�     5.     $D Description��61   #E [ 6F   $F 4* 6t   $G False��6   #L [	 6�   H 6�   �� $ Description�6�     51     #E [ 6�   $
F 0.5* 6�   $
G True��6�   #L [
 6�   D 61   �� $ HourRateHeaders[0]�4 	  *dtcMainViewModel+H 6�   �� *Base1Income+6�     53     #E [ 6�   $
F 0.5* 6�   $
G True��6�   #L [
 6�   D 61   �� $ HourRateHeaders[1]�4 	  *dtcMainViewModel+H 6�   �� *Base2Income+6�     55     #E [ 6�   $
F 0.5* 6�   $
G True��6�   #L [
 6�   D 61   �� $ HourRateHeaders[2]�4 	  *dtcMainViewModel+H 6�   �� *Base3Income+6�     57     #E [ 6�   $
F 0.5* 6�   $
G True��6�   #L [
 6�   D 61   �� $ HourRateHeaders[3]�4 	  *dtcMainViewModel+H 6�   �� *Base4Income+6�   S �� 
GroupStyleS 5:     (  "System.Windows.Controls.GroupStyle  5;     T   PanelT 5=  "   �� 5>  &   .R�5?  *   >  8System.Windows.Controls.Primitives.DataGridRowsPresenter  5@  '   U   ContainerStyleU 5B  "   �� 5C  &   " ��6,   .�5D  *   ��  � �� 5E  .   �� 5F  2   V �� 
TargetType"V ��6B   .R�5G  6   9� W 9� 
IsExpanded$
W True��6?   $��0q�6Q   $��0,5,0,0q�6e   ��5H  :   �� 5I  >   $ 
Horizontal=�6I   .+�5J  B   �� $
��Bold"�6L   ��6^   �� *Name+5K  ?   ��5M  :   �� 5N  >   
�������$��0,1,0,0q�6X   ._�5O  B   �� 5P  ?   5R  7   5S  3   5U  +   5V  '   5X     5Z     �� 5[     $��8��6!   $ 
Horizontal=�6.   $��Right=�6G   $��Center=�6c   .+�5\     �� $��Work Stamps Count:��6$   $��14(�6>   �� 5]     $��14(�6D   $��5,0,0,0q�6R   ��6$   �� *WorkStampCount+6R   5^     5_     5`     5a     5b     5c     