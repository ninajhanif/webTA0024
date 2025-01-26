<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="<?php echo base_url('/'); ?>" class="brand-link">
      <img src="<?php echo base_url('themes/dist'); ?>/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">SIAT Online</span>
    </a>

    <div class="sidebar">
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <?php if(session()->get('level') == 'Admin' || session()->get('level') == 'Kepala'): ?>
                <li class="nav-item">
                    <a href="<?php echo base_url('/'); ?>" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo base_url('category'); ?>" class="nav-link">
                        <i class="nav-icon fas fa-tags"></i>
                        <p>Category Management</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo base_url('product'); ?>" class="nav-link">
                        <i class="nav-icon fas fa-cart-plus"></i>
                        <p>Product Management</p>
                    </a>
                </li>
                <?php endif; ?>
                <li class="nav-item">
                    <a href="<?php echo base_url('transaction/transaksi'); ?>" class="nav-link">
                        <i class="nav-icon fas fa-dollar-sign"></i>
                        <p>Transaction</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo base_url('transaction'); ?>" class="nav-link">
                        <i class="nav-icon far fa-file-alt"></i>
                        <p>Transaction Management</p>
                    </a>
                </li>
                <li class="nav-header">ACCOUNT</li>
                <li class="nav-item">
                    <a href="<?php echo base_url('auth/logout'); ?>" class="nav-link">
                        <i class="nav-icon far fa-circle text-danger"></i>
                        <p class="text">Logout</p>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>