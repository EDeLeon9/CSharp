   M S B A M L   `   `   `  ���� N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5clr-namespace:AttachedBehaviorsAttachedBehaviors  $    RegistrarInventario.VerOrdenes   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     3local!clr-namespace:RegistrarInventario     .abclr-namespace:AttachedBehaviors       � DataContext  '   !RegistrarInventario.VM_VerOrdenes  -   dtcVM_VerOrdenes��.���    windowRectangleBackground#��[   � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��1* ��� $
��Auto �.+�]� $��0��$��12q�.+�d� $
��Left=�$
��Left=�$��Nueva Orden��$��90��$��26�� d� 	IsChecked �� *AgregandoNuevaOrden+���� *CommandNuevaOrden+�� $��Right=�$��Right=�$��Regresar��$��18,0,0,0q�$��80��$��26������ *CommandRegresar+�� $
��12,0q�$��1��� $��2��$��
12,12,12,0q� � ColumnDefinitions �� $��6* ��� $��1* �.+�]� .+���  �� Orientation$ 
Horizontal=�$��Bottom=�$��Right=�$��0,2,0,8q�.+��� $��Conteo de filas:��$��0q��� $��4,0,2,0q����� *Items.Count+ �� ElementName$ 
grdOrdenes��&   System.Windows.Controls.DataGrid  -     Name$ 
grdOrdenes������ *
ColOrdenes+ �� SelectedItem �� *SelectedOrden+ � 	Resources 	 �� 
TargetType  scrollBarStyle
 �� BasedOn*  $System.Windows.Controls.DataGridCell  dataGridCellStyle��%:   '��       7  '       7  �� "	 ��8
   �� "	  8
      RowStyle �� )  #System.Windows.Controls.DataGridRow"	  #
 [B .��� (   "AttachedBehaviors.AttachedBehavior �� Property �@ 	EventType �� Value$ MouseLeftDoubleClick=���  �@ Command �� * CommandElegirOrdenSeleccionada+$ dtcVM_VerOrdenes����  �@�ContextMenu ��   ��  �� Source %  System.Windows.Markup.Reference  *dtcVM_VerOrdenes+.@�m�  m� Command �� *CommandEliminarOrden+���� "	 m�.���  � ��$2 ,Eliminar orden (solo órdenes sin productos)����  � {�$ False�� �� Triggers ��  �� Binding �� *" SelectedOrden.CantProductosOrden+ �� Value 0.a���  � {�$
 True����  � ��$ Eliminar orden�� m� Icon �� $��/Resources/delete.png�� ��  �� *AgregandoNuevaOrden+$ dtcVM_VerOrdenes�� True.a���  �@�ContextMenu Z�    Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$ 70	    Header$ Id Orden��  ElementStyleCenter1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [  
  Binding �� *	IdOrden+  $ 45	 $ Cant. Prod.��# [  �� *CantProductosOrden+  $	 170	 $ Fecha Orden�� �� *
FechaOrden+  dateTimeConverter �� 	Converter# [   $
 0.6*	 $ Total Orden�� �� *
TotalOrden+  $
 3.2*	 $ Descripción de Orden��  ElementStyleWrapping# [  �� *DescripcionOrden+  $ 1*	 $ Nombre de Tienda��# [  �� *NombreTienda+  $
 1.8*	 $ Nombre del Proveedor��# [  �� *NombreProveedor+  $
 2.8*	 $ Comentarios��# [  �� *ComentariosOrden+� $��1��$��
24,70,0,70q� �� $
��Auto ��� $��1* ��� $
��Auto ��� $
��Auto �.+��� $#��Gastos de orden seleccionada:��$��14(�  -   $ 	grdGastos��$��1������ *	ColGastos+ ��%:   '��       7  '       7  �� "	 ��8
   �� "	  8
      $
 0.7*	 $ Monto�� �� *
MontoGasto+  $
 2.5*	 $ Descripción de Gasto��# [  �� *DescripcionGasto+�� $��2��$ 
Horizontal=�$��Right=�$��0,2,0,0q�.+��� $��Total de gastos:��$��0q��� $��4,0,2,0q����� *SumMontoGasto+�� $��Ver detalle de gastos��$��3��$��0,10,0,0q�$��26��$
��12,0q�$��Right=����� *CommandVerDetalleGastos+� $��
12,6,12,12q�$��3��$��58�� �� $
��1.5* ��� $	��240 ��� $
��0.8* ��� $
��0.9* ��� $
��1.5* ��� $
��Auto ��� $
��Auto �.+�(   "RegistrarInventario.LabeledTextBox  $��0��"   TxtVerticalContentAlignment$	 Top=�   
LblContent$ Descr. Orden:��   TxtTextWrapping$
 Wrap=�   TxtText �� *DescripcionOrden+  $��1��$��12,0,0,0q�$ Fecha Orden:��$��26��   
NumsNChars$ /:�� �� *
FechaOrden+)   #RegistrarInventario.LabeledComboBox  $��2��$��12,0,0,0q�$��26��   
LblContent$ Tienda:��    CboIsEditable$
  True��!   CboDisplayMemberPath$! NombreTienda��"   CboSelectedValuePath$" IdTienda��#   CboItemsSource# �� *
ColTiendas+$   CboSelectedValue$ �� *
IdTienda+  $��3��$��12,0,0,0q�$��26��$ 
Proveedor:��$
  True��$! NombreProveedor��$" IdProveedor��# �� *ColProveedores+$ �� *IdProveedor+  $��4��$��12,0,0,0q�$	 Top=�$ Comentarios:��$
 Wrap=� �� *ComentariosOrden+)   #RegistrarInventario.LabeledCheckBox  $��5��%   
LblContent$% 	Terminado��$��12,0,0,0q�&   ChkIsChecked& �� *	Terminado+�� $��6��$��12,0,0,0q�$��90��$��38������ *CommandGuardarCambios+���� "	 ��#
 [B��.���  � �� �� $ Vertical=�.+��� $��	Modificar��$��Center=�$��15(�$��DemiBold"� ��  �� *AgregandoNuevaOrden+$ dtcVM_VerOrdenes�� True.a���  � �� �� $ Vertical=�.+��� $��Nuevo��$��Center=�$��16(�$��DemiBold"�