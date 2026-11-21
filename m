Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263866;
	b=CLULG2mf6PZ2sexPtlHAHW826eWhwaPNV2q8pRsoZ1erZt/7vtMIiFF5fFbSflkN62IM
	 b19u2Z4hDOawwHn9qz9S5/vjMJ6FqtGkTrKjfBqPbq5WcbeGwKsxF+ga6e/Nco1Rk/yKg
	 /rqkQqpdJrkc72wAACXLAcxrd6thGpmxz8zPFXGDEVLDIl97Z5t5HnSybwS1cnINNZFol
	 bKTf9M6dEDpru7cW8Em5vwDXm4By+C9QSIBJgn7A/7xX3hCM0PCe/CDnN7Tz+JncwwQ8N
	 wwkh3EmfuiPTLa2jYri9VGPX8K7LKJXPZy7uI05OlK/DnuaVOwLxrSxI0dpjO8hwv3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i6Qv8wZdxu9JFYsmpOYL26yXLDHBJkV6sn6Hsg9cqy8=;
	b=25sUbzdvdE+Ub2FIq0ZGQpZSYrbJuLGBcYLJQlLrc9zf9vxkoVIAApd7EDhOVRp/RKeV
	 iOTeXYUqGv/hrt+PgOceZ7++wusL3tc7YrGMgokA708wXPUcaGeIVBM4QPQS7A+z94nlu
	 JF39GM2YQJkI6YB+Zgmxx79rj5b4w5l7DSZOufIhQRL7/wBal/6D59CqZL9NhEIvwJcrn
	 T0VtZyEaqdiXg2YjzJ8WqVBmdS0qTBH6B5TCEt6lfV7i23cJt9yTaJxTCG7cbMq4xNpqQ
	 iB860UQBIOxbVxPOSSBToG+eIgsxu/vRIIEA/0KXBGWNkLG+M3Vb3mgYt2Ftg/2r1xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlj210yX;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9C606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF9C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlj210yX
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so4058630c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795263865; x=1795868665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6Qv8wZdxu9JFYsmpOYL26yXLDHBJkV6sn6Hsg9cqy8=;
        b=mlj210yXvSRbMgy2A3+qsQtbS/9BHBbYy4xOJF2/2eM9BGeuKpAzbkgrTPUjujlrPP
         dpRkqcgJzQg+t4LF7B2kmYjvIaLovHwkQ3bULS/Hj9RI2S89U4sFsmU0FkAEFcVjMMkz
         cNJ3ua6u8jRyy7XCgWNi2yi17LIcmGROZaIU9t/L+P9DQ4BFOaoXS4Zx3fORoWKVfXjS
         8xTDLlVVJhMsj1xCRVzMJB9jtQTBG8Aul0xDuGGTewttQCCRvUrw7uXyl0qgzMFNRsDl
         zkLd8rzc3HSCATYRsuBgd/iHFW6lw7W/xMIrY+vD3wjjhj0nRFEkuSrP6W3uw5ozRNq7
         +KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263865; x=1795868665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6Qv8wZdxu9JFYsmpOYL26yXLDHBJkV6sn6Hsg9cqy8=;
        b=mMRNcpGLcTdrf+J4ciaV297/w9qa7F6d7PtpcGPZlDVMaviiGTbGkYEUr3HqgNHHCR
         GTRF4UIlseasr4qopIPl4HaxnrDW/L2E4KyOB/34CeJfnWNbJfTL1jQqzSRQx6HvNA8T
         Q8xdRgxhzzGEl5+3ZlfMS5UB0mhwgAw9jvRoCumuUmBhPtFy5oS3RYge/C2sPEJtqxNZ
         PxO/wLQ+yKlHjUJEdBD8yXBHfN8d+QBIxlfgvkrDPF10CxKoBUj3heoMW3KCY7Qxz9SQ
         UNcVo9+Sa2B8YeOWQ1rj4Z8bXan+Vj8JLMSdTw4iEU5VvQuRLNg+8L/iY8zDdHadiOE8
         ipRQ==
X-Forwarded-Encrypted: i=1; AL+hErEyibyADIhfsUw/lxCjQkiE4oW39wpcokf1C6OIuPo2bkeV8sIMPTKh8W9yeS3DDHBXo2MePfnwrRd7ALY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SpVU/lyTtVKesWXRhuD52Q4CjLB8eCiDpqVPCGwboiHwi1aH6
	FJetGmHG6KmlZqale0ySIbHbtUP8CtXC42YJig7aS84Fg12eVM954jAfsrAiWPl9NyCoIg==
X-Gm-Gg: AZFdTZcYxCfJMqwVUKiZa11mfX8IgyefxDzx+PEAX7WOYWcDHL2tvx4HO8ADuh/53og
	PT4nSvbolP1hmE2ilY+67CXbXvj5/HO0hoqN6d4b96vlv+z8Ll0ZoT/oQfWK/5TyB4UuUonvG+4
	VEaF3vyHWPAFIj2+OdS3M8927nw695bA6WNsB4sZI8T+LcflZDEHb1KLrKSpqzipryw9GTOJHIp
	CElg3JyXTY2dPzEWpqI1awhdONRpzni4gbGbvF5KDry82R73xWh1Oy1uV2qb/w3tunO6be+Z2Hj
	2hNfOVBUPCpPbNiv5W5dlh//g61tM9qgZSKqvn6xQ3pFNv90XlwJumFjY0rnPPV/6V2LUCAT8nB
	w1r88z3QfTfiU3lriq6nnOU/u2kqpmHTWo9V4J1saspZGZiv0vW0hdLWG2mYr13jf2w4JD7Cfic
	EjB1ULdcnidSsjqbm7k9autCKeo03DJFUKKFEqtxyoM59augw7HqByfTU6F2ZEy7EL/m0Lm7oi2
	670ifAGw+bvnU5SxVeYmtFts0ACvckSQCOANI1m/0p9EkRrE08AVVolZDWc3xQsKAd2yyYzOLsr
	2Tj9oiNW4AQX0rr5RYMl1KbD/MtDasgQqc7S534nLWmkGiAOfsaVh9hVL7ewrqS7URANrkfGgTH
	NYtX/IZOQbqNs2ZNE47V5t3KR
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr6730337c88.32.1795263864702;
        Sat, 21 Nov 2026 04:24:24 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:10d7:e30e:302e:83a2:5a33:afcc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm14733690c88.6.2026.11.21.04.24.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 04:24:24 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Tanuj Sharma <ertanuj96@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] ntfs3: fix out-of-bounds write in do_action() bitmap operations
Date: Sat, 21 Nov 2026 17:54:17 +0530
Message-ID: <20261121122417.72854-1-ertanuj96@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <2026112132-spending-smoking-5e7d@gregkh>
References: <2026112132-spending-smoking-5e7d@gregkh>
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

  if (attr->type == ATTR_ALLOC) {
      t32 = le32_to_cpu(oe->bytes_per_index);
      if (bytes < t32)
          bytes = t32;
  }
  buffer_le = kmalloc(bytes, GFP_NOFS);

But the bounds check uses the larger lco:

  if (cbo + (off + 7) / 8 > lco || ...)

With bytes_per_index=4096 and lco=8192, any bitmap_off >= 32768
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
Changes in v3:
- Fix coding style: move bmp_limit declaration to function scope,
  remove bare blocks

Changes in v2:
- Resend with proper formatting (git send-email)

 fs/ntfs3/fslog.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 1879d04e3cd05..373d84545a8fe 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3125,6 +3125,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 	u16 roff = le16_to_cpu(lrh->record_off);
 	u16 aoff = le16_to_cpu(lrh->attr_off);
 	u64 lco = 0;
+	u64 bmp_limit;
 	u64 cbo = (u64)le16_to_cpu(lrh->cluster_off) << SECTOR_SHIFT;
 	u64 tvo = le64_to_cpu(lrh->target_vcn) << sbi->cluster_bits;
 	u64 vbo = cbo + tvo;
@@ -3751,8 +3752,12 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		bmp_limit = attr->type == ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit) {
 			goto dirty_vol;
 		}
 
@@ -3764,8 +3769,12 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		bmp_limit = attr->type == ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit) {
 			goto dirty_vol;
 		}
 
-- 
2.43.0

