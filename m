Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621884;
	b=HnTdMHgiiYIY67xhP4zIIDfjLo3xRP9q+qGX2c8Yvq/RBcauJugvwufJTFMq/zLvozxk
	 yG2R62Fwoc5MahXViXbPANapP839Dcng6BsctSGsBDKG7BKF28btjObLHHTodletYWirP
	 Qk/fgv1Z3IH7Yx71ZPP1H8agLY49uU8GQyslE2vPVF1LwEEEOI7a/ZW4RISa6kNuXs/xf
	 KZ9fjRTnXB0B9iCgJMcdQcR5o4c7Hd+oIyaboebFlwdvFgRQ2Zju1/srOtBxFmZ/x+UsJ
	 nYLYKrJAf5AsJfzuRolCHBTIaX/WqybIhJPtBkTWi7GZ8jzqhJK1JBgdT60dALblwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VHe5Uw67z1Y8nTKWeloBeO0r936iChXIFhmIiPgc1Jk=;
	b=wMveTyZm6kEvNb8EEZyzYEQNg+UGpnEV7gfwwJ7Kn8KdCkbewsRDRiqb+mHFkRrwbgMf
	 R8BzrUPVZQKm6NQEwY+tFyjQBr6KLUajsvCksicSox2xbtC/gBUU55wo98sNkVzhfzwbA
	 mo48dH7BgeP17nl+Wh/PH5SwsbvgP6k93Dde5gn97NtMarhzE9tBzksI3rfBvZ3W5UCHb
	 DvVdYQZZeqZZAHy/JXqjlPRkMA2o51nMUmhbkVmXrI7SmgwK/QqiB2UXfcC1I+SeyJNEf
	 L/XcFTvTcdsGNyYM5qx9dKV75/P+bhKESRmw9ec5tM0LAXqIlxDBAcZ4QWcXnRJPx3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2lCVdIu;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE1606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBE1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e2lCVdIu
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso2322714a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795621883; x=1796226683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VHe5Uw67z1Y8nTKWeloBeO0r936iChXIFhmIiPgc1Jk=;
        b=e2lCVdIuqvkmEDMYhcpIp9zqr5gaxZfqktPjSx+DVQZUnEKVz414FztQv4uwpgUCX/
         sqB2crJH2SBrrsnAPm/dRJlI2de9u9a3pwmBeTFjF0+WY7u8ceO6sjGeOCwHV+2WMett
         5UW4otjYZXC+kD2JmledeZlS5HRP+9UlFgO7EcNjTlAlH/jFFoF1j0uYLFAoa67N/BhO
         LFjTrl7tTXDVYOst+fT9pqOUBTHDf48axh3jKCZ+lrnC1Y21/G+hJmSzWMJChIQ6JsIS
         kooL3ZpqjI8p6CJctYIF5DfswbDvfJopi9aDSeJCZsFdgwShIgDwa7bMYpxOs1Rczt+j
         9S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621883; x=1796226683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHe5Uw67z1Y8nTKWeloBeO0r936iChXIFhmIiPgc1Jk=;
        b=HnY06cTiPwAIRyQ5psaLzv1B2M+e3O9KqgioowrR78KLvFN8DWJVq6tJdlLP2jVfu5
         QhziuFRAOjzLBu1cN3o8qR7NRyIvtoFt0U1xl3T4P+b1aaN4irpVeF1ravx4ZSjhCw8a
         BT/UA2u7KEAAqwQ4J40iPbRruAl/vtpgihXTdLT/n70v/zRxqrKT/uwNHvju15ifF5Mk
         pXsQYWWcGCfTyPSWK3KvMAyMOgSP1v8U5bM92vlQh2+N8sOpFSvo4dwUYbstaJlajNdj
         we4rck83aoFFsa4TX7npCUoZxsHM5X2GtuiFkHjb36AyW4ytpl1Y61DFtxqdsH1zADi9
         Dy8w==
X-Forwarded-Encrypted: i=1; AL+hErE841AsXpFBw0TG1/92rEDAcYzqCVEa04h+39pDbaOCbfSlVMXC2kjbI4+BO3+TuHDtbtBWD/oos/5NPhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DPANon+SxrPXyw/j44Cca2rMm+SulZcZixt4DrtG7QFrMtQj8
	1enBpmuZGqOLkq4d8eVpmIWtuBH4ZYFiS5V/1n85t1SxeEK9u70IOibg
X-Gm-Gg: AZFdTZfXGwTeDEkMWRkvTjOws0nNIu0+TVTxcHOlQJJti4TP5DaAImSwuPqIVQcZniG
	eIQHFD7UZusJnlEO2HuVMotBp4eXY9dCxBfzJlQpHvsl1nWuwdbHfAv+iJwqwmAxn83AZuPNY0f
	/IvCuCdkc89VG8Gh4eU9dSQKTAfM8gIHAID4F+ZR/tnGJm7kPgW1ByJ6Xf8i4oZasoMEDOgAbJX
	3mH70sL/Ult8Hd6g7XLobtWkr5l4XLtZKMibNxiQ0AHOouf5VTkB+Oa+lzM/HDUcsMHV9SEgDm0
	091351Icxa5W2qH4/B5iDxs7/UQzketDkqAP7ubDBnVJAyiSy2OfMvCuTvvMn3M9pIWc09OuLVJ
	Nmt9KxNkmF7x0k0mLCWYEBtZKbKoQ9fSYTfwY59NPovZV6ebYXE1YQWEp8D1Qtq2c1I4uImXqQO
	xe0rDTOHHWjfmidicQhmdRvmz0vQ8BHZW07GL6nVqtdWANm3cx8yV2COd+IIDYDzPXbYs73FgK8
	6KAR15JOPKro/6EXNFKayXTQFezEKhfQIGY8oVQI2NppgUH0Was8+IccO5SMOOrbyvko2T5Lo0t
	6/ysSs3TOYrx56UmABIcG0VuX33psi0BnqNBfphx5n1a8g1SBrMR
X-Received: by 2002:a05:6a21:8201:b0:3f5:ef59:3aaa with SMTP id adf61e73a8af0-4014ae81ebbmr19762858637.16.1795621883355;
        Wed, 25 Nov 2026 07:51:23 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm9058205a12.30.2026.11.25.07.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:51:22 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Usama Arif <usama.arif@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Frank van der Linden <fvdl@google.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Jiri Bohac <jbohac@suse.cz>,
	kexec@lists.infradead.org
Subject: [PATCH] mm/cma: reject long-term pins of HugeTLB folios overlapping crashkernel CMA
Date: Thu, 26 Nov 2026 00:51:06 +0900
Message-ID: <20261125155108.24098-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

crashkernel=size,cma uses existing hugetlb_cma memory, so
crashk_cma_ranges[] may contain HugeTLB folios. HugeTLB folios allocated
from hugetlb_cma can be long-term pinned without being migrated.

After a crash, the crash kernel uses the memory in crashk_cma_ranges[],
but a device can still write to a long-term pinned folio.

So reject long-term pins of HugeTLB folios overlapping
crashk_cma_ranges[].

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
The above scenario is only possible with the two patches below applied.
Currently only linux-next, which is targeting v7.5, has both of them.

  "mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory" (kexec-next)
  "mm: gup: allow long-term pins of CMA-allocated HugeTLB folios" (mm-unstable)
---
 mm/cma.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/mm/cma.c b/mm/cma.c
index 0c97aadcfea4..cb4a92e2b9f5 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -32,6 +32,8 @@
 #include <linux/hugetlb.h>
 #include <trace/events/cma.h>
 #include <linux/page-isolation.h>
+#include <linux/crash_reserve.h>
+#include <linux/range.h>
 
 #include "internal.h"
 #include "cma.h"
@@ -42,12 +44,33 @@ unsigned int cma_area_count;
 
 bool cma_folio_is_longterm_pinnable(struct folio *folio)
 {
+	struct range r;
+	int i;
+
 	/*
 	 * Explicitly allocated CMA folios own their CMA memory and can be
 	 * pinned even in ZONE_MOVABLE, as CMA memory cannot be offlined.
 	 * For now, only HugeTLB tracks these allocations with a folio flag.
 	 */
-	return folio_test_hugetlb(folio) && folio_test_hugetlb_cma(folio);
+	if (!folio_test_hugetlb(folio) || !folio_test_hugetlb_cma(folio))
+		return false;
+
+	/*
+	 * The crash kernel uses the memory in crashk_cma_ranges[], but a
+	 * device can still write to a long-term pinned folio after a crash.
+	 */
+	if (!crashk_cma_cnt)
+		return true;
+
+	r.start = PFN_PHYS(folio_pfn(folio));
+	r.end = r.start + folio_size(folio) - 1;
+
+	for (i = 0; i < crashk_cma_cnt; i++) {
+		if (range_overlaps(&crashk_cma_ranges[i], &r))
+			return false;
+	}
+
+	return true;
 }
 
 phys_addr_t cma_get_base(const struct cma *cma)

base-commit: a036649714c3446abfdc36d0ae483046432b16c5
-- 
2.53.0

