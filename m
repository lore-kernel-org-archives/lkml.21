Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414458;
	b=HuxVsVUpAgk58pwZli6zJs4trT0Wo+8SIU/PQGrFt6FOeF9PR0vO9Jh45qbR+u5zHQvp
	 O+4hGkqNwPA/lYThw4eduHLTOvCM30oCPJqKuX8ntuCgvif8b4RCLWZeFueHWf3nLJ04/
	 Q12C+etNQDPw0la7WRu58iPmA9L+qh5V3gUb2Qx6hUec3d1DH70jMWGNGUv76oERlqge2
	 syYzcXisy4/qZ6SjOY5Kr/7BfjeNGSRLC7Jzum/syaf3XflNuF/nxtrXUuftMv9sGo6qr
	 1Gy0FEUPpAALKcpSIkOeHvi4sAL4ra5pXoa7zb34TEtfetFZ5uCH7qCZ8BCtLNODJHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414458;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SHhqxyIvi1H8U2rpd4aCXqvgpSyP2JDBne5lwDZqiDA=;
	b=GaXp5JK37lWOT3XzzrEfTWH8TN8e17eWLM9pwfTf3lOhakmFH6EBO8JSN3FY3vhQysQi
	 +uYiHrMsT9owp9RlWDpwFB8d0Tw8L3JSoQusKn4p5fUuuKe5F9x+qZvYZqb6ylP0KYJhi
	 sxAzubEuy8sszgO+cgAKJ3orA+eXrwD/GKlv0nEDegkVxMMPmKzn+qAoPv3ZR6KTqFAAi
	 EagubSgc1DeP9pe7I1sLKHEHsD62JmOf4d2MGBllbDkN4ZrTeI1YqpmO5bCEbRRcWDAph
	 /eJBgAQ7g0sn/yDD24xxnZRE5bUlXG7Djae1Z1+LPP44lkadsniKTztEyAzJM1Wj5iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="i/VbpO73";
	arc=none smtp.remote-ip=91.218.175.4
Received: from mta0.migadu.com (out-4.mta0.migadu.com [91.218.175.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i/VbpO73
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8leuJkCR02HJkwbVtT7h+Y6uZAx1n0OSx/Rh8/dbJII=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795414454; v=1; x=1796019254;
 b=i/VbpO73YPgCx/M9LcFeekAOXziWLmth0/Wohodwa4gJorzoO7dRmGN3mxbqFurtSLJfCt28
 bWs+XF1pU4aiAp41r2mlVqo4iAeRfxqo0f35GqzuqfrbOT3gohmEily4CRtcvqZZ0pT0VVUG7vi
 5+G0IVd/U0Hn+i8oufECMbdY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3a93840281764757;
	Mon, 23 Nov 2026 06:14:13 +0000
X-Mizu-Trace-ID: 3a93840281764757
X-Migadu-Flow: FLOW_OUT
Message-ID: <00efba16-87da-4fb1-8da9-2fe554a6eed9@linux.dev>
Date: Mon, 23 Nov 2026 14:14:06 +0800
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
Subject: Re: [PATCH v2] mm: shrinker: stop counting when the seq buffer
 overflows
To: Xuewen Wang <wangxuewen_ky@163.com>, akpm@linux-foundation.org,
 david@fromorbit.com, roman.gushchin@linux.dev, muchun.song@linux.dev
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Xuewen Wang <wangxuewen@kylinos.cn>
References: <20261123055020.287151-1-wangxuewen_ky@163.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261123055020.287151-1-wangxuewen_ky@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/26 1:50 PM, Xuewen Wang wrote:
> From: Xuewen Wang <wangxuewen@kylinos.cn>
> 
> The shrinker debugfs count file uses single_open(), so all memcg rows
> belong to one seq_file record. When the buffer overflows, seq_file grows
> it and retries the entire record. Queries for subsequent memcgs in
> an overflowing pass cannot contribute to the final output.
> 
> Stop the traversal once seq_has_overflowed() is true, using the existing
> mem_cgroup_iter_break() path to release the current memcg reference.
> Check for pending signals first to preserve the existing -EINTR
> priority. Leave the overflow state intact and return zero on overflow
> so seq_file can grow the buffer and retry.
> 
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
> ---
> Changes in v2:
> - Move the overflow check after signal_pending(), as suggested by Qi
>    Zheng, preserving the original -EINTR priority.
> 
> Retested in a single-node KVM guest with 1024 cgroups each caching 16
> ordinary files on ext4. Output remained 8865 bytes with three show
> attempts. Count callbacks fell from 3075 to 2472 (19.6%). Six fresh
> guests per variant each performed 101 full reads with no probes
> registered. The median of guest medians fell from 127.8 us to 114.0 us
> (10.7%, about 13.7 us per read).
> 
> Output matched byte-for-byte across the tested guests. Small reads,
> seek-to-zero rereads, populated memcg teardown and signal stress passed.
> Separate probe runs had no missed or dropped events. Small/sparse cases
> had unchanged callbacks. The 64-cgroup baseline timings were bimodal,
> so their apparent timing difference is not attributed to this change.
> 
>   mm/shrinker_debug.c | 5 +++++
>   1 file changed, 5 insertions(+)

LGTM, so:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
> index cafb566301326..eabdb33353a45 100644
> --- a/mm/shrinker_debug.c
> +++ b/mm/shrinker_debug.c
> @@ -84,6 +84,11 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
>   			ret = -EINTR;
>   			break;
>   		}
> +
> +		if (seq_has_overflowed(m)) {
> +			mem_cgroup_iter_break(NULL, memcg);
> +			break;
> +		}
>   	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
>   
>   	kfree(count_per_node);
> 

