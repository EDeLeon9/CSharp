   M S B A M L   `   `   `  ����D  @TablaAzar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:TablaAzar	TablaAzar  5          TablaAzar.Principal   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      )localclr-namespace:TablaAzar     5        N� Title$  	Principal��5	      .��5      � $��
18,8,18,18q�6    � RowDefinitions 5   
   �� 5      $��25 �6   �� 5      $��40 �6   �� 5      �� 5      $��45 �6   .+�5   
   ]� $��0��6   $��False��6!   .+�5      �� -   5         ��Name$ 	txtTitulo��5      $
��Left=�6+   $��Tabla números al azar��6A   $��18(�6^   $
|�True��6l   $��Center=�6}   �� 5      -   5         ��Name$ btnRutaArchivos��5      $��Right=�6.   $
��10.5(�6F   
������ $��0q�6o   6�   5      ]� 5   
   $��1��6   $��False��6!   .+�5      	� -   5         	�Name$ rdoSitioWeb1��5      $��Center=�60    	� 	GroupName$ OpcionPaginaWeb��6R   $��Sitio Web 1��6n    d� 	IsChecked$
 TrueY�6�   	� 5      -   5        $ rdoSitioWeb2��5      $��Center=�60   $ OpcionPaginaWeb��6R   $��Sitio Web 2��6n   $
��10,0q�6�   	� 5      -   5        $ rdoSitioWeb3��5      $��Center=�60   $ OpcionPaginaWeb��6R   $��Sitio Web 3��6n   $
��10,0q�6�   �� 5      -   5        $ btnConfigWeb��5   !   $��25��6   $	��110��67   $��14(�6C   $��
Config Web��6Q   $
��10,0q�6f   6t   �� 5      -   5         ��Name$ chkAbrirConEdge��5      $��Right=�60   $��Center=�6G   $��Abrir con Edge��6i   6�   5         TablaAzar.DataGridPlus  5    
   -   5          Name$ 	dgrTabla1��5          TablaAzar.DataGridPlus	   RowEditEnding$	 dgrTabla1_RowEditEnding��5"      
   AddingNewItem$
 dgrTabla1_AddingNewItem��6;   $��2��5    0   &   System.Windows.Controls.DataGrid   HeadersVisibility$ Column=�6=      CanUserAddRows$ False��6X      CanUserDeleteRows$ False��6o      SelectionMode$ Single=�6�      AutoGenerateColumns$ False��6�      HorizontalGridLinesBrush
 �����   VerticalGridLinesBrush
 ����� � 	Resources 5$         DataGridContextMenu m� Icon)  #System.Windows.Controls.DataGridRow �� 
TargetType �� Property �� Value��%�  &	        '      7   �� 5%      .@�5&      m� -	   5        $��Abrir temporada��5&       5'      �� 5)      $��/Resources/multimedia.png��6$   5+      m� 5,      -
   5        $��Omitir capítulo��5,       5-      �� 5.      $��/Resources/hide.png��6$   50      51      �� 53      "  6   .�54      -   5        �� 55       �@�ContextMenu8   64   56      57         Columns 59      &    TablaAzar.DataGridTextColumnPlus  5;      ,  &System.Windows.Controls.DataGridColumn   Header$ 	Temporada��6/      
IsReadOnly$ False��6B      Width5  /System.Windows.Controls.DataGridLengthConverter$ 1* 6�    ! TextBlockAlignmentNumberStyle1  +System.Windows.Controls.DataGridBoundColumn   ElementStyle# [ 6�     TextBoxAlignmentNumberStyle   EditingElementStyle# [ 6�      Binding 6U   ��  �� Path$ 	Temporada� �� UpdateSourceTrigger$ PropertyChanged=�  �� Mode$  TwoWay=�6�     5<      $ 	Capítulo��6/   $ False��6A   $ 1* 6�   # [ 6�   # [ 6�    6T   �� $ Capitulo�$ PropertyChanged=�$  TwoWay=�6�     5=      $ Capítulo Real��6/   $
 True��6F   $ 1* 6�   # [ 6�   # [ 6�    6X   �� $ CapituloReal�$ PropertyChanged=�$  TwoWay=�6�     5>      $ Título��6/   $ False��6?   $ 5* 6�     TextBlockAlignmentStyle# [ 6�     TextBoxAlignmentPasteStyle# [ 6�    6R   �� $ Titulo�$ PropertyChanged=�$  TwoWay=�6�     5?      $ 
Dirección��6/   $ False��6B   $ 5* 6�   # [ 6�   # [ 6�    6U   �� $ 	Direccion�$ PropertyChanged=�$  TwoWay=�6�   5B      ]� 5D   
   $��3��6   $��0,15,0,0q�6!   $��False��63   .+�5E      �� -   5        $ btnAgregados��5E      $
��Left=�6+   $��	Agregados��6A   $	��110��6U   $��15(�6a   $��0,0,15,0q�6o   6�   �� 5F      -   5        $ btnOmitidos��5F      $
��Left=�6*   $��Omitidos��6@   $	��110��6S   $��15(�6_   $��0,0,15,0q�6m   6   �� 5G      -   5        $ btnTemporadasConMaxCap��5G      $
��Left=�65   $��Temporadas Con Max Cap��6K   $	��210��6l   $��15(�6x   $��0,0,15,0q�6�   6�   �� 5H      $
��Left=�6   #��["�6.   $��0,0,15,0q�6l   �� 5I      $��Índice:��6   $
��Left=�6'   $��Center=�6=   �� 5J      -   5        ! ��Name$! 	txtIndice��5J      $
��Left=�6)   $��28��6?   $��25��6K   $��5,0,10,0q�6V   $��Center=�6h   �� 5K      -   5        $ btnGenerarExpress��5K      $
��Left=�60   $��Center=�6F   $��Generar Express��6c   $	��140��6}   $��15(�6�   $��0,0,15,0q�6�   6�   �� 5L      -   5        $ 
btnGenerar��5L      $��Right=�6)   $��Generar��6@   $	��110��6R   $��15(�6^   6l   �� 5M      -   5        $! txtDesde��5M      $��Right=�6(   $��28��6?   $��35��6K   $��5,0,10,0q�6V   $��Center=�6h   �� 5N      $��Desde:��6   $��Right=�6&   $��Center=�6=   �� 5O      $��Right=�6   #��["�6/   $��0,0,15,0q�6m   5P      5Q      5R      