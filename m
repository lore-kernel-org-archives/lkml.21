Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413429;
	b=A2rBCjy3VIYqfwnsVPEb0sj+4nxMtpnsdBzmHTc7sgVTyVs9AcFXYGErID9IZPkwB36I
	 q2tuoduMQoPiK1yBUNeEgF7xLNP4i3/Ak9E1tcPrcbz6c4zTOxHeD1KLLaOXMyQGTKgRc
	 GT0xOa5JNHESTEM7ZXqQ+bl+AhS7BVr5wag0zYZnRklpfYVg62ZhKMrl1z2mb29PQ6+hm
	 TC3kg1BmbF+4sDyMJ5/5oBTOw3Jgh2S56PdcsBF0gRozo/NEGuA0PzDHtc1eOk3wPK4tV
	 rlIFJuKFmQNnHLchgIGn5rRI7ENBpUuT7qW4NdK1UoNS1SN7qZsv4lFDh4szMha0QyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413429;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VLBfrvYTChA3dFqQBP/M2npRQQ8sZ+YNEJQyuYJmyF0=;
	b=zDSjxi6sr0/5+NFs+j7+1AJnFAfNGOdTXBWycVNCECDjcV4N5ECJnh5rzV443AeTpyJY
	 cj1ap1JL05AZ6LHkdvQhTD3YcfmR8KA9i4Duspq2TZk7SVM9yPaMrdCCmIqHv5C6szxGu
	 4N/6Fn7JSrGVlEUzfMPrC0D4n4xX9qTbYggXT0ei5mn4gtC1DZ4i52UX/L5kKMbKMPP23
	 XFQsJYBsxN0rjC2Rk/Mdw/+FtwoOXHDiesJAj9llo39SM5YmZ4MVeX+Hc118cOT3qNft9
	 xmUvdz+fOmr1+wXAcAHuLJ0q7uw7GM+urSgA2Mhi+1AuTNTYDusg/nQi184IBABKX9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.49
Received: from out28-49.mail.aliyun.com (out28-49.mail.aliyun.com [115.124.28.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345DA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09214134|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0467983-0.000864812-0.952337;FP=10292264724248510578|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034017;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k87d-Ke_1795413413;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k87d-Ke_1795413413 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 23 Nov 2026 13:56:55 +0800
Subject: Re: [PATCH v3 1/3] sched: Give root domain moves their own
 sched_class callbacks
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org
References: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
 <20261120-bug-sched-fair-offline-active-v3-1-325e9eefa56d@linux.dev>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <a8196fdd-9b96-2479-9b5d-9bdc8be3cf7f@open-hieco.net>
Date: Mon, 23 Nov 2026 13:56:55 +0800
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
In-Reply-To: <20261120-bug-sched-fair-offline-active-v3-1-325e9eefa56d@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Qiliang,

On 2026/11/21 10:57, Qiliang Yuan wrote:
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8553,6 +8553,8 @@ void set_rq_online(struct rq *rq)
>  		rq->online = 1;
>  
>  		for_each_class(class) {
> +			if (class->rq_attach_root)
> +				class->rq_attach_root(rq);
>  			if (class->rq_online)
>  				class->rq_online(rq);
>  		}
> @@ -8569,6 +8571,8 @@ void set_rq_offline(struct rq *rq)
>  		for_each_class(class) {
>  			if (class->rq_offline)
>  				class->rq_offline(rq);
> +			if (class->rq_detach_root)
> +				class->rq_detach_root(rq);
>  		}
>  
> 
>  /* Assumes rq->lock is held */
> -static void rq_offline_dl(struct rq *rq)
> +static void rq_detach_root_dl(struct rq *rq)
>  {
>  	if (rq->dl.overloaded)
>  		dl_clear_overload(rq);
> @@ -3664,8 +3664,8 @@ DEFINE_SCHED_CLASS(dl) = {
>  	.select_task_rq		= select_task_rq_dl,
>  	.migrate_task_rq	= migrate_task_rq_dl,
>  	.set_cpus_allowed       = set_cpus_allowed_dl,
> -	.rq_online              = rq_online_dl,
> -	.rq_offline             = rq_offline_dl,
> +	.rq_attach_root		= rq_attach_root_dl,
> +	.rq_detach_root		= rq_detach_root_dl,
>  	.task_woken		= task_woken_dl,
>  	.find_lock_rq		= find_lock_later_rq,
>  
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 81a71aa5f094a..45d10334f7253 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2398,7 +2398,7 @@ static void task_woken_rt(struct rq *rq, struct task_struct *p)
>  }
>  
>  /* Assumes rq->lock is held */
> -static void rq_online_rt(struct rq *rq)
> +static void rq_attach_root_rt(struct rq *rq)
>  {
>  	if (rq->rt.overloaded)
>  		rt_set_overload(rq);
> @@ -2409,7 +2409,7 @@ static void rq_online_rt(struct rq *rq)
>  }
>  
>  /* Assumes rq->lock is held */
> -static void rq_offline_rt(struct rq *rq)
> +static void rq_detach_root_rt(struct rq *rq)
>  {
>  	if (rq->rt.overloaded)
>  		rt_clear_overload(rq);
> @@ -2626,8 +2626,8 @@ DEFINE_SCHED_CLASS(rt) = {
>  	.balance		= balance_rt,
>  	.select_task_rq		= select_task_rq_rt,
>  	.set_cpus_allowed       = set_cpus_allowed_common,
> -	.rq_online              = rq_online_rt,
> -	.rq_offline             = rq_offline_rt,
> +	.rq_attach_root		= rq_attach_root_rt,
> +	.rq_detach_root		= rq_detach_root_rt,
> 
> +	/*
> +	 * Move an online rq to or from a root domain: rq->lock
> +	 */
> +	void (*rq_attach_root)(struct rq *rq);
> +	void (*rq_detach_root)(struct rq *rq);
> +

The newly introduced abstraction function cleanly separates the RT and DL
handling of the root domain, while leaving the CFS scheduling class entirely
unaffected, resulting in a well-structured design.

-- 
thanks,
kunyu
