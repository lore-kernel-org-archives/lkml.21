Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421701;
	b=kokVyCYqiENjUk2xbRxO9J6vqBmrlqN2TqgNbN9voVQikLhMUTehzkpJUtt3IMI5oNoB
	 LvJy6lmd37Q8ljYFlHNckhf9BrqadHHMHLUhHUQP5MtoQvcxhDtlkX7072lE81WynuFRG
	 0CQNuIU0KkLhwZxfDSfdH3oY+oYm86vKIS/cKDvq+cuHFUyWflCdRjZJovvqid6Qy0Zgq
	 Ad5R7ZiYfHP7vJw1YTci3l2YWSpN8cBPuZFl79CV31U4w9BtcLtNZINhwmBtMzQPQOaL6
	 /dzZVIJankdIW970HTdCsgPp0N3KFaUB9MCfOxtxs41v10VGyurJLDTi/dnmSMpassA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421701;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gaKscylzVA9L6Cd/lM7nAM+V8+V1ffHPVI55bUnkh2M=;
	b=3VpCH0ATlv41LoXCRpKAKbiCINtc8O3J4XurIXKctvUqxVakWw6WR1IWNLUisRnSwwZg
	 dHcxWBP3Pf9M/D9PcyqtIQLHQmhBL4tAZmmNxhny13akaAlYosvDKoi43vMZe9Pf9wh0P
	 WeOQYIaWuRfQk/CwnB5z0dF/5iJabyvECTYZ7ZfbpCo19PsZv4hilMbcNt8Nj9iT/b9Q1
	 O6807x6htPN0H5Sde9omJ3UXN6fB3KCeoE7/V46MR2HMIEZ7Z1Fr68gTTHwqisCL34fS/
	 tFCZYWgvKdg5MBFRkzPDS2riq0Wf04aAb/vDAjMP0WzJFOmFWLOnAdKnhWf90u/XJtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f6rS3qtW;
	arc=none smtp.remote-ip=91.218.175.227
Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A00606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A00606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f6rS3qtW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0his6L4KAv1ky0UJ0arlaVseKaKp+gf6jPobbtyi7KU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795421698; v=1; x=1796026498;
 b=f6rS3qtWqjwBOtLWmm8nE1rE++2Y0GSTfCCxuMVrMkr3vyVRt3kRH3OvuVrtug3cVKnPUTlf
 xQm1Xk+gTuTSUpXdL1MCiJOZCkJ/covQdEgUdlblHLBs0lgESrwIaJRCiHBA3LBFQt/7NbHiqx4
 2vq8aMYPTXqQ/enSjlFfq4kI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 87a4271b6fab09f6;
	Mon, 23 Nov 2026 08:14:58 +0000
X-Mizu-Trace-ID: 87a4271b6fab09f6
X-Migadu-Flow: FLOW_OUT
Message-ID: <5eea60a9-962f-4aa4-95b2-a242d847310c@linux.dev>
Date: Mon, 23 Nov 2026 16:14:48 +0800
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
Subject: Re: [PATCH v3 09/11] mm/cma: centralize CMA pageblock initialization
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
 <20261120100856.16929-10-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-10-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 6:08 PM, Muchun Song wrote:
> Early CMA reservations currently require callers to maintain CMA state.
> This exposes internal bookkeeping requirements and splits responsibility
> for the same area between CMA and its users.
> 
> Make CMA fully responsible for the state of early reservations. Pages
> already handed to a caller remain owned by that caller if activation
> fails, so keep their managed-page accounting intact regardless of whether
> CMA retains the rest of the area.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v3:
> - Restore managed-page accounting for early-reserved pages regardless of
>    CMA_RESERVE_PAGES_ON_ERROR (reported by Sashiko)
> ---
>   mm/cma.c     | 30 ++++++++++++++++++------------
>   mm/hugetlb.c |  8 +++-----
>   2 files changed, 21 insertions(+), 17 deletions(-)
> 

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

