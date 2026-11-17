Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950361;
	b=O0xcxEWKcdCCbRnqz5DesIespnyuRoI/SqrSSzITruEzcfeBKHVqoucOsfmDW5Mba9nr
	 qplMnCoZ/g+hYqSGdzC35rc1nBK2wdFcqox28Ir29XSQOYvf8YQyzeXmh9TTHUQNvtWls
	 tBeCw1WgLbUJCruTNIm+W5BNCfN+wA+3txiXDOQdqaL63qnrHZTpilaZlcH7WU6PoeCn7
	 RlekMc/uajS2UbGIcEwFgRDBrj+7yWJJtfDAgP5I84ySxkFfLX3ayE6beEiJUbNtKZP9Z
	 h2PjbaI7kuvFdcNo/ex+bb5PyUI/AEPaC2ABf+8l7jPg0b7gEN+ct3Tqh/xOF59B8Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950361;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2JIz144DjIendGJlmjAvjpQnCBmdwULUaJLtAI0rNec=;
	b=KMPgrnZk4sHdn5/Zq0xTov0EkT4YzOb/uKkGRfYAcf+JgPoDBTbIyHUU9ymsSSmf7ALt
	 74t8bsKk+KYpqvnA5M4nm3nQr6AHVwfojLc9dtN+51OFOYkqejQTnaFL30iqrk62GYPK1
	 FEX4+pVCZoNfaTWjnByNGlFHvhG11qZf6SNsN62oWz7reiN6ENYMCYfiPvMBJZWnRSjtd
	 u3eOCXepdx6D8OllDGzCzt1mEhwmxkF9nFHMMgy/isJXE3Cy8igKU2fy5sXOM9gwIgSeu
	 Jz3ELBpmuNP2l1qfyZ9g4dJUncF0rFxB3/I8AYNV5QaZRBs+k6EDWFGzy7xxEsYdKRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsJAJPnI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A19B606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsJAJPnI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E561F000C4;
	Tue, 17 Nov 2026 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950360;
	bh=2JIz144DjIendGJlmjAvjpQnCBmdwULUaJLtAI0rNec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IsJAJPnINh0BCJlAWxcYhk+Sm4Cd0CcpuNcVTUOZFHEyOCXCiSo2JvnVMfjWoNnRr
	 fSWR38slwarmoKNFzmYRFTSH2zEPSJDX//bPcCI56b4fxyGp/YSMXTduJJZNl3ycsV
	 7DwAmEJJWkkv7uRuLyZJ0clMEiHPCseNPZP/McRJgblqCC/3jGTHdUubiEqUrIrJiC
	 ey6QIT0Z2a1rboQoU9uUmp+JA8CXcAAhx4resiv82uhsWuzTenqFwarvVLwmxwc4Rr
	 F8qUmy5Vxm3yRgUpk9FaSOut0e9gjRWjWkChx/KeSHS2kRVpfmfcFJ+eAKluWBOV1d
	 USXL1bHKCVp+Q==
Message-ID: <c254a38b-d5e5-40d0-8d70-c6baa850cf2a@kernel.org>
Date: Tue, 17 Nov 2026 22:19:12 +0100
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
Subject: Re: [PATCH v2] mm: use memory barriers for non PMD-sized folios to
 sync
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <6274e62645b9f176dd10d7a79e86b900a39cec5f.1794898535.git.baolin.wang@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <6274e62645b9f176dd10d7a79e86b900a39cec5f.1794898535.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 08:00, Baolin Wang wrote:
> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
> uses PMD lock via sync_with_folio_pmd_zap() to synchronize when a cleared
> PMD is found while unmapping a folio.
> 
> However, for non PMD-sized folios, the only PMD clear that can race with
> this unmap is PTE table reclaim, which clears the PMD only after the rmaps
> for the table have been removed. This is plain message passing, and taking
> the PMD lock is more than needed, like I did in the previous patch[1].
> 
> Without barriers, the walker can observe the cleared PMD but a stale
> mapcount on weakly ordered architectures:
> 
> CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
> ================================    ================================
> folio_lock()
>                                     lock(ptl)
>                                     clear PTEs
>                                     remove rmaps   /* W mapcount */
> [mapcount load satisfied early,
>  folio still mapped]
>                                     pmd_clear()    /* W pmd */
>                                     unlock(ptl)
> pmdp_get_lockless() -> none         /* R pmd */
> skip the PMD
> folio_mapped() -> true              /* R mapcount, stale */
> unmapping assumed to have failed
> 
> Pairing an smp_wmb() before the PMD clear with an smp_rmb() after the
> PMD read forbids this outcome:
> 
> CPU 0 (unmap folio)                 CPU 1 (MADV_DONTNEED, full PMD)
> ================================    ================================
>                                     remove rmaps   /* W mapcount */
>                                     smp_wmb()
>                                     pmd_clear()    /* W pmd */
> pmdp_get_lockless() -> none         /* R pmd */
> smp_rmb()
> folio_mapped()                      /* R mapcount */
> 
> If R pmd observes W pmd, R mapcount must observe W mapcount, so
> folio_mapped() no longer reports the removed mappings.
> 
> Pass a 'folio' parameter to sync_with_folio_pmd_zap(), allowing us to
> skip those pfn walkers: pfn_mkclean_range and mapping_wrprotect_range,
> which don't need synchronization.
> 
> Similarly, skip sync for page_mapped_in_vma() since the subsequent
> operations don't check the folio's mapcount.

Do we have any way to measure the benefit of this? I think we'll need that to
convince reviewers (like Lorenzo :) )

-- 
Cheers,

David
