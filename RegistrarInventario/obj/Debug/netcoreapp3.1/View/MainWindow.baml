   M S B A M L   `   `   `  ����N  JRegistrarInventario, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:RegistrarInventarioRegistrarInventario  5   	   $    RegistrarInventario.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:RegistrarInventario     5   	   $��18q�5   A   $	��900��6N   $
��1800��6[   $	��600��6h   $
��1800��6x      mainBackground#��[  6�     � WindowStartupLocation$  CenterScreen=�6�    � Title 6	   ��    RegistrarInventario.App   	APP_TITLE �� Source# Z  � DataContext 5
      '   !RegistrarInventario.VM_MainWindow  5   
   -   5        dtcVM_MainWindow��5      .��5      �� -   5         ��Name$ 
tabControl��5      $��
12,8,12,12q�6%     windowRectangleBackground#��[ 69   $��0q�6q   ��6�   �� *
ColTabData+ �� SelectedItem 6�   �� *SelectedTabData+��5   
   �� 5      .R�5      �� ��6   �� *
TabTitle+5       �� ContentTemplate 5   
   �� 5      .R�5       � *   $RegistrarInventario.AttachedProperty   	FramePage 6   �� *	FramePage+5      ��5   
   �� 5      	 �� 
TargetType"	 ��6   
 �� BasedOn#
 [B��6)   .�5      ��  �� Property �@�ContextMenu �� Value 5      �� 5      .@�5"      m� $��
Cerrar Tab��6�    m� Command 6'   �� *CommandCerrarTab+ %  System.Windows.Markup.Reference  *dtcVM_MainWindow+ m� CommandParameter 6s   ��  m� Icon 5#   "   �� 5%   &   $��/Resources/delete.png��6,   5'      5(      5*       �� Triggers 5+      �� 5,       �� Binding 6"   �� *	Closeable+ �� Value	 False6@   .a�5-      ��  �@�ContextMenu 68   Z� 5.      50      56      57      