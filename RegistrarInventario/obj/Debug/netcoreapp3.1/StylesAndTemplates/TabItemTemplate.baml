   M S B A M L   `   `   `  ����W  SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   TabItem.Static.Background  �� Color  TabItem.Static.Border   TabItem.MouseOver.Background �� 
StartPoint �� EndPoint � Color � Offset  TabItem.MouseOver.Border  TabItem.Selected.Background  TabItem.Selected.Border  TabItem.Disabled.Background  TabItem.Disabled.Border  tabItemTemplate �� 
TargetType �Name J� SnapsToDevicePixels ��Name	 �� CornerRadius
 J� Opacity ��Name �� RelativeSource �� AncestorType �� Triggers ^� 
Conditions �� Binding �� Value �� 
TargetName �� Value �� Property�� 5      F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      :x,http://schemas.microsoft.com/winfx/2006/xaml      5      %�  &	        &	 !     &	 B     &	 �     &	     &	 �    &	 �    &	 �    &	 �    7   7  7  7  7  7  7  �� 5      $  #303030��68   �� 5      $  #505050��64   �� 5      $ 0.5,0&�6?   $ 0.5,1&�6R   .��5   
   � $ 	#557EB4EA��6   $	 0.1Q�6)   � 5   
   $ 	#553C7FB1��6   $	 0.5Q�6)   5	      �� 5
      $  #7EB4EA��67   �� 5      $ 0.5,0&�6>   $ 0.5,1&�6Q   .��5   
   � $ #757575��6   $	 0.1Q�6'   � 5   
   $ #505050��6   $	 0.5Q�6'   5      �� 5      $
  Gray��66   �� 5      $  #606060��6:   �� 5      $  #505050��66   �� 5      " ��6.   .R�5   
   � $ templateRoot��6   $
 true��6%   .+�5      �� $ 
mainBorder��6   $��26��6)   8��  $��1,1,1,0q�6m   8�� $��0q�6�   $	 3,3,0,0��6�   ._�5      �� $ innerBorder��6   8�� $��0q�6h   
���  ��$��-1q�6�   $
 0Q�6�   $	 3,3,0,0��6�   5      �� 5      $ contentPresenter��6   $
��12,0q�69   
�������$��Header��6d   $|�False��6{   $
��True��6  # z 6'  ��6�   �� *HorizontalContentAlignment+ �� " ����6c  �� *VerticalContentAlignment+ �� " ��5       5   
   ^� 5       5      �� 5       6    �� *IsMouseOver+ �� *Self+ true6f   .0�5      �� $ 
mainBorder��6/   8   � ��6G   �� 5       $ 
mainBorder��60   8   � ��6H   5!      ^� 5"       5#      �� 5$       6    �� *	IsEnabled+ �� *Self+	 false6d   .0�5&      �� $ contentPresenter��6,    �@J�Opacity$
 0.56Q�6J   �� 5'      $ 
mainBorder��6/   8   � ��6G   �� 5(      $ 
mainBorder��60   8   � ��6H   5)      ^� 5*       5+      �� 5,       6    �� *
IsSelected+ �� *Self+ true6e   .0�5.      ��  �@K�ZIndex$ 1��61   �� 5/       � ��$ 
-2,-2,-2,0q�6+   �� 50      $ innerBorder��6,    �@J�Opacity$ 1Q�6E   �� 51      $ contentPresenter��69    � ��
 �����6W   �� 52      $ contentPresenter��67    � ��$
 15.5(�6U   �� 53      $ contentPresenter��69    � ��$ SemiBold"�6W   54      56      58      