   M S B A M L   `   `   `  ���� N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  #    RegistrarInventario.VerGastos   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     3local!clr-namespace:RegistrarInventario       � 	Resources  .   (RegistrarInventario.JoinStringsConverter   joinStringsConverter��%   &	           � DataContext &    RegistrarInventario.VM_VerGastos  -   dtcVM_VerGastos��.���   windowRectangleBackground#��[  � RowDefinitions �� $
��Auto ��� $
��Auto ��� $	��425 ��� $
��Auto ��� $
��Auto �.+��� $
��12,0q�$��0�� �� Orientation$ 
Horizontal=�$��Center=�.+��� $��
Gastos de ��$��0q�$
��Bold"�$��18(��� $��0q�$
��Bold"�$��18(����� *TablaAsociada+�� $�� Nº ��$��0q�$
��Bold"�$��18(��� $��0q�$
��Bold"�$��18(����� *IdTablaAsociada++   %RegistrarInventario.VerticalSeparator  $��26,0,0,0q�d� $��26,0,0,0q�$��Nuevo Gasto��$��90��$��26�� d� 	IsChecked �� *AgregandoNuevoGasto+���� *CommandNuevoGasto+�� -    ��Name$ btnRegresar��$��0��$��12q�$��Regresar��$��80��$��26��$��Right=����� *CommandRegresar+�� $
��12,0q�$��1��� $��2��$��
12,12,12,0q� � ColumnDefinitions �� $��1.75* ��� $��1* �.+�]� .+�� $��Bottom=�$��0,2,0,8q� �� $��1* ��� $	��135 ��� $	��135 �.+��� $ 
Horizontal=�$��1��.+��� $��Total de Gastos:��$��0q��� $��4,0,0,0q����� *SumMontoGasto+�� $ 
Horizontal=�$��Right=�$��2��.+��� $��Conteo de filas:��$��0q��� $��4,0,2,0q����� *Items.Count+ �� ElementName$ 	grdGastos��&   System.Windows.Controls.DataGrid  -     Name$ 	grdGastos������ *	ColGastos+	 �� SelectedItem	 �� *SelectedGasto+  
 �� 
TargetType  scrollBarStyle �� BasedOn*  $System.Windows.Controls.DataGridCell  dataGridCellStyle  ElementStyleWrapping �� Property �� Value��%i   '��       7  '       7  &	      �� "
 ��8   �� "
  8   �� "
 ��.���  � ��$
 Wrap=�   RowStyle �� )  #System.Windows.Controls.DataGridRow"
  # [B .���  �@�ContextMenu ��  ��  �� Source %  System.Windows.Markup.Reference  *dtcVM_VerGastos+.@�m� $��Eliminar gasto�� m� Command �� *CommandEliminarGasto+ m� Icon �� $��/Resources/delete.png�� �� Triggers ��  �� Binding �� *AgregandoNuevoGasto+$ dtcVM_VerGastos�� �� Value True.a���  �@�ContextMenu Z�    Columns 0  *System.Windows.Controls.DataGridTextColumn  ,	  &System.Windows.Controls.DataGridColumn 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$ 70
  	  Header$ Id Gasto��  ElementStyleCenter1  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# [    Binding �� *	IdGasto+  $	 170
 $ Fecha de Gasto�� �� *
FechaGasto+  dateTimeConverter �� 	Converter# [   $
 0.4*
 $ Monto�� �� *
MontoGasto+  $
 2.5*
 $ Descripción de Gasto��# [  �� *DescripcionGasto+  $ 3*
 $ Comentarios��# [  �� *ComentariosGasto+� $��2��$��1��$��	24,0,0,26q� �� $
��Auto ��� $��1* ��� $
��Auto �.+��� $��14(����� *TablaAsociadaPlural+# [   �� ConverterParameter$ %:�� �� FallbackValue$  ��  -   $ grdOrdenesOPaquetes��$��1������ *ColOrdenesOPaquetes+	 �� *SelectedOrdenOPaquete+  ��%:   '��       7  '       7  �� "
 ��8   �� "
  8      $ 70
 # [  �� *TablaAsociada+      Name$ dtcVM_VerGastos��# [  $
 Id %��$  �� �� *	IdOrden+  $	 170
 $ Fecha�� �� *
FechaOrden+# [   $
 0.7*
 $ Monto Total�� �� *
TotalOrden+  $
 2.5*
 $ Descripción��# [  �� *DescripcionOrden+�� $��2��$��0,10,0,0q�$��26��$
��15,0q�$��Right=����� *TablaAsociadaPlural+# [  $ Ver más datos de %������ *$"CommandVerMasDatosOrdenesOPaquetes+� $��
12,6,12,12q�$��4��$��50�� �� $	��240 ��� $
��0.4* ��� $
��0.9* ��� $
��1.2* ��� $��28 ��� $
��Auto �.+�(   "RegistrarInventario.LabeledTextBox  $��0��   
LblContent$ Fecha Gasto:��$��26��   
NumsNChars$ /:��    TxtText  �� *
FechaGasto+  $��1��$��12,0,0,0q�$ Monto:��$��26��$ 0.��  �� *
MontoGasto+  $��2��$��12,0,0,0q�"!   TxtVerticalContentAlignment$	! Top=�$ Descr. Gasto:��"   TxtTextWrapping$
" Wrap=�  �� *DescripcionGasto+  $��3��$��12,0,0,0q�$	! Top=�$ Comentarios:��$
" Wrap=�  �� *ComentariosGasto+�� $��5��$��12,0,0,0q�$��90��$��38������ *CommandGuardarCambios+���� "
 ��# [B��.���  � �� �� $ Vertical=�.+��� $��	Modificar��$��Center=�$��15(�$��DemiBold"� ��  �� *AgregandoNuevoGasto+$ dtcVM_VerGastos�� True.a���  � �� �� $ Vertical=�.+��� $��Nuevo��$��Center=�$��16(�$��DemiBold"�