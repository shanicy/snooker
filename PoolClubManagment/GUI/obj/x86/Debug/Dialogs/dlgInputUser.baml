   M S B A M L   `   `   `  ����  GUI    GUI.Dialogs.dlgInputUser   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   $��RightToLeft=�5   	   $	��150��6%     � Title$  הזן מנוי��5   	   $	��130��6   $	��150��6'    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�6.    � Icon$' !/GUI;component/Resources/user.ico��6D   .��5      �  � RowDefinitions 5   
   �� 5	      $
��auto �6   �� 5
      $
��auto �6   �� 5      $
��auto �6    � ColumnDefinitions 5   
   �� 5      $
��auto �6   �� 5      .+�5   
   �� $��שם מנוי :��6   $��5q�6%   �� 5   
   -   5        $��txbName��5      $��5q�6!   $��1��6,   5      �� 5   
   $��סוג מנוי :��6   $��1��6&   $��5q�63   �� 5   
   -   5        $��cmbClassify��5      $��5q�6&    �� SelectedIndex$ 0��5      $��1��5      $��1��6    .@�5      �� $��רגיל��6   �� 5      $	��VIP��6   5      �� 5   
   -   5        $��	btnAccept��5      $��
אישור��6"   $��2��62   $��2��5      $��5q�6   6)   5      5      