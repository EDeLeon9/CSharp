   M S B A M L   `   `   `  ���� N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  $    RegistrarInventario.DetailsBox   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     3local!clr-namespace:RegistrarInventario     -     � WindowStartupLocation$  CenterOwner=�$
��Auto��$	��480�� � SizeToContent$ Height=�$	��480��$	��160�����#505050 � Title �� *
WinTitle+ �� UpdateSourceTrigger$ PropertyChanged=�.��� -    �Name$ 	grdWindow��$��12q� � RowDefinitions �� $��1* ��� $��36 ��� $��1* �.+�� $��0�� � ColumnDefinitions �� $��80 ��� .+��� $��0��$"��/Resources/error_32x34px.png��$
��0,10q�$
��None=��� -    ��Name$ 
txtContent��$��1��
������ $��0q� �� TextWrapping$
 Wrap=�	 �� 
IsReadOnly$
	 True��$��Center=����� *
TxtContent+$ PropertyChanged=�� $��1��$��0,10,0,0q� �� $��80 ��� �� $��80 �.+�'   !RegistrarInventario.DetailsButton  -   
  Name$
 btnDetalles��'   !RegistrarInventario.DetailsButton   ButtonClick$ btnDetalles_ButtonClick��$��0��   ContentText �� *TxtDetailsButtonText+$ PropertyChanged=��� -    ��Name$ 	btnCerrar��$��2��$��80������ *TxtCloseButtonText+$ PropertyChanged=��� -    ��Name$ 
bdrDetails��$��0,10,0,0q�$��2��
�������$	��1pxq����#303030._���    scrollViewerStyle#��[  .���� $��5q�
������ $��0q�$
 Wrap=�$
	 True������ *
TxtDetails+$ PropertyChanged=�