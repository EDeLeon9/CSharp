   M S B A M L   `   `   `  ����N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5      ,    &RegistrarInventario.IngresarInventario   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:RegistrarInventario     5        � DataContext  5
      /   )RegistrarInventario.VM_IngresarInventario  5   
   -   5        dtcVM_IngresarInventario��5   &   .��5      � .+�5   
   �    windowRectangleBackground#��[  6    � RowDefinitions 5      �� 5      $
��auto �6    �� 5      $
��auto �6    �� 5      $
��auto �6    �� 5      $
��auto �6    �� 5      $
��auto �6    �� 5      �� 5      $
��auto �6    �� 5      $
��auto �6    �� 5      $
��auto �6    �� 5      $
��auto �6    .+�5      � $��12q�6   $��0��6   $��58��6,    � ColumnDefinitions 5      �� 5      $	��150 �6'   �� 5       $��3* �6'   �� 5!      $
��Auto �6'   �� 5"      $	��150 �6'   �� 5#      $
��2.3* �6'   �� 5$      $
��Auto �6'   �� 5%      $
��1.5* �6'   �� 5&      $
��Auto �6'   .+�5)      �� $��0��6    �� Orientation$ Vertical=�6-   .+�5*      ]� .+�5+      �� -   5         ��Name$ 
btnIdOrden��5+   !   $��	Id Orden:��65   $��26��6I   $	��6,0q�6U   ��6c   �� *CommandAbrirOrdenes+(   "RegistrarInventario.LabeledTextBox  5,      -   5          Name$ 
txtIdOrden��5,   /      LblWidth$ 5Q�6C   $��26��6P      
NumsNChars$ +0��6\   "   TxtVerticalContentAlignment$ Center=�6�   	   TxtText	 6l   �� *	IdOrden+6�   5-        5.      -   5        $ txtGastosOrden��5.   +   $��0,6,0,0q�6C   
   
LblContent$
 Gastos Orden:��6T   $��26��6o      TxtIsReadOnly$
 True��6{      TxtBackground
 ���� $ 0.��6�   	 6�   �� *GastosOrden+5/        50      -   5        $ txtDescripcionOrden��50   '   $��1��6D   $��12,0,0,0q�6T   $	 Top=�6f   $
 Descr. Ord.:��6�      TxtTextWrapping$
 Wrap=�6�   $
 True��6�   
 ���� 	 6�   �� *DescripcionOrden++   %RegistrarInventario.VerticalSeparator  52      $��2��6*   $
��24,0q�6:   �� 54      $��3��6   $ Vertical=�6-   .+�55      ]� .+�56      �� -   5        $ btnIdPaquete��56   !   $��Id Paquete:��67   $��26��6M   $	��6,0q�6Y   ��6g   �� *CommandAbrirPaquetes+  57      -   5        $ txtIdPaquete��57   /   $ 5Q�6E   $��26��6R   $ +0��6^   $ Center=�6�   	 6n   �� *	IdPaquete+6�   58        59      -   5        $ txtGastosPaquete��59   +   $��0,6,0,0q�6E   $
 Gastos Paquete:��6V   $��26��6s   $
 True��6   
 ���� $ 0.��6�   	 6�   �� *GastosPaquete+5:        5;      -	   5        $ txtDescripcionPaquete��5;   '   $��4��6F   $��12,0,0,0q�6V   $	 Top=�6h   $
 Descr. Paq.:��6�   $
 Wrap=�6�   $
 True��6�   
 ���� 	 6�   �� *DescripcionPaquete+  5=      $��5��6*   $
��24,0q�6:     5?      -
   5        $ txtBuscarProducto��5?   '   $��6��6B   $��26��6R   $
 Buscar Prod.:��6^   	 6y   �� *BuscarProducto+d� 5A      -   5         d�Name$ btnVerMasBuscarProducto��5A      $��Ver más��6@   $��7��6R   $��12,0,0,0q�6b   $��26��6t   $��60��6�    J� IsHitTestVisible 6�   �� *IsOpen+ �� ElementName$ popupVerMasBuscarProducto��  invertBoolConverter �� 	Converter# [  d� 	IsChecked 5B   #   �� *VerMasBuscarProductoIsChecked+{�6W   �� *ColBuscarProducto.Count+ * &integerIsGreaterThanOneToBoolConverter# [ � 5D      -   5         �Name$ popupVerMasBuscarProducto��5D       � 	StaysOpen$ False��6}   $
��Left=�6�   $��Slide=�6�    � AllowsTransparency$
 True��6�   ��6;   �� *	IsChecked+$ btnVerMasBuscarProducto�� � PlacementTarget 6�   �� $ btnVerMasBuscarProducto�� � VerticalOffset 5E      �� *ActualHeight+$ btnVerMasBuscarProducto�� � HorizontalOffset 6i   �� *ActualWidth+$ btnVerMasBuscarProducto��  addStringToDoubleConverter# [  �� ConverterParameter$ 5�� � 	Resources 5F       �� 
TargetType  scrollBarStyle �� BasedOn��%0   '��       7  �� 5G      " ��6    8   67   5H      .��5I      ��  �� Padding$ 0,0,5,5q�6   ._�5J      �� $	��365��6"   
�������  listBoxItemMouseUpSelection#��[ 6E    �� DisplayMemberPath$ NombreProducto��6�   ��6�   �� *ColBuscarProducto+ �� SelectedItem 6�   �� *BuscarProductoItem+  J� Effect  5K      3  -System.Windows.Media.Effects.DropShadowEffect  5L   "   !   
BlurRadius$! 5Q�63   "   Opacity$	" 0.5Q�6B   5N      5O      5P      5Q      �� 5S      $
��12,6q�6   $��1��6&   � 5U      $��12q�6   $��2��6   $��58��6,    5V      �� 5W      $��2* �6'   �� 5X      $��1* �6'   �� 5Y      $
��Auto �6'   �� 5Z      $
��0.6* �6'   �� 5[      $��1* �6'   .+�5^      �� $��0��6   $ Vertical=�6-   .+�5_      ]� .+�5`      �� -   5        $ btnCategoria��5`   !   $��
Categoria:��67   $��26��6L   $��66��6X   )   #RegistrarInventario.LabeledComboBox  5a      -   5        #  Name$# cboCategoria��5a   1   $��26��6G   $   LblWidth$$ 5Q�6S   %   CboIsEditable$
% True��6`   &   CboSelectedValuePath$& IdCategoriaProducto��6�   '   CboDisplayMemberPath$' 	Categoria��6�   (   CboItemsSource( 6u   �� *ColCategoriasProducto+)   CboSelectedValue) 6�   �� *IdCategoriaProducto+5b      � 5c      $��0,6,0,0q�6    5d      �� 5e      $��1* �6/   �� 5f      $	��150 �6/   .+�5h      ]� .+�5i      �� -   5        $ btnProducto��5i   %   $��	Producto:��6:   $��26��6N   $��66��6Z     5j      -   5        $# cboProducto��5j   4   $��0��6I   $��26��6Y   $$ 5Q�6e   $
% True��6r   $' NombreProducto��6�   ( 6�   �� *ColProductos+*   CboSelectedItem* 6�   �� *ProductoItem+5k        5l      -   5        $ 	txtPrecio��5l   /   $��1��6B   $
 Precio:��6R   $��12,0,0,0q�6g   $��26��6y   $
 True��6�   
 ���� $ 0.��6�   	 6�   �� *Precio+5m      5n        5o      -   5        $ txtComentariosProducto��5o   '   $��1��6G   $��12,0,0,0q�6W   $	 Top=�6i   $
 Coment. Prod.:��6�   $
 True��6�   $
 Wrap=�6�   
 ���� 	 6�   �� *ComentariosProducto+  5q      $��2��6*   $
��24,0q�6:   ]� 5s      $��3��6   .+�5t      �� -   5        $ btnColorTalla��5t      $	��6,0q�64   .��5u      �� $ Vertical=�6%   .+�5v      �� $��Color:��6(   $��Right=�66   �� 5w      $��15��6%   �� 5x      $��Talla:��6(   $��Right=�66   5y      5z      �� 5{      $ Vertical=�6!   .+�5|        -   5        $# cboColor��5|   0   $��0��6B   $��26��6R   $$ 5Q�6^   $
% True��6k   ( 6�   �� *
ColColores+) 6�   �� *Color+  5}      -   5        $# cboTalla��5}   0   $��1��6B   $��0,6,0,0q�6R   $��26��6c   $$ 5Q�6o   $
% True��6|   $' Talla��6�   +   CboColumnNames$+ Talla,TallaReal��6
  ( 6�   �� *ColVariacionesPorColor+* 6�   �� *VariacionItem+6
  5~      5        5�      -   5        $ txtNotasVariacion��5�   '   $��4��6B   $��12,0,0,0q�6R   $	 Top=�6d   $
 Wrap=�6�   $
 Notas Variación:��6�   $
 True��6�   
 ���� 	 6�   �� *NotasVariacion+5�      �� 5�      $
��12,6q�6   $��3��6&   � 5�      $��12q�6   $��4��6    5�      �� 5�      $
��Auto �6'   �� 5�      $
��Auto �6'   �� 5�      $
��Auto �6'   �� 5�      $
��Auto �6'   �� 5�      $��1* �6'   �� 5�      $
��Auto �6'   �� 5�      $
��Auto �6'   .+�5�        -   5        $ txtCosto��5�   '   $��0��69   $
 Costo:��6I   ,   TxtWidth$, 80Q�6]   $��26��6k   $ 0.��6w   	 6�   �� *CostoProducto+  5�      -   5        $ txtShippingProducto��5�   '   $��1��6D   $��12,0,0,0q�6T   $, 80Q�6f   $
 Shipping Prod.:��6t   $��26��6�   $ 0.��6�   	 6�   �� *ShippingProducto+  5�      -   5        $ txtDescuentoProducto��5�   '   $��2��6E   $��12,0,0,0q�6U   $, 80Q�6g   $
 Descuento Prod.:��6u   $��26��6�   $ 0.��6�   	 6�   �� *DescuentoProducto+  5�      -   5        $ txtReembolsoProducto��5�   '   $��3��6E   $��12,0,0,0q�6U   $, 80Q�6g   $
 Reembolso Prod.:��6u   $��26��6�   $ 0.��6�   	 6�   �� *ReembolsoProducto+  5�      -   5        $" txtComentariosProdInventario��5�   '   $��4��6M   $��12,0,0,0q�6]   $��26��6o   $
 Coment. Prod. Inventario:��6{   	 6�   �� *ComentariosInventario+)   #RegistrarInventario.LabeledCheckBox  5�      -   5        -  Name$- chkNoLimpiar��5�   (   $��5��6>   .   
LblContent$. 
No Limpiar��6N   $��24,0,0,0q�6f   /   ChkIsChecked/ 6x   �� *	NoLimpiar+�� 5�      -   5        $ 
btnAgregar��5�      $��6��6-   $��32��6=   $��70��6I   $��12,0,0,0q�6T   $��Agregar��6f   ��6x   �� *CommandAgregar+5�      � 5�      $��5��6   $��	0,12,24,0q�6     5�      �� 5�      $��24 �6'   �� 5�      $��1* �6'   .+�5�      �� -   5        $ txtAgruparInventario��5�      $��42��67   $	��Top=�6C   ��6[   �� *CommandAgruparInventario+.��5�      F� 
�������F����        �     � р�[ ��[ р�[  � � � ��[ р�[     р�[ ��[ 	��5�      �� 5�      " F�6$   0 �� Triggers0 5�   "   �� 5�   &   1 �� Binding1 62   �� *ColumnCantidadVisibility+2 �� Value2 Visible6_   .a�5�   *   �� 3 �� Property3 � z�4 �� Value4 5�   .   �� 5�   2   5 �� CenterX$5 6Q�6B   6 �� CenterY$6 6Q�6N   7 �� Angle$	7 180Q�6Z   5�   +   5�   '   5�      5�      5�      &   System.Windows.Controls.DataGrid  5�      -   5        8  Name$8 grdInventario��5�      $��1��62   9   ColumnHeaderHeight$9 40Q�6B   ��6Z   �� *ColInventario+ 6�   �� *SelectedInventario+ 5�      *  $System.Windows.Controls.DataGridCell  dataGridCellStyle��%`   '��       7  '  "     7  �� 5�      " ��6    8   67   �� 5�      "  6    8   6:   5�      :   RowStyle: 5�      �� 5�      )	  #System.Windows.Controls.DataGridRow" 	 6    # [B	 69   .�5�      �� 3 �@�ContextMenu4 5�   "   �� 5�   &     62   �� ; �� Source; %
  System.Windows.Markup.Reference
  *dtcVM_IngresarInventario+.@�5�   *   m� $��Eliminar Producto��6_   < m� Command< 63   �� *CommandEliminarProducto+= m� Icon= 5�   .   �� 5�   2   $��/Resources/delete.png��68   5�   +   5�   '   5�      5�      >   Columns> 5�      0  *System.Windows.Controls.DataGridTextColumn  5�      ,  &System.Windows.Controls.DataGridColumn?   Header$? Cant.��6-   @   Width5  /System.Windows.Controls.DataGridLengthConverter$@ 45 6�     ElementStyleCenter1  +System.Windows.Controls.DataGridBoundColumnA   ElementStyle#A [ 6�   B   
VisibilityB 6<   �� *ColumnCantidadVisibility+; 
  *dtcVM_IngresarInventario+C   BindingC 6�   �� *CantidadAgrupado+6�     5�      $? Nombre del Producto��6-   $
@ 1.4* 6J     ElementStyleWrapping#A [ 6z   C 6W   �� *NombreProducto+6z     5�      $? Color��6-   $
@ 0.6* 6<   #A [ 6c   C 6I   �� *Color+6c     5�      $? Talla��6-   $
@ 0.5* 6<   #A [ 6c   C 6I   �� *Talla+6c     5�      $? Costo Producto��6-   $
@ 0.4* 6E   C 6R   �� *CostoProducto+  5�      $? Costo Final Producto��6-   $
@ 0.3* 6K   C 6X   �� *CostoFinalProducto+  5�      $? Precio��6-   $
@ 0.3* 6=   C 6J   �� *Precio+  5�      $? Ganancia Estimada��6-   $
@ 0.3* 6H   C 6U   �� *GananciaEstimada+  5�      $"? Notas de Talla y Comentarios��6-   $@ 2* 6S   #A [ 6�   C 6^   �� *NotasTallaYComentarios+6�   5�      5�      �� 5�      $ 
Horizontal=�6   $��6��62   $��Right=�6?   $��0,2,24,8q�6[   .+�5�      �� $��Conteo de filas:��6   $��0q�63   �� 5�      $��4,0,2,0q�6S   ��6   �� *Items.Count+$ grdInventario��6S   5�      � 5�      $��
12,6,12,12q�6   $��7��6'    5�      �� 5�      $	��200 �6'   �� 5�      $	��200 �6'   �� 5�      $��1* �6'   �� 5�      $��0.65* �6'   �� 5�      $
��Auto �6'   �� 5�      $	��160 �6'   �� 5�      $
��Auto �6'   .+�5�        -    5        $ txtIdOrdenSelect��5�   '   $��0��6A   $
 Id Orden Selección:��6Q   $��26��6r   $
 True��6~   
 ���� $ +0��6�   	 6�   �� *OrdenSelect.IdOrden+]� 5�      $��1��6   $��24,0,0,0q�6,   .+�5�      �� -!   5        $ btnGastosOrdenSelect��5�      $��Gastos Orden:��6;   $��26��6S   $	��6,0q�6_   ��6m   �� *CommandAbrirGastosOrden+  5�      -"   5        $ txtGastosOrdenSelect��5�   +   $ 5Q�6I   $��26��6V   $
 True��6b   $ 0.��6w   
 ���� 	 6�   �� *OrdenSelect.GastosOrden+5�      ]� 5�      $��2��6   $��24,0,0,0q�6,   .+�5�      �� -#   5        $ btnProveedorSelect��5�      $��
Proveedor:��69   $��26��6N   $	��6,0q�6Z     5�      -$   5        $ txtProveedorSelect��5�   +   $ 5Q�6G   $��26��6T   $
 True��6`   
 ���� 	 6�   �� *OrdenSelect.NombreProveedor+5�      ]� 5�      $��3��6   $��24,0,0,0q�6,   .+�5�      �� -%   5        $ btnTiendaSelect��5�      $��Tienda:��66   $��26��6H   $	��6,0q�6T     5�      -&   5        $ txtTiendaSelect��5�   +   $ 5Q�6D   $��26��6Q   $
 True��6]   
 ���� 	 6�   �� *OrdenSelect.NombreTienda+5�        5�      -'   5        $ txtTotalOrdenSelect��5�   '   $��4��6D   $��24,0,0,0q�6T   $
 Total Orden:��6f   $��26��6�   $, 80Q�6�   $
 True��6�   $ 0.��6�   
 ���� 	 6�   �� *OrdenSelect.TotalOrden+  5�      -(   5        $% txtCantidadProductosOrdenSelect��5�   '   $��6��6P   $��24,0,0,0q�6`   $
 Cant. Prod. Orden:��6r   $��26��6�   $, 60Q�6�   $��Right=�6�   $
 True��6�   $ +0��6�   
 ���� 	 6	  �� * OrdenSelect.CantProductosOrden+5�      �� 5�      $
��12,6q�6   $��8��6&   � 5�      $��12q�6   $��9��6    5�      �� 5�      $	��200 �6'   �� 5�      $	��200 �6'   �� 5      $��1* �6'   �� 5     $
��Auto �6'   .+�5       -)   5        $ txtIdPaqueteSelect��5  '   $��0��6C   $
 Id Paquete Selección:��6S   $��26��6v   $
 True��6�   
 ���� $ +0��6�   	 6�   �� *PaqueteSelect.IdPaquete+]� 5     $��1��6   $��24,0,0,0q�6,   .+�5     �� -*   5        $ btnGastosPaqueteSelect��5     $��Gastos Paquete:��6=   $��26��6W   $	��6,0q�6c   ��6q   �� *CommandAbrirGastosPaquete+  5     -+   5        $ txtGastosPaqueteSelect��5  +   $ 5Q�6K   $��26��6Y   $
 True��6e   
 ���� 	 6�   �� *PaqueteSelect.GastosPaquete+5       5     -,   5        $' !txtCantidadProductosPaqueteSelect��5  '   $��3��6R   $��24,0,0,0q�6b   $
 Cant. Prod. Paquete:��6t   $��26��6�   $, 60Q�6�   $��Right=�6�   $
 True��6�   
 ���� 	 6�   �� *$"PaqueteSelect.CantProductosPaquete+5	     5
     5     5     