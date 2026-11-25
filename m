Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608549;
	b=iXYw/KgECX2yR20sZrQQqg8tTwWjl+2WY8vyU4HKQLErqHqN6a5HnhLjcHWwA++mGNPv
	 1gSN8dhpm7B2eU82YFPY76aIEhqvOKNKzJw/s96oiICDedet6PQ1dPVICHcumtlbctV3G
	 eIHxUJZVX1XrdridBDdpon4T4icsPaaHuCUuvPBbpx44MiDtpo4b+79nQCW8DGmy3oCQt
	 lXWz1afJD1/panZsajMNu+qvkVqBsIyNk7PakDMzdxp5F5np3Ab+jQAMP395jw3rnmSbA
	 KSdZTHXy173ReUGZDSMDF14mB7LAnGIDXs2I216Pmu2SzrCNB37t0wDf/bC2v102NEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q+pas6iyIgctKAn1tCXhNYxNGSLbjoEgQaK/+oTuUAc=;
	b=BXdu8QC76qxBAoDzuyN3Yec8y+CB8NlXcVQi5PA8HCyvUl0WpC3Bvm2yTn1JQVa69juo
	 xxUeodZcahCVerA6/sqnK/2WOzpuAvWW+lsRFBzdCCBdJ/jZRHy3HGQsN0oGcFe6NXocT
	 EEfmmlmi5HJiZCzCyBh7JgBFQqWEbK06eqRiRlek+6O8Sv47NsArHQoCNmN61/ODz3GwN
	 KCKpfbubSd8pVqSEnY0gJcWgRDEAqGsE4ROT8g9oDp+6A4KdEJxTKpZrRFmFphQfM/x1z
	 oAaSoFdwnLHw/dx+oXHm2Ih4KZYsVS63r8Cy4/XCPEnwUAft/YhfOnpmN4y++SNxwbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTBGWGHM;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B8606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C80B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTBGWGHM
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49a357e48a2so423622f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608547; x=1796213347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q+pas6iyIgctKAn1tCXhNYxNGSLbjoEgQaK/+oTuUAc=;
        b=tTBGWGHM8E+gzVeGSjQnKU1H3VkHzPOVDxC+1S6hQdKhEDqDyka7RVDS1vuO2suFwx
         W1Y2WFGYTav3vLDw5NJQdkrPBv5f8yPEGXa3df2hv6uWaEiAr0aSKPtKS40ub5SKiZtx
         1qf8/fMFo4tlXbYikAnAVoHw4EBS3e0PS5iDFd2/V+j1zAkvYn/1gREyMzI+Xcrtg/fz
         gNw23KaV3ZeSrk2g4ijEr7jSqO3VNUV6ASUoSRjmiCAwazBQMmsH1cCyNFVoe7FOlEKl
         gwjozYUEZSoKOELJFbxoNJ42Wbu6MVtITKQZ/5nfTYk48f4CLwcDQU6U1I0camSVtGmA
         9rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608547; x=1796213347;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+pas6iyIgctKAn1tCXhNYxNGSLbjoEgQaK/+oTuUAc=;
        b=CTwtpcQUh4w4En7fVoBP9yvcOCOydZ9gd9DAPl/+ofz8s7goVuNWOGNzHVd6Mv/lLi
         RWgD3h8cSa6uDtb59My6MAkBOrPfHqP0S6bU9pt0ehRs2QLtvjVLCWHxzSgAIiqgKBlw
         spDBODBRPqQYRb2kRz+TDvZ6zWisiz5lcIIuylGV5s/4C71+ExWJfJm2KK/jZAvWBuTw
         8XwYS8daj+1cCf+rlHZYuDcXZF4QnmOVBGOUuICb4BOK0MX/8bLTfs2Hn4COpnlGkNkX
         3Cx5amob6GXY64UAJo5AATRF9D1R+hZAhoLLzNkI6iaVJHym5BcysI0qc7LBNJCQwg62
         3d6Q==
X-Forwarded-Encrypted: i=1; AL+hErE24teY4FnLMJxjqRu2FZP7d2fO+VYqzPsY2LTADH9M/6ZVUKvV057AV7qOuYoXeBlBMPPC9WuBmMF5kp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jYWxCeviuYxlBAC6dwuXIIp8GomOSmau1eM6IlQO0xjGzrRtM
	VBywlO9cdMkLYOq05FAwzckFD2umwLu5lqi6HZuHv3hCjvp5tOM1yEtl
X-Gm-Gg: AZFdTZc+ZPHCA9IrxQbr2BPY8Gde7OdjK+lG1v9H9VWhakCiRuE0oII8D3GNhLPLgWt
	eObE0uGrvc71JofDPjf2CfpgDdcGuS1hp9MTPWn8j1r6pJ7+zC+9BkVzy/iMoN6JXPO6sZulJcG
	68fGioYzRuPV7x9Jix2YqhJuX3hvj6SiXSCTrbs8JY4sodzaMpidoqg5uChw8dC3sNXXT1CfUO5
	gHzj4ufxK6SAnlCY0buGr2dn8hjq10exnCQqE/WZByXngOcP6Ct9qEaqSyPLM9S6cG8saWZQFj7
	K7R2y3sgrZmbd2Nco6mwWexj2BYitW5al0lh3FeHxUWbWiR3wXZ5xbb/26GO+AeHCj/QjXI71OP
	rtD20OxtxXbK5848oFTCkbedfsJPGnoKFgKms4SGBopPDyyFkX2tuZmUQJqhIij+PqYcs3+dJZ8
	i9Mmn83jouFrx7cxgVZi1BLw9v1IxPiIvOrsdcOUNDIVQdsXsBvm9M7/etCYk7d+5W5Q3gVK5X0
	OSaneXEDVLUJopveOCxXhdI9iA3VTnXl09ji5kLRDY2xdM2uMWZ1rBQUNhKcLOS2hh5/fwiXAN4
	rSdYEbpFcL3cHxxAGmUuxPYy45CbFKhzY96ksxee5GBTmL9ItgQ+LQHp9g==
X-Received: by 2002:a05:6000:2210:b0:4aa:8fc3:28fc with SMTP id ffacd0b85a97d-4abad0dedc8mr35898701f8f.1.1795608546671;
        Wed, 25 Nov 2026 04:09:06 -0800 (PST)
Received: from scheduler.schedules ([85.100.65.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm34561159f8f.53.2026.11.25.04.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:09:06 -0800 (PST)
Date: Wed, 25 Nov 2026 15:09:02 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Wenwu Hou <hwenwur@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, stable@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Wei Yang <albin_yang@163.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: Avoid counting sleep time as run delay after
 migration
Message-ID: <awbNyJl7j4z4wZ5H@scheduler.schedules>
References: <20261125115519.2373653-1-hwenwur@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125115519.2373653-1-hwenwur@gmail.com>

Hi,

On Wed, Nov 25, 2026 at 07:55:19PM +0800, Wenwu Hou wrote:

[snip..]

> Link: https://gist.github.com/hwenwur/61cf383f8df72d4270ad9918b1d4edc8 [1]
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
> ---
>  kernel/sched/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 515b9d0353ce9..043885c66365e 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2198,7 +2198,8 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
>  
>  	psi_enqueue(p, flags);
>  
> -	if (!(flags & ENQUEUE_RESTORE))
> +	/* Delayed tasks remain asleep across migration requeues. */
> +	if (!(flags & ENQUEUE_RESTORE) && !p->se.sched_delayed)
>  		sched_info_enqueue(rq, p);
>  
>  	if (sched_core_enabled(rq))
> -- 
> 2.43.0
> 

Wei Yang is already working at the same issue at here:
https://lore.kernel.org/lkml/20261122121823.2572209-1-albin_yang@163.com/

And here:

https://lore.kernel.org/all/20261024042753.2276779-1-albin_yang@163.com/

So I'd just suggest dropping this patch.
Or atleast working something out. Adding Wei to CC.


Thanks!

Kayra
