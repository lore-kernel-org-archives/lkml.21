Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415098;
	b=EZYZdmyeU07F+d1sesnF1vWd7EX1Hi6LI8PpLdPZOoGRVToLTeDqL6lWirax/VykMPoS
	 CmdEQsJC38/C3UsdKckiswJE7dOwYC816IR9F3atZj9Jh+W5GNjGbXq6/Tr3oMVw5e5Am
	 kgjxq+dgN+YANEcL6AHHfpVaEO02VzKxhfWKFPMdiJTRAj0kx/eu37/vC3eX3XynZlLRJ
	 BLny/Kx+DH2V2kDKmerPg5q3OcprszKa9Sg9NfR1Ok5iGmHqiNnJTPruOgyULhbx0FDHh
	 ecKSwUqNiK4EgL3yeCygorGPM5T1G1YWejudfXUPwHO35/GHU2/0/3Fj6apP8FiBNRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dFdEqFiacjVlyhuruK5DmKXl2N1tqCNj7wsKhuFYg58=;
	b=Nofg3zFGNuTwFncBeL2Ird1LbMUceLlVc+YRLgxekdbqhssqb6YxY+KALsAA0rWpb2Pm
	 oopc/Lx081gdJf6tepsujNBmBQwOnCkWg+YDYju6LYw4MEmqhSOYWG3WtZGbMTne1vWGn
	 LK7ZxysPcIuipXIblMp2Xc7uh+HVfLb0U4WL5CC2Kk1E61sHbiB4g3iQVtbPz1eDAmrdJ
	 2ndAm07v07akXVLblrYN2qqGhHBLO+f/BTAmpcRPJxWSrrBQwbkN8m9+ilD33XRfIMF7d
	 trcr69j/1Rihm9ZAZQp67TfLU6FiiN9H7g1mcb6F+hHFb64HkVUdD8lb+plmjJ9wETA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kksPxDBi;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8FE606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F8FE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kksPxDBi
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386ab9ab619so1556191eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415097; x=1796019897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFdEqFiacjVlyhuruK5DmKXl2N1tqCNj7wsKhuFYg58=;
        b=kksPxDBi+60aFba/GVGkbKoJN+BgFq9Pr8CxCZ/hZl8TA/LSo7BXAUdz9fyoiffaUu
         eCqULUQ9WT3ewKO72r/ilWpnchOrnN1Fov0O8spI3teFCKHroOmUzmqixFfW5bIgmS/q
         8P0Xhqdp1KlI+SRjSXRsujFbglZtjcIG3JfCz7sqAC77e10+YNs/VXlzgAgr42iaGlcx
         iRFeBHYkNCU7z5J0SDTTQTRfgy3TLOOY9EQxFzwNtbqWEH/UgoIU4yryYGiyf+iwBfGI
         XpXOzHMuG/TYXSx6gXXNtUyLhG4iXujQcPnoaMPFJ6iGazaZnEnRBgXnxXm/9wSdk7La
         ZOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415097; x=1796019897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFdEqFiacjVlyhuruK5DmKXl2N1tqCNj7wsKhuFYg58=;
        b=RH7LMEYY7RvbS06sFFMjG6G8oVBH4VlPNLDWyGeQxgTi3JhvdhGLYSoR1F+CvQ2GHB
         U7FCtiJo2p91Tv5O/ullHihRcXGogtLnJWLTAxze7OSxZfo4SScnA+Fhq0nGc93wnavl
         i0KJbchaMMYZozeWQdit8WXCEnXTnDJ69BDDwK3LmLCVwBJqX+dUlPOA/V5iXFNIl1Zk
         MfD8XluyjjSTi4SsGwybrAWyzpHzIqBzVkA8NFkXw5QIVGQyHZUX/Ht4r8cW/cZZprVI
         WAKISuUeynu7kRXnezkNk+u/uWnNgpm8f3DRIUL/ghA1+LQpjBJdAWgnf1y4Av2K4t0K
         uJrA==
X-Forwarded-Encrypted: i=1; AL+hErHwwWNiptj41dMReZdCBmyqEBEZy3fThyBp+9tcoUUIGxGmADj39geCOMWcquMfx1PtsoK0RllWbEaHYYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ENOCh27W+Ba5/8XvyTXeT4MM72I2HoYKlZ1qhj47dPg6ecSGw
	ah6QbJB36iCmOrgWoS9BTh4CuF6xXLJHPUThwL2KKtQ9f1YaO4cPsnax
X-Gm-Gg: AZFdTZcVH+iZocN6EuoxpYQmnrOlLvcPflOuam3wEwmkQWpSExJbwpYhMStn+ZDdOoW
	MlaqGv7y67gepy5zOHzRegRgln83DNEza1c0Ap+AdTygFPJS0Outy86tDgz2m/ZYP5r0dJ3ypyk
	hI2XjcKKDcdNrI5D5yyJRNAQZ+6twijzTfiPNV3Vg5XGeWe94i5yXIMaRDSSh1wZx8FhUXQtxcA
	6pigpi1txo04yj3rRp1g6hFo2k4t8I9M8JEE03N7wcWM1nRa6lJye+sGyAfaLKsZYeOR0tMsw4Y
	D/ZJ7Gf9tB2TJijk/BnDylzK0Y4LH5OcToqp3y7/YN0qKFElWek1shRHirkVXc7FQ9W+gxWB0ER
	XmLtBlOTSA2WUn0kjKjOESKmmRXOTb+S3Ebo/9SNRg8GYtrGzk7fuyk5lRdphUrxrkd45yF4Ez5
	GOcuEfSMOwDFA5Kr/WDuxPKRtuc0R6edw7o7XVaYQ/3g1ppRvXAtXp8BdnB3zwU4cqtpWJMFzx6
	hvjNmB/c0FyZk6Ne9rcvu9qpW7UO8m+4WIXckMwUqCsuGnjckt9d+z8R+b8dSTp9WRQcjnBfE2B
	5VfaO68lYwO1FNvaJDboQWfISjSmcQV/Bufcumn6DgU76MneCi4MPD2MbNTtrX8hCwsh59VxUzB
	OaUNNXmPzMNvwTALjLg==
X-Received: by 2002:a05:7301:6405:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38570254ec3mr12905314eec.22.1795415097415;
        Sun, 22 Nov 2026 22:24:57 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:2009:6412:a5f6:d81:c3c7:7d8b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm55987369eec.3.2026.11.22.22.24.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 22:24:56 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Tanuj Sharma <ertanuj96@gmail.com>
Subject: [PATCH v4] ntfs3: fix out-of-bounds write in do_action() bitmap operations
Date: Mon, 23 Nov 2026 11:54:50 +0530
Message-ID: <20261123062450.5153-1-ertanuj96@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <2026112152-delivery-synopsis-ada7@gregkh>
References: <2026112152-delivery-synopsis-ada7@gregkh>
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
Changes in v4:
  - Removed unnecessary braces around single goto statements
 fs/ntfs3/fslog.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 1879d04e3cd05..0f83e4e8dbb9d 100644
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
@@ -3751,10 +3752,13 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		bmp_limit = attr->type == ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit)
 			goto dirty_vol;
-		}
 
 		ntfs_bitmap_set_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty = true;
@@ -3764,10 +3768,13 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		off = le32_to_cpu(((struct BITMAP_RANGE *)data)->bitmap_off);
 		bits = le32_to_cpu(((struct BITMAP_RANGE *)data)->bits);
 
-		if (cbo + (off + 7) / 8 > lco ||
-		    cbo + ((off + bits + 7) / 8) > lco) {
+		bmp_limit = attr->type == ATTR_ALLOC ?
+			min(cbo + (u64)le32_to_cpu(oe->bytes_per_index), lco) :
+			lco;
+
+		if (cbo + (off + 7) / 8 > bmp_limit ||
+		    cbo + ((off + bits + 7) / 8) > bmp_limit)
 			goto dirty_vol;
-		}
 
 		ntfs_bitmap_clear_le(Add2Ptr(buffer_le, roff), off, bits);
 		a_dirty = true;
-- 
2.43.0

