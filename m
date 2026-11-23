Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418183;
	b=MRF/BM8abF3ifIQB+YvTTt8+7EKk8Q/L5deAh9U3ifbWcvLX+1Nkw9j5eGdyOM/IPS65
	 u+R5v7NXwFTMU+oYmX0REzM/7pGo8UWjgA9Yr4m4lZtXlK6ljGpl/gFLoflV+qP+fEdEI
	 OTguhG/yBHDHpa2qgSzlyoDz8iZ4NOdd42+Sb68ec2sK8iIicvp4Sn3UmEkGtO0Lf/qJq
	 +YUi5ty3sOK5FFK/3gDsMUWNZHstl5IpDRqmFgSuiWBKUAc838qlwE0vJImwoduAMyNck
	 klw5TfDHHuMQnfv07Lz2kKQVtrmrE6a6BRejUp4MvDRk/WYgDKQdGwoSI3p3wy8o93g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418183;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qWuSEBbe4RE+BEi4g+bK4UJkZUyNGdpTjGoBgR8/Wcg=;
	b=454YsLoul6LlXlXboYllk1wa/enVPqhthcRUTl/PxsK0fgci4Q8VILrzil/aXPqrt3bX
	 KH2eSTZiEZvuhATURyM2J0+v3jisjmi20hKnWSmZoP1LjyWxwhWFemoWVQveRV64JMMtB
	 v/JgdoxXdZl23yS9vqbcOtes1KN0Hx1L2+A/VXuGZbC7HeIRrTpKdMNcWrYl7BEaZzEBj
	 0qKOinY9BWuH83H3t3PjpClb5kqLEg71Dn+23kUXzY5Rt9nWGAytub261ULB56y5ZOgCV
	 UeibiwkJqq7RF8RuFgtABJ06AWg3g/6fgBVWH3CmLv0I2ZbWB4yzKUKJrkigGKeeTsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q3ZHFOLH;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEEB606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FEEB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q3ZHFOLH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RmJfjbW9hanTanRMvzBOFEucChAhacO/MlKfSklTaqw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795418180; v=1; x=1796022980;
 b=Q3ZHFOLHQgeWyu8jn9GzKSy5xUH4NNHprAauA0Qa3wLS2LmLxWxDZ7uPzL3xvCghUYTAVKe+
 KdqUBKV+6Eod5KaRbX6DTm1ElzOS1ZYhIAvfMrrQSrjd4eFwkYz/vassKdcZNHoJcrtpHBebwpo
 /oEdcYEP3WYRHEANHtT7wELE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0696a849d2745a18;
	Mon, 23 Nov 2026 07:16:20 +0000
X-Mizu-Trace-ID: 0696a849d2745a18
X-Migadu-Flow: FLOW_OUT
Message-ID: <f4f45970-d917-4fb4-8bae-63c836527888@linux.dev>
Date: Mon, 23 Nov 2026 15:16:11 +0800
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
Subject: Re: [PATCH v3 05/11] mm/hugetlb: drop boot-time HVO handling for
 gigantic folios
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
 <20261120100856.16929-6-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-6-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 6:08 PM, Muchun Song wrote:
> HugeTLB HVO is currently supported on x86-64, riscv64, and LoongArch.
> On x86-64 and riscv64, gigantic HugeTLB pages are larger than the
> section size, so the existing section-based vmemmap optimization
> infrastructure is already sufficient to cover the whole folio.  On
> LoongArch, HugeTLB HVO is supported without gigantic HugeTLB pages.
> 
> Therefore, boot-time HugeTLB HVO folios can rely on the section-based
> vmemmap optimization infrastructure directly, without the extra bulk
> optimization and fallback handling.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/hugetlb.c         | 25 +++++++------------------
>   mm/hugetlb_vmemmap.c | 19 +------------------
>   2 files changed, 8 insertions(+), 36 deletions(-)
> 

LGTM, so:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

