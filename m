Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421757;
	b=kVsXec6fwSAyYbOGAJ5r8sKSfnRjn3feJJwtCL5m2ljj4cL3bqeA1x10MkWjuPs1M4Jn
	 fx6f5dhpgajfa4WobhGQE/Nb97mjsvcdRa56020CeR9Y3Gi7NKzTl8jawgNyHKiF49l7B
	 9YV631zEFLBpXYjliQ68khKt0LjJnre85hatZ/vJkxmHS+K8ocjh0qrljHxOE17PcJnnu
	 NJItYxZpekTHvI5zLav2XQ5MuiHLHP/UfoY9gRXvviSedlQjyE9mXrjj42mP25Z/tzTml
	 NQHbE7cOwFGhJ1meoGVzyai0nyloq5bW2Xs2JGA65Irq/dHdLepHlpdkC06nKA3jD8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421757;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HxKlpJSUNaY7zIGvzfiGBJ8p1bMRLpHDczsf0LguRP4=;
	b=OdyDHaJVlzubipw0T0uyhYRWg7bIOR3SiM1z3V4OUaWKI21nYcJK9KyduYGHjCEU95PF
	 C3fpDaKft60AR2QtEhtsot1gVBmG0H/e1pA2P0DiMzG1kb16Ad8c+lsD1jf3mAPmYl4jL
	 RtZjJyF+S3hKoUj5TTFeHFtx0qRogSpUfAEsDyvPy2oaYk++mfYgzrUa25kHr8CviiBXr
	 T6MkbEV1v2jWkGe7/gN1vay3O5jT6p1WSPbeM0OpfWYJ/67o/X6/eQ97+UewJ0LJC0FYm
	 LWOMeyoExxeRLuxDGIP5iTLeyoDVlFyiWFYSh3n5Y4F+pgO7rnlOPttvmgKV4CMpOQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X7uVqYs8;
	arc=none smtp.remote-ip=91.218.175.1
Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9D1606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X7uVqYs8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z1HmiQjy0A3ZiDMZtu24685wy3WZO4eR60IuYEdmpPQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795421754; v=1; x=1796026554;
 b=X7uVqYs8dS0mVeTymafUXqp42Umpdif5cHVmun2ZGJV12wazls4W9Z4pvlRc6kVA/J7lEk72
 NE8MDmeRMjkFvzmwc3FM4MGIHjjppcZfIAj4WZcTCTrBtDDTg0skVy0Mqk5qOpbueLxoHCULP0T
 okr8Yp6N/zU5lV2MiMtt2/3s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 976744ee88a23da7;
	Mon, 23 Nov 2026 08:15:45 +0000
X-Mizu-Trace-ID: 976744ee88a23da7
X-Migadu-Flow: FLOW_OUT
Message-ID: <57867aaf-81e6-453e-9808-7e2824f45009@linux.dev>
Date: Mon, 23 Nov 2026 16:15:41 +0800
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
Subject: Re: [PATCH v3 10/11] mm/cma: localize init_cma_pageblock() to cma.c
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
 <20261120100856.16929-11-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-11-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 6:08 PM, Muchun Song wrote:
> Move init_cma_pageblock() from mm_init.c into cma.c so it lives
> alongside the CMA code that uses it.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/cma.c     | 8 ++++++++
>   mm/mm_init.c | 9 ---------
>   mm/mm_init.h | 8 --------
>   3 files changed, 8 insertions(+), 17 deletions(-)
> 

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

