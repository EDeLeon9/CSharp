   M S B A M L   `   `   `  ����N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5      5clr-namespace:AttachedBehaviorsAttachedBehaviors  5      %    RegistrarInventario.VerPaquetes   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:RegistrarInventario     5      .abclr-namespace:AttachedBehaviors     5        � DataContext  5      (   "RegistrarInventario.VM_VerPaquetes  5   
   -   5        dtcVM_VerPaquetes��5      .��5      �    windowRectangleBackground#��[  6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��1* �6   �� 5      $
��Auto �6   .+�5   
   ]� $��0��6   $��12q�6!   .+�5      d� $
��Left=�6   $
��Left=�61   $��Nuevo Paquete��6L   $	��100��6d   $��26��6p    d� 	IsChecked 6|   �� *AgregandoNuevoPaquete+��6�   �� *CommandNuevoPaquete+�� 5      $��Right=�6   $��Right=�6,   $��Regresar��6H   $��18,0,0,0q�6[   $��80��6m   $��26��6x   ��6�   �� *CommandRegresar+5      �� 5   
   $
��12,0q�6   $��1��6"   � 5   
   $��2��6   $��
12,12,12,0q�6    � ColumnDefinitions 5      �� 5       $��6* �6#   �� 5!      $��1* �6#   .+�5$      ]� .+�5%      ��  �� Orientation$ 
Horizontal=�6   $��Bottom=�66   $��Right=�6N   $��0,2,0,8q�6j   .+�5&      �� $��Conteo de filas:��6   $��0q�67   �� 5'      $��4,0,2,0q�6U   ��6   �� *Items.Count+ �� ElementName$ grdPaquetes��6U   5(      &   System.Windows.Controls.DataGrid  5*      -   5          Name$ grdPaquetes��5*      ��60   �� *ColPaquetes+ �� SelectedItem 6T   �� *SelectedPaquete+ � 	Resources 5+      	 �� 
TargetType  scrollBarStyle
 �� BasedOn*  $System.Windows.Controls.DataGridCell  dataGridCellStyle��%`   '��       7  '  "     7  �� 5,      "	 ��6    8
   67   �� 5-      "	  6    8
   6:   5.         RowStyle 55      �� 57      )  #System.Windows.Controls.DataGridRow"	  6    #
 [B 69   .�58      �� (   "AttachedBehaviors.AttachedBehavior �� Property �@ 	EventType �� Value$ MouseLeftDoubleClick=�6N   �� 59       �@ Command 6L   �� *" CommandElegirPaqueteSeleccionado+$ dtcVM_VerPaquetes���� 5:       �@�ContextMenu 5;   "   �� 5>   &     62   ��  �� Source %  System.Windows.Markup.Reference  *dtcVM_VerPaquetes+.@�5?   *   m�  m� Command 63   �� *CommandEliminarPaquete+��5@   .   �� 5A   2   "	 m�68   .�5B   6   ��  � ��$4 .Eliminar paquete (solo paquetes sin productos)��6O   �� 5C   6    � {�$ False��6R    �� Triggers 5D   6   �� 5E   :    �� Binding 6F   �� *&$SelectedPaquete.CantProductosPaquete+ �� Value 06   .a�5F   >   ��  � {�$
 True��6Z   �� 5G   >    � ��$ Eliminar paquete��6W   5H   ;   5J   3    m� Icon 5L   .   �� 5N   2   $��/Resources/delete.png��68   5P   +   5Q   '   5S       5T      �� 5U   "    6.   �� *AgregandoNuevoPaquete+$ dtcVM_VerPaquetes�� True6w   .a�5V   &   ��  �@�ContextMenu 6D   Z� 5W   #   5Y         Columns 5\      0  *System.Windows.Controls.DataGridTextColumn  5]      ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$ 70	 6-      Header$ 
Id Paquete��68     ElementStyleCenter1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [ 6j    
  Binding 6L   �� *	IdPaquete+6j     5^      $ 45	 6-   $ Cant. Prod.��68   # [ 6v    6M   �� *CantProductosPaquete+6v     5_      $	 170	 6-   $ Fecha de Consolidación��69    6Y   �� *FechaConsolidacion+  dateTimeConverter �� 	Converter# [   5`      $	 170	 6-   $  Fecha de Llegada a Panamá��69    6\   �� *FechaLlegadaPanama+# [   5a      $
 0.4*	 6-   $ Gastos Paquete��6:    6R   �� *GastosPaquete+  5b      $
 1.3*	 6-   $ Descripción de Paquete��6:     ElementStyleWrapping# [ 6�    6Z   �� *DescripcionPaquete+6�     5c      $
 0.4*	 6-   $ Nombre de Courier��6:   # [ 6w    6U   �� *NombreCourier+6w     5d      $
 1.7*	 6-   $ Comentarios��6:   # [ 6v    6O   �� *ComentariosPaquete+6v   5f      5g      � 5i      $��1��6   $��
24,70,0,70q�6#    5j      �� 5k      $
��Auto �6$   �� 5l      $��1* �6$   �� 5m      $
��Auto �6$   �� 5n      $
��Auto �6$   .+�5q      �� $%��Gastos de paquete seleccionado:��6   $��14(�6B     5s      -   5        $ 	grdGastos��5s      $��1��6.   ��6;   �� *	ColGastos+ 5t      ��%`   '��       7  '  "     7  �� 5u      "	 ��6    8
   67   �� 5v      "	  6    8
   6:   5w       5y        5z      $
 0.7*	 6-   $ Monto��6:    6I   �� *
MontoGasto+  5{      $
 2.5*	 6-   $ Descripción de Gasto��6:   # [ 6}    6X   �� *DescripcionGasto+6}   5}      �� 5      $��2��6   $ 
Horizontal=�6*   $��Right=�6C   $��0,2,0,0q�6_   .+�5�      �� $��Total de gastos:��6   $��0q�67   �� 5�      $��4,0,2,0q�6>   ��6   �� *SumMontoGasto+6>   5�      �� 5�      $��Ver detalle de gastos��6   $��3��69   $��0,10,0,0q�6F   $��26��6X   $
��12,0q�6d   $��Right=�6s   ��6�   �� *CommandVerDetalleGastos+5�      5�      � 5�   
   $��
12,6,12,12q�6   $��3��6#   $��58��60    5�      �� 5�      $
��1.3* �6#   �� 5�      $	��290 �6#   �� 5�      $	��320 �6#   �� 5�      $
��0.9* �6#   �� 5�      $
��1.5* �6#   �� 5�      $
��Auto �6#   �� 5�      $
��Auto �6#   .+�5�      (   "RegistrarInventario.LabeledTextBox  $��0��6#   "   TxtVerticalContentAlignment$	 Top=�63      
LblContent$ Descr. Paquete:��6U      TxtTextWrapping$
 Wrap=�6r      TxtText 6�   �� *DescripcionPaquete+  5�      $��1��6#   $��12,0,0,0q�63   $ Fecha Consolidación:��6E   $��26��6g      
NumsNChars$ /:��6s    6�   �� *FechaConsolidacion+  5�      $��2��6#   $��12,0,0,0q�63   $ Fecha Llegada a Panamá:��6E   $��26��6j   $ /:��6v    6�   �� *FechaLlegadaPanama+)   #RegistrarInventario.LabeledComboBox  5�      $��3��6$   $��12,0,0,0q�64   $��26��6F      
LblContent$ Courier:��6R       CboIsEditable$
  True��6h   !   CboDisplayMemberPath$! NombreCourier��6�   "   CboSelectedValuePath$" 	IdCourier��6�   #   CboItemsSource# 6}   �� *ColCouriers+$   CboSelectedValue$ 6�   �� *	IdCourier+  5�      $��4��6#   $��12,0,0,0q�63   $	 Top=�6E   $ Comentarios:��6g   $
 Wrap=�6�    6�   �� *ComentariosPaquete+)   #RegistrarInventario.LabeledCheckBox  5�      $��5��6$   %   
LblContent$% 	Terminado��64   $��12,0,0,0q�6K   &   ChkIsChecked& 6]   �� *	Terminado+�� 5�      $��6��6   $��12,0,0,0q�6%   $��90��67   $��38��6B   ��6N   �� *CommandGuardarCambios+��5�      �� 5�      "	 ��6   #
 [B��60   .�5�      ��  � �� 5�      �� 5�   "   $ Vertical=�6-   .+�5�   &   �� $��	Modificar��60   $��Center=�6A   $��15(�6^   $��DemiBold"�6l   5�   #   5�       5�      �� 5�       6*   �� *AgregandoNuevoPaquete+$ dtcVM_VerPaquetes�� True6s   .a�5�   "   ��  � �� 5�   &   �� 5�   *   $ Vertical=�65   .+�5�   .   �� $��Nuevo��68   $��Center=�6E   $��16(�6b   $��DemiBold"�6p   5�   +   5�   #   5�      5�      5�      5�      5�      5�      