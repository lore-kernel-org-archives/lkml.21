Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373099;
	b=OqLxWmX7VMgEtf7e0M7noZrM9Q3a8evv9a2ZFH5V3a2ZimxRSvHZHG9QdGa/K7DeTbRv
	 9v9vfXKCmbHVIdbaNEx7JDBjsIW5J0wmOY1xXXBhHFy/juG5gh/KjG4YZlzu5bk7/ev++
	 V7ju7vB9w3deruU2I96jcFyIjB2A11TUm+I4Ij5JVG+GpMZPcZ3oj8Fbcp9UT6naSGXVA
	 TJziwjCygwUfucVJvTZ5HL4NOXXiRPPaRBNsFD+3czDz69Vpt88qb0WSsBFdWuPVZ1W6w
	 y10ylJoMm+Z6S6TeGNVu3GuKhIrR65tG61Z2UvqZz6zsDF+9gmWFd3pilgP0FUBuCLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=a/BzRua6E4eXmgBBVosYCcmxsDMlITpi7UmbKmFzU4U=;
	b=QeTpwHVCT3w0wS9Uk4gaCWNyq1MSUlguBniwGMdd1VWdWLytgYEn5itynFs8C5PW49vM
	 BS32Su1C6cQ29QpUym1DnDk6lLTzK9lhECr9asNaxXE4qYBd+522ApB5fJ2iSeE5Hdlmg
	 4AqrNTkJ2GsJwKroH0lNxovmHZPMhDQx4IpFN4fBct2CA0WtPPXw0mCTDbyt+Y87LNM6o
	 mnlUie9EHUrkoaO9OO3pNU+vi04Ke3URndEmJICUpV8oc5+ZJ4l8tHBpGrBeYMH9pRn8g
	 c+JQMBs3pzhHng88QTJC+dzcutlQx+GqX+Lp63Mf7GgTfqnXzpp1UzsBy3xYxUEwZxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GCFIdJ0a;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9F606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB9F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GCFIdJ0a
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so2505272a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373098; x=1795977898; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/BzRua6E4eXmgBBVosYCcmxsDMlITpi7UmbKmFzU4U=;
        b=GCFIdJ0a3ktfnDgKN0dtXYKmaJ89GtHACgaH6uDY42A32P6dFe2eV/0g1KlCffKxAG
         ABmwv61w9fbK7mgsFYnPEktO2XU/NMH+QAWTiJegqSyIXj/4GYlhAc8cqWkh/TKKMRmj
         gxt5sKoI7E6XB1MJaelm8fNBeSqBMsXnHw8lfrPjsvHcdZGM4w0GzGe9dOTJ1CPR6j3W
         QXYnjZFXI9zuicD9OIoFRIaEvw52Q2b+PfIZuDOnfcpbuy9nMZhi8UQQ+DJwP88SLdm3
         Et2YYa1D1CasLhgGLsB0UA6ZVxIM6liZJSuwWwr4bTqcP1BvAhybm0565DzQwi7/71RM
         Mcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373098; x=1795977898;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/BzRua6E4eXmgBBVosYCcmxsDMlITpi7UmbKmFzU4U=;
        b=h8H9oqTO+UxgCViRO1kZgs2cxEEcPxjmVGzWo8b1KWLFvPPx/ywRe6tXe14M9n+UBB
         keG70J2MumP/qo5GRLcC3wwXWOffanhNgu3l4bf26ZpMX0IdrRFK7E2Zc9WYi8ET/pBm
         cPNVNA9krR/cqJNktfsLzti/8Fw3Ase/1ZJ5BDRROu1YLkwXEjsdtg5Mq3zJ4t5tBNvc
         vkohr4Amudcg48V9AYlGNB/1/q171z7vJycC7CEy8Lqo/IsSTBZNIoq1moeSwDE2bPZE
         SVFs7nUmt/sGSzLYes+iwnu5o/Y8xoxvOsFlkzMoO6wP+uweN/EUB79sdJNEUAVUYnys
         3XgQ==
X-Forwarded-Encrypted: i=1; AL+hErHpO29FAitrgCzL0wUHFCOr4pshs18p2OF8ehPZv0R5xVMfPBJfM86LxmntsEiJq/aXdhGEpjs1+XwlZbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jfoLLeoNp/V9u3K3uvsMciVlkOsJcNhNjt4rzMkvsBE0+eEoe
	TcvFCTYsGo82VH7Ev54bE7BCIMZAmL8ASOspDHnzYOrBuiT3s93CPr+KmKs8A4WtKBAGqsEc6o8
	pA+NFyuHeqhMDfT7YMl6C0Q==
X-Received: from pjbgm11.prod.google.com ([2002:a17:90b:100b:b0:3b4:3d61:7517])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3b41caecd51mr6521075a91.44.1795373098233;
 Sun, 22 Nov 2026 10:44:58 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:36 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-3-jthoughton@google.com>
Subject: [PATCH v3 02/19] hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

vmemmap_remap_range() can potentially leave the vmemmap in a partially
optimized state. In this case, a TLB flush should be done if the walk
caller asked for it, even if the optimization was not fully applied.

A follow-up patch will more completely deal with partially-optimized
folios.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 09b9fd83c198..7be08c68c2f1 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -163,13 +163,11 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 
 	ret = walk_kernel_page_table_range_lockless(start, end, &vmemmap_remap_ops,
 						    NULL, walk);
-	if (ret)
-		return ret;
 
 	if (walk->remap_pte && !(walk->flags & VMEMMAP_DEFER_TLB_FLUSH))
 		flush_tlb_kernel_range(start, end);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.56.1.809.ga0b61035b5-goog

