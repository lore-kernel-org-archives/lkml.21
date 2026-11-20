Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181772;
	b=WzF05E+OsVfB7OBNTJiJ03kNro3MUI1tHdG8SLz1tueah4bpLOeImUBNDcQe9z9iVeeY
	 dOXn9JKnde8Ez5sw0TsdCKYB+kEKiNrlpAkOJkMafvqjUpfrgj+tcG4KMS+fRw8i9mwYz
	 ZewaTKewoM88Tpd0QeW2LC11QttKCyMB+5E+h9Y2RTOKXZOH2sYVi3n60+c5dT3n2EG67
	 tmqaMRIuNCJ90jQBFqfv+/E/qOxzSc8VimyWXcfBnvzJOJjnHhGNT1iSqLrv2XMySQCtC
	 E1t3uDI1sUdb+FuxEpxIR5XQMFUlCsTrUstAFI5lIX8O/QonFcBBa3g/dif5/MelmIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=buQIV0vkdXGXpQqdQz4ZB0pqcKMsGECCL78uKqu8k0I=;
	b=zcepNV4HLpkvuaS+B6gZJnGFjB1+/sdwythfT//Rtgdhecsx6sOjlTEgTjmuY2ubtVNB
	 8hmQ1SNK86Q84UyWrcIA3dsSVIDQwETr5WX+ey2o9DwU2WwpMj2RvmiDFHbz6aodiClFt
	 3aJ5o3jlTKq/r+p49dvYu4MI2Q+Wgz8eU7EV51Mq2n7PBGCmDzw5HDryaLeFG6fgRwvbg
	 Joiy73WMu2RaZDTi7aH7lbq9wO7OADtrByKHEFh1MR4A8xZyVIoJiYvoRbtUFxGyuG+Pf
	 2XTA5kdPo+Y1ITL6B+d5+VXSsqyuoPAM8SbIlI7KXyFu8LVA7+m5ng0v9FDAqjOoXCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJCf37oa;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9619460A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9619460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NJCf37oa
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so515246a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181772; x=1795786572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buQIV0vkdXGXpQqdQz4ZB0pqcKMsGECCL78uKqu8k0I=;
        b=NJCf37oa3Vu2kSYXoj0jctv4LzonJfIcZ3ltwyjlxMqZG+ZogqcYpjIxSV6xKG0See
         RmHewxvqzhC42W1rNkX/84g3bRswwXYT3WyfSsk9Kzikg+Sq/NwbCrWsEgSX3Wr0twMR
         yJmW4GAdhWxqAOicxM4U6eI1Ea90Hmpl/KUja2CmxWAt0NJ9dVyIw3NsatYBk9hlBOhn
         SONi3hpY5+hnG9JRGA8RmyHh7NwP7ZnjHeCfKyTmJVgoJfya2+reuwPjhizzjRFF8A0a
         NN1P1EYlCs6OFmmeFDFrKJOFo0yhb6r26Z5X8eG7DzFDZd0mDVFyhdofLeJ1eUn7HpKu
         yCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181772; x=1795786572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buQIV0vkdXGXpQqdQz4ZB0pqcKMsGECCL78uKqu8k0I=;
        b=YC902o5V5LZAzyILHh3T0/8tSYQWnKEODGDa2AnNK2Qfd5rBBNKZjKrOIwti9X0LP9
         cNuGHqtFK6qqzDDrnlajjfCCE83lu3cidhpx/7Hksxba7rD03HCDzFbLUWvxl1KrhF8o
         yDIXOLrOPyiq12V9fZ7bixTpos0KNfxfmAJp2vXXsyCQLgWrdwQpCfiAv2Z1zrsLx3/8
         zYwFO7psIXv6b5yIYPyLE93mDkrv0gS0OyT3n2lpHaRQQvZyNUur/9J1WoYmgmDGGPp3
         isEduC7g+yMYZeSRP8Pj9z4xnaY3PG4ZKpI6XPSOEobOdVBz1zIvEO+bJ5hF4Cz5D52n
         K7hw==
X-Forwarded-Encrypted: i=1; AL+hErHRxYoYo6vVl11tPm8LulrkxyhNmRYMq8NlgglnFoeE+A8lx8hBm7wkamkeIfpHeEOWMwYOEDtG3Oa1J10=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rDpDOdiYOCAweBVDKNZw0zsmbf85kE9y6T5avpx8HDTv730NG
	jDnGG6KPB3AnCsS5us/5+KE+lPz6GyDDWjD9fhuQo5RXqZ3Pfj1s2a0C
X-Gm-Gg: AZFdTZcoxGE9+ptH8zenVBqSKubxHXlnxSjM/MdezwA7AlWmQdWXibJ9gW2mYSBLcud
	6mp1L+9ssUUepsVUwdCRbTMi0Rhb/uTAQkodvZjmUFFuBJMXx79FLSucbThg5h0T5rsMuiuUlPz
	4UQBPgurOI58O2b4/4qXE89PCP6tvmYrNTjqjnpwJg9g5SmoF+XYfqyi3T3yYF1EV9f1QGueU3F
	2YJU12ZYLJLBpLktBVyMf1Hi2s5RRdnjezwqek1ozlAOhl79ho8Bmlt/Vg0xLs51datK1dg/xtO
	m6XYXKIJdrLpDc6WpJ9m1DVlH3vrU1/sTOwm6tCGXX7MSjuSY8kfLo2z99sUfbCRkF+5qyrtH0U
	1W5v3Dyd4uOtp+u7KVJ+y7QpGtZkPGU96TYVLgTB4HJHUUkDMcR37dNUv5V7CRFb7Js0bBDSU4t
	rn2eLmptgSTIP0yKvxs2zxPuhYCO6jidcV8NhRntPQuFHn/+422VcWHQhIc2p1/UtwfVyecALBa
	kroZYYfNyv8O2BJasHI/5H2j4BAAxXJ5IJjirJ0S3gnWChUCbyFUwSqcS6FImcGZXG0dinRJkuO
	UOT1GY8IfKPeRD41LQRBe2kaXHnei30bcW7lqYtGbPkAY/v4U8jGrdVNlCgDw5rf3KI=
X-Received: by 2002:a17:90a:e70c:b0:3b3:a9a4:a60e with SMTP id 98e67ed59e1d1-3b41c92643amr2783153a91.25.1795181771890;
        Fri, 20 Nov 2026 05:36:11 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm7557362a91.14.2026.11.20.05.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:36:11 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 2/2] fs/ntfs3: zero new clusters that a write only partly covers
Date: Fri, 20 Nov 2026 21:36:04 +0800
Message-ID: <20261120133604.427285-2-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120133604.427285-1-zhanxusheng1024@gmail.com>
References: <20261120133604.427285-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

When ntfs_iomap_begin() allocates clusters in a hole, the part of a new
cluster that the request does not write keeps the old disk contents,
and reads below the valid size return it.  The iomap conversion asked
attr_data_get_block() to zero such clusters only for writes through the
page cache, and commit 10d7c95af043 ("fs/ntfs3: add delayed-allocation
(delalloc) support") stopped asking for it at all.  Only the delalloc
path still zeroes them.

On a volume with 64K clusters, write 4K at 0 and at 960K into a sparse
file, then 4K at 512K: 61440 bytes of the file read back old disk
contents, both with O_DIRECT and with a buffered write on a volume
mounted without delalloc.

Zero the new clusters when the request does not cover them.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Fixes: 10d7c95af043 ("fs/ntfs3: add delayed-allocation (delalloc) support")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
With 4K clusters a page covers a whole cluster, so only 64K clusters
show it in these tests.  With both patches, fsx with mmap on 4K and 64K
cluster volumes and on sparse and compressed files gives the same
results as before.

 fs/ntfs3/inode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 535a2b0804af..9c2ded9567f7 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -982,6 +982,10 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	 */
 	no_da = flags == (IOMAP_DIRECT | IOMAP_WRITE) || srcmap == WB_NO_DA;
 
+	/* The request does not write all of a new cluster: zero it first. */
+	if (rw && ((offset | endbyte) & sbi->cluster_mask))
+		zero = true;
+
 	err = attr_data_get_block(ni, vcn, clen_max, &lcn, &clen,
 				  rw ? &new_clst : NULL, zero, &res, no_da);
 
-- 
2.43.0

