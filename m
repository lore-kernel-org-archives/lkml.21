Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145408;
	b=dbI4uxdiUWIU10FRJdOPRAylPXVQYIMWLY7F56SmhBUBzvV2zLg7xvl2/he6OIDFiqdO
	 tSBsO2k/HHfPaOGdd2Rj6l3L8o8u+ry5+scWVljWHo/+IdO2jmQkbdovwRfUpK7bX7rpx
	 sQ2nkOUTtwMsPQdmrYtAUhoAiih9uwZEgDX5E9lDf7XvY/crQWlsRsQzY5IRCDRg8SgBr
	 lxx1X64AVNBLXwU0liZuN0OcFcohc5xU7onytNOCV2Ox9bamvuoOEVLawiq1yTXs6sYe4
	 bCNdTztbroGL2fHZmo3rPU40cD6ZxXISHHpwgjkkcvb8trwyQ/7ractJ8sfgi2lY5iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KTndnfxJwqix05BvAkS77J9qZoQYoGc9j/m7r9xKGZc=;
	b=2fLa7vWRsJI+hcDVAvV8Zl/tr2OLt2nA/USM/gnxo81yRIgf9lF4eULE2Y9x3pJWRzIL
	 g96xmlBhE4k+WDbxsFuzH9x2nIrlErx0S5/57F+Y+QT+z63LZmCQDJDyNCNHk+B7P2PIq
	 J6wjzqzhoWFXQtH8/oJX2R5TpJ3RM1dQOu0fRJnVeV5Yq55jtRig2ZR0wXTFjT8A5kLCa
	 O+GqZxXUJDkNOC/HrT+3syU7xJ/MPuqz7uKRlW3n0C4fpSPes/+inSQef88VflMjiHcvs
	 KChczZln/TXBwc1uiTVPMBcu17LW8+aTZt/SDSJHqcCfsvHowx8z0Qy+JJfMEXeoh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnYdQHTb;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1468606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1468606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnYdQHTb
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso477096eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795145407; x=1795750207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTndnfxJwqix05BvAkS77J9qZoQYoGc9j/m7r9xKGZc=;
        b=HnYdQHTb8Hmp1b8ITX/jRPpXwTCq1RN/XgrKCuIFg5+BAq2HCs4XdfoVsCUTQk7Puf
         bIz0qin3sCGrwTEAV+0tStBoM27NBaQmKrnj5I4IfBp3yW/aNLkNZvICUu2JibsdMZyX
         vkiRmfVSLCsdubS9qGMoGYUz3TIaU1er9CT5Mee7UaMLxmR80s00/UZHWYkl+Y3zqwBB
         vQmQn70ewXmf6lt5swSQLD8pHeY+s7LOYeO/d9Ut4+xmyHBWY6SitdqjKO/DO/f2zf7O
         4nfURrAcWstXc2HqpjGs/dKB32tw2n3PHbMIew5YgT6G+di8nDsy4qxWNhjEvAzs4BYB
         sr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145407; x=1795750207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTndnfxJwqix05BvAkS77J9qZoQYoGc9j/m7r9xKGZc=;
        b=TaRDFtMGlbJxRkmIFfHQGn4bgGj/uMdNJlk5wKqR+T4ropuRTOwlUX0WLGIPXRMdvs
         /d0ttTFwZEnJlGy/1eJXHcG7QyywaCj2ppICREKgYmNklVUdSQtJyflja579q6bLs5Yu
         lA1WXV9zHwRFxVW0QE/b+kmjD13A+sNPYntRoy8pB46hsgChVlWbvkafWTxe4il++7Ru
         cYTUFhRdKeM36JUKoSZXQ4O2N7/pHPU7W7tatyd+8viOnxtulKHa2xeamAyHOP+knZLG
         8gis984ovM25h+z+u4b0TEiHm9Jw+rTLuuiyLkFdBOyhDl+xmQuTEJPeoqZdUbNwmNwJ
         UVyw==
X-Forwarded-Encrypted: i=1; AL+hErGTgoMCRiqSXC2ydbuM8lO2LC5FeLi9ZEGDHm8SfSj4EELTv12rE0qdiArFzr98GUkGshOFBdoetiMcNhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z815vis+DN+kUQP917sOvbRIEB3jTpIXPDwT0g/H7khjxqic9t3
	6PiQ991pgK98BXcB8j5elOoVvd3ZO6+K48eLCB18V1bUInLg7aWXb7s5
X-Gm-Gg: AYBFou2jn11ECYAKWh3AcTDU55dNgP3TH8h/WZ6dL6jbHhpWF8d3BxfqDrDjsiCDHG/
	nBQpIaELcufA3CSabNpvxLoS7ASNRqY6RkanLuy5h2jzifd5MyNaFOet82V7nNp/rpWTkjn8mKF
	+xPzx7Fbl7Zpa5METlmhyuEWQYKctiy9rVy8sHEMjJOODTBW7X3z2L/ZTt6Mq0SfMdfEBXD0wo/
	i8/v/BNGBwZjbVtLndSzthPws7w4mCqT+NBKQU5zrQh+45fc4qiacX7sN88LvfRxjs49CZZ2KJL
	i4m3i1t+NuH2FMLuzpIXcb0EWWcwZPodk3VqP3mqHFKMkHV8irHWDOJ3aFwaXlWHsuTC2BHv88Z
	Zyf+WQ+oBzZ/79mNHBoQfe8sBSq0i0jbx5OJlXrtQWndx4ID/xwS6nh8R8NdtP0OHhHVK/q6Ffd
	plGMAZ1MziyomWYp+VUP2kA4Jt1y2CNqO22nhyd2ICx45T94m0ohmeYmOWbxOS67VB6Y0dGomjX
	PRVtHD7CXoPB0VJRXCZ5iY14SDTghKCOCRBQETYX0XHyzUyKtEsJMPtc3Xlr6yAa3v26seqr5fd
	a2aB4yPRC8KuQ7T1ZdlVcfRPj73dp/73juGE6UbZvw==
X-Received: by 2002:a05:7022:2207:b0:166:b307:5855 with SMTP id a92af1059eb24-1b556688160mr2437834c88.0.1795145406990;
        Thu, 19 Nov 2026 19:30:06 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e644dsm4362507c88.5.2026.11.19.19.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:30:06 -0800 (PST)
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
Subject: [PATCH 1/3] mm: factor out common softleaf offset PTE batch scanning
Date: Fri, 20 Nov 2026 11:29:47 +0800
Message-ID: <20261120032949.2036731-2-chenwandun1@gmail.com>
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

Extract the consecutive-offset scan from swap_pte_batch() into
__softleaf_pte_batch() to prepare for migration PTE batching in a
subsequent patch.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 mm/internal.h | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 3a1643afedc0..9f78c12882cb 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -512,29 +512,26 @@ static inline pte_t pte_next_swp_offset(pte_t pte)
 }
 
 /**
- * swap_pte_batch - detect a PTE batch for a set of contiguous swap entries
+ * __softleaf_pte_batch - detect a PTE batch for contiguous softleaf entries
  * @start_ptep: Page table pointer for the first entry.
  * @max_nr: The maximum number of table entries to consider.
  * @pte: Page table entry for the first entry.
  *
- * Detect a batch of contiguous swap entries: consecutive (non-present) PTEs
- * containing swap entries all with consecutive offsets and targeting the same
- * swap type, all with matching swp pte bits.
+ * Detect a batch of contiguous swap or migration entries: consecutive
+ * (non-present) PTEs with consecutive offsets/PFNs and the same entry type,
+ * all with matching swp pte bits.
  *
  * max_nr must be at least one and must be limited by the caller so scanning
  * cannot exceed a single page table.
  *
  * Return: the number of table entries in the batch.
  */
-static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
+static inline int __softleaf_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
 {
 	pte_t expected_pte = pte_next_swp_offset(pte);
 	const pte_t *end_ptep = start_ptep + max_nr;
 	pte_t *ptep = start_ptep + 1;
 
-	VM_WARN_ON(max_nr < 1);
-	VM_WARN_ON(!softleaf_is_swap(softleaf_from_pte(pte)));
-
 	while (ptep < end_ptep) {
 		pte = ptep_get(ptep);
 
@@ -546,6 +543,15 @@ static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
 
 	return ptep - start_ptep;
 }
+
+static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
+{
+	VM_WARN_ON(max_nr < 1);
+	VM_WARN_ON(!softleaf_is_swap(softleaf_from_pte(pte)));
+
+	return __softleaf_pte_batch(start_ptep, max_nr, pte);
+}
+
 #endif /* CONFIG_MMU */
 
 void __acct_reclaim_writeback(pg_data_t *pgdat, struct folio *folio,
-- 
2.43.0

