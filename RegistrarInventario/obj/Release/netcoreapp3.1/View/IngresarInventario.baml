   M S B A M L   `   `   `  ���� N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  ,    &RegistrarInventario.IngresarInventario   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     3local!clr-namespace:RegistrarInventario       � DataContext  /   )RegistrarInventario.VM_IngresarInventario  -   dtcVM_IngresarInventario��.��� .+��    windowRectangleBackground#��[   � RowDefinitions �� $
��auto ��� $
��auto ��� $
��auto ��� $
��auto ��� $
��auto ��� �� $
��auto ��� $
��auto ��� $
��auto ��� $
��auto �.+�� $��12q�$��0��$��58�� � ColumnDefinitions �� $	��150 ��� $��3* ��� $
��Auto ��� $	��150 ��� $
��2.3* ��� $
��Auto ��� $
��1.5* ��� $
��Auto �.+��� $��0�� �� Orientation$ Vertical=�.+�]� .+��� -    ��Name$ 
btnIdOrden��$��	Id Orden:��$��26��$	��6,0q����� *CommandAbrirOrdenes+(   "RegistrarInventario.LabeledTextBox  -     Name$ 
txtIdOrden��   LblWidth$ 5Q�$��26��   
NumsNChars$ +0��"   TxtVerticalContentAlignment$ Center=�	   TxtText	 �� *	IdOrden+  -   $ txtGastosOrden��$��0,6,0,0q�
   
LblContent$
 Gastos Orden:��$��26��   TxtIsReadOnly$
 True��   TxtBackground
 ���� $ 0.��	 �� *GastosOrden+  -   $ txtDescripcionOrden��$��1��$��12,0,0,0q�$	 Top=�$
 Descr. Ord.:��   TxtTextWrapping$
 Wrap=�$
 True��
 ���� 	 �� *DescripcionOrden++   %RegistrarInventario.VerticalSeparator  $��2��$
��24,0q��� $��3��$ Vertical=�.+�]� .+��� -   $ btnIdPaquete��$��Id Paquete:��$��26��$	��6,0q����� *CommandAbrirPaquetes+  -   $ txtIdPaquete��$ 5Q�$��26��$ +0��$ Center=�	 �� *	IdPaquete+  -   $ txtGastosPaquete��$��0,6,0,0q�$
 Gastos Paquete:��$��26��$
 True��
 ���� $ 0.��	 �� *GastosPaquete+  -	   $ txtDescripcionPaquete��$��4��$��12,0,0,0q�$	 Top=�$
 Descr. Paq.:��$
 Wrap=�$
 True��
 ���� 	 �� *DescripcionPaquete+  $��5��$
��24,0q�  -
   $ txtBuscarProducto��$��6��$��26��$
 Buscar Prod.:��	 �� *BuscarProducto+d� -    d�Name$ btnVerMasBuscarProducto��$��Ver más��$��7��$��12,0,0,0q�$��26��$��60�� J� IsHitTestVisible �� *IsOpen+ �� ElementName$ popupVerMasBuscarProducto��  invertBoolConverter �� 	Converter# [  d� 	IsChecked �� *VerMasBuscarProductoIsChecked+{��� *ColBuscarProducto.Count+ * &integerIsGreaterThanOneToBoolConverter# [ � -    �Name$ popupVerMasBuscarProducto�� � 	StaysOpen$ False��$
��Left=�$��Slide=� � AllowsTransparency$
 True������ *	IsChecked+$ btnVerMasBuscarProducto�� � PlacementTarget �� $ btnVerMasBuscarProducto�� � VerticalOffset �� *ActualHeight+$ btnVerMasBuscarProducto�� � HorizontalOffset �� *ActualWidth+$ btnVerMasBuscarProducto��  addStringToDoubleConverter# [  �� ConverterParameter$ 5�� � 	Resources  �� 
TargetType  scrollBarStyle �� BasedOn��%   '��       7  �� " ��8   .����  �� Padding$ 0,0,5,5q�._��� $	��365��
�������  listBoxItemMouseUpSelection#��[  �� DisplayMemberPath$ NombreProducto������ *ColBuscarProducto+ �� SelectedItem �� *BuscarProductoItem+  J� Effect  3  -System.Windows.Media.Effects.DropShadowEffect  !   
BlurRadius$! 5Q�"   Opacity$	" 0.5Q��� $
��12,6q�$��1��� $��12q�$��2��$��58�� �� $��2* ��� $��1* ��� $
��Auto ��� $
��0.6* ��� $��1* �.+��� $��0��$ Vertical=�.+�]� .+��� -   $ btnCategoria��$��
Categoria:��$��26��$��66��)   #RegistrarInventario.LabeledComboBox  -   #  Name$# cboCategoria��$��26��$   LblWidth$$ 5Q�%   CboIsEditable$
% True��&   CboSelectedValuePath$& IdCategoriaProducto��'   CboDisplayMemberPath$' 	Categoria��(   CboItemsSource( �� *ColCategoriasProducto+)   CboSelectedValue) �� *IdCategoriaProducto+� $��0,6,0,0q� �� $��1* ��� $	��150 �.+�]� .+��� -   $ btnProducto��$��	Producto:��$��26��$��66��  -   $# cboProducto��$��0��$��26��$$ 5Q�$
% True��$' NombreProducto��( �� *ColProductos+*   CboSelectedItem* �� *ProductoItem+  -   $ 	txtPrecio��$��1��$
 Precio:��$��12,0,0,0q�$��26��$
 True��
 ���� $ 0.��	 �� *Precio+  -   $ txtComentariosProducto��$��1��$��12,0,0,0q�$	 Top=�$
 Coment. Prod.:��$
 True��$
 Wrap=�
 ���� 	 �� *ComentariosProducto+  $��2��$
��24,0q�]� $��3��.+��� -   $ btnColorTalla��$	��6,0q�.���� $ Vertical=�.+��� $��Color:��$��Right=��� $��15���� $��Talla:��$��Right=��� $ Vertical=�.+�  -   $# cboColor��$��0��$��26��$$ 5Q�$
% True��( �� *
ColColores+) �� *Color+  -   $# cboTalla��$��1��$��0,6,0,0q�$��26��$$ 5Q�$
% True��$' Talla��+   CboColumnNames$+ Talla,TallaReal��( �� *ColVariacionesPorColor+* �� *VariacionItem+  -   $ txtNotasVariacion��$��4��$��12,0,0,0q�$	 Top=�$
 Wrap=�$
 Notas Variación:��$
 True��
 ���� 	 �� *NotasVariacion+�� $
��12,6q�$��3��� $��12q�$��4�� �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��1* ��� $
��Auto ��� $
��Auto �.+�  -   $ txtCosto��$��0��$
 Costo:��,   TxtWidth$, 80Q�$��26��$ 0.��	 �� *CostoProducto+  -   $ txtShippingProducto��$��1��$��12,0,0,0q�$, 80Q�$
 Shipping Prod.:��$��26��$ 0.��	 �� *ShippingProducto+  -   $ txtDescuentoProducto��$��2��$��12,0,0,0q�$, 80Q�$
 Descuento Prod.:��$��26��$ 0.��	 �� *DescuentoProducto+  -   $ txtReembolsoProducto��$��3��$��12,0,0,0q�$, 80Q�$
 Reembolso Prod.:��$��26��$ 0.��	 �� *ReembolsoProducto+  -   $" txtComentariosProdInventario��$��4��$��12,0,0,0q�$��26��$
 Coment. Prod. Inventario:��	 �� *ComentariosInventario+)   #RegistrarInventario.LabeledCheckBox  -   -  Name$- chkNoLimpiar��$��5��.   
LblContent$. 
No Limpiar��$��24,0,0,0q�/   ChkIsChecked/ �� *	NoLimpiar+�� -   $ 
btnAgregar��$��6��$��32��$��70��$��12,0,0,0q�$��Agregar������ *CommandAgregar+� $��5��$��	0,12,24,0q� �� $��24 ��� $��1* �.+��� -   $ txtAgruparInventario��$��42��$	��Top=����� *CommandAgruparInventario+.��F� 
�������F����        �     � р�[ ��[ р�[  � � � ��[ р�[     р�[ ��[ 	���� " F�0 �� Triggers0 �� 1 �� Binding1 �� *ColumnCantidadVisibility+2 �� Value2 Visible.a��� 3 �� Property3 � z�4 �� Value4 �� 5 �� CenterX$5 6Q�6 �� CenterY$6 6Q�7 �� Angle$	7 180Q�&   System.Windows.Controls.DataGrid  -   8  Name$8 grdInventario��$��1��9   ColumnHeaderHeight$9 40Q����� *ColInventario+ �� *SelectedInventario+ *  $System.Windows.Controls.DataGridCell  dataGridCellStyle��%:   '��       7  '       7  �� " ��8   �� "  8   :   RowStyle: �� )	  #System.Windows.Controls.DataGridRow" 	 # [B	 .��� 3 �@�ContextMenu4 ��   �� ; �� Source; %
  System.Windows.Markup.Reference
  *dtcVM_IngresarInventario+.@�m� $��Eliminar Producto��< m� Command< �� *CommandEliminarProducto+= m� Icon= �� $��/Resources/delete.png��>   Columns> 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn?   Header$? Cant.��@   Width5  /System.Windows.Controls.DataGridLengthConverter$@ 45   ElementStyleCenter1  +System.Windows.Controls.DataGridBoundColumnA   ElementStyle#A [ B   
VisibilityB �� *ColumnCantidadVisibility+; 
  *dtcVM_IngresarInventario+C   BindingC �� *CantidadAgrupado+  $? Nombre del Producto��$
@ 1.4*   ElementStyleWrapping#A [ C �� *NombreProducto+  $? Color��$
@ 0.6* #A [ C �� *Color+  $? Talla��$
@ 0.5* #A [ C �� *Talla+  $? Costo Producto��$
@ 0.4* C �� *CostoProducto+  $? Costo Final Producto��$
@ 0.3* C �� *CostoFinalProducto+  $? Precio��$
@ 0.3* C �� *Precio+  $? Ganancia Estimada��$
@ 0.3* C �� *GananciaEstimada+  $"? Notas de Talla y Comentarios��$@ 2* #A [ C �� *NotasTallaYComentarios+�� $ 
Horizontal=�$��6��$��Right=�$��0,2,24,8q�.+��� $��Conteo de filas:��$��0q��� $��4,0,2,0q����� *Items.Count+$ grdInventario��� $��
12,6,12,12q�$��7�� �� $	��200 ��� $	��200 ��� $��1* ��� $��0.65* ��� $
��Auto ��� $	��160 ��� $
��Auto �.+�  -    $ txtIdOrdenSelect��$��0��$
 Id Orden Selección:��$��26��$
 True��
 ���� $ +0��	 �� *OrdenSelect.IdOrden+]� $��1��$��24,0,0,0q�.+��� -!   $ btnGastosOrdenSelect��$��Gastos Orden:��$��26��$	��6,0q����� *CommandAbrirGastosOrden+  -"   $ txtGastosOrdenSelect��$ 5Q�$��26��$
 True��$ 0.��
 ���� 	 �� *OrdenSelect.GastosOrden+]� $��2��$��24,0,0,0q�.+��� -#   $ btnProveedorSelect��$��
Proveedor:��$��26��$	��6,0q�  -$   $ txtProveedorSelect��$ 5Q�$��26��$
 True��
 ���� 	 �� *OrdenSelect.NombreProveedor+]� $��3��$��24,0,0,0q�.+��� -%   $ btnTiendaSelect��$��Tienda:��$��26��$	��6,0q�  -&   $ txtTiendaSelect��$ 5Q�$��26��$
 True��
 ���� 	 �� *OrdenSelect.NombreTienda+  -'   $ txtTotalOrdenSelect��$��4��$��24,0,0,0q�$
 Total Orden:��$��26��$, 80Q�$
 True��$ 0.��
 ���� 	 �� *OrdenSelect.TotalOrden+  -(   $% txtCantidadProductosOrdenSelect��$��6��$��24,0,0,0q�$
 Cant. Prod. Orden:��$��26��$, 60Q�$��Right=�$
 True��$ +0��
 ���� 	 �� * OrdenSelect.CantProductosOrden+�� $
��12,6q�$��8��� $��12q�$��9�� �� $	��200 ��� $	��200 ��� $��1* ��� $
��Auto �.+�  -)   $ txtIdPaqueteSelect��$��0��$
 Id Paquete Selección:��$��26��$
 True��
 ���� $ +0��	 �� *PaqueteSelect.IdPaquete+]� $��1��$��24,0,0,0q�.+��� -*   $ btnGastosPaqueteSelect��$��Gastos Paquete:��$��26��$	��6,0q����� *CommandAbrirGastosPaquete+  -+   $ txtGastosPaqueteSelect��$ 5Q�$��26��$
 True��
 ���� 	 �� *PaqueteSelect.GastosPaquete+  -,   $' !txtCantidadProductosPaqueteSelect��$��3��$��24,0,0,0q�$
 Cant. Prod. Paquete:��$��26��$, 60Q�$��Right=�$
 True��
 ���� 	 �� *$"PaqueteSelect.CantProductosPaquete+