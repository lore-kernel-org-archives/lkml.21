Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169415;
	b=3mqjZZ9PpPg6ksp5QM9sN5jfPlRAALhOKOUhmaZarfeOxORD/C7GDp+uizTin/jFXJ5l
	 qm+CyozXpyQtawWmg5p6uOsYd3bhMU+lOQNyC5t2dzVhqRTErQmxwIrJmPQC9VBR5tEnM
	 c90Bbgu+rgUTyZa34Dc/ew45sOjzR+PgSpI9qV02bf0YcdClnPQojVaR5geUbeqE270DV
	 Ar7sowW+IYDomUkVg2v8jgojn9QnOMRiuCiSXNXtqWvHMfzqi7wnIEyH428QOTGhjmEKh
	 FPmUf8iKpFyOzTC3O/TLLU7tdBSFkkXs3vND/aKvnIoJd+6Cq3V4Q808EDHuzm1KQlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DqMj7FcIuyq0vRRF9cXEEeA76ZKra2Ioy2S+xhdtfRg=;
	b=Yineck1E/gimYfjubKnVRt2jVQLlLq497ak3ePjeMkYUKrH44vT+E5SbgwG7omgy1499
	 aYIB5Ku/AsOVnCxd+96HZt/Em+V6DrLlBHIpeS0tpSC2mw6Rd9gQShqKNheBS4LxcglIo
	 WiQNlbOYLzAsPVSyGCsdB+wj8eavAPdzMKyGHHmiynKpkJxsTZ8SQO4oEzzLSBSvDtGuV
	 FUaR8IH2TltGEW8qlkwma8mrN8CXCgnNJ6vTv9MI4bXROsPXhfRpV6YqWeNH9BqjldwvE
	 mFKmQqyn93hv14Wqs2smgXD5j4fkEPsRCEZI1MHtnu8j5YXKU4PERNDZAIunAslIOyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ra1SSfSv;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36333606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36333606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Ra1SSfSv
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1676550a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169414; x=1795774214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqMj7FcIuyq0vRRF9cXEEeA76ZKra2Ioy2S+xhdtfRg=;
        b=Ra1SSfSvXvyRKNr1BEGWmm6OUn+IycGQGPZbBVEJz9vsG9V6JC4p5N0uqDzK62fQrA
         A8W48yucfCwy5oo6yBLDIIsHLXTHz5SU5j0icg4jjLZQOv6lqeSXletIwvKarGDvjQGF
         2f5SSG4t26mVgDYABiYCmf5Gu98UJAM/GNS2N4zAIL333wPUA392dX1UnUVsFGHiZ/a2
         VXaCKZ+rS0L1EDeJbiC1xdJJ/lw3Tn0njjH969wWUK2sXgkGdHKCZ2+lfE4fOMYTIIwB
         KYquQn9V/CtSF+jykT6npt80cRqHkItWODlf9fD9CbnBVErmbj4cTAE9QUtnZtQKA3eP
         1C2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169414; x=1795774214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DqMj7FcIuyq0vRRF9cXEEeA76ZKra2Ioy2S+xhdtfRg=;
        b=glAifFNlXhuhzBXnSpLRbjcOwuok3zS2QEo3z7h43WyJdW7cxCiytcYHnmD58Rclwq
         jewM19dXfBY15EsrXUs/e0cuo/+9jrcqkxiOBaFcNZDWDvUfgRZ3iTDa/+wvXuShzlnm
         qRDyFcPGDG4ECUlRvmYJ7bBKqJm8nXjHqx4nBpA2maJ8wIUhgyQ7u1jNhLArN1KAOrul
         ztSWW0wD1D1S7MU+ayAVNZ92hW8aSTR6Tq2ZnQnNYPENjLJkLhlhZyDdjJElcrrOTTJN
         2PUtMh83d/L2MmMrcH+lkQbqoIQbQR0UekohwE3+U0MgkUZ07gQsq4gI89Qo/gz6E9HO
         bEjA==
X-Forwarded-Encrypted: i=1; AL+hErEfG60CqwFTyG2Wak2sgRy93DRbaq2cCl1p6sKTRoAtohBzIMsBMN8DJ/LKAmj7+rO26RZLiFeK/c+UnVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cxeun2MEtIUo34Hk6ZvCqIpGANDqGRI5pz570RUSm+6XBJZUs
	gr98IvUvb5wzPdtyGZQDHdxKU4gMQnxALBQgFpZ1Qtsx+lwV60Z4dJpwbVhDBvBh2tE=
X-Gm-Gg: AZFdTZeRsUOyXSPVLAmZiFtPmcrgCF+ovKGnCoupWkFgzlpBqvmr5+yxFskGgjcdNMp
	XTJ8xsFoV6q6NJ/LApW8BZrVyLiGJ9R+DMxaUa+/78aKd/DThKp8Fxcy1NqoXTn+32Tzqg2jCEe
	M/21hlgynH0gRxQCCcjgCvAssWyUIcjZUeCYbfRoi/ebZ4/pgF2OepLCaW8sh/F2MpmLVy+RNcC
	0YUp/wcBJJP00pAgestzL9ZFuJ1XsN0EFCmJn0hYNwyZmoLiXB/6G5aVUJ6zMsXbeC9pQUOHWJm
	8ImUIy31+4qne7nliQtZv4VujhH2J6o9vlbfu9LlDNjydZlHhqROGHanCEL7rfrdumlNjqN1WhZ
	bVjT2Y7qcRl+8WYd44DDTIKcJT+BOHHOc+16+u9Leg5XwJPzVKMkYH5aZYzqZSLf//OCUgCZx/A
	vhq7t0Tj9pYPLd3VioNtNZx0MMDnBfLQUvOSaUA6RHhvvsM4nfBLHnm14u34p0R/BCUyCuHdKAj
	8IuC6zNOOiJF8yhGGVg7eFCV+ZABNdw4WtGCTR0BJbv5xtSZvb2JdyUk5eOzBVSiV7rIieV2nLA
	Urhwz+JbPnlT/5fv/OfW3LzcIyG8HpS1HB5u6al6sGE9iVprzRtyC4FkrBlPIFdHuORhCw==
X-Received: by 2002:a17:90b:4b85:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3b41c7bc5d5mr1647918a91.4.1795169414343;
        Fri, 20 Nov 2026 02:10:14 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.10.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:10:13 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 08/11] mm/mm_init: make __init_single_page() static
Date: Fri, 20 Nov 2026 18:08:53 +0800
Message-ID: <20261120100856.16929-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261120100856.16929-1-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
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

__init_single_page() is only used within mm/mm_init.c, so make it
static.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 2 +-
 mm/mm_init.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 8bf350d5a695..a427477483d0 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -617,7 +617,7 @@ void memmap_init_page(struct page *page, enum zone_type zone, int nid)
 #endif
 }
 
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
+static __meminit void __init_single_page(struct page *page, unsigned long pfn,
 		unsigned long zone, int nid)
 {
 	memmap_init_page(page, zone, nid);
diff --git a/mm/mm_init.h b/mm/mm_init.h
index 1e6d2f78afdd..c03413a090eb 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -110,8 +110,6 @@ bool memblock_has_mirror(void);
 void memblock_free_all(void);
 
 void memmap_init_page(struct page *page, enum zone_type zone, int nid);
-void __meminit __init_single_page(struct page *page, unsigned long pfn,
-				unsigned long zone, int nid);
 void __meminit memmap_init_compound_page(struct page *head, unsigned long pfn,
 		const struct zone *zone, unsigned int order);
 
-- 
2.54.0

