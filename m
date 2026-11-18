Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962945;
	b=ZU0eSsCiGbZVKF5aTPxEefAiTUxRdwAAHR6A56/PeNC+B7IunOyIDUVONLtHNxfgEe15
	 v+OdiOe5ncODhc2/CtJXaULoNllA7C11u/jA5SBasbuXJ6HJI0SyeXcZRWTQ8EBiI8xP5
	 jbXVj+dccsNlzCvDuCtdbzMWXWXck2gM0Z09f5yEGh56LwrRBSpkghjZcyqMAcUW8xBW3
	 2xHXeqyg2r3yKAfZnQoC9S0IxG8dNiA3jo4Y2E1fL8KDra9ZemN4ARC2oSFulTr0K8LHK
	 TAeTjineD6j6nuEddoYto7pEZWVdxrBCLgwfp0xWY9XpCFPi6objNCAaIFyGFis/ZVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uygP09TWvScyICofwLDljYgom7VYS3wGkavE3BwU9h8=;
	b=rh/zVnUKcdBMpGMTOOnm3Wq9rHFmAB4iKTTz2lkvJz/wofQ8Ynycq0XUuDCrC3mxsd8C
	 1Q21U9icCFLSv8EqAlkKotE9U149tbnhyalsPHAiapHHotJ8eP3G0GjNvvOU9EbmxXFkh
	 kMQVs0ESNLgSzJruSd8BJpXTArBDLz7FiJU4luik4Ypn/m1xxU2TFvYmN4kqmDbDNycHM
	 RLnmQR72MyZQkCScmGCiB5t/8rUVoM3Szke3JVPWVIE/vwVXGfC98IZRyMVfPCq+8RTv0
	 i17nOw87ch8OPSjnjESxGVqGGc6VOBeRcaNFehGagqxvOL2ZQTDTIcQbmlVZyNmGYEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Dqr3ni5J;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8240E606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8240E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Dqr3ni5J
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67db8985419so496533d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794962942; x=1795567742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uygP09TWvScyICofwLDljYgom7VYS3wGkavE3BwU9h8=;
        b=Dqr3ni5JjgMu8kUg65eWevBO8hYO/MldUTZEDJdMF+7N/h4n0s+4fvDmy3RG7QoKRt
         0Uw+ayj0sLeXkK+6jVTY1T3uH8wHy4z9m59RWo/n9SOppMcxcVEOJ4UBJYJx3Q/CRs2q
         LznBcoWnqadFL0Wvz0LE0WlxwiAxcSMw5wa6JA5EOL6pj7kCOuULU/fQ9D8xxBmKBO0h
         GIpCWLBPcP4zmnA7Ym3rICn1gv9IQn8w0/PymPyNWsggmYqzOFFsXEWcGG5vhwmrV80U
         fQ9BHH8nYqRsrAAarBdYYQcHCZa9B40kaP38olItOGkpGfe53Lbvv7sXhQFHVwYewHCQ
         Ambw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962942; x=1795567742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uygP09TWvScyICofwLDljYgom7VYS3wGkavE3BwU9h8=;
        b=UJIjvNfTSKUp9kl9BODD3JGQBHW5XB4nMPbtC0Uex5gPUHQs1GfUCUk2BgxcjxqugM
         6cJeDm7ks3Ccyag//oUF+DU+V8DkXcZ5VkpLN/EFDIx4BeJ5sAUoppiJrCpHryGGUI76
         0xbwPgYwXDVEmv0t6H9Usgrbv+olAvCTOrMcEwaK3lNiDLG18G+WZb89bIW4K0lVNUXY
         ZZ+qOIuxpVbszv68Nnl3Zsvkde13UTkz6zVJzYGRBRSjZKiZ4ep5/fEC/FKx+4oWEyjG
         G6oz3mzAmjv2v6oyPzxE2aQ9KXlX9c3G+PkVPgAh8E8/HDnvEJ2MR0FCxy3gO/Po6d9P
         if1Q==
X-Forwarded-Encrypted: i=1; AL+hErFzUt+UYX2E4pUAfPCfGFGPBHWHefHsZDr4sIEKiotcI7A90VlW95j8pY1Qf1eNTkvdKmmFnoNdIV53vdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q0qssPek3yO+JY3AE8vYvyF6I6Ikrl+a3WbIER5F+Q7prFqTN
	fWXwqEVDP3ePsEEnPIcff31BG1IRcagdFDZMgWRCurpyxYTZ0SghG2jLWdtqGh+ZutE=
X-Gm-Gg: AZFdTZe9Ijbl/tZiHV7FUQBWutuy5+FnRtXpwvm+e0KhmHVHYrPwKokRKW8hc7Gr4RV
	uXdHQOLdW8VFzWUZ6deRQOXKVZI9/YRWPWj6ECkw5+ApNhcgRGQdgfRFiNy79mGMZd2iU26BJF4
	ml6bh5v//k9A89j4r9z+Z6b3OmsHbgybgk1jZMzvz31cBSposRsxsHZnRjo0yMal69xq+FlpQb5
	0YBAklWu+RgHBrZ8FoEOQqnclnEPlVCrl8dv2BlQzRMVb+EhaAxg56myUMm+UJu7Gn2rCPVW5Fe
	pIuH/r5kVyVFbWqHgZ0k+IZazpgDloGtl6BwplHl2QvNyWGUT5Q/R0Ex6Uu7aDp6X1/C/ZUII3n
	7zT0nRanQ1UpzvgIVMZYgngvOUyEgPdXjG6MzhFFjkZVzcF4J8FOkzE53N/5KTh+hpqv2sur7Io
	v2n6mVueLr+BJNBSWlAklaWNsdLrysAiHf6Kd0VBL7DZ2jjTqlLgmmeh41F3cx4VrQgNPnGidkt
	T6s6UEMTDbicGIqQRB7IFdEOtB70tU7L0xo0ebcs7mMqsw4cBUC0Z7femYO9MGYsKLM2i/nGlHF
	S35ew9FzYRa/CBjN5BGtJL9VPL4svXd7DaulYXqLQ1gwZvbSdXzlWcN7m9oYcDozU2ByuAMcBCH
	N9byLYLCrYWwQMVnvZ7uXnE8EnoahmPSP39TQ1z+y7UI6ZyewbbL2mMUayh6VVGqMSIbqudU=
X-Received: by 2002:a05:690e:12c6:b0:67d:ac2d:d821 with SMTP id 956f58d0204a3-67dd45342e3mr649464d50.44.1794962942572;
        Tue, 17 Nov 2026 16:49:02 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:5fae:4d02:7055:94ad])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd56ead87sm729575d50.1.2026.11.17.16.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:49:01 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	hch@lst.de
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	brauner@kernel.org,
	linux-xfs@vger.kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v5 4/5] hfsplus: return -EIO from hfsplus_map_extent() if no extent covers the block
Date: Tue, 17 Nov 2026 16:48:43 -0800
Message-ID: <20261118004844.3849979-5-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118004844.3849979-1-slava@dubeyko.com>
References: <20261118004844.3849979-1-slava@dubeyko.com>
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

hfsplus_ext_find_block() walks one 8-entry extent record and returns
the number of contiguous allocation blocks starting at the requested
offset. If the offset lies beyond all entries of the record, it sets
*dblock to 0 and returns 0. hfsplus_map_extent() ignores this and
returns success, so the caller gets allocation block 0 as the mapping.

This can only happen on a corrupted volume, for example when the
extents overflow b-tree lacks a record for a range that is below
alloc_blocks, or when the found record does not cover the requested
block. THe hfsplus_get_block() then maps the file block to allocation
block 0, which holds the boot blocks and the volume header. A read
returns that metadata as file data, and writeback of a dirty page
of such a file overwrites the volume header.

Return -EIO from hfsplus_map_extent() when hfsplus_ext_find_block()
finds no extent, for both the fork's first extents and the cached
extent record. The iomap conversion later in this series relies on
this too: __hfsplus_iomap_begin() derives the mapping length from
max_blocks, and a zero max_blocks would produce an invalid zero-length
mapping instead of an error.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/extents.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index cdb337ba3924..bb5a1508498d 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -67,7 +67,7 @@ static u32 hfsplus_ext_find_block(struct hfsplus_extent *ext, u32 off,
 		}
 		off -= count;
 	}
-	/* panic? */
+	/* 'off' lies beyond this extent record; callers treat 0 as an error */
 	*dblock = 0;
 	return 0;
 }
@@ -273,6 +273,8 @@ int hfsplus_map_extent(struct inode *inode, u32 ablock, int create,
 		*max_blocks = hfsplus_ext_find_block(hip->first_extents,
 						     ablock,
 						     dblock);
+		if (!*max_blocks)
+			return -EIO;
 		return 0;
 	}
 
@@ -300,6 +302,9 @@ int hfsplus_map_extent(struct inode *inode, u32 ablock, int create,
 	if (was_dirty)
 		mark_inode_dirty(inode);
 
+	if (!*max_blocks)
+		return -EIO;
+
 	return 0;
 }
 
-- 
2.53.0

