   M S B A M L   `   `   `  ����N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5      #    RegistrarInventario.VerGastos   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      3local!clr-namespace:RegistrarInventario     5        � 	Resources  5
      .   (RegistrarInventario.JoinStringsConverter   joinStringsConverter��%   &	          5   
   6%   5       � DataContext 5      &    RegistrarInventario.VM_VerGastos  5   
   -   5        dtcVM_VerGastos��5      .��5      �   windowRectangleBackground#��[ 6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $	��425 �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   �� $
��12,0q�6   $��0��6#    �� Orientation$ 
Horizontal=�60   $��Center=�6I   .+�5      �� $��
Gastos de ��6   $��0q�6)   $
��Bold"�65   $��18(�6G   �� 5      $��0q�66   $
��Bold"�6B   $��18(�6T   ��6   �� *TablaAsociada+6T   �� 5      $�� Nº ��6   $��0q�6#   $
��Bold"�6/   $��18(�6A   �� 5      $��0q�68   $
��Bold"�6D   $��18(�6V   ��6   �� *IdTablaAsociada+6V   +   %RegistrarInventario.VerticalSeparator  5      $��26,0,0,0q�6&   d� 5       $��26,0,0,0q�6   $��Nuevo Gasto��6-   $��90��6C   $��26��6N    d� 	IsChecked 6Z   �� *AgregandoNuevoGasto+��6�   �� *CommandNuevoGasto+5!      �� 5#   
   -   5         ��Name$ btnRegresar��5#      $��0��6&   $��12q�63   $��Regresar��6?   $��80��6R   $��26��6]   $��Right=�6i   ��6�   �� *CommandRegresar+�� 5%   
   $
��12,0q�6   $��1��6"   � 5'   
   $��2��6   $��
12,12,12,0q�6    � ColumnDefinitions 5(      �� 5)      $��1.75* �6#   �� 5*      $��1* �6#   .+�5-      ]� .+�5.      � $��Bottom=�6   $��0,2,0,8q�6/    5/      �� 50      $��1* �6+   �� 51      $	��135 �6+   �� 52      $	��135 �6+   .+�54      �� $ 
Horizontal=�6!   $��1��6:   .+�55      �� $��Total de Gastos:��6    $��0q�6;   �� 56      $��4,0,0,0q�6B   ��6    �� *SumMontoGasto+6B   57      �� 58      $ 
Horizontal=�6!   $��Right=�6:   $��2��6V   .+�59      �� $��Conteo de filas:��6    $��0q�6;   �� 5:      $��4,0,2,0q�6W   ��6    �� *Items.Count+ �� ElementName$ 	grdGastos��6W   5;      5<      &   System.Windows.Controls.DataGrid  5>      -   5          Name$ 	grdGastos��5>      ��6.   �� *	ColGastos+	 �� SelectedItem	 6P   �� *SelectedGasto+  5?      
 �� 
TargetType  scrollBarStyle �� BasedOn*  $System.Windows.Controls.DataGridCell  dataGridCellStyle  ElementStyleWrapping �� Property �� Value��%�   '��       7  '  "     7  &	 D     �� 5@      "
 ��6    8   67   �� 5A      "
  6    8   6:   �� 5C      "
 ��6=   .�5D      ��  � ��$
 Wrap=�6=   5E      5F         RowStyle 5H      �� 5J      )  #System.Windows.Controls.DataGridRow"
  6    # [B 69   .�5K      ��  �@�ContextMenu 5L   "   �� 5O   &    62   ��  �� Source %  System.Windows.Markup.Reference  *dtcVM_VerGastos+.@�5P   *   m� $��Eliminar gasto��6\    m� Command 63   �� *CommandEliminarGasto+ m� Icon 5Q   .   �� 5S   2   $��/Resources/delete.png��68   5U   +   5V   '   5X       �� Triggers 5Y      �� 5Z   "    �� Binding 6.   �� *AgregandoNuevoGasto+$ dtcVM_VerGastos�� �� Value True6s   .a�5[   &   ��  �@�ContextMenu 6D   Z� 5\   #   5^         Columns 5a      0  *System.Windows.Controls.DataGridTextColumn  5b      ,	  &System.Windows.Controls.DataGridColumn 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$ 70
 6-    	  Header$ Id Gasto��68     ElementStyleCenter1  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# [ 6f      Binding 6J   �� *	IdGasto+6f     5c      $	 170
 6-   $ Fecha de Gasto��69    6Q   �� *
FechaGasto+  dateTimeConverter �� 	Converter# [   5d      $
 0.4*
 6-   $ Monto��6:    6I   �� *
MontoGasto+  5e      $
 2.5*
 6-   $ Descripción de Gasto��6:   # [ 6}    6X   �� *DescripcionGasto+6}     5f      $ 3*
 6-   $ Comentarios��68   # [ 6r    6M   �� *ComentariosGasto+6r   5h      5i      � 5l      $��2��6   $��1��6    $��	24,0,0,26q�60    5m      �� 5n      $
��Auto �6$   �� 5o      $��1* �6$   �� 5p      $
��Auto �6$   .+�5t      �� $��14(�6�   ��6   �� *TablaAsociadaPlural+# [   �� ConverterParameter$ %:�� �� FallbackValue$  ��6�     5v      -   5        $ grdOrdenesOPaquetes��5v      $��1��68   ��6E   �� *ColOrdenesOPaquetes+	 6q   �� *SelectedOrdenOPaquete+  5w      ��%`   '��       7  '  "     7  �� 5x      "
 ��6    8   67   �� 5y      "
  6    8   6:   5z       5|        5}      $ 70
 6-   # [ 6�    68   �� *TablaAsociada+      Name$ dtcVM_VerGastos��# [  $
 Id %��$  �� 6�   �� *	IdOrden+6�     5~      $	 170
 6-   $ Fecha��69    6H   �� *
FechaOrden+# [   5      $
 0.7*
 6-   $ Monto Total��6:    6O   �� *
TotalOrden+  5�      $
 2.5*
 6-   $ Descripción��6:   # [ 6t    6O   �� *DescripcionOrden+6t   5�      �� 5�      $��2��6   $��0,10,0,0q�6�   $��26��6�   $
��15,0q�6�   $��Right=�6�   ��6&   �� *TablaAsociadaPlural+# [  $ Ver más datos de %����6�   �� *$"CommandVerMasDatosOrdenesOPaquetes+5�      5�      � 5�   
   $��
12,6,12,12q�6   $��4��6#   $��50��60    5�      �� 5�      $	��240 �6#   �� 5�      $
��0.4* �6#   �� 5�      $
��0.9* �6#   �� 5�      $
��1.2* �6#   �� 5�      $��28 �6#   �� 5�      $
��Auto �6#   .+�5�      (   "RegistrarInventario.LabeledTextBox  $��0��6#      
LblContent$ Fecha Gasto:��63   $��26��6M      
NumsNChars$ /:��6Y       TxtText  6i   �� *
FechaGasto+  5�      $��1��6#   $��12,0,0,0q�63   $ Monto:��6E   $��26��6Y   $ 0.��6e     6u   �� *
MontoGasto+  5�      $��2��6#   $��12,0,0,0q�63   "!   TxtVerticalContentAlignment$	! Top=�6E   $ Descr. Gasto:��6g   "   TxtTextWrapping$
" Wrap=�6�     6�   �� *DescripcionGasto+  5�      $��3��6#   $��12,0,0,0q�63   $	! Top=�6E   $ Comentarios:��6g   $
" Wrap=�6�     6�   �� *ComentariosGasto+�� 5�      $��5��6   $��12,0,0,0q�6%   $��90��67   $��38��6B   ��6N   �� *CommandGuardarCambios+��5�      �� 5�      "
 ��6   # [B��60   .�5�      ��  � �� 5�      �� 5�   "   $ Vertical=�6-   .+�5�   &   �� $��	Modificar��60   $��Center=�6A   $��15(�6^   $��DemiBold"�6l   5�   #   5�       5�      �� 5�       6*   �� *AgregandoNuevoGasto+$ dtcVM_VerGastos�� True6o   .a�5�   "   ��  � �� 5�   &   �� 5�   *   $ Vertical=�65   .+�5�   .   �� $��Nuevo��68   $��Center=�6E   $��16(�6b   $��DemiBold"�6p   5�   +   5�   #   5�      5�      5�      5�      5�      5�      