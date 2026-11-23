Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404684;
	b=DMyorP0A8zQYNxLBSdp+9jEiDddfBPRpKNiImiD5ZaXExudm5/aBtH8to95i/YWp6nSV
	 TxvrTzDWAeH52ObXUB3T4zemVyNkGt2Drp9knZ4pSbVQQITnaKLkE8+ONesst3rgxROIb
	 xgmuUtfFgNvd+QUO9eQSQ+GCPMYdETd4Rq+oo2m4JaqmubncT6yXEST2P0wMl8OWiFNkw
	 CPX4YIZeoXrAsdaR6TKKLUOQsue3ocC4opvkRJGbvqvhlvxzCC+9d3L81V0Bq8Jx5HkLz
	 wKKUwBjYeOEbg6EElgt9XMkGaGh3jvgnDq/AzVKNy8EJVH/l6cHgeIO/2j1SXpWD97Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
	b=ujU393mO0SymfU5RQbME+I2wW6mU6dwHV3L7Jby+N9jCK/XqmoY4tEHAejiX+qgNt/1I
	 Q7/6hD2Ka5iqtR+Asb3nO4q1xyq6t8wo65pii7m45VB/F5oKz9v5ts15wreZ5hUZz5Qf3
	 Pom2wBg7r6wVZLjGk719Sx7IqeLqfaxodRB5LuofSM5texh5NTODVlfZJ3TKihFGTwqAq
	 b+pK6JW8uzUKmWC6kC3/GIEM7Z+xjRhyemQsC7KiUeCCzIxL/GoJRcDnAF0h7F1OoaY1A
	 Wjj2nYrTeSF8ArhOt1HU05l7Wr0O4IUcnsFdeD0pt0VEnHx0UBUiKbH+jscjEkazDhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AxPYQPzz;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD9D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AxPYQPzz
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b4ab53a966so9328a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795404683; x=1796009483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
        b=AxPYQPzz//LoTvh9Mr24xcYoaLF4FfIftHMSVYvNWkkd2ORREvf97GRTmlchcg5pA/
         BY7zxNGJ9LLSAtVEdx572axC+dtCMdmu2MGH8ThCGPY3DEEFyqzqLt5DgIuv64ua28yS
         2YY/pj6BGymwB0NT9sh7rI/OFa3aN3Yg7uhBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795404683; x=1796009483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+VJkDmgbhhT238e3Khqv+7tnUuWga3+yY83FP/NeKA=;
        b=nThMA9B2CMH6+C6cnho3bmuhxFPMNwEMzAohs+3OLLBKOrB+85SFUy4kE+i2ta5021
         GuyeWbIxKHwz3q7LrATvOLTZdREK1vrHgsWpPctkXRPC0AxRLdXQy7ShHLHjnCbmkDcI
         i4kYgIkrhMo4JWBfF1WJE+zuVtB7uo6X3eEEz5fNqOgWRuK6oisUYpFO/1Z43ZYJOTjL
         VXl1cH0QlbD87CcoceY9638nkCdE/xkcp2SMmV/NG+6A7PO5jAKW+SnyB76KL6C3yIo4
         nD4KOdb2ZYYY+bNgtSMsqa2mVmVWzpBX7a5Vm8qlbX/hO0W4TzuOR8p9kGKnqsWdNYTm
         rZrg==
X-Forwarded-Encrypted: i=1; AL+hErEmLU1eW6iigqyUohrnIvq/9qSuR6ROEudAwQ/cbJIrMC/j1e3uELS7bgRU0eYui/Q4toHNBZ4m7LE/foc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xv/PCmtKCJ3hd7WJ8B+mQu8kItqNGDZUGGvwO5Sop9chQ04hq
	1BLur6WFl1bO+JXn+OScmgi1dHA8HhRDfA4fDsTPXoBfHGje0amfIC2nKwKW8nAqiQ==
X-Gm-Gg: AZFdTZfxpFNwwHDf7bKkXGJjD3OVYlrR21+0OJmsYd+BPSeO2SCaeuIMSxJBUvdvbvW
	TBdyQtSAVTLBJ825UbhhPkAfSTls273HgyhHJXtvamD+NTmMcxYx7nlK21/Q+0TplxNEv9fHpDp
	eGP/EENx8/w9lj4xRptOyP9DMMiX/o+26VryZ4FatfkoMr/KtW4hYcewCUA6T2Q0EfuQ/Af+cCd
	TGRSK0YJE5XeErZ1q42RkHsyQxzffW4svHqznzDDTKQfM4fvj2scGFzR55uionsok8V6Azlqx51
	dWqsVlKOBboKAMmZp8sbV/cMGxfz8Fi3PiCtZIJyEFifNZpqNQeizbicb83DXSJb3/OO7PPzxS9
	jz6nqa9fRMaQlKUeP9a7Yt8OAkqTv9H3FROpugbCXh38nvBaYwNVfbKQUXYMMHI9MQWLS5MjWi1
	3ZJV3ELbGdo+6sEhICrU19ru8STEAzboU7AWpPfYC7vxDcLg3Wg1w0FPF7lX8vk5Jhh2sCvPScU
	/gdxmUNza/rZJ3Y4olEU5eNeV7cKcopOP1bk3zhV+e9ugjxjfBAyybJa/HTvQYfqfjK7eiq9xUq
	x4do1pE1fOpqEnjzxojab5jWUdEW2hin0lPGdGCJVq+ZODQRwhP1xUziIddIVj+aBCBurA==
X-Received: by 2002:a17:90a:e70c:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b41c58aebdmr15663729a91.0.1795404682704;
        Sun, 22 Nov 2026 19:31:22 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41ad48786sm15745736a91.9.2026.11.22.19.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:31:22 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Sun, 22 Nov 2026 19:31:10 -0800
Message-ID: <20261123033111.2349160-2-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123033111.2349160-1-jeffxu@chromium.org>
References: <20261123033111.2349160-1-jeffxu@chromium.org>
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

Move __GFP_SKIP_KASAN from GFP_HIGHUSER_MOVABLE to GFP_HIGHUSER so
non-movable userspace page allocations also skip KASAN tagging on
allocation and poisoning on free under CONFIG_KASAN_HW_TAGS.

GFP_HIGHUSER_MOVABLE already skips KASAN because user pages do not hold
kernel data structures and tagging every 16-byte MTE granule on
allocation and free is expensive. GFP_HIGHUSER has the same contract and
differs only in being non-movable, used mainly by DMA-BUF, DRM/GPU
buffers, and non-movable HugeTLB.

On an Armv9.2-A device (6.12 kernel, kasan.mode=sync), this reduces
32 MB /dev/dma_heap/system alloc+free latency by ~80% (~59% alloc, ~98%
close) and improves an app-loading OpenGL benchmark by 15-23%.

Callers that access GFP_HIGHUSER pages through kmap_local_page() or
page_address() (such as ramfs, pipe/FUSE buffers, kexec, and RDS) lose
HW_TAGS checking on those pages. None of them store kernel structs
there; this matches the trade-off already made for GFP_HIGHUSER_MOVABLE.
Generic and SW_TAGS KASAN are unaffected.

Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 include/linux/gfp_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
index c1331bf0b239..bb54c7abfb02 100644
--- a/include/linux/gfp_types.h
+++ b/include/linux/gfp_types.h
@@ -376,8 +376,8 @@ enum {
 #define GFP_USER	(__GFP_RECLAIM | __GFP_IO | __GFP_FS | __GFP_HARDWALL)
 #define GFP_DMA		__GFP_DMA
 #define GFP_DMA32	__GFP_DMA32
-#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM)
-#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE | __GFP_SKIP_KASAN)
+#define GFP_HIGHUSER	(GFP_USER | __GFP_HIGHMEM | __GFP_SKIP_KASAN)
+#define GFP_HIGHUSER_MOVABLE	(GFP_HIGHUSER | __GFP_MOVABLE)
 #define GFP_TRANSHUGE_LIGHT	((GFP_HIGHUSER_MOVABLE | __GFP_COMP | \
 			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)
 #define GFP_TRANSHUGE	(GFP_TRANSHUGE_LIGHT | __GFP_DIRECT_RECLAIM)

base-commit: d12eccbcb79a4fa35c3aa588eb79056af62eb859
-- 
2.56.1.750.gf70dc682cf-goog

