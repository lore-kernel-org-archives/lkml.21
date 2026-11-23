Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419461;
	b=hQ7iE/NUhVq+BT1R7wi8/YVsyZr2mDmEuF90Kxjs1LHEhwnmSq+U16Alx2+5SMB4+904
	 Jh0vv1pwnU8uaRjmev3AZzzV5vorWFVAf7xCq8MBg4sPyQTKZHz8ht7CRkMvAfrXgVcd0
	 LCnzCWmPFn1djHcl7r1OK1qreKSi521F9q+dRbnSXFYIm/fsVC7rdSotS2dFFSweqxgw6
	 cPdPBdI0gZv8IKaWpsJCVlbSMem/FLHrXoNCjPX6do+5ySUiwwRwmdNDxb6VfH4qotOI4
	 Zh167gx8Zs0svi61pg1XGsau4dzTg6Wj6pfThcIZthY61jZFh/nGjIlUGhZTz9WcEWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419461;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NmodjGeKHDCfxRhpWSEVp9AH2hRjN+0p/3GpG2Sg1w8=;
	b=EYTGKOpN5fzvr5ENAScMNOT29fP0C7xS/DtQlNViVyvFmYD1INMtmaeBvryDzjXB3T4+
	 tDLr0PjC3quh3pxFFuR4XNQ6Kyk/SWCFKeNSV0Og2iEHO681C8jWUXvAJc9B7kgG4Cxqk
	 O6YFdwe0P05K8q0vmCxjG14kKbvWiFlqOB8+HGJVnM/4h7iBQnj9lhk25rxLgbXXan3/u
	 eDohm/UzEdIe88tjlB/V9HovCmLM+FxC/rXzM1A8VrEIHMW0R413EMoXsH7YhlO46Zeoz
	 Jqo4b7GlBK/MPDKkhyU/NtLqBkVquEt7k3TYjXpaWE+c2L2/rM+WCxtDRaLQywaEn2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="CKIFl/24";
	arc=none smtp.remote-ip=91.218.175.222
Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04CB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F04CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CKIFl/24
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xIzYw8/Ro5xzMGJMzNGSSSnMkdVNEoq8ZUwi7dXoTsw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795419459; v=1; x=1796024259;
 b=CKIFl/24BMuYv6VYlzHSMMfwr2AN1enC6IMMKqNdonZaUYbUsI8/eI5Q4QrMOiL7FJqCeYd0
 W0L0DWvDFhkfuup0tUZszdPwmX2XQC9dNa9Yl7Shp4T/ZhYDa3377piscm6tBitv6u/aWiMXy1i
 aZ6wNSG8sAjm8eNr+/V+1VR0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 999da549a628da71;
	Mon, 23 Nov 2026 07:37:38 +0000
X-Mizu-Trace-ID: 999da549a628da71
X-Migadu-Flow: FLOW_OUT
Message-ID: <5036e26a-0889-4def-a3ec-1b35802ac0ca@linux.dev>
Date: Mon, 23 Nov 2026 15:37:30 +0800
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
Subject: Re: [PATCH v3 08/11] mm/mm_init: make __init_single_page() static
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
 <20261120100856.16929-9-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261120100856.16929-9-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/26 6:08 PM, Muchun Song wrote:
> __init_single_page() is only used within mm/mm_init.c, so make it
> static.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/mm_init.c | 2 +-
>   mm/mm_init.h | 2 --
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi
