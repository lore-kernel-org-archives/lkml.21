Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085875;
	b=OG/UQilvIeIyBC432nBBcatHW1LIWZlm9aIto05WLtUWHatuUMoVL3gbRDM2qiNfoj0y
	 c7hWzjLX4WgzlrYq2ddA1NATYkx45yRMY4lrdK4E13xwIDlKYFY3ksVrYpOCxR4G6jt+W
	 y9mWnFPDR1VcTX9mapEoymnnqeczAU9YHV97xwqSnxrh+b/3TaBgXNBtjp2Sx7FAmXwea
	 j6s/CEeAIe4hmaOfaNBPVu8tZUAaaiB/vVFCmoI+hw15DDsdkmIOKX6MGBiW0yVLtrBtZ
	 Sp6AUCaANfVhAhpenR2GF7VDetN7iGDpqSjCAdlm+dsVhQnWFbL5iPHK9fxwOFdmchw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085875;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nkep9V+9M81dGzA4DVoTUAoMFfZAfhwxu8MxQVdO5n4=;
	b=zolG7KfKTlrKDs+K4mfxvP8xnm2a15Z7gi9M4FC1yxyqzKJG8Zn6bY7WA4sMNcCNcRQ8
	 SMDekD38boI4IqKD8BwmaowFo/F77PXYN6ccO6BmOup/VyNOJfrAR+/JT0u4f/olAaqgN
	 G7m6JTbQtcI7blxn+KgYt2C2UC9/JyV62qQZNjyM04jmRB0ujZFIt4zWj5xx7KVbCqkyS
	 sWY2X0RlOyc4ZZu5MhXnxRnb+QvAS7O9JQg0V2il1F3vreMQIGBEFROuvPJ7znURsLOfd
	 FGIJewKndXSgaDWb4pLhK/o3lsOs22q5AfWsnMlJ66Ay5N6TfE+v+B4pj7/X2FLp2Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AGUt+R8H;
	arc=none smtp.remote-ip=95.215.58.27
Received: from mta1.migadu.com (out-27.mta1.migadu.com [95.215.58.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCC606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FCC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AGUt+R8H
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NEZHan1kWUfbBPUsTRpDo31GyAtxZjws+3uudEspXMo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795085873; v=1; x=1795690673;
 b=AGUt+R8HGEz8/YXUw0vRo5bMDvpM3jUxG1bDOI4pe43HgH1goon5bu/ycRNK5RtvR0Z6K+p1
 lV0VwuSYJqIXelaaxYIRN1rbVYZO87nqCBg2tzPl2k9mCqanFGwcGt5oXUdd+6rIJRTVv42aCcw
 zEVMOGsAeK4jmGU/x7KmJYrE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d39bc78d310ad665;
	Thu, 19 Nov 2026 10:57:52 +0000
X-Mizu-Trace-ID: d39bc78d310ad665
X-Migadu-Flow: FLOW_OUT
Message-ID: <c86a3b79-353d-48b8-ac7d-eb87920feb66@linux.dev>
Date: Thu, 19 Nov 2026 18:57:40 +0800
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
Subject: Re: [PATCH v9 08/16] mm/mglru: lift youngest gen protection for
 higher priority
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: axelrasmussen@google.com, baolin.wang@linux.alibaba.com,
 baoquan.he@linux.dev, hannes@cmpxchg.org, hui.zhu@linux.dev,
 kasong@tencent.com, kunwu.chan@gmail.com, liam@infradead.org,
 lianux.mm@gmail.com, linux-kernel@vger.kernel.org,
 liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org,
 mhocko@suse.com, qi.zheng@linux.dev, rppt@kernel.org, ryncsn@gmail.com,
 shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com,
 weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com,
 zhuhui@kylinos.cn, sidchintamaneni@gmail.com
References: <20261114200803.23129-1-baohua@kernel.org>
 <20261114200803.23129-9-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-9-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:07 AM, Barry Song (Xiaomi) wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The forced protection of younger generations contradicts the
> goal of minimizing the I/O cost of reclaim. Under high memory
> pressure, MGLRU can repeatedly trigger premature OOMs, while
> the classic LRU does not.
> The problem is that aging may fail to keep up with reclaim.
> When this happens, reclaimers may all abort prematurely
> because they see only empty generations or just two
> generations remaining.
> Proactive aging does not solve this problem either. The
> number of threads performing proactive aging is limited,
> while the number of concurrent reclaimers can be much
> larger. This is a fundamental limitation of MGLRU. One
> possible solution is to use an aging lock. However, the
> aging lock introduces significant jitter under heavy memory
> pressure and has been reported to cause noticeable lags
> on Android.
> Furthermore, the generation-based reclaim model can
> conflict with the goal of swappiness, which is to minimize
> I/O cost rather than blindly follow folio hotness.
> The previous commit allowed reclaimers running at
> non-default priorities to reclaim up to `lrugen->max_seq`,
> while reclaimers at the default priority could reclaim only
> up to `lrugen->min_seq`.
> This patch further refines generation protection based on
> reclaim priority. At the default priority, reclaimers can
> reclaim generations down to `lrugen->max_seq - MIN_NR_GENS`.
> As reclaim priority increases, reclaimers are progressively
> allowed to reclaim younger generations.
> With this graduated protection, premature OOMs are no
> longer observed, while swappiness is also respected.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>   mm/vmscan.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 18cf1c084e78..b538abf02578 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4772,12 +4772,14 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>   	VM_WARN_ON_ONCE(!list_empty(list));
>   
>   	/*
> -	 * Respect the gen hotness distribution at low priority to avoid
> -	 * aging and scan cost, but prefer to satisfy the reclaimers request
> -	 * when under pressure to respect swappiness more and reduce IO cost.
> +	 * Respect hotness at default priority, and only reach into the
> +	 * newest generation when under severe pressure, so hot folios are
> +	 * not evicted as soon as priority is raised.
>   	 */
>   	if (sc->priority == DEF_PRIORITY)
> -		seq = lrugen->min_seq[type];
> +		seq = lrugen->max_seq - MIN_NR_GENS;
> +	else if (sc->priority > DEF_PRIORITY / 2)
> +		seq = lrugen->max_seq - 1;
>   	else
>   		seq = lrugen->max_seq;
>   

Reasonable.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

