Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047204;
	b=X6E1/x8xvf2JUK/d/QoHw1keyu9r9AMJHT8eF2wjlgtKfN/Fr9D50yOM5QyPHmclZVvv
	 IpJSPqFUJc6K/wuhxLe5s2uDTy0phcE1kJZjxuhLbreTImvsgpfuQsKy6hCXnYzsV5Byg
	 Y22klPeygiSYCEvSQYVZVFSDYK6Z5ODuUKs3OT3lnflO5dBc/MvKww97koeVGYEH3NvMP
	 25hG9aLkRcdMWWquLuAaOWmYC1PUHYqhOleTI8m1Bja6ipzfPVU2eDAV3ybHhYK35y92d
	 LAyR20STAls6+X5xwO2gqJFCCf/zn7kz8WmuBrQkXLSklL681VxzGvZEHADsnBdx3Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Z+4T7HksHFh0HyOVyESymA8Z3DhRY0Y5VmPHJCOWPKw=;
	b=CauRpMLu8QcrQztPrRGDJA1ZKAE6HH4of1TXasEtP0fGw8Z5eRsDQYd0v7VLOtdHUWeA
	 nX9qzV/1qLchZkczWkT8G0fgorLRDtJZPsRIaDzRFfEEkZRyW4AJ/Y5W7D6MoK8KH53ZK
	 CFRWxElU5UP4JU7mtMDExI9ZnCWH/aUatlSgWPTeFNN/gtewwG188Sf60WuSmHDeceCw2
	 Y8l1p3uCtuoI1xYUTrJszp5Zva3cOutp/uiYIfjehE21qyYP9zQ5pOfsOGHGoTZmZSOgW
	 q7CZQJE6Zx5Ddgw8HyrfbG7uTyLUgL6PQJwjD+auHesiedfKIzHaVPZ5aVBwkIiJscQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=lWVk3evo;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E156E606A336
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E156E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=lWVk3evo
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679aeeddc6bso1483934d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1795047200; x=1795652000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z+4T7HksHFh0HyOVyESymA8Z3DhRY0Y5VmPHJCOWPKw=;
        b=lWVk3evoc6XTkw2CnC4EGTAjOmPzamp1BoH0fhOMMjRFjnFLY6dIsMgCV0rv3fkY+F
         M9yCs+mo7CKMDz3fcCwbyWJHoZmowmtYXno7TQkZm5mpNgZDHo0/WNEJ950gc0c/YPqS
         hPuVhxncNVNCwigIKaGRJreMz3L/s8na7A6R1ZVzuYN4GBeF3yB6m4zz0cB4mAbzQsJM
         3d1Ex8eu5M14sGf1vxa5iPGC7lFgk5xvJJPJGBQbhHz33YdlsJfx+BEpqPe567WouOPj
         95I4jVPKgvWXqLfPUuCdRYR00NP38TlzQRiJiHckdLTH8EVIKk2/F4xme9sPlnCM0vLR
         lYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047200; x=1795652000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+4T7HksHFh0HyOVyESymA8Z3DhRY0Y5VmPHJCOWPKw=;
        b=PhC8gmfF1UEV/V3K+hkIvIQcZC3SmQQr2+4Oncr5nI67jgw+C+m32IPVltHA4FLwRR
         iuXyR2UBYf9AZhYBHehcqMIOQAxnQfdRD79/EyIK/mvUM4X+E42eYE2/hoarT1bwUfbr
         GBY1T6J0U2UdEdWzIwv1xjpQGfZ/USVMP0xGS0QCY8UKIPseLbVTsY/jEiHu6hTyuD2g
         8Wy+rEAOuiE8ZYNsYdsGtAfhK2lVojSEZfW7Ej+9f4RgNL7gCKx3+aPpyCEBkAU24jJ8
         DR6mc4bKOnoW3UfhdsEImeft/bOb4IP+vM8LhO6rNh14rRZDNgYqf+FRk/E1jBu0pQFX
         YzbA==
X-Forwarded-Encrypted: i=1; AL+hErGgN6lr2ngg7APSzV12b3S2GVvNc6ouIzFXvn8NB33hpxhpuCB0i2k+0PBtJDJDG+qswmvrZ9yeLZViAQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X69oPuOLRirf5J2vVhpzDMUjDIHwB9jdzDDKaCfuwncjLNlfm
	OLXWjJG1fe0yaZzAfET9i+FgQrFul0j4GhkVbA+rdD0sxDEiAzm8TZYycPksjsrbrxk=
X-Gm-Gg: AZFdTZfE3eKJqim14xH1wutnw8EByuFDHBMg5nlyd3qv/5A/UfoCkEbPoA+sgIRsTf/
	lhnqGlhT1WQR5GrTWQqmkH4XpvIkSBZVifpzK244Tq370cIP4ZfRKzqA2+K0y9q1Sgctrr/qQ1g
	OJdTcePSe97Zkjje3ipYmosc+b8vQGhtA/BJUzVvFbedUOo38nt5n9vbBheZYGesqmp22mtPclI
	UNF+tHPpm81fxuUvMB/ab/EDG7sUWardnS1EB/DByySHssua2wJFN3brPErUp39hKbxwsazxBpf
	4Qw0C6nL+Gkfz3kjnnlzIA6wAr15Dr5fr5D0YazaevKsOjX8H8f+08/7cCBnp5tvl+7nrUFToCB
	MUBdFO07/7ZBcUt7gxjoO9LujYNhyBTRo+NrFT6NJ1zRLuOIRtLacPtjsFtDNvLfyOMTvCrcZv8
	C4zvMHI+ssJFiuv0gkIdfrD1oZKD+EeQ8iRIjvdak+FB+717/GYIgbcrBtWoExxqCUMZ0u6xJw4
	9ouMuYSzDq1Jwmi+xJqGp/mAyCn7/I0XLbgKdysh2jFiOubMmTAVa+R3n2WUpCAQqbeLERNmCnf
	ZfGfhNGTlJdxVC7cuI2Z5AxefdD6
X-Received: by 2002:a53:d005:0:b0:67c:6e1b:84d2 with SMTP id 956f58d0204a3-67dd460a10amr1474859d50.101.1795047199791;
        Wed, 18 Nov 2026 16:13:19 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd5843177sm2483921d50.5.2026.11.18.16.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:13:19 -0800 (PST)
Date: Wed, 18 Nov 2026 19:13:18 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Cenk =?utf-8?Q?Y=C4=B1lmaz?= <cenk@deepfinresearch.com>,
	Zhang Peng <zippermonkey@icloud.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>, Mel Gorman <mgorman@suse.de>,
	Sasha Levin <sasha.levin@oracle.com>,
	Rik van Riel <riel@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Peter Xu <peterx@redhat.com>, Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/4] mm/vmscan: flush deferred writable TLB entries
 before unlocking the folio
Message-ID: <av4_Hkq1kNQUyIeI@cmpxchg.org>
References: <20261118-file_folio_flush-v1-0-e9e739ed14e0@kernel.org>
 <20261118-file_folio_flush-v1-2-e9e739ed14e0@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-file_folio_flush-v1-2-e9e739ed14e0@kernel.org>

On Wed, Nov 18, 2026 at 10:20:37AM +0100, David Hildenbrand (Arm) wrote:
> try_to_unmap() with TTU_BATCH_FLUSH transfers the PTE dirty bit to the
> folio and defers the TLB flush.
> 
> Reclaim must flush the TLB before unlocking the folio, otherwise stale
> writable TLB entries might be left behind temporarily: writeback started
> by other mechanisms (e.g., fsync) will not find any mappings in
> folio_mkclean(), so it will neither write-protect nor flush anything.
> 
> A write through a stale TLB entry after the folio was cleaned gets lost
> once the folio is reclaimed.
> 
> However, reclaim currently does not flush the TLB if the now-dirty folio
> does not get written back (e.g., gets activated or kept instead). Fix it
> by flushing right after try_to_unmap() if the folio is dirty, which makes
> the existing flush before pageout() unnecessary.
> 
> For dirty page-cache folios that reclaim activates, we will now flush the
> TLB immediately after unmapping them instead of batching the flush, which
> is the right thing to do. Performance-wise, it shouldn't really matter
> much, because folios with dirty PTEs are usually young and reclaim won't
> even try to unmap them.
> 
> Fixes: d950c9477d51 ("mm: defer flush of writable TLB entries")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
