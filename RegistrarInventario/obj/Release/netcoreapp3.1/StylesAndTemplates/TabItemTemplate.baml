   M S B A M L   `   `   `  ���� W  SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   TabItem.Static.Background  �� Color  TabItem.Static.Border   TabItem.MouseOver.Background �� 
StartPoint �� EndPoint � Color � Offset  TabItem.MouseOver.Border  TabItem.Selected.Background  TabItem.Selected.Border  TabItem.Disabled.Background  TabItem.Disabled.Border  tabItemTemplate �� 
TargetType �Name J� SnapsToDevicePixels ��Name	 �� CornerRadius
 J� Opacity ��Name �� RelativeSource �� AncestorType �� Triggers ^� 
Conditions �� Binding �� Value �� 
TargetName �� Value �� Property�� F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      :x,http://schemas.microsoft.com/winfx/2006/xaml      %�  &	        &	      &	 &     &	 �     &	 �     &	 �     &	     &	     &	 '    7   7  7  7  7  7  7  �� $  #303030���� $  #505050���� $ 0.5,0&�$ 0.5,1&�.��� $ 	#557EB4EA��$	 0.1Q�� $ 	#553C7FB1��$	 0.5Q��� $  #7EB4EA���� $ 0.5,0&�$ 0.5,1&�.��� $ #757575��$	 0.1Q�� $ #505050��$	 0.5Q��� $
  Gray���� $  #606060���� $  #505050���� " ��.R�� $ templateRoot��$
 true��.+��� $ 
mainBorder��$��26��8��  $��1,1,1,0q�8�� $��0q�$	 3,3,0,0��._��� $ innerBorder��8�� $��0q�
���  ��$��-1q�$
 0Q�$	 3,3,0,0���� $ contentPresenter��$
��12,0q�
�������$��Header��$|�False��$
��True��# z ���� *HorizontalContentAlignment+ �� " ������ *VerticalContentAlignment+ �� " �� ^�  ��  �� *IsMouseOver+ �� *Self+ true.0��� $ 
mainBorder��8   � ���� $ 
mainBorder��8   � ��^�  ��  �� *	IsEnabled+ �� *Self+	 false.0��� $ contentPresenter�� �@J�Opacity$
 0.56Q��� $ 
mainBorder��8   � ���� $ 
mainBorder��8   � ��^�  ��  �� *
IsSelected+ �� *Self+ true.0���  �@K�ZIndex$ 1����  � ��$ 
-2,-2,-2,0q��� $ innerBorder�� �@J�Opacity$ 1Q��� $ contentPresenter�� � ��
 ������� $ contentPresenter�� � ��$
 15.5(��� $ contentPresenter�� � ��$ SemiBold"�