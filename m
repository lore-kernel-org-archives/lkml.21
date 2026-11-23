Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418841;
	b=uOQGnQcb5R23q+imsgzeqPEYlYf+IJnBZ5yr+w+iLtsYAJc5z9SL5k0vX6GSIBPQ3mgD
	 JNBjghVZecruwYz37HDZWbk+s4z5GBiA3cH7oCwEEZ11v0hNZcnJ+ErVFUcF/acDUV6W1
	 uRFqjHu5FbJDFnyBSi2S0cbMj7AfvyECXbhoF3taDpJH+BtJeyzgfH8ohdPcLKHx8JP0E
	 XpoD9Od4CHHg5+WHhsyEao08U8XoByxG9ys4jdex9VNNX8l3oHpCQIhjQPyxPRZLVtcmJ
	 gaQZCau4G9a6jWLUCWkP1GPMBPClUacq59VGD74OoSnJWm9HehLnrx/+R6t0lAxCg1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418841;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WgehDg6pcaH9Fwnyu9osCErYzzR7cI1YfyGC9vqBeEE=;
	b=BEo3O+bY0n7A6OOkfwecRi3OmLaGzXX9Zh8LKdi9n/692zdKPhTxqRqsJkmU1W0VDpQr
	 MFocSla99vk/Ns50EkVe/Wv3X9DFW6grbBmyjACX/n40x0DJ0i0lSlJKGFsf1obnwpZZv
	 OxzgEP2kHFLnIRajytfFaSQHuKxgxIcitNIv8oIzq2UGlYpgfFNBSW804gVk3bYtJsdtX
	 54GwrDW2QmV/O//eRJZ6SYfJGC9aNumvBlQVnqAA0MTp2cDH8N7oT5FkmtlRIjRzgLMBo
	 m9sIDgSW4sj2tdw+3EEObeqzD68qozdVcoZ3XAfsu2qKjSynRggDv9Klrtlu6C45LBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o8OnsbjB;
	arc=none smtp.remote-ip=91.218.175.45
Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AB3606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1AB3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o8OnsbjB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=82ciyE0YI3UBAfRF/D8QcRgrNL2qnfQIx+kCfemew/4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795418837; v=1; x=1796023637;
 b=o8OnsbjBENvlOPircJWSJjeWz4aEo33MiMhV7zlMs8EdkrlvyuBREWEgAueyoLwRS6XYPwkE
 nwAM6O/DvSTM9DROdGe6izAyVCrADEOEl9iO4MpMCvneA8A/t9LA+K2FotubuRCL/epPgeDtaBF
 5PwLr/z+gkAdyqpn7jeI47uU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f250bcde65441288;
	Mon, 23 Nov 2026 07:27:17 +0000
X-Mizu-Trace-ID: f250bcde65441288
X-Migadu-Flow: FLOW_OUT
Message-ID: <1d164f38-5c0f-4ea4-9c0c-9ce225498596@linux.dev>
Date: Mon, 23 Nov 2026 15:27:12 +0800
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
Subject: Re: [PATCH v3 06/11] mm/hugetlb: initialize all struct pages for
 bootmem hugepages
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Li Zhe <lizhe.67@bytedance.com>,
 Andrew Popple <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 James Houghton <jthoughton@google.com>, Lance Yang <lance.yang@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261120100856.16929-1-songmuchun@bytedance.com>
 <20261120100856.16929-7-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-7-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 6:08 PM, Muchun Song wrote:
> Boot-time gigantic hugepages currently leave the head struct page to
> the generic memmap initialization path while the HugeTLB code
> initializes the remaining struct pages itself.
> 
> Mark the full hugepage noinit and initialize the head struct page in
> hugetlb_folio_init_vmemmap() as well, so the whole compound-page setup
> is handled in one place.
> 
> This can also reduce memblock metadata overhead when many boot-time
> HugeTLB pages are reserved, because physically contiguous hugepages
> can be covered by fewer noinit regions.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v3:
> - Defer the HugeTLB template-copy optimization to the common helper
>    switch after integrating the series (suggested by Mike Rapoport)
> ---
>   mm/hugetlb.c | 27 ++++++++++-----------------
>   1 file changed, 10 insertions(+), 17 deletions(-)
> 

LGTM, so:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

