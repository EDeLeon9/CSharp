   M S B A M L   `   `   `  ����N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5      5clr-namespace:AttachedBehaviorsAttachedBehaviors  5      $    RegistrarInventario.VerOrdenes   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:RegistrarInventario     5      .abclr-namespace:AttachedBehaviors     5        � DataContext  5      '   !RegistrarInventario.VM_VerOrdenes  5   
   -   5        dtcVM_VerOrdenes��5      .��5      �    windowRectangleBackground#��[  6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��1* �6   �� 5      $
��Auto �6   .+�5   
   ]� $��0��6   $��12q�6!   .+�5      d� $
��Left=�6   $
��Left=�61   $��Nueva Orden��6L   $��90��6b   $��26��6m    d� 	IsChecked 6y   �� *AgregandoNuevaOrden+��6�   �� *CommandNuevaOrden+�� 5      $��Right=�6   $��Right=�6,   $��Regresar��6H   $��18,0,0,0q�6[   $��80��6m   $��26��6x   ��6�   �� *CommandRegresar+5      �� 5   
   $
��12,0q�6   $��1��6"   � 5   
   $��2��6   $��
12,12,12,0q�6    � ColumnDefinitions 5       �� 5!      $��6* �6#   �� 5"      $��1* �6#   .+�5%      ]� .+�5&      ��  �� Orientation$ 
Horizontal=�6   $��Bottom=�66   $��Right=�6N   $��0,2,0,8q�6j   .+�5'      �� $��Conteo de filas:��6   $��0q�67   �� 5(      $��4,0,2,0q�6T   ��6   �� *Items.Count+ �� ElementName$ 
grdOrdenes��6T   5)      &   System.Windows.Controls.DataGrid  5+      -   5          Name$ 
grdOrdenes��5+      ��6/   �� *
ColOrdenes+ �� SelectedItem 6R   �� *SelectedOrden+ � 	Resources 5,      	 �� 
TargetType  scrollBarStyle
 �� BasedOn*  $System.Windows.Controls.DataGridCell  dataGridCellStyle��%`   '��       7  '  "     7  �� 5-      "	 ��6    8
   67   �� 5.      "	  6    8
   6:   5/         RowStyle 56      �� 58      )  #System.Windows.Controls.DataGridRow"	  6    #
 [B 69   .�59      �� (   "AttachedBehaviors.AttachedBehavior �� Property �@ 	EventType �� Value$ MouseLeftDoubleClick=�6N   �� 5:       �@ Command 6L   �� * CommandElegirOrdenSeleccionada+$ dtcVM_VerOrdenes���� 5;       �@�ContextMenu 5<   "   �� 5?   &     62   ��  �� Source %  System.Windows.Markup.Reference  *dtcVM_VerOrdenes+.@�5@   *   m�  m� Command 63   �� *CommandEliminarOrden+��5A   .   �� 5B   2   "	 m�68   .�5C   6   ��  � ��$2 ,Eliminar orden (solo órdenes sin productos)��6O   �� 5D   6    � {�$ False��6R    �� Triggers 5E   6   �� 5F   :    �� Binding 6F   �� *" SelectedOrden.CantProductosOrden+ �� Value 06{   .a�5G   >   ��  � {�$
 True��6Z   �� 5H   >    � ��$ Eliminar orden��6W   5I   ;   5K   3    m� Icon 5M   .   �� 5O   2   $��/Resources/delete.png��68   5Q   +   5R   '   5T       5U      �� 5V   "    6.   �� *AgregandoNuevaOrden+$ dtcVM_VerOrdenes�� True6t   .a�5W   &   ��  �@�ContextMenu 6D   Z� 5X   #   5Z         Columns 5]      0  *System.Windows.Controls.DataGridTextColumn  5^      ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$ 70	 6-      Header$ Id Orden��68     ElementStyleCenter1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [ 6f    
  Binding 6J   �� *	IdOrden+6f     5_      $ 45	 6-   $ Cant. Prod.��68   # [ 6t    6M   �� *CantProductosOrden+6t     5`      $	 170	 6-   $ Fecha Orden��69    6N   �� *
FechaOrden+  dateTimeConverter �� 	Converter# [   5a      $
 0.6*	 6-   $ Total Orden��6:    6O   �� *
TotalOrden+  5b      $
 3.2*	 6-   $ Descripción de Orden��6:     ElementStyleWrapping# [ 6}    6X   �� *DescripcionOrden+6}     5c      $ 1*	 6-   $ Nombre de Tienda��68   # [ 6s    6R   �� *NombreTienda+6s     5d      $
 1.8*	 6-   $ Nombre del Proveedor��6:   # [ 6|    6X   �� *NombreProveedor+6|     5e      $
 2.8*	 6-   $ Comentarios��6:   # [ 6t    6O   �� *ComentariosOrden+6t   5g      5h      � 5j      $��1��6   $��
24,70,0,70q�6#    5k      �� 5l      $
��Auto �6$   �� 5m      $��1* �6$   �� 5n      $
��Auto �6$   �� 5o      $
��Auto �6$   .+�5r      �� $#��Gastos de orden seleccionada:��6   $��14(�6@     5t      -   5        $ 	grdGastos��5t      $��1��6.   ��6;   �� *	ColGastos+ 5u      ��%`   '��       7  '  "     7  �� 5v      "	 ��6    8
   67   �� 5w      "	  6    8
   6:   5x       5z        5{      $
 0.7*	 6-   $ Monto��6:    6I   �� *
MontoGasto+  5|      $
 2.5*	 6-   $ Descripción de Gasto��6:   # [ 6}    6X   �� *DescripcionGasto+6}   5~      �� 5�      $��2��6   $ 
Horizontal=�6*   $��Right=�6C   $��0,2,0,0q�6_   .+�5�      �� $��Total de gastos:��6   $��0q�67   �� 5�      $��4,0,2,0q�6>   ��6   �� *SumMontoGasto+6>   5�      �� 5�      $��Ver detalle de gastos��6   $��3��69   $��0,10,0,0q�6F   $��26��6X   $
��12,0q�6d   $��Right=�6s   ��6�   �� *CommandVerDetalleGastos+5�      5�      � 5�   
   $��
12,6,12,12q�6   $��3��6#   $��58��60    5�      �� 5�      $
��1.5* �6#   �� 5�      $	��240 �6#   �� 5�      $
��0.8* �6#   �� 5�      $
��0.9* �6#   �� 5�      $
��1.5* �6#   �� 5�      $
��Auto �6#   �� 5�      $
��Auto �6#   .+�5�      (   "RegistrarInventario.LabeledTextBox  $��0��6#   "   TxtVerticalContentAlignment$	 Top=�63      
LblContent$ Descr. Orden:��6U      TxtTextWrapping$
 Wrap=�6p      TxtText 6�   �� *DescripcionOrden+  5�      $��1��6#   $��12,0,0,0q�63   $ Fecha Orden:��6E   $��26��6_      
NumsNChars$ /:��6k    6{   �� *
FechaOrden+)   #RegistrarInventario.LabeledComboBox  5�      $��2��6$   $��12,0,0,0q�64   $��26��6F      
LblContent$ Tienda:��6R       CboIsEditable$
  True��6g   !   CboDisplayMemberPath$! NombreTienda��6�   "   CboSelectedValuePath$" IdTienda��6�   #   CboItemsSource# 6|   �� *
ColTiendas+$   CboSelectedValue$ 6�   �� *
IdTienda+  5�      $��3��6$   $��12,0,0,0q�64   $��26��6F   $ 
Proveedor:��6R   $
  True��6j   $! NombreProveedor��6�   $" IdProveedor��6�   # 6   �� *ColProveedores+$ 6�   �� *IdProveedor+  5�      $��4��6#   $��12,0,0,0q�63   $	 Top=�6E   $ Comentarios:��6g   $
 Wrap=�6�    6�   �� *ComentariosOrden+)   #RegistrarInventario.LabeledCheckBox  5�      $��5��6$   %   
LblContent$% 	Terminado��64   $��12,0,0,0q�6K   &   ChkIsChecked& 6]   �� *	Terminado+�� 5�      $��6��6   $��12,0,0,0q�6%   $��90��67   $��38��6B   ��6N   �� *CommandGuardarCambios+��5�      �� 5�      "	 ��6   #
 [B��60   .�5�      ��  � �� 5�      �� 5�   "   $ Vertical=�6-   .+�5�   &   �� $��	Modificar��60   $��Center=�6A   $��15(�6^   $��DemiBold"�6l   5�   #   5�       5�      �� 5�       6*   �� *AgregandoNuevaOrden+$ dtcVM_VerOrdenes�� True6p   .a�5�   "   ��  � �� 5�   &   �� 5�   *   $ Vertical=�65   .+�5�   .   �� $��Nuevo��68   $��Center=�6E   $��16(�6b   $��DemiBold"�6p   5�   +   5�   #   5�      5�      5�      5�      5�      5�      