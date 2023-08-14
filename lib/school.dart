class DataSekolah {
  String? kabupatenKota;
  String? kecamatan;
  String? id;
  String? npsn;
  String? sekolah;
  String? bentuk;
  String? status;
  String? alamatJalan;
  String? lintang;
  String? bujur;

  DataSekolah(
      {this.kabupatenKota,
      this.kecamatan,
      this.id,
      this.npsn,
      this.sekolah,
      this.bentuk,
      this.status,
      this.alamatJalan,
      this.lintang,
      this.bujur});

  DataSekolah.fromJson(Map<String, dynamic> json) {
    kabupatenKota = json['kabupaten_kota'];
    kecamatan = json['kecamatan'];
    id = json['id'];
    npsn = json['npsn'];
    sekolah = json['sekolah'];
    bentuk = json['bentuk'];
    status = json['status'];
    alamatJalan = json['alamat_jalan'];
    lintang = json['lintang'];
    bujur = json['bujur'];
  }

  get overview => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kabupaten_kota'] = kabupatenKota;
    data['kecamatan'] = kecamatan;
    data['id'] = id;
    data['npsn'] = npsn;
    data['sekolah'] = sekolah;
    data['bentuk'] = bentuk;
    data['status'] = status;
    data['alamat_jalan'] = alamatJalan;
    data['lintang'] = lintang;
    data['bujur'] = bujur;
    return data;
  }
}
