Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065278;
	b=o9oh3tmH/o6Tj/LKIPWOTIkFGjakJcOqc3qhhbip2BnrStM/301rJdzL+z0t3JIglxqm
	 KYqtl3nw0nSBGGSf7shl4HVsvlhDO5PpkZqPvfDtK9niptlNXUK5VmgyNJHx6cEiniIDW
	 gPWbMOkjgMOpLBSiiJGkRBN+CFc3DgNrwZ+OS8CzEpFBba+ubCKhOxa22HcCRNaQO5o9G
	 RpR+/WNu/1U0aN6zhdvtcNboFqHGY8xpI7BX8s5vCfVe2dsv5SmgJpQ+tKHCw6onCvguu
	 6tP3inzkSrTglCkLPp6pAFCmdxegU6fI9I0qKN1YSeXlCex5jmIQriyoruNIBUOsFzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wyxiWuQSWhgvdEtewWdluvJTi3FrncODBevXsHd/xk4=;
	b=SbhbcL0ydGX06gt7vcqBmHlmVDW3vGf/IQlnCW50b2FTWfdRcWTGKSbuODjTrYNd1HIw
	 umRXHVRwZtT1DIXBp/RTXtw2GJPIqr0aig7vrjJwjCOg+D4zeWrU0ebSL6X+5KTXP2xXE
	 mtXp2duc8Q4TM5a9YXfNHrklK7uLI4QHMWIWjmY8C18Ki/00vdw031gIfe6ArlVj+WtG8
	 LRJkbCQH886cVRjfQrFVnfIE0h2hJ6QNLvWctzW33EZhguEIALSzGNtnSR3axxiOUgQdZ
	 GWLCPMG+XncwlNtY19aXVFduwCDQxKuHt2He+/vigS6X5QDAhbia0DySwU/42w6OW3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IrY/U+3s";
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEFA606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AEFA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IrY/U+3s
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb628232d2so1061195a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795065278; x=1795670078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wyxiWuQSWhgvdEtewWdluvJTi3FrncODBevXsHd/xk4=;
        b=IrY/U+3sMojwRsoCdIKNZ7+7w+rAuIZCaA8qG1HKoDyscOwi5hQSBJxg6rVJh5YU4r
         OOi070XGHRZzdtbWslSZmzWvGpIzchWBiBpCfm4eKx58ktKoA02lKmlzoBXML4ClVLu1
         c66BkNOjyg+0liDhrHMXjV3CMWM4ssuM5Z1psWUVA2SQQdNrf6QYi5Xymyhw5UbKjbHC
         5g+CZd+CX3vxmqOaCv55f+9xZMncjLwzvLY+08HnXSfFxHCeqv720GXklLBDMdW6wywH
         N88nHwaHtCa4KYZ4Pn7otDRQMvuHbx0LjfIXEKrcx8LNaiv/EbcNmJG0wg3dtXsVFWSo
         Guiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065278; x=1795670078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyxiWuQSWhgvdEtewWdluvJTi3FrncODBevXsHd/xk4=;
        b=rWZ/9HlyACmvWUvgGEZMiTmhBYX3NEdTrlqpVPiVhJbNg+EFQmq5Sa6cY5U/OuF7QB
         QfQftjXjtvM4E9J3Jg65bZYkCHLnIqXQbvJq9EjB+GwlliNxLE6NUcEBg54y18gxHzOy
         6yiWnrT7Z0kGYJQiS/rpxVpfTFQDvVk6Y0Jdig8MVIJ6W5ZIKw/G+akoDiRauQfvRHfl
         QuOaXB8cip2R1/+FF9rwpn5N6K9PRNWhg648WYnGaM689r9sv1N/blO16fi7mOYmvPF5
         Qe0GMdQzYjG3hN9LrCHm+3v2CV/7OMD+L2+FWNHBDGwXFP02TjvUmqGPwZpelZPbCkUb
         3lEA==
X-Forwarded-Encrypted: i=1; AL+hErH7YqdpDBO2Lsw1oISch16k/hUn/zgE6XydLFAOwppkwVQ1hOBJALuyMT8W26l/JrmOX0EVe6oITBYwpKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eWmzgJg0GFIS2+tVfjQdVeafKcBKT2MvrCNWIO2vxn8A/lbai
	FVkBdFrW+tOIC0h9LNQnBlgRwJg6KGYg5o47b7j6/p51z6R0tBdmW5YV
X-Gm-Gg: AZFdTZcnGPowlhJ0OOdREx7IF5GVSlpRLqLd+j/iR4X6KkztSvEbods69I2Pl+8wL66
	FbvzzItHgdDebGHKU+TKloJxam7pYYS+ZMo/fuEvD5xRVjaEmubvGmbbdqjT6L8DHqBIzZQlzs9
	ScJUMuVVLWwC7hMIRz/QfATPOWkqmZe2u3GbCfmF214z+opxon7W6F0mzDbHzxG563iMA9+ZAqT
	8qepFWVFS5hbqINw0yNOf0rE8VqIOERbtvEIkJnARtZFG5T+7gLTt743EobMdGQwISJYvGv5R1r
	T2IAUZsrOgboxuB7GpMB7L34r/80tNg43A8KBnT+M1RNvy1AawlBPJKHj4ceCCQksVdZnZh2Pv5
	j0/qXiT9ABQM/2EZgHKwuewVtHZ4M9NiBfNVeq6um+vptjW9Seer35VJY323IItVFCrJtRtk0VJ
	o2NDXsKE2XfdYdIKFzoFOOyoeKs0JsGfFGgdQGUcTNozW+esO6axAHbnaBB+1rhxwltclkghvvO
	/3VWZmiGf4M7JYkApzXIx+lVWJK3sn0myCdJl1u/cz8CPqVTdLwxJXTpkz17XEWLb3W/VykQDDN
	VrtQ9fcI0p9qnvn6NlwgF8ap4FESnviYE8Oqz0PRMAq29kyipP87E09p+AovWRfd1fj7Fjc=
X-Received: by 2002:a17:90b:4b86:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3b3d06a487emr5255430a91.6.1795065277522;
        Wed, 18 Nov 2026 21:14:37 -0800 (PST)
Received: from localhost.localdomain (vmi2317697.contaboserver.net. [85.239.239.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff628b4ddsm23497315ad.62.2026.11.18.21.14.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 21:14:37 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: wang =?utf-8?q?lian=EF=BC=88ByteDance=EF=BC=89?= <lianux.mm@gmail.com>,
	linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Gregory Price <gourry@gourry.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	SJ Park <sj@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Yu Zhao <yuzhao@google.com>,
	Vernon Yang <vernon2gm@gmail.com>,
	Zicheng Wang <wangzicheng@honor.com>,
	Chen Ridong <chenridong@xiaomi.com>,
	Tal Zussman <tz2294@columbia.edu>,
	Kairui Song <ryncsn@gmail.com>,
	Xiang Liu <liuxiang.277@bytedance.com>,
	Ehab Ababneh <ehab.ababneh@intel.com>,
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Hui Zhu <hui.zhu@linux.dev>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG) and flag cleanup
Date: Thu, 19 Nov 2026 13:13:33 +0800
Message-ID: <20261119051404.14533-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

From: wang lian（ByteDance） <lianux.mm@gmail.com>

Hi Kairui,

On Thu, 19 Nov 2026 05:03:32 +0800 Kairui Song <kasong@tencent.com> wrote:

> I also retested the LevelDB benchmark from the cache_ext paper [4].
> Interestingly, mainline MGLRU already beats CLRU on this one after a
> recent change in lru_gen_folio_seq that bumps new folios with refs == 1
> to the second-oldest generation as discussed. That change accidentally
> gave random reads a higher hotness level while making sequential reads
> much colder as described before [13]. However it's unreliable and
> incorrect because it depends on LRU drain timing, and hurts some workloads
> as reported, or where the sequential part is actually hotter (any workload
> involving hotter large file and many small cold files will be affected)
> which is reproduced below.
> 
> This series improves it while covering ordinary workloads too and fixing
> more regressions:
> 
> LevelDB Scan / Get, Throughput Total:
> CLRU:         4708.3 ops/s
> MGLRU:        5026.9 ops/s (faster than CLRU, but hurts other workloads)
> MGLRU After:  5179.2 ops/s (even better in all cases, and no regression)
>

We did observe a LevelDB regression in our earlier tests on our
machine. The fixes and results discussed in your cover look promising,
and may address our case too. I haven't retested v5 locally yet, so I'll
rerun the workload on the current base to check whether the regression
is resolved. I'll also look more closely at the access patterns and how
MGLRU behaves with them.

The results on file-backed workloads have been especially encouraging.
Next, I'd like to discuss some anonymous-memory workloads and potential
fixes with you.

> Others
> ======
> 
> Additionally, PSI, smaps, and readahead should all benefit from better
> accuracy since this series unifies the flag usage between classical
> LRU and MGLRU.
> 
> Other tests such as MySQL are looking fine, with no regressions. There is
> also community test report [7].
> 
> Refault distance is not included yet, so MGLRU may respond more slowly to
> workingset shifts. That can be added later, as previously demonstrated
> [8], [9].
> 
> Extra note about future development: this series is actually highly
> compatible with ideas like workingset reporting [10]. The "gen climbing
> folio" design may appear to conflict with workingset reporting's idea,
> but it doesn't. The solution is simple and straightforward: once we can
> extend the generation number to a larger value (e.g. 64 or 128), the
> refs-driven promotion can stop at a lower gen (e.g. oldest_gen + 16),
> leaving the remaining newer generations as perfectly time-gap-separated
> bins. These older gens can be considered as expiring gen.
> 
> The tier count is not fixed either, we'll need to find a way to tune it
> if tiers go beyond 4 though, but that shouldn't be hard, not a blocker
> either.
> 
> More details are in the individual commit messages. LLM is used to help
> improve the comments and tests, all results are double checked.
>

Thank you for this outstanding work! We've seen some really exciting
gains in our tests, and we're very happy with the results. From our
earlier private conversations, I know how much time and effort you've
invested in this. You deserve all the praise for that dedication.

I'll continue reviewing and testing the series and work with you on
further improvements. I'll go through the patches one by one, and I'll
share the workload scenarios and requirements from our side as we go.

Thanks,
Lian
