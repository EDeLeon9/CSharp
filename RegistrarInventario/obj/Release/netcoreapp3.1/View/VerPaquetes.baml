   M S B A M L   `   `   `  ���� N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5clr-namespace:AttachedBehaviorsAttachedBehaviors  %    RegistrarInventario.VerPaquetes   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     3local!clr-namespace:RegistrarInventario     .abclr-namespace:AttachedBehaviors       � DataContext  (   "RegistrarInventario.VM_VerPaquetes  -   dtcVM_VerPaquetes��.���    windowRectangleBackground#��[   � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��1* ��� $
��Auto �.+�]� $��0��$��12q�.+�d� $
��Left=�$
��Left=�$��Nuevo Paquete��$	��100��$��26�� d� 	IsChecked �� *AgregandoNuevoPaquete+���� *CommandNuevoPaquete+�� $��Right=�$��Right=�$��Regresar��$��18,0,0,0q�$��80��$��26������ *CommandRegresar+�� $
��12,0q�$��1��� $��2��$��
12,12,12,0q� � ColumnDefinitions �� $��6* ��� $��1* �.+�]� .+���  �� Orientation$ 
Horizontal=�$��Bottom=�$��Right=�$��0,2,0,8q�.+��� $��Conteo de filas:��$��0q��� $��4,0,2,0q����� *Items.Count+ �� ElementName$ grdPaquetes��&   System.Windows.Controls.DataGrid  -     Name$ grdPaquetes������ *ColPaquetes+ �� SelectedItem �� *SelectedPaquete+ � 	Resources 	 �� 
TargetType  scrollBarStyle
 �� BasedOn*  $System.Windows.Controls.DataGridCell  dataGridCellStyle��%:   '��       7  '       7  �� "	 ��8
   �� "	  8
      RowStyle �� )  #System.Windows.Controls.DataGridRow"	  #
 [B .��� (   "AttachedBehaviors.AttachedBehavior �� Property �@ 	EventType �� Value$ MouseLeftDoubleClick=���  �@ Command �� *" CommandElegirPaqueteSeleccionado+$ dtcVM_VerPaquetes����  �@�ContextMenu ��   ��  �� Source %  System.Windows.Markup.Reference  *dtcVM_VerPaquetes+.@�m�  m� Command �� *CommandEliminarPaquete+���� "	 m�.���  � ��$4 .Eliminar paquete (solo paquetes sin productos)����  � {�$ False�� �� Triggers ��  �� Binding �� *&$SelectedPaquete.CantProductosPaquete+ �� Value 0.a���  � {�$
 True����  � ��$ Eliminar paquete�� m� Icon �� $��/Resources/delete.png�� ��  �� *AgregandoNuevoPaquete+$ dtcVM_VerPaquetes�� True.a���  �@�ContextMenu Z�    Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Width5	  /System.Windows.Controls.DataGridLengthConverter$ 70	    Header$ 
Id Paquete��  ElementStyleCenter1
  +System.Windows.Controls.DataGridBoundColumn 
  ElementStyle# [  
  Binding �� *	IdPaquete+  $ 45	 $ Cant. Prod.��# [  �� *CantProductosPaquete+  $	 170	 $ Fecha de Consolidación�� �� *FechaConsolidacion+  dateTimeConverter �� 	Converter# [   $	 170	 $  Fecha de Llegada a Panamá�� �� *FechaLlegadaPanama+# [   $
 0.4*	 $ Gastos Paquete�� �� *GastosPaquete+  $
 1.3*	 $ Descripción de Paquete��  ElementStyleWrapping# [  �� *DescripcionPaquete+  $
 0.4*	 $ Nombre de Courier��# [  �� *NombreCourier+  $
 1.7*	 $ Comentarios��# [  �� *ComentariosPaquete+� $��1��$��
24,70,0,70q� �� $
��Auto ��� $��1* ��� $
��Auto ��� $
��Auto �.+��� $%��Gastos de paquete seleccionado:��$��14(�  -   $ 	grdGastos��$��1������ *	ColGastos+ ��%:   '��       7  '       7  �� "	 ��8
   �� "	  8
      $
 0.7*	 $ Monto�� �� *
MontoGasto+  $
 2.5*	 $ Descripción de Gasto��# [  �� *DescripcionGasto+�� $��2��$ 
Horizontal=�$��Right=�$��0,2,0,0q�.+��� $��Total de gastos:��$��0q��� $��4,0,2,0q����� *SumMontoGasto+�� $��Ver detalle de gastos��$��3��$��0,10,0,0q�$��26��$
��12,0q�$��Right=����� *CommandVerDetalleGastos+� $��
12,6,12,12q�$��3��$��58�� �� $
��1.3* ��� $	��290 ��� $	��320 ��� $
��0.9* ��� $
��1.5* ��� $
��Auto ��� $
��Auto �.+�(   "RegistrarInventario.LabeledTextBox  $��0��"   TxtVerticalContentAlignment$	 Top=�   
LblContent$ Descr. Paquete:��   TxtTextWrapping$
 Wrap=�   TxtText �� *DescripcionPaquete+  $��1��$��12,0,0,0q�$ Fecha Consolidación:��$��26��   
NumsNChars$ /:�� �� *FechaConsolidacion+  $��2��$��12,0,0,0q�$ Fecha Llegada a Panamá:��$��26��$ /:�� �� *FechaLlegadaPanama+)   #RegistrarInventario.LabeledComboBox  $��3��$��12,0,0,0q�$��26��   
LblContent$ Courier:��    CboIsEditable$
  True��!   CboDisplayMemberPath$! NombreCourier��"   CboSelectedValuePath$" 	IdCourier��#   CboItemsSource# �� *ColCouriers+$   CboSelectedValue$ �� *	IdCourier+  $��4��$��12,0,0,0q�$	 Top=�$ Comentarios:��$
 Wrap=� �� *ComentariosPaquete+)   #RegistrarInventario.LabeledCheckBox  $��5��%   
LblContent$% 	Terminado��$��12,0,0,0q�&   ChkIsChecked& �� *	Terminado+�� $��6��$��12,0,0,0q�$��90��$��38������ *CommandGuardarCambios+���� "	 ��#
 [B��.���  � �� �� $ Vertical=�.+��� $��	Modificar��$��Center=�$��15(�$��DemiBold"� ��  �� *AgregandoNuevoPaquete+$ dtcVM_VerPaquetes�� True.a���  � �� �� $ Vertical=�.+��� $��Nuevo��$��Center=�$��16(�$��DemiBold"�