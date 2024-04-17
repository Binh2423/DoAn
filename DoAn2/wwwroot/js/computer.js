$(document).ready(function () {
    $('.btn-thue').click(function (event) {
        event.preventDefault(); // Ngăn chặn hành động mặc định của nút

        var comId = $(this).data('comid'); // Lấy giá trị ComId từ thuộc tính data-comid của nút

        // Gửi yêu cầu AJAX đến hàm ThueMay trong FoodController
        $.ajax({
            url: '/Computer/ThueMay', // Đường dẫn tới hàm ThueMay trong controller
            type: 'POST', // Phương thức POST
            data: { ComId: comId }, // Dữ liệu gửi đi (ComId là giá trị bạn muốn truyền vào hàm ThueMay)
            success: function (response) {
                // Xử lý kết quả trả về từ server nếu cần
                console.log(response);
                // Ví dụ: chuyển hướng người dùng đến một trang khác
                window.location.href = "/may-tinh"; // Chuyển hướng đến trang chủ
            },
            error: function () {
                // Xử lý lỗi khi yêu cầu gặp vấn đề
                alert('Đã xảy ra lỗi khi gọi hàm ThueMay.');
            }
        });
    });
});
