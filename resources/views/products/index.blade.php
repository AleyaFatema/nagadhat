@extends('products.layout')

@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Product List (Total: {{ $total_products }})</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-success" href="{{ route('products.create') }}"> Create New Product</a>
            </div>
        </div>
    </div>

    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif

    <table class="table table-bordered">
        <tr>
            <th>No</th>
            <th>Image</th>
            <th>Category</th>
            <th>Code</th>
            <th>Name</th>
            <th>Details</th>
            <th>Price</th>
            <th>Quantity</th>
            <th width="190px">Action</th>
        </tr>
        @foreach ($products as $product)
            <tr>
                <td>{{ ++$i }}</td>
                <td>
                    <img width="100" height="80" src="{{ $product->thumbnail_url }}" />
                </td>
                <td>{{ $product->categories->name }}</td>
                <td>{{ $product->product_code }}</td>
                <td>{{ $product->title }}</td>
                <td>{{ \Illuminate\Support\Str::limit($product->detail , 50, $end='...')  }}</td>
                <td>{{ $product->price }}</td>
                <td>{{ $product->quantity . ' '. $product->base_unit }}</td>
                <td align="middle">
                    <form action="{{ route('products.destroy',$product->id) }}" method="POST">

                        <a class="btn btn-info btn-sm" href="{{ route('products.show',$product->id) }}">Show</a>

                        <a class="btn btn-primary btn-sm" href="{{ route('products.edit',$product->id) }}">Edit</a>
                        @csrf
{{--                        <input type="hidden" name="_token" value="{{ csrf_token() }}">--}}
                        @method('DELETE')

{{--                        <a href="{{ route('products.destroy',$product->id) }}" class="btn btn-sm btn-danger deleteRecord" data-id="{{ $product->id }}">Delete</a>--}}
                        <button type="submit" data-id="{{ $product->id }}" class="btn btn-danger btn-sm deleteRecord">Delete</button>
                    </form>
                </td>
            </tr>
        @endforeach
    </table>

    {!! $products->links() !!}
@endsection
@section('scripts')
    <script type="text/javascript">
        $(document).ready(function () {
            $(".deleteRecord").click(function (e) {
                if (!confirm("Do you really want to do this?")) {
                    return false;
                }
                e.preventDefault();
                var id = $(this).data("id");
                $.ajax(
                    {
                        url: 'products/'+id,
                        type: 'DELETE',
                        data: {
                            "id": id,
                        },
                        success: function (response) {
                            alert(response.message);

                        },
                        error: function (request, status, error) {
                            alert(request.responseText);
                            alert('Error!!. Prodict could not be deleted.')
                        }
                    });
                return false;

            });
        });
    </script>
@endsection


