Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181770;
	b=ZbYCXg8wInIcp3oaFRPscOFfxtS6bn7eSP40yKrGQD8hYd7uizVS/Svmvta7ovdUuclB
	 dm7MwCxBXPKQnqAwGW0HB4+atmUAzkbXk+M044MroySsqccybOSxXkiiE6Zrn90xjqrcX
	 rH7Rbx76Diu7WPzzEz788sfHsmXoIHe+3RUOTt6mY7XgS9ItIxV0CnqCvzMMoVCYbTca4
	 Pk7zgl++UA9+onFYC222anKzXLyDDoUR9gDNcs20qrojIYNgo3zLtypolIym/F0dBouPG
	 37gsyNwbGMgG0t+qVxNYGcCZ1RSoBQc/1Zj6PsdR+TzeQXBccLMTnw6ShoUh7tyU3Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/vILFpTBKVy7hMrZddb0IwK/uJclDAZCWjwJQwnPh2M=;
	b=dV96nq3M9c2/L5Kjdj4S8iCD4E3IJUSiQQgQNUWW6PdKqLW8WyHQQfck3wtTvaECrw+S
	 D154/HQHFCzg1h0JDgm8ob92LCZX0TopGzBeMK5xCLn+Zfb2UxTeq99NDkgp/+kz9EACM
	 12uTcRhENjF3e+9ssof2AOsHlQzDXMlgJa5OuNVFzTHRFJ4De5FdXBLgNPAfIPhF9dzdS
	 H6jgU2HMzBViJlZRl3sZaMGqLGW7jlcmFqdSK5A1p7vhZAFUJ55gar0txjv6w5YJcrQ7G
	 bp+TFuYg7UExw7o1Lk9jfzDLq1EbMDvO8h3bQgTqxY6szf/aXT9bj3BKlN1oY4ClTBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rqD2brcK;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65F606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B65F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rqD2brcK
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso514152a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181770; x=1795786570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vILFpTBKVy7hMrZddb0IwK/uJclDAZCWjwJQwnPh2M=;
        b=rqD2brcKpq+QbkzaX7aG3WpNJUL8fYl4ejHYirlAC7PRiN6CrdvcI28LAGmbeOwc/Q
         z3sEQUIcCiqsbmLHZab82gKslwp7lJIHgRgckWkZUg64PhcSlZb8qWTVteiXjsUZ475c
         kT6uKp8KSzVcatL+BCoQhQ+CFFu/opAWIfqcWE9gdlidDSoU8Xcoe3ocQw4fruOvznzO
         tSr6vdjHOeNjJpEiO0/7Jmsmkh49bMgrP1oQncGlob1BGHVDtHBU6hvA5/ZXWG5VU4RZ
         kZUlF3Gq/X1EITDJhIPx9ugiY0kEda1Rdd8wuryECc8P3PEhLH2Y1ltzFyO7Ot/FOvgR
         q6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181770; x=1795786570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vILFpTBKVy7hMrZddb0IwK/uJclDAZCWjwJQwnPh2M=;
        b=xRYOXU/zdRV7jhuE3B2n4wcFStGNnHjuomOVk5hDr/jFjRo7q0iNhTfMb+5TkDskJs
         6OvCgMwF42ZD5wrBW01lbTL2mcDACoq4VECpjQLIQUK/RXsVL3Q2VMrbYXBheBezMw62
         xaOBCnQanwMAPB+tVCmZiT0W4F6BIa2CGF1ngJfdhGtb4FntHUx2nv8boJMhj0ZBE4fj
         Vj/2KbxjJ4wYHKuWlu4SkaeDxWzITEuJS5ZSOk8Pt2o9L96zTlKMMbYnAnZjHMYL5sAR
         /MesiGQu32SuZwzDuCm85qzpdiRul7CFh3WkxNLAB3h2YDUhdumHH65faFAvOUb4/6xC
         V3qA==
X-Forwarded-Encrypted: i=1; AL+hErF4QJCP8+zufdrL4af3LoRSoPVhbvm00SBkVLyqhSd67BqAR9iSB7tXnhwh0cG9042WF0S81STxUEN6818=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wBUFS8odJ/zz7YS6l2EzXKrueA8C6on33dDizvYo8k13UVlAz
	yMqAhAdyPatBQwXQo5lF+J9qBbjqDufA/3dNvYahtQhyJqEdMCQJKxTFSMFpRg==
X-Gm-Gg: AZFdTZeEXz7PdOz3IcIMRBf0eWocpmNbHA6HAiYIK6qroOkwONbe5+u4RzqNsCPEqxp
	x8L00LRipJotTZSSEGX1UplehcqU39eYBUAq2DX2/PrzHY39KUXE1Jdbm9zKT35hxsiVELIR9C2
	3cdycWAX+Zmh2Jb19gieTJypqy+MPEBtyeEE2sRgQHsRmaZSF4hGs9DWAz2dvqPdawAHzFXHIme
	0flx4goDXRFRRQ/Y4+gP9SuyREhyuF6uNZ8RX1P23IvJ9nRCEJVWqOw79PXMLo0hBYRNRXcN8nW
	Kj7FxkZdMm886+5ARRfCk6Rb8fVbZd8V7WukNvnJGW/FNasGikNQgS2qHSd73OCmdj0Tad5JKa9
	SVp/Fx07qLss5H5JvT9aSrqT1MBdsRXFxsSf01I0KjM9/1fQ3+ojVYFBmcdh2Y8LIA6owxDwA0T
	RkSTohcmlOKcK2KkJyps/PJ79r73BtMjGbyZ4SWRgkLyceoE8LLJlE8LsuCUK/uJ+y8sJbzfpeI
	ByQJBntRoa9GNyY2HjosShoUjeCPnj+1UuAJdchshM7oYbjDOa32c70/8GRQYFkBYPaLdLn4yjz
	qncLbYOVhx39PdQKzOS2IHHJoWl6MIRaHkjL1209cRbPMA==
X-Received: by 2002:a17:90b:2688:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3b41c97ab4emr2678585a91.51.1795181769634;
        Fri, 20 Nov 2026 05:36:09 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm7557362a91.14.2026.11.20.05.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:36:09 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 1/2] fs/ntfs3: allocate only the written range of a hole on writeback
Date: Fri, 20 Nov 2026 21:36:03 +0800
Message-ID: <20261120133604.427285-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ntfs_writeback_range() maps from the folio to the end of the file with
one ntfs_iomap_begin() call, and for a sparse file that call allocates
the holes it maps.  A page stored through a shared mapping reaches
writeback without a delayed allocation, so writing it back allocates
every cluster from that page to the end of the file.  Only the page is
written, and ntfs_filemap_close() later raises the valid size over the
rest.

On a volume with 4K clusters, map a 4096-byte sparse file MAP_SHARED for
100 MiB, grow it to 100 MiB with ftruncate() and store 8 bytes at 4096:
97876 KiB are allocated instead of 8 KiB.  With a 4 MiB file and the
store at 2M, the 2093056 bytes from 2M + 4K to the end of the file read
back what their clusters held before.

Map only the range being written back for a sparse file.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in a VM on 7.4-rc3 (20eef29b7c84), 4K and 64K clusters, with and
without delalloc, with the free space filled with a known pattern first.
The numbers in both changelogs are from 7.4-rc3 without the series.

For a sparse file, writeback now calls ntfs_iomap_begin() for each
dirty range instead of once per extent.

 fs/ntfs3/inode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 45f894d182dd..535a2b0804af 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1181,7 +1181,11 @@ static ssize_t ntfs_writeback_range(struct iomap_writepage_ctx *wpc,
 		struct ntfs_inode *ni = ntfs_i(inode);
 		struct ntfs_sb_info *sbi = ntfs_sb(inode->i_sb);
 		loff_t i_size_up = ntfs_up_cluster(sbi, inode->i_size);
-		loff_t len_max = i_size_up - offset;
+		/*
+		 * Map up to EOF in one go, except across the holes of a sparse
+		 * file: iomap_begin() allocates what it maps there.
+		 */
+		loff_t len_max = is_sparsed(ni) ? len : i_size_up - offset;
 
 		err = ni->file.run_da.count ? ni_allocate_da_blocks(ni) : 0;
 

base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
-- 
2.43.0

