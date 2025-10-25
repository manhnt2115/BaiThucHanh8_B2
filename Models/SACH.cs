namespace BTH8_BT2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SACH")]
    public partial class SACH
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SACH()
        {
            CHITIETDONHANGs = new HashSet<CHITIETDONHANG>();
            TACGIAs = new HashSet<TACGIA>();
        }

        [Key]
        public int MASACH { get; set; }

        [Required]
        [StringLength(200)]
        public string TENSACH { get; set; }

        public decimal? GIABAN { get; set; }

        public string MOTA { get; set; }

        [StringLength(200)]
        public string ANHBIA { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NGAYCAPNHAT { get; set; }

        public int? SOLUONGTON { get; set; }

        public int? MACD { get; set; }

        public int? MANXB { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CHITIETDONHANG> CHITIETDONHANGs { get; set; }

        public virtual CHUDE CHUDE { get; set; }

        public virtual NHAXUATBAN NHAXUATBAN { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TACGIA> TACGIAs { get; set; }
    }
}
