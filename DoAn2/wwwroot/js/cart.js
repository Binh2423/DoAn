var isCartEmpty = true;

var cart = {
    init: function () {
        cart.regEvents();

    },
    regEvents: function () {
        // Xử lý sự kiện khi số lượng sản phẩm thay đổi
        $('.txtQuantity').off('change').on('change', function () {
            var productId = $(this).data('id');
            var newQuantity = $(this).val();
            cart.updateCart(productId, newQuantity); // Gọi hàm cập nhật giỏ hàng
        });

        // Xử lý sự kiện khi nhấn nút Xóa
        $('.btn-delete').off('click').on('click', function (e) {
            e.preventDefault();
            var productId = $(this).data('id');
            $.ajax({
                data: { id: productId },
                url: '/Cart/Delete',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        // Hiển thị thông báo thành công
                        alert('Đã xóa sản phẩm khỏi giỏ hàng.');
                        window.location.href = "/gio-hang";
                    } else {
                        // Hiển thị thông báo lỗi nếu có
                        alert('Đã xảy ra lỗi khi xóa sản phẩm khỏi giỏ hàng.');
                    }
                }
            });
        });

        // Xử lý sự kiện khi nhấn nút Xóa tất cả
        $('#btnDeleteAll').off('click').on('click', function () {
            $.ajax({
                url: '/Cart/DeleteAll',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        // Hiển thị thông báo thành công
                        alert('Đã xóa tất cả sản phẩm khỏi giỏ hàng.');
                        window.location.href = "/gio-hang";
                    } else {
                        // Hiển thị thông báo lỗi nếu có
                        alert('Đã xảy ra lỗi khi xóa tất cả sản phẩm khỏi giỏ hàng.');
                    }
                }
            });
        });

        // Xử lý sự kiện khi nhấn nút Tiếp tục mua sắm
        $('#btnContinue').off('click').on('click', function () {
            // Hiển thị thông báo hoặc chuyển hướng người dùng đến trang chủ
            if (confirm('Bạn có muốn tiếp tục mua sắm không?')) {
                window.location.href = "/trang-chu";
            }
        });

        // Xử lý sự kiện khi nhấn nút Thanh toán
        $('#btnPayment').off('click').on('click', function () {
            // Hiển thị thông báo hoặc chuyển hướng người dùng đến trang thanh toán
            if (confirm('Bạn có muốn thanh toán giỏ hàng không?')) {
                window.location.href = "/thanh-toan";
            }
        });

        cart.calculateTotal();
    },

    calculateTotal: function () {
        var totalQuantity = 0;
        var totalPrice = 0;
        $('.txtQuantity').each(function () {
            var quantity = parseInt($(this).val());
            totalQuantity += quantity;
            var priceString = $(this).closest('.row').find('.amount span').text().trim().replace(/\D/g, '');
            var price = parseFloat(priceString.replace(/[^\d.-]/g, '')); 
            totalPrice += (quantity * price);
        });

        // Định dạng tổng giá trị dựa trên mã địa phương "vi-VN"
        var formattedPrice = totalPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });

        // Cập nhật nội dung của các phần tử HTML với tổng số lượng và tổng giá trị tính được
        $('#totalQuantity').text(totalQuantity);
        $('#totalPrice').text(formattedPrice);
    }

};


// Xử lý sự kiện khi nhấn nút +


cart.init();