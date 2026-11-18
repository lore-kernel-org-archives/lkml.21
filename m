Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043141;
	b=TFtsrOKWmdBzmDeA0ziINtV6Cv79+EL7Caexxo21DagpYvM1kbQAyJ8jmYAhbCKBSLeu
	 GgTyzBtzu8yLWEoaFIZ2yg1VDhIaNzD9jLlCTpJm60RKnCnb4YTXdhD6sNO+axp7BlQ5b
	 VaxVwj36sPaHePwQG3hShGHkrQpyZO/X7BzYW21cVjyYdeSPRcE5Fua2dZ8q6iTNjwkK7
	 VisRtpZ6dX7ib910EFQq33fBkQJW0+BYIrvnWdDb34d+QprzZuMBj30TrAIEHqXIKkOIe
	 5s6fnblk6DvjHBhRDv1phMwZd01htoysl/WjKZjSeqpDrjqxeX/1nJ7mEXkku4Aq/sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oDhtyDpb3tGZC7Jtx2M4+QH25JCcfsus/aSGkCqzCNo=;
	b=zNYmyfEImlbTgekL09U9SjvzqSkZgaasPNIUo13HaP7T7zy/53jjl8DrvzTNYBnFWngL
	 1dyVnQnbxz3VuxPtJ7Y4YiBgX9dqkriOVgMi9nKnKHgd1ev4MoUj6YGDXflz1g1ovaqbk
	 l7bqKQvq00O5dANMfQGMPlKSL3OnvO1bBn8MP9ns1Au937Su/2r94yElPZIGPp0WZbiZd
	 h46K8KfxkNDWUVVnDAikUzFAVs0XGoA+Nba2kpBkaN1HF6rQseV9LByoZdKv/Bz1KNNSW
	 r2+lnrzZnAFRrFbUPXfJRJhGBqMzyxWqnc3zPJZ349rzLEdAO+tFYHHvSHoIoWt8wbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ctG4qP0j;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F0E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ctG4qP0j
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ac9e15640so911655eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043140; x=1795647940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oDhtyDpb3tGZC7Jtx2M4+QH25JCcfsus/aSGkCqzCNo=;
        b=ctG4qP0jSJ6uuRgK5fcfiDbOjbs1p1IJUo65+bfhrAZrrbw3wJQ65ORk/8/M9cGXoN
         LifJ3N8ZLWgqGgHx2ROr01tdmfYhkNhB3Z/4BvNBhmjJrBr6+QPFmZO7fMXpAKLriTEn
         FqHBlb7Hj5Z1GWhyst77Y5LIZZ2+z2iURGx48c7pDHGGxOswrpsYT4oPjacW7uadd+RE
         jo5ZLK/JOExCyO5Bx95px/4WmP+MTKuXhbabH8yYxip/ih/VIOgZUh6B2LqE/5OhJgsQ
         DtiVzbWSmOgQHpTCAgqqkl7R72BYvhixkXKfKWtgUcYVOVParxRB7ytwPCbVw6sHN1jp
         ejRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043140; x=1795647940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDhtyDpb3tGZC7Jtx2M4+QH25JCcfsus/aSGkCqzCNo=;
        b=bVhDhFQ0u4wK5irZ4sgsruIT6vqfDXzlocWNkV6w9g31HCgmr2PMNbTVf5erN072+6
         S0v+zVsJaujH4BL9jGDW7rkaWIUdRwZm/wiYkZ1MvDIdU6pSLyDnu0R7SDr7vhlFzr86
         WkrTg34GbXthOr0nZndVviJli2I7nni8LGRz3LnqzZQJWocn2ZpcVJ+M37PwMeSzXRh4
         kATBB7gSH9VnDTYMEi2XksWY+m3flh0gmeJsbRQ0c/fmiickdh5/mJ4gwz0HCkgWSyqW
         FPm4+mPkVDc5ogxXEnfuLFuHEMc+GI1dDglEPgTR2FeAR3S7GBDEXei2i19gJF9h8r+x
         7tnA==
X-Forwarded-Encrypted: i=1; AL+hErFV7lf/nnopvre+r+Uo8alCbpBRmCGD23YpNiww+tuPqSu7ccnTdgJjrbOIkaWR990720Jy/3mcfvLlQM4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cATxP8r9WW190q4T1G7L5hWXNw31vGQnnlTt/QIoXPPIF12QP
	eJWZR2+wvsf0JtP2ayotg0rkGbRuJV3NFGXuh2UIDNt7qBpMkvDLGT7e
X-Gm-Gg: AYBFou1I6DtsoUXf2zMqy5veAFRqdii0t3rS8m+jUViCJ9H4gysmLPAEInUKFv1u8VJ
	acwVdmuT+DF26pVkALPA/a2f8Wz3fMzpAb6cKbkSiEzTomSUT+nvIqiuIe4vTliv5ygAKKkNiE8
	t2ioHoOS+HedcI4aYwgNjCmjDbw/TLIFdv0wSDeRi7W35PHTJAWhvUEGzXsQCW12b+dIy94HBh4
	3gF2F0qfKlwE0yJy7R7cl7PAUzGk6NOiuhdHklpuHz4fQvnvyWQivQ+2GQ+V7+3BfkuI+h5xFEX
	Ae6meLLpc8AyiNm8ErGVQx25QpVILDvBr27f/pp7LGiJi0Wte00E1MCHss4lUtFRn1xQxZjvYa6
	50luYwZaBBYxnLvNEq9FH0JUQoHArhIdjYa5zYLurKiGqizp8+J+F5htd/aJc2PTrG2YfGLuY4p
	V4ajWsbodXtnnQz3la+r9XYnEXqS1CvVkQZ07mMpWEULdTx0X8hWSKzrebN61CjOMkfHpXKARHr
	BbaX6fkLJxo/IK+Yq6muwTxZYpdooBtENeypHY9kyGgwnDuFjQmiYp/ZKRPIHu5Nt5OqMxi7Zuc
	5EQlnWFxbh4D4atfke+LxLf/MhF+u/YQdUegvrXYZ5FKfLvvfILnwzzU1i3j
X-Received: by 2002:a05:6820:81e:b0:716:bbb5:fec with SMTP id 006d021491bc7-71b1882c9edmr3135927eaf.83.1795043139882;
        Wed, 18 Nov 2026 15:05:39 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:46::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b73f876f2bsm3601930fac.2.2026.11.18.15.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:05:39 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v3 0/2] mm/page_alloc: get_page_from_freelist cleanups
Date: Wed, 18 Nov 2026 15:05:33 -0800
Message-ID: <20261118230539.3789231-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
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

v2 --> v3:
==========
- Drop 1/3, since Kiryl is working on some in-flight changes that use
  the gfp mask. Thank you Dev Jain for pointing this out.
- Mark should_skip_kswapd_zone as inline, as suggested by Dev Jain.
- Collect signatures.

2 cleanups for vmscan and page_alloc code. The primary goal is to make
get_page_from_freelist a bit easier to read, especially after the new
kswapd zone skip conditions [1].

Based on the latest page_alloc/for-next branch as of 11/18/2026.
Notably, there is a dependency on the aforementioned kswapd zone skip,
677dfdfad244a "mm/page_alloc: only skip kswapd nodes below their kswapd
watermark".

No functional changes intended.

[1] https://lore.kernel.org/all/CAN+CAwNsqWpPoag_XE6bxbrfi6m71xw1NS_wc3h_ShZjNspSjg@mail.gmail.com/

Joshua Hahn (2):
  mm/page_alloc: move the kswapd node skip check into a helper
  mm/vmscan: consolidate promo vs. high watermark checks

 mm/internal.h   |  1 +
 mm/page_alloc.c | 47 ++++++++++++++++++++++++++++-------------------
 mm/vmscan.c     | 22 +++++++++++++---------
 3 files changed, 42 insertions(+), 28 deletions(-)

base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
-- 
2.53.1-Meta

