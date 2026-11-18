Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041312;
	b=p0Af5m8gAaevfJtkLVDy/+fenGg2lHijA5RZbHVXgDdEjMkEEa1izmWg1NBIRXguYBuU
	 4FHYNhh8dlz4h2tacndgkvE9+KR0BdsEDaWOy9a0M2N95HaDjWUXNnJ+DpNJI/ylrG4MR
	 B9YfBjhbWl3Gf4MbtgBLcGCxrlsh8RPFezZmSVcNaGfWZjaIlcuPKEgc+wf1yEkZU0WRN
	 rJ7giJI6gYT3odzwa/LZ2j7PxPnx0rAB10cU3+fhYEYzL8fANlfWorOp6bJqifhmvmuD+
	 rVBcDBqMDMOFof7To/3qmfSq83BIQIs0BrG1G+6emniJx21RZoeOV+v/+ZcqI+172cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+wEj8CWquloqUtruK2jACBvwnRpGsJYik9FeeinA1ng=;
	b=LoA7Xz+nEV6Dpc7zEb+VZJKIOmEde3VXaMpgxuEarqOcrMemEePabSWqjSLXYEJwqNHc
	 HMTj7TCp5lHSZlRBk3A8XDwhkckhSAcWowlmtxVHBnGouhdvIZZgXYOZYE/le1lAqgucS
	 xy2xTfpRI20xgFDPiluKbTsxX70J4b+Cz8Y5PlPo5wfAZzw1p7SXRm32X3qaB4uUv0i5M
	 RoNPF9TlHREnAKlgvZXXfupQw31QKsz+PYNq/WSNffV5v6mb+sqLcqJAQu7IfXUA0s+Mr
	 HL0mqi25LJmVoqkfMqUtzSKW+hWGYWNNKuTr+R1E3fzNOXxPr0lX4c0tn/ywQq1xgsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pGRNfmS9;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pGRNfmS9
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1051175f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795041311; x=1795646111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+wEj8CWquloqUtruK2jACBvwnRpGsJYik9FeeinA1ng=;
        b=pGRNfmS98w+QY0eyutrVZ4vvk5cqFOyy/I+CThkz9hde2+IK9TM7yfxhZieeDRbuJq
         A7bqb0eODI6dFfNjVvKqY4t4sdRGV8wTZd1otbjojVfdg4l+MBG4UVyK9TdvBZqb1Lbn
         mq3y+8oKROpj9r2b3hgYMAvR4zRdT/S3T7eNc2rCSKXzam409hTEDdWvnuqGbNw+dKVZ
         7vcegWMaWtYmDVFdmkb2Oe1wDDccgg2yw3pErYBvoCSLzGr9pVlL3wNPNGg8nLJWhw5h
         /2QZJ6rZWFdkA4uNkSAwxzntIQ8hRts76df+A8+lTjHWS28P9eC+WeXh/OFxkZPYnnkR
         Ydmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041311; x=1795646111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wEj8CWquloqUtruK2jACBvwnRpGsJYik9FeeinA1ng=;
        b=VjWQDdTplpub9FVdVtZ2bGMTP/LmhpeOCCO+JTC3jzC+/Ks1ydRszLyVTIpEdaL8Tu
         mrD+KX5l7P8KNNBt37SmZjfRlqdIu3v7og7h84F5+V3Xa2UMGjZdVfZ2yrjRbc/8Xb+w
         2NAyF5uSQ8wRV8R9qj+9BgHup/gQM7CyhpvJ93IKsw87W6rra/l9a8Y3ilcPx38wpD/N
         ov8XOYtrp5Gda16E7/9ErsFVVZWlHn4IXiWwiWQGu+a6o5xph18A3a9SSAqPkD4p42UV
         w6D4TA37scK2Pdh2uKrGM7nlyK/pAK0XJ1HrcKs6rdUmQET6A/6aw+i1p3aTM2r9Dx4D
         QjOA==
X-Forwarded-Encrypted: i=1; AL+hErGHtQrU9VB9GEZH3hjR5n0hyPCcQb3FZ82N8KLr1T7vcuY3+FaQMm6gcQxFTzkJzIhI4FHu72NWeDYwxOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sDMPgjtjWaTIJ7LSqW3N1tmhV4vxdhnpMhDISr4/LW9ll8cbT
	otDY5HtwCxr4SLN/fLYN2gUpVOIVjeKkzTvYaPMUABRKqjbSMyHdyHbU
X-Gm-Gg: AYBFou2wdpSwzqwOAuwZgH6rLzbCDxzrWXUin6Ko8U2ua5rPIClqWWPXWP3u5yk+VEL
	gfLhqiX/e9hceH+tomheznQyaxt8X3NIukRHaIotilbt+mUCTJlK0fUr08K4XgkQCyK94I972tT
	Ymdwle9j6/JihrXKafn1O0STE3HkKU6mBwubun8ACYZm6TsqrZOZ8JNkNXcSWZGIHi2qqQ5tjNt
	WIeAUrY13ncx5RY3oAS4uY2oiYF4LVmK9ofaLHrxNHIUYbhAVt/F9jzGHeyij4+X7f/+33FlX0l
	RaZ6W+Xes1zqipbqu4XKgkzndBDPKbLkVI4W96XzCrBJLhtgqbbg3QyhTO4kV+QTFvEgAb++qeh
	8zOoJB8QjyrRENJPeogEVvxWI0z4L5zyZxu3upaxszmfIaa6href4Mx+gl+/g8ckDZ6DChvuKlP
	z0vS817Oos4XdrfZcDEqmGOECgH+HRBd0wjcrpJ2r78wDAlIDEdGwO/Z5dMK7NvwvPdyMvekx50
	BMF3hnI8UJDkichqTeBhfxedhFu1qItPH6eFeTkx97ZtKhN4IC9xVNp7umJHxU8pX8M5bDfvvYC
	03SinlkUmErxUeo86T271xN0YfEUwyG7YONL2Zv84OMh9g==
X-Received: by 2002:a05:600c:4e92:b0:4bb:6a2d:b440 with SMTP id 5b1f17b1804b1-4bb7d6d1df0mr87283275e9.2.1795041310455;
        Wed, 18 Nov 2026 14:35:10 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb845223b8sm2954135e9.12.2026.11.18.14.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:35:10 -0800 (PST)
Message-ID: <e0a946fa-19bb-41fe-adbf-8ead08009ab9@gmail.com>
Date: Wed, 18 Nov 2026 23:35:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mm: flush stale TLB entries before installing a
 CoW'ed folio
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 =?UTF-8?Q?Cenk_Y=C4=B1lmaz?= <cenk@deepfinresearch.com>,
 Zhang Peng <zippermonkey@icloud.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, Mel Gorman <mgorman@suse.de>,
 Sasha Levin <sasha.levin@oracle.com>, Rik van Riel <riel@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Peter Xu <peterx@redhat.com>,
 Hugh Dickins <hughd@google.com>, Axel Rasmussen <axelrasmussen@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261118-file_folio_flush-v1-0-e9e739ed14e0@kernel.org>
 <20261118-file_folio_flush-v1-1-e9e739ed14e0@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261118-file_folio_flush-v1-1-e9e739ed14e0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/18/26 10:20 AM, David Hildenbrand (Arm) wrote:
> Zapping PTEs in zap_pte_range() defers the TLB flush until after dropping
> the PTL for clean page-cache folios.
> 
> A concurrent write fault in a MAP_PRIVATE mapping can then CoW the
> page-cache folio and install a new anon folio without a prior TLB
> flush:
> 
> 	CPU0				CPU1
> 	LOAD(ADDR)
> 	 -> #PF
> 	    installs R/O PTE -> A
> 					fuse_open()
> 					 -> invalidate_inode_pages2()
> 					    -> zap_pte_range()
> 					       clears R/O PTE
> 					       // delayed flush
> 	// Other CPUs (incl CPU0) still cache ADDR -> A
> 	STORE(ADDR)
> 	 -> #PF
> 	    do_cow_fault()
> 	    copies A to B, installs R/W PTE -> B
> 	    // no TLB flush: PTE was none
> 
> CPUs with stale TLB entries will still read from the old folio while writes
> go to the new folio, until the TLB is flushed.
> 
> We really must process pending TLB flushes if we are not faulting the
> same folio back in.
> 
> Fix it by flushing the TLB before installing an anon (CoW'ed) folio in
> set_pte_range() if a TLB flush is pending. Zapping itself stays as fast
> as before.
> 
> Other faults are not affected: unmap_mapping_*() users only remove
> folios from the page-cache after their own TLB flush, so until then, a
> refault maps the same folio again. The exception is a concurrent
> invalidation that removes the already-unmapped folio from the
> page-cache before the zapper flushed the TLB; that is an unlikely corner
> case that we'll not handle for now.
> 
> Note that we don't care about MADV_DONTNEED followed by a new read
> fault, as MADV_DONTNEED only guarantees its semantics once the operation
> completed. CoW faults will flush the TLB either way.
> 
> For example, imagine that MADV_DONTNEED zaps a page-cache folio and
> doesn't flush the TLB (but still holds a reference). If the page-cache
> replaces the folio, a new read fault might map the new folio without
> flushing the TLB. That's okay, as MADV_DONTNEED did not complete yet.
> Same applies to MADV_DONTNEED of CoW'ed folios when re-faulting the
> page-cache folio.
> 
> Memory reclaim, which removes folios from the page-cache before performing
> its own batched TLB flush, will be handled separately.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Cenk Yılmaz <cenk@deepfinresearch.com>
> Debugged-by: Cenk Yılmaz <cenk@deepfinresearch.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
