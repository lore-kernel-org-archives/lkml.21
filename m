Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771986;
	b=AZHL3SPmvjE453/DQ/G6dn8gY+1kBLDZGl+gSKda4JMZQ1AZfGnrBUQQT7QsZ2NDyBdT
	 Cbf60u7ykCkCw8ov+abT5cgaMbKM7fkqlREkZV8rvMr/yYMN8DRQHr9wGoWyemCM9Yyhz
	 i2caeENWiFn7oowAuqe0CbcIW0HMvRB0a/HWbe9a3UDyd0lBQ1JRImNbUNCBKnt9KigKU
	 58u829sOpHIgaKEjUp8rM7jkLyjB1cteD+BIhLodCWDg0I833e65sKggpBvjCWWYu78SO
	 OSjOBgD0qRiu4DqQBHcXhqvquWsXXdv8LnOXsWJKeRU4oX0K4RtTFrXmFw9zeghxVRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y2BhRCymTpOTyQSO9s2aQmbpmiaKmr8nd/v0xMMqhEY=;
	b=XDLMflmg6olAb2BcNq6pRP4wBPEHgDtE3vONNp2WlbePZsjyHxOsNiXlekShcq9553Dh
	 1kpJ9wPH5tTw64IlNeo8lfHMelIY8PVmTYw8xrI3JGk4Q7kcwvK9FZ5+OC0lQhKDPUBEh
	 0ndpZVmJrA7z8esxIQyywjT+rSJCiAKexLjSB+EaXIMR9rNcV9FXlKnWWpo4hBxUpyncc
	 aKlRIoFK8yeR2zPpFUiqwlP2u2jQy9DYhZQ4TXDX6054v0gQRaWMR1Lu8XoQIlHPw0Vq5
	 rgrhz64bC9UVuKc8XDTi8UtlVBC0H3vKHigE62QXSNGJFINbv4CRm0nXyRld3d09uwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOzhw8Hc;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOzhw8Hc
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so562342f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771984; x=1796376784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y2BhRCymTpOTyQSO9s2aQmbpmiaKmr8nd/v0xMMqhEY=;
        b=rOzhw8HcLpT62bCli917E/ZbHdvWXBXvbkbJS1FM8QDt2JPaFh03u6xy9bzh4O28Nz
         EWcVswL/bvN5E/YBjq5wZ53GwyFyHpeANg/tLd475GDo5I+yD/yOpi4cEMrQWYf5YWpF
         9wB+Vtx4KoR0pZvGeLf2ztEVCLbpPs9oTh1kcBrxHu8tD5fsuGKmuylV+/H2BTQJW8Qk
         1Rh9rB7LZHE8R4SiGn/pJiXgM/UCebDr3jlYGWi+UeMRS+Xc4qCXFcvC1ETfjZw9Kzt2
         LVVviY4Gsv70olJxb48o9uPOAQOa2Wh3AMWoPp4sHG6VpLmzuhUPVA0HKv1V35xx8TCz
         a6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771984; x=1796376784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2BhRCymTpOTyQSO9s2aQmbpmiaKmr8nd/v0xMMqhEY=;
        b=jv5tkpbxX6h7oTJAZzRvP3UWqRxwl81AtTEaavfoNzaKJJfIO8uxPqgaQUFW2Azl6b
         7zcQaoZQWsQA1DBYW3uY/jjAFWqYMdC8lL8WuN8a4z5GXXIcEvYRimb+1zbK4HlzyyW9
         j5R2TMlyJHW0xBgK2YnVoaJ+S9SixnWRp2IvR2PBoNt5hmeJTZZBehuOfJOffMOGs6e3
         MwAfSNfcI9zqao7nppJkjLrL8GzEssS8L+3eZEXCRQW98q/LK72rtksXNPaRZ7mmEEOB
         H6bwiw8mPMtYrgd1ZMeduNP1TXlWh22S6W5kSh1+Z5vqL9dWY6ntDkmvTfso9oHGEcpc
         1+BQ==
X-Forwarded-Encrypted: i=1; AL+hErGWveJRoSZMUl+n/Ib195WhHgrnVqkd8eld1XGuj5UIhcy1P1X4U0MNJm9b+sfrEDO1jfkMzTFxCzquoRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JxsY3r7lE9/TkPZIuV+voqNaltOF9RJ6KAqlvNfQ32POxqOnB
	rMSKMIYsUsl0gCd/a15j7Vd1l1JMVpI9tlkyMujdcpyWG3iimnzd/CDr
X-Gm-Gg: AZFdTZcYGd9BHLbveH1Fu58FjI/jsXTpuQzZXDywe2E4VQ6/ujjFc0TeWAXaCJ/SAlR
	hUh7NjmMTxpViXfZhbyZCv4Dgqo1qnocIAAdeWtE7XVxkdvmJ4BNowuy59YpXYGEKaeBZth5wXT
	6MDtlVWE2ai/TVPRarCxP8fvUrhgDMRvXMhMrUms0tjyfTz1TF0REYWgEQKA8GMolmhI9n+ATdR
	A3xxIa45TnrdJ67+TyB96s2CcGOwIPbcR8WBBzoPVb0ly85BIamBczpIRsRMiB29TBnPU/VGtDA
	Q/9LGRImBNumMqN52D2Pq362Df22fVcw0oFlYv4tOEGUbnOwe4g0qLzj89lUzoiGG01l/iXugT8
	TKeA9E4BqlNHadIAmCZKu2JfV5tZWBoozCcmcU27iMu0mkIc1AtqMi3jC4QrGKPvao7fw6le/tc
	5g0MCrAMPSsWSIkTq9C+w124tGEcrsdW+0Hto//H+e/hvAl/B8pLBuv5NkbrcH58S728FWpxdQA
	3311JInSsCQIIVNN5mchEhD/aHXVTiCaDeHWnqMcS//MCWXOHq9j1wxziJ5ln2tZoOzvK1K9F2a
	+3tkUQAZAoe5qjI2x6oc5wnvBLLzw6myfn+xDBJkoxx38RerzjFy6gWQ
X-Received: by 2002:a5d:5f93:0:b0:48e:6675:3a77 with SMTP id ffacd0b85a97d-4abb400ac51mr45532503f8f.3.1795771984287;
        Fri, 27 Nov 2026 01:33:04 -0800 (PST)
Received: from scheduler.schedules ([85.100.65.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm38651647f8f.46.2026.11.27.01.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:33:03 -0800 (PST)
Date: Fri, 27 Nov 2026 12:33:01 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Simplify pref_llc_queued handling in
 account_llc_enqueue()
Message-ID: <awlMqTZK8_0gmSMC@scheduler.schedules>
References: <20261127091146.3504-1-likunyu@open-hieco.net>
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
In-Reply-To: <20261127091146.3504-1-likunyu@open-hieco.net>

Hi,

On Fri, Nov 27, 2026 at 05:11:46PM +0800, Li kunyu wrote:
> pref_llc_queued is only used once. Assign p->pref_llc_queued directly
> at the original sampling point instead of caching the value in a local
> variable.
> 
> Suggested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> Link: https://lore.kernel.org/all/awhlwJTOLPeNqFW8@scheduler.schedules/

I didn't really suggest anything. I don't know which part of my mail
was a suggestion to you? Maybe below code is correct but I didn't
suggest it. So please remove my tag from the patch.

> Signed-off-by: Li kunyu <likunyu@open-hieco.net>
> ---
>  kernel/sched/fair.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..4efc5ed5e79f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1521,16 +1521,13 @@ static void pref_llc_running_dec(struct rq *rq, struct task_struct *p)
>  
>  static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
>  {
> -	int pref_llc, pref_llc_queued;
> +	int pref_llc;
>  	struct sched_domain *sd;
>  
>  	pref_llc = p->preferred_llc;
>  	if (pref_llc < 0)
>  		return;
>  
> -	pref_llc_queued = (pref_llc == task_llc(p));
> -	rq->nr_llc_running++;
> -
>  	/*
>  	 * Record whether p is enqueued on its preferred
>  	 * LLC, in order to pair with account_llc_dequeue()
> @@ -1545,7 +1542,8 @@ static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
>  	 * p->pref_llc_queued in account_llc_dequeue() would
>  	 * be reliable.
>  	 */
> -	p->pref_llc_queued = pref_llc_queued;
> +	p->pref_llc_queued = (pref_llc == task_llc(p));
> +	rq->nr_llc_running++;
>  
>  	/* Skipped while delayed; clear_delayed() adds it back on wake. */
>  	pref_llc_running_inc(rq, p);
> -- 
> 2.47.3
> 

Thanks,

Kayra
