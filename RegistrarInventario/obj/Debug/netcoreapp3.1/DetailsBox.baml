   M S B A M L   `   `   `  ����N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5   	   $    RegistrarInventario.DetailsBox   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:RegistrarInventario     5   	   -   5          � WindowStartupLocation$  CenterOwner=�5   	   $
��Auto��5	   I   $	��480��6W    � SizeToContent$ Height=�6c   $	��480��6z   $	��160��6�   ���#505050 � Title 6	   �� *
WinTitle+ �� UpdateSourceTrigger$ PropertyChanged=�.��5      � -   5         �Name$ 	grdWindow��5      $��12q�6    � RowDefinitions 5   
   �� 5      $��1* �6   �� 5      $��36 �6   �� 5      $��1* �6   .+�5   
   � $��0��6    � ColumnDefinitions 5      �� 5      $��80 �6#   �� 5      .+�5      �� $��0��6   $"��/Resources/error_32x34px.png��6$   $
��0,10q�6J   $
��None=�6X   �� 5      -   5         ��Name$ 
txtContent��5      $��1��6*   
������ $��0q�6S    �� TextWrapping$
 Wrap=�6g   	 �� 
IsReadOnly$
	 True��6{   $��Center=�6�   ��6�   �� *
TxtContent+$ PropertyChanged=�5      � 5   
   $��1��6   $��0,10,0,0q�6    5      �� 5      $��80 �6#   �� 5      �� 5       $��80 �6#   .+�5"      '   !RegistrarInventario.DetailsButton  -   5        
  Name$
 btnDetalles��5"   "   '   !RegistrarInventario.DetailsButton   ButtonClick$ btnDetalles_ButtonClick��6G   $��0��67      ContentText 6m   �� *TxtDetailsButtonText+$ PropertyChanged=��� 5#      -   5         ��Name$ 	btnCerrar��5#      $��2��6(   $��80��6�   ��68   �� *TxtCloseButtonText+$ PropertyChanged=�6�   5$      �� 5&   
   -   5         ��Name$ 
bdrDetails��5&      $��0,10,0,0q�6%   $��2��67   
�������$	��1pxq�6W   ���#303030._�5'      ��    scrollViewerStyle#��[  6   .��5(      �� $��5q�6   
������ $��0q�6>   $
 Wrap=�6R   $
	 True��6f   ��6x   �� *
TxtDetails+$ PropertyChanged=�5)      5*      5,      5-      