   M S B A M L   `   `   `  ���� B  >Workath, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:WorkathWorkath  3clr-namespace:Workath.ControlsWorkath.Controls      Workath.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     'localclr-namespace:Workath     3controlsclr-namespace:Workath.Controls     _ [Hardcodet.NotifyIcon.Wpf, Version=1.1.0.0, Culture=neutral, PublicKeyToken=682384a853a08aad)tb http://www.hardcodet.net/taskbar  -     � Title$  Workath�� � WindowStartupLocation$ CenterScreen=�   DarkBGColor#��[  $	��900��$
��1700��$	��500��$	��750�� � 	Resources  �� MergedDictionaries �� Source  WorkStampsViewSource �� Source �� GroupDescriptions2  ,System.Windows.Data.PropertyGroupDescription   PropertyName �� 
TargetType  BrownButtonStyle	 �� BasedOn��  �� $, &Controls/DataGridComboBoxTemplate.xaml?�%`   &	       '�� 9     7  ��  �� *GridWorkStamps+   $ DateText���� " ��8	   '  !System.Windows.Shell.WindowChrome
   WindowChrome
      ResizeBorderThickness$ 7q�   CaptionHeight$ 35Q�   UseAeroCaptionButtons$ False�� � DataContext    Workath.MainViewModel  -   dtcMainViewModel��.��� .+�3  -Hardcodet.Wpf.TaskbarNotification.TaskbarIcon  -     Name$ tbiTaskbarIcon��   NoLeftClickDelay$
 True��   
IconSource$* $/Resources/workstamp_isopen_icon.ico��   ToolTipText$ Open Work Stamp��   LeftClickCommand �� *TaskbarIconClickCommand+���� "  .���  �� Property � y� �� Value$ 	Collapsed=� �� Triggers ��  �� Binding �� *WorkStampIsOpen+ �� Value True.a���  � y�$ Visible=�$   Workath.Controls.WindowButtons  -     Name$ ctrlWindowButtons��$	��Top=�$��Right=�� $��17,14,17,17q� � RowDefinitions �� $
��Auto ��� .+��� $��0�� �� Orientation$ 
Horizontal=�.+��� $&�� /Resources/workath_logo_24px.png��$��Center=�$��0,0,0,2q��� $��0��$
��Left=�$��Center=�$��2,-2,0,0q�$	��100��$��Workath��$��22(�$
��Bold"�
�������� $��1��$��0,2,0,0q�  LightBGColor#��[ .+�� $��14q� �� $
��Auto ��� $��10 ��� $
��Auto ��� $��13 ��� $��26 ��� $��10 ��� �� $��4 ��� $
��Auto �.+��� $��0��]� $��2��.+��� $��Right=�$��14(�$��Right=�$��70��$��Finish��$��	10,0,0,10q�  BoolTrue#��[ ���� *FinishWorkStampCommand+�� $��Right=�#��["�$��0,0,0,10q����#A0A0A0�� $ Vertical=�.+��� $��	0,-10,0,4q�$��Generate Work Stamp:��$��Bottom=�$��16(��� $
��Left=����� *ProjectsForStamping+���� .R��  � Orientation$ 
Horizontal=����� .R��� $��18(�$��35��$��	0,0,10,10q�����  �� Path$! GenerateNewWorkStampCommand� �� ElementName$ dtcMainViewModel������ *	IdProject+���� $	��7,0q����� *ProjectName+�� $��3��$	��Top=�� $��4��.+��� $ 
Horizontal=�.+��� $��Year: ��$��Center=�$��15(��� -    ��Name$ cboYear��$��70��$��Center=�$��13(����� *YearFilters+  �� SelectedItem  �� *
FilterYear+�� $��Month: ��$��20,0,0,0q�$��Center=�$��15(��� -   $ cboMonth��$	��100��$��Center=�$��13(����� *MonthFilters+  �� *FilterMonth+�� $��	Project: ��$��20,0,0,0q�$��Center=�$��15(��� -   $ 
cboProject��$	��220��$��Center=�$��13(�! �� DisplayMemberPath$! ProjectName������ *ProjectFilters+  �� *FilterProject+�� -   " ��Name$" 
btnRefresh��$��Refresh��$��Right=�$��70��$��14(�#��[ ���� *LoadWorkStampsCommand+&   System.Windows.Controls.DataGrid  -	   #  Name$# grdWorkStamps��$��6��$   HeadersVisibility$$ Column=�%   CanUserAddRows$% False��&   CanUserDeleteRows$& False��'   CanUserSortColumns$' False��(   SelectionMode$( Single=�)   AutoGenerateColumns$) False��*   HorizontalGridLinesBrush
* �����+   VerticalGridLinesBrush
+ �����!, %� IsVirtualizingWhenGrouping$
, True��-   EnableRowVirtualization$
- True��. %� IsVirtualizing$
. True��/ %� VirtualizationMode$/ 	Recycling=�0   ClipboardCopyMode$
0 None=�1   RowHeaderWidth$1 0Q�2   
IsReadOnly2 �� *SelectedWorkStamp.IdWorkStamp+  ZeroIsTrueConverter3 �� 	Converter#3 [ ���� 4 �� Source#4 [   �� *SelectedWorkStamp+   CenteredHeader=  7System.Windows.Controls.Primitives.DataGridColumnHeader5 �� TextAlignment  HourRateHeader  HeaderConverter6 �� ConverterParameter 	 DefaultCellStyle*  $System.Windows.Controls.DataGridCell7 P� Property8 P� Value9 ^� 
Conditions: �� Binding%	  System.Windows.Markup.Reference; �� Value< �� RelativeSource= �� Mode 
 RightTextStyle��%I  &	       &	 f     7  7  7  7  &		     7   7   &	
 �    7 	 �� "  .���  � ��$ Center=���  � �� �� .R��� $
��Wrap=�$5 Center=����� �� "  8	   .���  � �� �� .R��� $ Vertical=�.+��� $
��Wrap=�$5 Center=����� $ .�83  �� $5 Center=�$��11(����� $ .�83  86  �� "  .�-
    ��  �� *InvalidDates+ True.a���  � ��
 �  ����  � ��
 �������  � ��
 �  ��P� 7 �@ 
IsSelected$
8 True��. ���  � ��8   ��  � ��
 �������  � ��8  ^� 9 �� : �� *EditingSelectedWorkStamp+4 	  *dtcMainViewModel+; True�� : �� $ 
IsSelected�< �� $
= Self=�; True.0���  � ��
 �   ���  � ��
 �������  � ��
 �   �P� 7 �@J�	IsFocused$
8 True��. ���  � ��
 �   �^� 9 �� : �� *EditingSelectedWorkStamp+4 	  *dtcMainViewModel+; True�� : �� $ 	IsFocused�< �� $
= Self=�; True.0���  � ��
 ������� "  8	   .���  �@��TextAlignment$ Right=�>   RowStyle> �� )
  #System.Windows.Controls.DataGridRow" 
  ��  �� *IdWorkStamp+#3 [ 	 False.a���  �@�ContextMenu ��  �� 4 	  *dtcMainViewModel+.@�m� $	��0,5q�$��Show work stamp ID��? m� Command? �� *ShowWorkStampIdCommand+@ m� CommandParameter@ �� *SelectedWorkStamp.IdWorkStamp+A m� IconA �� $��/Resources/key.png���� m� $	��0,5q�? �� *MergeWorkStampCommand+@ �� *SelectedWorkStamp+���� .+��� $(��"Merge with the previous work stamp���� $��with same project and day��A �� $��/Resources/merge.png���� m� $	��0,5q�$��Delete work stamp��? �� *DeleteWorkStampCommand+@ �� *SelectedWorkStamp+A �� $��/Resources/delete.png����  �� *IdWorkStamp+ 0.a���  � ��
 �������  � ��
 �������  � ��$ Medium"�B   ColumnsB 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumnC   
Visibility$C 	Collapsed=�D   Header$D Id��E   HeaderStyle#E [ F   Width5  /System.Windows.Controls.DataGridLengthConverter$F 35 G   
IsReadOnly$
G True��1  +System.Windows.Controls.DataGridBoundColumnH   BindingH �� *IdWorkStamp+4  .System.Windows.Controls.DataGridComboBoxColumn  $D Project��#E [ $
F 0.9* $G False��I   SelectedValuePath$I 	IdProject��J   DisplayMemberPath$J ProjectName��  DataGridComboBoxStyleK   EditingElementStyle#K [ L   	CellStyle#L [	 M   ItemsSourceM �� $ ProjectsForEditing�4 	  *dtcMainViewModel+N   SelectedValueBindingN �� *	IdProject+O   ElementStyleO �� " ��.���  � ��$
 2,-1q�4  .System.Windows.Controls.DataGridTemplateColumn  $D 
Start Time��#E [ $F 0.75* $G False��#L [
 P   CellTemplateP �� .R��� Q �� Padding$	Q 2,0q����� $ 	StartTime�  DateTimeConverter#3 [ R   CellEditingTemplateR �� .R�!   Workath.DateTimeTextBoxCell  $��0q����� $ 	StartTime�#3 [   $D End Time��#E [ $F 0.75* $G False��#L [
 P �� .R��� $	Q 2,0q����� $ EndTime�#3 [ R �� .R�  $��0q����� $ EndTime�#3 [   $D Working Time��#E [ $F 0.35* $
G True��#L [
 H �� $ WorkingTime�  TimeSpanConverter#3 [   $D Description��#E [ $F 4* $G False��#L [	 H �� $ Description�  #E [ $
F 0.5* $
G True��#L [
 D �� $ HourRateHeaders[0]�4 	  *dtcMainViewModel+H �� *Base1Income+  #E [ $
F 0.5* $
G True��#L [
 D �� $ HourRateHeaders[1]�4 	  *dtcMainViewModel+H �� *Base2Income+  #E [ $
F 0.5* $
G True��#L [
 D �� $ HourRateHeaders[2]�4 	  *dtcMainViewModel+H �� *Base3Income+  #E [ $
F 0.5* $
G True��#L [
 D �� $ HourRateHeaders[3]�4 	  *dtcMainViewModel+H �� *Base4Income+S �� 
GroupStyleS (  "System.Windows.Controls.GroupStyle  T   PanelT �� .R�>  8System.Windows.Controls.Primitives.DataGridRowsPresenter  U   ContainerStyleU �� " ��.���  � �� �� V �� 
TargetType"V ��.R�9� W 9� 
IsExpanded$
W True��$��0q�$��0,5,0,0q����� $ 
Horizontal=�.+��� $
��Bold"����� *Name+���� 
�������$��0,1,0,0q�._��� �� $��8��$ 
Horizontal=�$��Right=�$��Center=�.+��� $��Work Stamps Count:��$��14(��� $��14(�$��5,0,0,0q����� *WorkStampCount+