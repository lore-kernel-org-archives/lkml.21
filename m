Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659426;
	b=FVsXHUEjPRjqifpaXqbOOmoTUJfzuRrFWPSq8PdLo7zpvG8mgImJMFKtflF0lRzgxHbR
	 7NCo+xKckjAIdyHtmhqsWyyVZAOvwI0LcLLXN39aTttPmT7Ex8uH6VCAhG7G7lL7vYl00
	 DhOeE6DRSa760aaN7N64m5XQrUzuTHNT8kNm0QBoHUdq+pxDA4Ssd/Ljmq3LzTxME7x1t
	 IECfuJ3Nj+/xUI1HC7v2zOtDzM76JsM28CwflhJKboU6niXkNg8XDKdpxmTM0NYC2jhCB
	 X1bBJFNOk884BMlnjZuR2Jz55CjqeOJpM4jkViuGNkqym9KGBIMnjCqA53Bdlm40X7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659426;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7D1KDwdmyMYWSbEwbcIhiAAhhVSggZqewSdyEuJmEQY=;
	b=kbv/Vbzs91qETU2OprI+0edKy0bNXHccjnFKVCjvVr9cKHpJHn4Y/vMdJPPnVQJY5yh2
	 +OubgZXwVWtufS80zrEkAI8K6aOsR/YR0E/MdSXKFwr3j373xkkBoWY03OnRoSaWiExd6
	 roY1WXglOjU+HSpA+7dLVeIoCoxo/AUWsWIfuVQf8DuWeOR4/aspWOmowGSWWQXw5aSkG
	 JhBs6MkJWJh1kMaicDKmsZqlRsOTzgQGrHtAq8pcbktsJD4TOxhiA3L3KttCb4jibDiZi
	 qhgoWGUEKoN0bWsc6qwz9JOuslo8EPqUkS8A7SNj7WG9VwRFseYCsyhyZkTXFZ7QTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.51
Received: from out28-51.mail.aliyun.com (out28-51.mail.aliyun.com [115.124.28.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CF8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CF8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07445636|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0228038-0.000245648-0.976951;FP=1913840856086432982|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045099153;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.kAFFSgn_1795659411;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.kAFFSgn_1795659411 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 10:16:54 +0800
Subject: Re: [PATCH] sched/topology: Count LLCs per node from the sched groups
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>
Cc: linux-kernel@vger.kernel.org
References: <20261125-feat-sched-nr-llcs-v1-1-05f8e23a5f8f@linux.dev>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <71dc8425-c2bb-72ed-2627-186b6168d84e@open-hieco.net>
Date: Thu, 26 Nov 2026 10:16:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261125-feat-sched-nr-llcs-v1-1-05f8e23a5f8f@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Qiliang,

On 2026/11/25 21:19, Qiliang Yuan wrote:
> adjust_numa_imbalance() sets imb_numa_nr from the number of LLCs under
> the LLC's parent domain, so that tasks spill over to another node only
> once every LLC of the local node is in use.  It estimates that number
> by dividing the parent's span weight by the LLC's.
> 
> The division assumes all LLCs in a node are the same size.  On a Hygon
> C86-4G 7493 each node has four CCXs of 4, 4, 3 and 3 cores, as two core
> slots per node are fused off, giving LLCs of 8, 8, 6 and 6 CPUs out of
> 28.  CPUs in the larger CCXs compute 28 / 8 = 3 LLCs and the others
> 28 / 6 = 4, so CPUs of the same node apply different imbalance limits
> at every NUMA level.
> 
> Count the parent's sched groups instead.  They are built from the child
> domains, one per LLC, before imb_numa_nr is computed, and give the same
> count as the division when all LLCs are the same size.
> 
> imb_numa_nr per domain on a KVM guest with that node layout (2 sockets
> x 2 nodes, SLIT 15/25/27, fused-off core slots offlined), read through
> a debugfs file added for the test; change is for the 4-core CCXs:
> 
>   domain (CPUs)  before, 4-core CCX  before, 3-core CCX  after  change
>   NODE (28)                       3                   4      4    +33%
>   NUMA (56)                       3                   4      4    +33%
>   NUMA (84)                       3                   4      4    +33%
>   NUMA (112)                      6                   8      8    +33%
> 
> Fixes: e496132ebedd ("sched/fair: Adjust the allowed NUMA imbalance when SD_NUMA spans multiple LLCs")
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>  kernel/sched/topology.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 99878da03bce7..7efb2cde5534f 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -2893,8 +2893,9 @@ static void adjust_numa_imbalance(struct sched_domain *sd_llc)
>  {
>  	struct sched_domain *parent;
>  	unsigned int imb_span = 1;
> +	unsigned int nr_llcs = 0;
> +	struct sched_group *sg;
>  	unsigned int imb = 0;
> -	unsigned int nr_llcs;
>  
>  	WARN_ON(!(sd_llc->flags & SD_SHARE_LLC));
>  	WARN_ON(!sd_llc->parent);
> @@ -2918,8 +2919,19 @@ static void adjust_numa_imbalance(struct sched_domain *sd_llc)
>  	 * enough logical CPUs per LLC to avoid SMT
>  	 * factors and that there is a correlation
>  	 * between LLCs and memory channels.
> +	 *
> +	 * Count the LLCs through the parent's groups, one
> +	 * per LLC, rather than dividing the spans: LLCs
> +	 * in a node need not be the same size (e.g. when
> +	 * some cores of a CCX are fused off), and the
> +	 * quotient then depends on which LLC the CPU is in.
>  	 */
> -	nr_llcs = sd_llc->parent->span_weight / sd_llc->span_weight;
> +	sg = sd_llc->parent->groups;
> +	do {
> +		nr_llcs++;
> +		sg = sg->next;
> +	} while (sg != sd_llc->parent->groups);
> +

I have a suggestion: add a static key switch. During scheduling-domain
initialization or rebuild, if an asymmetric LLC layout is detected, enable the
key and take the new code path. The key is disabled by default, so the original
code path is retained.

>  	if (nr_llcs == 1)
>  		imb = sd_llc->parent->span_weight >> 3;
>  	else
> 
> ---
> base-commit: c47af85667065c6dd5b79564203c2d29948ef60e
> change-id: 20261125-feat-sched-nr-llcs-a1a82664eac0
> 
> Best regards,
> 

-- 
thanks,
kunyu
