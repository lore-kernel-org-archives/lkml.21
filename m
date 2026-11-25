Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611648;
	b=o9+UYEHj0cpvNIW+TEV6Fb71xpAcMRYz8ddoWNoVEg/a4J4K5KSyGRJO2V8260PCMDSt
	 166eZCrtLreWLZ310G3WO6ATp5gf002Yv9hdREuVdcFvUbOOLN4lJ6+41Wv95uDT2Wdoy
	 sr1HzYc3PJy01bfUrAp7798bLMCZMBQfyE31aAzrqf05I7uizebLLqqlGNQUoAqNWwvYt
	 348xgYJbzX3JEUvUAaR/FQx5l+sR4S5INN9AP9Y33N7NePc3GWHWsMemjt2XubP6/EGPi
	 XGnwaOD7VuL1QqQ+MTVy6TEHs0p3KwkeYEL8DkdFZbWcRUcUdcYnzAoq0i4KrVTkONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611648;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OFy3WviaYP7EOH8706hEhHzhb+EluVzWS5SXIUBm5Ig=;
	b=GoRmbPAeimiLuEOQJlGklw8almEjbwah3Y35n1qcB5IWTf2JOqX4Av9CMYhevzmBMHwj
	 02rQ7zRK6WFMcmmUoSEmVnfcZ+gGSqLZkLn7kWj4gcMIU5XWyQMn52AZ1VwoCamRgoi16
	 osO24YeqznbhgzdfwKw6r6SiYv2xZI3upuhtmoEaO6bdCrdHT3eIQUpSLBW21VZOd6wt8
	 f5/usAhvmd8xRbEcQjkyR0mwoX0I3kMa2+t8OGAAS0mYEPGXLlScj7E4wQV4ShwphKT1N
	 Qh/3x/1D+eXvGT++jG0tTfT4Yv3Tvd2YuaPpS4otBzUjHBVPINP/K0IVLTBeUe0VCHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bb9yHVjF;
	arc=none smtp.remote-ip=91.218.175.201
Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE21606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bb9yHVjF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=v0ANhT+rIRKj1GNWz5h+Zv0aeoPAdiTKhvM8PO5u0YA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795611645; v=1; x=1796216445;
 b=Bb9yHVjFdob6NcRMsFr+aWSkdkbZbkoAdqJgCtDJi5PMYv4ET95KFem2cc6huMXFMvcUt6YL
 fBZvryYhp79hjDdvHpPFWgwzSBLr8AZRZEJ11R33eNflySgHn385prS3BH/JseXGvcfN14NiA3i
 jFsVvWMGyeTo/laJgACgo3AQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0f1b50c62d71d176;
	Wed, 25 Nov 2026 13:00:40 +0000
X-Mizu-Trace-ID: 0f1b50c62d71d176
X-Migadu-Flow: FLOW_OUT
Message-ID: <3b42b905-ee4d-4c0d-a266-abf27bb10bf4@linux.dev>
Date: Wed, 25 Nov 2026 21:00:29 +0800
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
Subject: Re: [PATCH v9 13/16] mm/mglru: Reduce LRU lock contention by
 shrinking folio batches in inc_min_seq
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
 <20261114200803.23129-14-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-14-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:08 AM, Barry Song (Xiaomi) wrote:
> Reduce the number of folios moved from the oldest generation to the
> second-oldest generation in each batch. This shortens the time the
> lruvec lock is held, allowing concurrent LRU operations to make
> progress and significantly reducing LRU lock contention.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>   mm/vmscan.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index c9e22a5cbb51..6cb905162cba 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3914,7 +3914,7 @@ static inline void flush_lru_batch(struct list_head *head, struct list_head **ba
>   static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>   {
>   	int zone;
> -	int remaining = MAX_LRU_BATCH;
> +	int remaining = MIN_LRU_BATCH;
>   	struct lru_gen_folio *lrugen = &lruvec->lrugen;
>   	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
>   	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

