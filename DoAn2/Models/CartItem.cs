namespace DoAn2.Models
{
    [Serializable]
    public class CartItem
    {
        public ThucPham thucpham { get; set; }
        public int Quantity { get; set; }

    }
}
