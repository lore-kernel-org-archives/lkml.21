Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145422;
	b=GLLFfPMRjMMqoqunQawz96b+DTZODZa55bj1o88IOnVBxoiOUypGkoLZYwpWq8HFX79y
	 zf7gZZBbZClqc5jRhEiodLl8tna98S6J44wtEgvgwQz9HSwM4MbEKpwv3bs6Y+GJ6RIVT
	 XJ4RgAlf8+wwtV2qqsrjCnzfA9Ub3EFWI3YgfLgov/TbQX4iKj8arQteib5VsX7hFRb5N
	 ZOPWvTkpRmitC1badNXzpA30FKN5DjEnd8210IAxOH7TlbREab0cfeINY70PWtBQi389y
	 totMS8h6ocu7YTJLnHazW1gm+hHGm6eGBNfG8R0BpWtEpIxM1urjcIdXlK9kbXKDfPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G4CRmLsM2FeO2FoUhWeUWlm1ZB2WhalSLCCny6IP3jc=;
	b=ZH7F0+znBporoD+Z7Uiv/7myXTc3I1pZ/8duPwPTp7KYXMs+trcxTwBBrFudLehV8w0F
	 8lmp2j7v6l+X9jHfGQjjcea0LDQafPVR1P5squwJMNtlKbosMu4pEx1Nt5TuKsMU8yOO1
	 +cOqre/BPOOYed5WpSXeNcIBWd7mwtScJRuMQWMlFSVMCef8/0iMBLAvmFXGATUOXcsKm
	 YyA1XyFqTtEu9jpflwJcKEtCycTMhgEckvLSt9JxCPC9v/qSBtKVY+w0tHygr0d5nBDKL
	 +Ygw+/iFYvIqPTkOB0GyttasEo0HNmdFVvcjRsUwbYTA8mQmbQFywatC6JZYAg2podw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0U45S/vk";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9720606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9720606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0U45S/vk
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36f936424f2so85737eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795145421; x=1795750221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4CRmLsM2FeO2FoUhWeUWlm1ZB2WhalSLCCny6IP3jc=;
        b=0U45S/vk9WRKBnCn6RYGKf/TAqpbqLSlkXBPMY0JzKh51R48SnePWuc3LJjcZ98tKi
         ocRMD/Mq1tqLWwydwPVQSdwCPIq33FELluyXlVPcpK+Hvsg5EnbvqNuLZaR9d5t5DsMP
         AD5+JArv+bioUaVJYat3BqRv/S4Kfg6C9AYinJez9x9A8Cw0zq2n4VrcYCeH4EyZUR5o
         zeuCG1nT00VAynoXNvBUXV3JTDz1AxN59EgNXLcM86ZdZFJENgeS5VduuxozL570hzO8
         u2mAKqAkyDCNSmEHj/YiM2pZw/DXXrDwspFhjwLS1v6yvGogjHq4NhexTLdIeu+8w//9
         xRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145421; x=1795750221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G4CRmLsM2FeO2FoUhWeUWlm1ZB2WhalSLCCny6IP3jc=;
        b=p8pytJ2rp0U8m4v5kZHM/FVZls1SVEC0hRbIeb+Hj91t3BdT9OyxLHWL5j+VZHt2R3
         98KcL9BHBIKqJp1E9fkRU5+2GY276CwWiHnoQ2btgxGE3kxwYT/FSrz6xf8gAajWpwg4
         xUtamH6E+oGPoFmloHrpHBeNVMX71o+IG4h1UXoTmAW+X5eep7rtFFW08N1ZBLAU+h1V
         Bh3OZvLlRdvJhSP5/msENAIyJkdZgpLfNJyvbVQxWOvlIgHU/95ZPF2deqsRyaSZEoQL
         OcyNDlLuqinRNTgJSVdp8/5L7iZ6xZzWtA35MHCKAVsiotUIUTrTNhBLp4AOKiDIutXj
         vpOA==
X-Forwarded-Encrypted: i=1; AL+hErHDQspE+444GWbbI0YfRU2+1a5w6pJBNK6FEFqnhn5LsyRam8VvY9SVLMOCi1vYjPTAxOod7v21IyN9KKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O4XZQVhul8AMFwDaN3majDcGWHrxZ6XrF51rGNQbkg2k8hlcg
	uCtzP8lj5cTqiZhBHvloDQMnvd2rIuIaCp6i4nCNnA+xNxMRFqZEFpSs
X-Gm-Gg: AYBFou31qhg10/hZOWTlUstj39aG1t6Y0fzRR04hhMwLbgtLJ/GlSwooyVNvEUwqwy+
	CK22IkiedhMfhlyDwLIFaVmWhSdvwPUqMKs4YBmwIhCeLjsyDBqVYJG1k0UBgfXyP/XzD1ywukq
	LKe18gSf4y+Wxfsu5AY4HIyndvS/EJ//4miwEV1qIBzaCx8oaqLvCOyVwgg4vka8XxkEKHhCoBw
	ASMOAxFGjGHCf3wF14A742y5OMU+lP9fZmJ80Z4FIv46/q5NYhuaa5QrdsV13w/WDi0aSTBep1x
	rKhK+RCBaUIIsKv2QUWw82CB0RcYaQeXFYeNBWTc+6E9Bea/njfldz1vVNGFPoJfiHSFtkH/DDY
	prqjdYOik91ME55yCRtTjAmROoQRebH2uyfYbHD+xyrU1qvDz1WitQY5TlY6luM0eVZRMnaf7VO
	qFFNFI55pkpBPxqtrqsvvWhSjJU6WHItkVTq3kbwZ6twfroWx6mGPEinNy8L9V+RoT3ZlrkKypg
	wj4UkRwh3BEPovkgDTtD+hdLOobZz9EJO7xZYHQgkzM5pRyv6lLgb0ZfA6aWWaHcKApKTK9xaex
	6bZkUVO5Ip4jfb/C2//82/VeYCk04ek5kh3t91smZA==
X-Received: by 2002:a05:7022:1187:b0:1b5:31e4:9970 with SMTP id a92af1059eb24-1b55689ee2dmr1602946c88.8.1795145421007;
        Thu, 19 Nov 2026 19:30:21 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e644dsm4362507c88.5.2026.11.19.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:30:20 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com
Subject: [PATCH 3/3] mm/migrate: batch PTE restoration for device-private folios
Date: Fri, 20 Nov 2026 11:29:49 +0800
Message-ID: <20261120032949.2036731-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120032949.2036731-1-chenwandun1@gmail.com>
References: <20261120032949.2036731-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

Device-private PTEs encode PFN as softleaf offset. set_ptes() does not
handle this encoding when constructing subsequent PTEs, such as on
arm64 with a 16KB page granule, leaving device-private destinations
folio unbatched.

Add set_device_private_ptes() to construct subsequent entries with
pte_next_swp_offset(). This enables remove_migration_pte() to batch
PTE restoration for device-private folios.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 mm/migrate.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index e000ef77ea87..3d3d91fd61c7 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -345,6 +345,19 @@ struct rmap_walk_arg {
 	bool map_unused_to_zeropage;
 };
 
+static void set_device_private_ptes(struct mm_struct *mm, unsigned long addr,
+				    pte_t *ptep, pte_t pte, unsigned int nr)
+{
+	for (;;) {
+		set_pte_at(mm, addr, ptep, pte);
+		if (--nr == 0)
+			break;
+		addr += PAGE_SIZE;
+		ptep++;
+		pte = pte_next_swp_offset(pte);
+	}
+}
+
 /*
  * Restore a potential migration pte to a working pte entry
  */
@@ -442,8 +455,7 @@ static bool remove_migration_pte(struct folio *folio,
 		} else
 #endif
 		{
-			if (folio_test_large(rmap_walk_arg->folio) &&
-			    !is_device_private_page(new)) {
+			if (folio_test_large(rmap_walk_arg->folio)) {
 				unsigned long end_addr = pmd_addr_end(pvmw.address, vma->vm_end);
 				unsigned long max_nr = (end_addr - pvmw.address) >> PAGE_SHIFT;
 
@@ -463,7 +475,11 @@ static bool remove_migration_pte(struct folio *folio,
 							 pvmw.address, rmap_flags);
 			else
 				folio_add_file_rmap_ptes(folio, new, nr, vma);
-			set_ptes(vma->vm_mm, pvmw.address, pvmw.pte, pte, nr);
+			if (unlikely(is_device_private_page(new)))
+				set_device_private_ptes(vma->vm_mm, pvmw.address,
+							pvmw.pte, pte, nr);
+			else
+				set_ptes(vma->vm_mm, pvmw.address, pvmw.pte, pte, nr);
 
 			ptes += nr;
 		}
-- 
2.43.0

