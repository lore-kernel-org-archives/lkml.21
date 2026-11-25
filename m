Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612080;
	b=sAUkCK8TW/7XYBg+7GDTj4R+2W1GWae9cRCOd1ln7AHZBb2sS3a1xOY7Pe0WK6Zh738O
	 5yEIzj9i6bAQ5dIk8oH/00wz+0PxwyTjm1g5PVJ6MQfJVS+RZB0qJriam5jd62w7jplfz
	 2oK6ppvYeXWktAn0+Q0zcBLFRytf4rWgC7ugVL2uM4xZjT/RHBt72PiFqnctmg3gOqrPm
	 AVCbbxc1qhqqgHgbPRg0Zd+gcu4EYRySL5bv1KeAEpmhebsqY1epwKC7VkaoG8vo2p3p7
	 P3r5IX4X8uqRRHF5DktscTi083a4ObQqgLydhkhyIPFvJAsU+Seu3Smr5GDS5+eJDKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612080;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=q0DEdpN3ojeKgoLctDTUtNsR/rNFWVH2tWR5Eb+4pvc=;
	b=IHJgu6cN3SP6Qr4SHwSmj1+f6rk5a/0+zD2eBZw/6/gCvtfvzbN5VvHZR18nrOe67qXv
	 BEpCu49PlUsbukMyN+z7v5WyFeta78BeUhRD53cgeJkENopaSfsdlKN1MFQxZXnvdRGCk
	 CP8M8i87c7h1Zjp4pGSeB+DpboiBFB0WeSgRfE6gPuzD+1AS4ZHIAaXSH/FQT+5qRrRNa
	 Xn5HdVC5beTw9GQH3Xm+vc4bZkDZ4LylZ4H1FEZhofT6JdGPzxVF1X9GuZB/eGrPI0LAM
	 wafFq6Kk0RvMb/trZ5Hj1PDBV87r2sZlHkTXbHkXkwDU3e1XZBZtkQTSr51DFPUVdww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="cBqN/ScR";
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED6606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53ED6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cBqN/ScR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KavEao8O84ypd9lQF6n7cjGolI9drRYJL3+xCTQEsiw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795612077; v=1; x=1796216877;
 b=cBqN/ScRkVwyzquPAkuANMSGbAus36I+6jwrY2z5grU4XCfAHE+gM0MOs+gBKh8S6VChz4Oh
 rXAqN0H2gDKkbMXrnzyuP+gWVsuiQCzOMwdm+D2vik+Y9wa4+7fDUFWn+EUb6uiecTuOES6VNs8
 WqK9m7fEG2AP+vgHPrUl+LoM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b2a14b8d26fc06d9;
	Wed, 25 Nov 2026 13:07:57 +0000
X-Mizu-Trace-ID: b2a14b8d26fc06d9
X-Migadu-Flow: FLOW_OUT
Message-ID: <c76bc990-e5e8-4058-ad80-3a766a162b0c@linux.dev>
Date: Wed, 25 Nov 2026 21:07:45 +0800
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
Subject: Re: [PATCH v9 15/16] mm/mglru: Make swappiness=1 file reclaim more
 aggressive
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
 <20261114200803.23129-16-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-16-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:08 AM, Barry Song (Xiaomi) wrote:
> In MGLRU, swappiness=200 favors anon reclaim, while swappiness=1
> favors file reclaim. Swappiness=0 allows only file reclaim, while
> swappiness=201 allows only anon reclaim. Thus, swappiness=1 and
> swappiness=200 are counterparts for file and anon reclaim,
> respectively.
> 
> Before this patchset, get_type_to_scan() always returned
> LRU_GEN_ANON for swappiness=200 and LRU_GEN_FILE for swappiness=1.
> 
> For swappiness=200, file_factor is set to 0 at higher reclaim
> priorities. Similarly, for swappiness=1, anon_factor is set to 0
> at higher reclaim priorities. This makes the two settings behave
> similarly, although the thresholds differ slightly based on
> testing.
> 
> This allows file pages to be reclaimed more aggressively and
> benefits workloads that prioritize file reclaim by using
> swappiness=1.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>   mm/vmscan.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index abefd91f5b95..a9b97d23838b 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4955,7 +4955,11 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
>   	anon_weight = nr[LRU_GEN_ANON] + nr[LRU_GEN_FILE] / size_bias;
>   	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
>   
> -	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
> +	if (swappiness == MIN_SWAPPINESS + 1)
> +		anon_factor = sc->priority <= AGING_PRIORITY ?
> +			      refault_rate[LRU_GEN_FILE] * anon_weight : 0;
> +	else
> +		anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
>   	if (swappiness == MAX_SWAPPINESS)
>   		file_factor = sc->priority < AGING_PRIORITY ?
>   			      refault_rate[LRU_GEN_ANON] * file_weight : 0;

LGTM.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

