namespace BTH8_BT2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KHACHHANG")]
    public partial class KHACHHANG
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KHACHHANG()
        {
            DONDATHANGs = new HashSet<DONDATHANG>();
        }

        [Key]
        public int MAKH { get; set; }

        [StringLength(100)]
        public string HOTEN { get; set; }

        [StringLength(50)]
        public string TAIKHOAN { get; set; }

        [StringLength(50)]
        public string MATKHAU { get; set; }

        [StringLength(100)]
        public string EMAIL { get; set; }

        [StringLength(100)]
        public string DIACHI { get; set; }

        [StringLength(20)]
        public string DIENTHOAI { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DONDATHANG> DONDATHANGs { get; set; }
    }
}
