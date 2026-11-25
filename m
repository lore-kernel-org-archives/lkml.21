Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611945;
	b=nMDSHFgNLiSKggLi5W1ZTsEd2urN7yiBMS2zb2XZ4RLr+G0cYzUzQobCAsEV28mUeQ+5
	 /5KNNH41wZNGno5NSqEzmnSG+dNll+pTFrHF2LSNbj36gvZhy5FAxgC54urBODSiKIC4Y
	 orpCVY203xaBBO3lHuD34/JpuI/llYSqDXUgLXLoqeRsE/76aip+rgqzXWMskXi6AINZV
	 7WB9rpQMVP3SXnfHVhJYhS2q8LLGU1isEuo/aZmECIHqzpQczcangwHdUZr4Y3Fv/v2Lw
	 yuXsKME85Y7UjB4Dk+RO5bMjFxvg4LnV+9P7nVuvKMVXnl3pH0bmG8ShN107/06S84g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611945;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LU+lZMJ7C1LRaiuMHqC0yX/sKSPUmOi9g87GKed2nkY=;
	b=FfoIU00JdCKCoc1Yh8c6IzjVgqxnMf/ApPskcJsDKd/+emgCtlqq/JwDXTxiZmorPMH8
	 NzTDsg5E4DELQ6qvkj+DR3drutpko6HA60rap7v1lZKcm9RwLhQQfkR+z3Vrzpi7+j6Yb
	 UJCeFIes75D64+CTt5r3MMlx5eyhdRu6LCr0ZrV9x7CKrQuwddli+pDOhGiZfVQ5o2DNs
	 tXtM9JVZIjQ4jNjL5QKaymp24k1Qvq9e2DsNzCLuWLvRMX2Cowv6RCxNhBY6DdEWpeDt1
	 lXPEA23yOH1AUvqhGzA67dCXbV3TKwUYAhi6ik2iaYsFhWyg71ZBE75CnRmRFDWIQjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SLn9JtpM;
	arc=none smtp.remote-ip=95.215.58.176
Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10322606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10322606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SLn9JtpM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y5XrY5yN2GLoPwf0NATfst7wtuL8/+fZic3NtYnstlw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795611943; v=1; x=1796216743;
 b=SLn9JtpM/da0kdRqx43Tj38Oh6RATKdZeXmXESkjP7q0gPItn/S1a+qRjAP1khPxIKHp/F4F
 0eGDCfWdMJxdfGK7l7CAHiJ9zVMhhdsnEkVJCPR3r+ppFzH/vO3bxJTLBleRiP8ir+2BhtkOl8/
 ajiaURp/RUhZuiSExp/e9Nqc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4cf78b17849a4a84;
	Wed, 25 Nov 2026 13:05:40 +0000
X-Mizu-Trace-ID: 4cf78b17849a4a84
X-Migadu-Flow: FLOW_OUT
Message-ID: <47d6cfe5-f2a7-41d7-b397-df30429b216b@linux.dev>
Date: Wed, 25 Nov 2026 21:05:28 +0800
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
Subject: Re: [PATCH v9 14/16] mm/mglru: Avoid prolonged anon reclaim with
 swappiness=200
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
 <20261114200803.23129-15-baohua@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261114200803.23129-15-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2026 4:08 AM, Barry Song (Xiaomi) wrote:
> From: Gaofei Lyu <lyugaofei@xiaomi.com>
> 
> It has been observed that swappiness=200 can significantly slow down
> reclaim on some machines, with some workloads running 3x slower
> under MGLRU than under CLRU.
> 
> This is because swappiness=200 currently results in file_factor=0.
> Give file reclaim a small factor at lower priorities, for example,
> when sc->priority < DEF_PRIORITY / 2.
> 
> Signed-off-by: Gaofei Lyu <lyugaofei@xiaomi.com>
> Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>   mm/vmscan.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 6cb905162cba..abefd91f5b95 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -4898,8 +4898,8 @@ static int get_tier_idx(struct lruvec *lruvec, int type)
>    * We don't calculate the scan cost. MGLRU uses lazy promotion, which will
>    * cancel the scan budget naturally.
>    */
> -static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
> -		unsigned long total_scan, unsigned long nr[])
> +static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
> +		int swappiness, unsigned long total_scan, unsigned long nr[])
>   {
>   	struct lru_gen_folio *lrugen = &lruvec->lrugen;
>   	u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
> @@ -4956,7 +4956,12 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
>   	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
>   
>   	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
> -	file_factor = (u64)(MAX_SWAPPINESS - swappiness) * refault_rate[LRU_GEN_ANON] * file_weight;
> +	if (swappiness == MAX_SWAPPINESS)
> +		file_factor = sc->priority < AGING_PRIORITY ?
> +			      refault_rate[LRU_GEN_ANON] * file_weight : 0;
> +	else
> +		file_factor = (u64)(MAX_SWAPPINESS - swappiness) *
> +			      refault_rate[LRU_GEN_ANON] * file_weight;
>   
>   	/* Cross-multiply the ratio above. */
>   	anon_scan = mul_u64_u64_div_u64(total_scan, anon_factor, anon_factor + file_factor);
> @@ -5144,7 +5149,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
>   
>   	total = apply_proportional_protection(memcg, sc, total);
>   	total >>= sc->priority;
> -	lru_gen_balance_scan(lruvec, swappiness, total, nr_to_scan);
> +	lru_gen_balance_scan(lruvec, sc, swappiness, total, nr_to_scan);
>   }
>   
>   static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
> @@ -5910,7 +5915,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
>   			return 0;
>   
>   		lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan, sc->reclaim_idx + 1);
> -		lru_gen_balance_scan(lruvec, swappiness,
> +		lru_gen_balance_scan(lruvec, sc, swappiness,
>   				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
>   
>   		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH, NULL))

LGTM.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Thanks.

-- 
Best regards
Ridong

