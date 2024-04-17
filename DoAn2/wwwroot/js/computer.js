function confirmDelete(IdMay) {
    if (confirm("Are you sure you want to delete this item?")) {
        $.ajax({
            url: '/Computer/Delete',
            type: 'POST',
            data: { IdMay: IdMay },
            success: function (response) {
                if (response.success) {
                    // Hiển thị thông báo xóa thành công
                    alert('Item deleted successfully.');
                    // Reload page or update UI as needed
                    location.reload();
                } else {
                    // Hiển thị thông báo lỗi nếu có
                    alert('Failed to delete item: ' + response.error);
                }
            },
            error: function (xhr, status, error) {
                // Hiển thị thông báo lỗi nếu có
                alert('Error: ' + error);
            }
        });
    }
};

function confirmRent(IdMay) {
    if (confirm("Bạn có muốn thuê máy này không ?")) {
        $.ajax({
            url: '/Computer/ThueMay',
            type: 'POST',
            data: { IdMay: IdMay },
            success: function (response) {
                if (response.success) {
                    // Hiển thị thông báo thuê máy thành công
                    alert('Đã Thuê Máy Thành Công');
                    // Reload page or update UI as needed
                    location.reload();
                } else {
                    // Hiển thị thông báo lỗi nếu có
                    alert('Failed to rent item: ' + response.error);
                }
            },
            error: function (xhr, status, error) {
                // Hiển thị thông báo lỗi nếu có
                alert('Error: ' + error);
            }
        });
    }
};
function confirmPay(IdMay) {
    if (confirm("Bạn có muốn trả máy này không ?")) {
        $.ajax({
            url: '/Computer/TraMay',
            type: 'POST',
            data: { IdMay: IdMay },
            success: function (response) {
                if (response.success) {
                    // Hiển thị thông báo thuê máy thành công
                    alert('Đã Trả Máy Thành Công');
                    // Reload page or update UI as needed
                    location.reload();
                } else {
                    // Hiển thị thông báo lỗi nếu có
                    alert('Failed to rent item: ' + response.error);
                }
            },
            error: function (xhr, status, error) {
                // Hiển thị thông báo lỗi nếu có
                alert('Error: ' + error);
            }
        });
    }
};

function confirmEdit(IdMay) {
    $.ajax({
        url: '/Computer/Edit',
        type: 'POST',
        data: { IdMay: IdMay },
        success: function (response) {
            if (response.success) {
                location.reload();
            } else {
                // Hiển thị thông báo lỗi nếu có
                alert('Failed to rent item: ' + response.error);
            }
        },
        error: function (xhr, status, error) {
            // Hiển thị thông báo lỗi nếu có
            alert('Error: ' + error);
        }
    });
};
$(document).ready(function () {
    var defaultMaLoai = $('#maLoaiSelect').val();
    // Gán giá trị mặc định vào button hoặc thực hiện các thao tác khác tùy ý
    $('#addButton').data('maLoai', defaultMaLoai);

    // Bắt sự kiện khi giá trị của select thay đổi
    $('#maLoaiSelect').change(function () {
        // Lấy giá trị MaLoai được chọn
        var selectedMaLoai = $(this).val();
        // Gán giá trị MaLoai vào button hoặc thực hiện các thao tác khác tùy ý
        $('#addButton').data('maLoai', selectedMaLoai);
    });

    // Bắt sự kiện khi button được nhấp
    $('#addButton').click(function () {
        // Lấy giá trị MaLoai từ button
        var maLoai = $(this).data('maLoai');
        // Gọi hàm để thêm mục mới với MaLoai được chọn
        addItem(maLoai);
    });
});

function addItem(MaLoai) {
    $.ajax({
        url: '/Computer/Add', 
        type: 'POST',
        data: { MaLoai: MaLoai },
        success: function (response) {
            if (response.success) {
                // Hiển thị thông báo thành công
                alert('Item added successfully.');
                // Reload page or update UI as needed
                location.reload();
            } else {
                // Hiển thị thông báo lỗi nếu có
                alert('Không thể thêm máy vào: ' + response.error);
            }
        },
        error: function (xhr, status, error) {
            // Hiển thị thông báo lỗi nếu có
            alert('Lõi: ' + error);
        }
    });
}