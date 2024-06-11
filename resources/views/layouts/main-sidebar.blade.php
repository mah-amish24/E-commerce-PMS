<!-- Sidebar Menu -->
@php
    $userId = auth()->id();
    $count = \App\Models\Product::where('user_id', $userId)->count();
@endphp

<nav class="mt-2">
    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
        data-accordion="false">
        
        <li class="nav-item">
            <a href="{{route('products.index')}}" class="nav-link">
                <i class="nav-icon far fa-calendar-alt"></i>
                <p>
                     WEB-products
                    <span class="badge badge-info right">{{ $count }}</span>
                </p>
            </a>
        </li>
        <li class="nav-item">
            <a href="{{route('api.data')}}" class="nav-link">
                <i class="nav-icon far fa-calendar-alt"></i>
                <p>
                     API-products
                    <span class="badge badge-info right">{{ $count }}</span>
                </p>
            </a>
        </li>
     
    </ul>
</nav>
<!-- /.sidebar-menu -->
</div>
<!-- /.sidebar -->
</aside>
