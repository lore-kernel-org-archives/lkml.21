Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262134;
	b=YIVClromHdqbgj5DE5JrvmJPpggM8LBbbFudtxSDDzIghOgm1iiQRhF3IATQgGowUo+K
	 U5wRNC4v6YAwyLvMihZuQ1VO6bYIUpLEkP8JAy6v8HHFInpDxniYdUb92w+fTRRk3fo41
	 Lx9Jp45lQ2saWZZAw+Lr8VOvy5bq/bxg1kSq9Ignpj9/WRTeoUa8qhp5bTjOYjZHvW8O4
	 bTFpsg+qLMv1so7nJ40ZJltwM2JbcVbdS6eLToTwnRxPlynhkDhBiqoJ5EsQcr0XSYIkD
	 ddZR4UXClX24lUn6n7MsXRYRxiXZUO6io/GHI8sLbjrRkpcPS8x8ENmThKbFGNgTyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=Udl+/K1uwpei4wEZthYxSyLuxFRGO3vhDmEacUQwYcU=;
	b=SOg9siidfO8Pe1TtoSqYj+MTLgzqLoFmscU27iWSWkijF+216WAWWHRShE4iCxwqWwU7
	 afaQzPpcy4nd66t1Te2CreAsRbdP1chLDX+yLTb8o2MYnEXFdgl5cLpZiAGC61Xyae3zL
	 i0tOu14KNSP8P7hZxAv4d6uQsy4MXgxqHFfNVF/m5PNb6ggctAGJEscVTKuWPZHZMdciZ
	 d5yvKYHiiTN+mnASMiW5rDYYRmmjd+krL/U53zv30ypJm7kH3NvdWTR39heiRPnXNL6O3
	 H2V0I0/nS+e73yd9vdPbsRc/ThKh9XA1ZnmAJCABJJEO2hTayPz+DCTc8alH+2DvEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0k+YJBUH;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9191606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9191606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0k+YJBUH
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-382f4710a17so3009251eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262133; x=1795866933; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Udl+/K1uwpei4wEZthYxSyLuxFRGO3vhDmEacUQwYcU=;
        b=0k+YJBUHmdNpld/JWXvrBrKQuGuyaLGNv3sxg43FeN8rrDSQ4s066Skzh/9L7bR3yC
         1IZqCBZz8ikuGIAebBgi1vCiSPFarzz7syzVNBvi3h4KusKVoQryvGBmPxJHnseTA/WL
         Dvl9WLqU4BcUiaFeEOe54dbE5E4cpDXgsHc5cvz72kSnPB2WFbkdF4eEAM1c6+UMWn9w
         6zu8kPnFmVmhe3iCdCDm6JEflXLETJTrW6NEhHuZ2ui1LXOUpC1KIp73tXusjZkTq7E5
         /nJGiiJR3ogrKwP0sflp2r2J4DXc3TDupzRJlONF0NTg6yTWJ6jrzG3NIOumNQHSCeDH
         LNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262133; x=1795866933;
        h=content-type:mime-version:content-transfer-encoding:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Udl+/K1uwpei4wEZthYxSyLuxFRGO3vhDmEacUQwYcU=;
        b=Hd/jqJ2fIOmb40cNuN905LwWZE8x4kp7JV1D0YzX6HO9lCqz8eW+YmX7C2x43WodcX
         jcZpKilTrFvs6KB009VJ3mpwTRMGvRjzsqG/XBOt6jutSrduLp0crivzytpi9Qh26Kap
         /5xhcuu93pJMc8mPlsvEX5axgU5h4I2JoYtupqcARjXGbbKIE3rlB18YnPhhwMCrPRat
         BwHZJz32/FukQuXOkXNnhyHS9cOw2D38ch4hppLTbFBqSelB9qnj8SVGni89XSMX4oa4
         hzmZ2HwfECU9E8tNNmLlYdSHC4Qjb7/hStkemAS4cAVoPAY6S74pzHCpybA4M/T05vG/
         PHVw==
X-Forwarded-Encrypted: i=1; AL+hErFUQuHeHT3FAy76h/kxTN1ToZ3ON+LAdeH689K7UPE5t3tTrW6vtxNX7ECbB8VmfwR4vObScil5G9eNpiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l+DIH+Mu5IpGBFtwsHXXsQCykXptaGdvyQ0PP57d2ZvmHxdUp
	BTOtPQCZrOW7JitWDJm3xWIWQUwPSpM/1ROXFtwIe+TeucvIisMhLRe4
X-Gm-Gg: AZFdTZcBKASAA8Eik7Joh02FwWenfKrbZmp6jBL+wsQbhVl5EZhxbL2u8VWLn/ilzM9
	AenDeRKrrmRdBfFAAI1upRatHlhjfxu4R6jM05eCg/F0ZRUj2ZmOiD/Up+RE42VLxN+HX6FJZRM
	3o3VPpxOIfWLGMvhb46m+pGF8QpzkA21jI56DNMgLBarowTVFH+FSbQLcOc9+l3vCQvMaMBHel1
	GVzjkoRLiuaoCg2CnQPLPTTE85gc/E/jPqjem7pie274tibD5xGErEkP9hxtoe7f1wdUuFBbysJ
	yob2z6uHa6M08XdU0UixKw3TWMASvjuTdGb3ixMzNpBilQUOtC/XAdJUJH/fmlYZ9+aRB9J5ge9
	2vLEBCvlSqql69OTAnhUW+OWtVKieoPcASC/BvDOkqScWSUZg2GQT71eTopM8urA3Suv3r+KHxt
	vg0T7XGAu1KEoC+ZdcZtHX0jiUJH/HRjo0GJkuqFd3gpdLkuHULedmTLUC1puph0lgWtBkLi2KZ
	HzYfD8jC2/zuWaWzR1Nn4WP1dtqOYJVdURoEaRPUpGXamcZEh7BYoqNRRG9tQ68X6/Zw1ixLEm4
	x72gZirC5CZXXIoYujyLEVLKfLczbeNrpDB5Wc32LIjr8hGXSSA=
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3856fe5971amr6534175eec.13.1795262132618;
        Sat, 21 Nov 2026 03:55:32 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:10d7:e30e:302e:83a2:5a33:afcc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm22261925eec.4.2026.11.21.03.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:55:32 -0800 (PST)
Message-ID: <6b0186b4.6dbf942f.174087.451e@mx.google.com>
Date: Sat, 21 Nov 2026 03:55:32 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, gregkh@linuxfoundation.org
Subject:
 [PATCH v2] ntfs3: fix out-of-bounds write in do_action() bitmap operations
In-Reply-To: <2026112159-sampling-unmade-c123@gregkh>
References: <2026112159-sampling-unmade-c123@gregkh>
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"

In do_action(), when replaying log records for ATTR_ALLOC attributes,
the buffer is allocated based on bytes_per_index (typically 4096 bytes,
kmalloc-4k) but bitmap operation bounds checking uses lco -- a larger
value derived from lcns_follow << cluster_bits (typically 8192).

This allows SetBitsInNonresidentBitMap and ClearBitsInNonresidentBitMap
opcodes to write past the allocated buffer into the adjacent slab object
when processing crafted NTFS images with malicious $LogFile records.

The bounds check compares against lco (the full LCN extent size) but
should compare against the actual buffer capacity. For ATTR_ALLOC, the
buffer is only bytes_per_index bytes, allocated here:

  if (attr->type =3D=3D ATTR_ALLOC) {
      t32 =3D le32_to_cpu(oe->bytes_per_index);
      if (bytes < t32)
          bytes =3D t32;
  }
  buffer_le =3D kmalloc(bytes, GFP_NOFS);

But the bounds check uses the larger lco:

  if (cbo + (off + 7) / 8 > lco || ...)

With bytes_per_index=3D4096 and lco=3D8192, any bitmap_off >=3D 32768
(byte offset 4096) passes the lco check but writes past the buffer.

Fix this by computing the bounds limit as the minimum of the buffer
extent (cbo + bytes_per_index) and the LCN extent (lco). This ensures
bitmap operations cannot exceed either the allocated buffer or the
on-disk extent, and also prevents a crafted bytes_per_index larger
than lco from weakening the existing check.

Found by code audit and confirmed with a crafted NTFS image that
triggers the OOB write on mount.

Cc: stable@vger.kernel.org
Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Tanuj Sharma <ertanuj96@gmail.com>
---
 fs/ntfs3/fslog.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 1879d04e3cd05..85590f56587c2 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3751,10 +3751,16 @@ static int do_action(struct ntfs_log *log, struct OPE=
N_ATTR_ENRTY *oe,
 		off =3D le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits =3D le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
=20
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		{
+		u64 bmp_limit =3D attr->type =3D=3D ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit) {
 			goto dirty_vol;
 		}
+		}
=20
 		ntfs_bitmap_set_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty =3D true;
@@ -3764,10 +3770,16 @@ static int do_action(struct ntfs_log *log, struct OPE=
N_ATTR_ENRTY *oe,
 		off =3D le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits =3D le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
=20
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		{
+		u64 bmp_limit =3D attr->type =3D=3D ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit) {
 			goto dirty_vol;
 		}
+		}
=20
 		ntfs_bitmap_clear_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty =3D true;
--=20
2.43.0

