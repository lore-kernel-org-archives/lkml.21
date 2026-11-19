Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102328;
	b=TtKdWtlVazaXX8ZIR/kO6hwOASc3PxKc5/5msgFHb2grTzKz/VRevBEek5kRLtcWwp6N
	 CLa7/3TXMn+o5cnYjwH1QHtNPfRU8yoNQegYmg4dHhfjXulZYUBVMUGaRjD2PpZP69IWW
	 sV1x43kN9OJyAYSMI2jggdlEVvKnrPnq2ooUvDGQUqpp9vZOmPVnzLVuAKkxTvycTG65T
	 qIe2sQ9OmGtQzTL9799f9557y8CIej5NDktXcTFbBwEZ1LoTubooOn4Qq3xHyxU9gC8lY
	 hOMzcWZEPfOmrGCfRGahVT11kBB8mp/5IHPWeF6GiecuzXkX92f/msEfZ7RJ3dRQ7dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5xWH9QkVlNL/69pXekrjPtbhvYWgn6Pj/OKz9wdAdLA=;
	b=pgx6Sp/QbaHIr9Mh7mfFmBeRf8hBtYtbRu5dIiw1cwN0VuCprl4TgkdROkm8u3EIVo2s
	 lozHoQZRsRaq8gqVtmnRx2/yl8RruWJKSLfz3Ay6o0ScsxzPrV/GhFhX5o4/r/w4TWyw7
	 MDqKY66gD2Uci5f3Uq/W2JKOr/uQFAKGuLu3WgoGX+broIpKYrgEcYMGV9XC1QPnOKjgJ
	 rBaHCWYx0+EIBEhNBmiOrgBFJNy/wyGntR+SU3m3cFCDqZiPp4LOvlpNK6N0KhCtbxpsc
	 81m3DH1wgGPHJGC7ObksUMJ82xasTMp4jhgsVRiG0xab8nXO2OdOHKaYK/yPDF/+vZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Mqz0WOke;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F667606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F667606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Mqz0WOke
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so34167835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1795102327; x=1795707127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xWH9QkVlNL/69pXekrjPtbhvYWgn6Pj/OKz9wdAdLA=;
        b=Mqz0WOkec/q439ndtR/kd2SFnNnmIV0hswKZlxv0FaKhVj28JpxQD2jvx0AGktJksV
         fedyobJUohwgAIGsR82gQBI7QTjFY2HeW4iFjzaGKydrVXzkEKi5Y9BkSMhnZTMzchGm
         4A8l/uJfhsKAqweWwShgWI0l0DlhT+n8QWQf72MS/ORRQvMBdC8iA/YZXqC6sjW4GPoT
         /2f0jAQRKmswaxBPP5+qmtdfCA/zUe+b9EVFJa7QEi3v3R1pkMAokO1utHgQRk842eZq
         928HvzOLeuqrf0jU2xnNz5IiNK1jdOrJzaPt9EKzU/cvYu3hvivNZOtWM5wSjaBuWmnp
         JE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102327; x=1795707127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xWH9QkVlNL/69pXekrjPtbhvYWgn6Pj/OKz9wdAdLA=;
        b=yMvqgGSZzluIK6uxOr7aqtdEsCMm8v02oZWKD5sE5e8HcrjWFvJk2ZWN/wOQ/D1uCo
         V0NjCywNd2evWccMIyfjfs5f5EUp6zqy2VL2nfPl5mepwbe9l4TDjbF6euok3sZYzHwP
         9dXfRQExeRYhrA3RAczjPd2gSXvQZAveB+NXpJb2dm+PxroNLGwQQPFQcAdrIh6bLJc6
         XRr7ddecq4Yh1ZKLafGaf8NVPQEvsk6slRfWobPFhNuY9betpi9fq1QyhEpLbVWiEX7S
         NqjYGKNDbpxxhNJnyzE/AV0JLLN7KkW89Q8xWJmPWUxiCMno6XwxIf0ScXUyTTG6p7ZV
         C5gw==
X-Forwarded-Encrypted: i=1; AL+hErG9YfA81+l3Nu88UMubp0LLexK6QFGYeXCFLNspQ50m56DBSdXF2nCl2CJgYMtsjdVsdKnJaI7hS97gnQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U9c6u9TuKCjdWqsjYWk1p548S2RBUQzHMLOYFVB/SBfVN7fE9
	2Pw3seTH0ryF9ulziHtEIhDFCI+NRRSRHUTd0rYreyjeKIhHNNR4qH3BMRDuOPRU77s=
X-Gm-Gg: AYBFou1bqaYD4lNfA3nOznrlDaJ1tf9HRpBnAdqPPVABuZE8781sDwsDcPe8zuv5SLI
	TX8plofLvAsv5+YvkAXLpiRLzMypeyomLMptLLgNgPaetERHTPrKZ9eJOfJwGonGl5FzgjfP/QD
	mlv9TjTzapnkhl/kmWKZG8r8E2sTi04/wTxCdvVwAuJJ971s44QEe+vHAaZihXFrqRJkNfIVvjS
	tYKDKyyaB7RxY5THPr3FV9CFjojWYKEn0A3eB4o/85bp/ZtW+RY/XxMGZLVm6ZqrIQTgRm2phJw
	hVN8FIabewn+hd5Ji/R+0jWr/VDQHXx36nNalhwsX66HbvEmw2ZjNOotyVq4UbZWl7cpkZe2I28
	yT+BWw0roADiGcFq/rgiX/6i0+T0fgmCWSe6mmSIgXAEpraJEW2DCwU1Y1cdi0XCakmPEejDNYJ
	ZwZGjk3n0dfswm3rtDeY47SlSapyaEIwoI7409RDtvEXRCVff8ZaQPAqipzZVVq/PoDoICFpnLn
	wuTImxq5T/ofCrXiKHwLKCNI5XV66YPhrlbJxFfl5qLwsm7iTvDrb9cmQ2ByDSuve8xHqimjPVX
	6HrrrtyC5mhh7C4H0/UqBMawvlx3pGw=
X-Received: by 2002:a05:600c:5395:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb7da14af8mr129074685e9.14.1795102327018;
        Thu, 19 Nov 2026 07:32:07 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:294b::41d:4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm237463f8f.7.2026.11.19.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:32:06 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Caleb Kan <ckan@cloudflare.com>,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v4 04/10] mm/slub: use stack_depot_fetch_into() for owner tracking
Date: Thu, 19 Nov 2026 15:31:37 +0000
Message-ID: <20261119153143.4099483-5-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153143.4099483-1-matt@readmodwrite.com>
References: <20261119153143.4099483-1-matt@readmodwrite.com>
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

From: Caleb Kan <ckan@cloudflare.com>

SLUB owner tracking stores allocation and free stacks as persistent stack
depot handles. Compressed frames must be decompressed before use, so
__kmem_obj_info() and the alloc_traces and free_traces debugfs files
cannot use stack_depot_fetch().

Use stack_depot_fetch_into() with TRACK_ADDRS_COUNT-sized local arrays.
This matches the save-side limit. Keep the existing KS_ADDRS_COUNT copy
limit and debugfs formatting unchanged. Continue
to copy or print no frames when the fetch returns zero.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 mm/slub.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 5c33d1247060..2c4ab16c0fbb 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -8335,12 +8335,12 @@ void __kmem_obj_info(struct kmem_obj_info *kpp, void *object, struct slab *slab)
 #ifdef CONFIG_STACKDEPOT
 	{
 		depot_stack_handle_t handle;
-		unsigned long *entries;
+		unsigned long entries[TRACK_ADDRS_COUNT];
 		unsigned int nr_entries;
 
 		handle = READ_ONCE(trackp->handle);
 		if (handle) {
-			nr_entries = stack_depot_fetch(handle, &entries);
+			nr_entries = stack_depot_fetch_into(handle, entries, ARRAY_SIZE(entries));
 			for (i = 0; i < KS_ADDRS_COUNT && i < nr_entries; i++)
 				kpp->kp_stack[i] = (void *)entries[i];
 		}
@@ -8348,7 +8348,7 @@ void __kmem_obj_info(struct kmem_obj_info *kpp, void *object, struct slab *slab)
 		trackp = get_track(s, objp, TRACK_FREE);
 		handle = READ_ONCE(trackp->handle);
 		if (handle) {
-			nr_entries = stack_depot_fetch(handle, &entries);
+			nr_entries = stack_depot_fetch_into(handle, entries, ARRAY_SIZE(entries));
 			for (i = 0; i < KS_ADDRS_COUNT && i < nr_entries; i++)
 				kpp->kp_free_stack[i] = (void *)entries[i];
 		}
@@ -10038,12 +10038,14 @@ static int slab_debugfs_show(struct seq_file *seq, void *v)
 #ifdef CONFIG_STACKDEPOT
 		{
 			depot_stack_handle_t handle;
-			unsigned long *entries;
+			unsigned long entries[TRACK_ADDRS_COUNT];
 			unsigned int nr_entries, j;
 
 			handle = READ_ONCE(l->handle);
 			if (handle) {
-				nr_entries = stack_depot_fetch(handle, &entries);
+				nr_entries =
+					stack_depot_fetch_into(handle, entries,
+							       ARRAY_SIZE(entries));
 				seq_puts(seq, "\n");
 				for (j = 0; j < nr_entries; j++)
 					seq_printf(seq, "        %pS\n", (void *)entries[j]);
-- 
2.43.0

