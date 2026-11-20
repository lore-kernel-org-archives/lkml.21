Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172577;
	b=PxoqV5yd8P22bHu4y99xw9+FrRfTArmvSpe1AWHt0O9NJvqySgW75ijYSgXbJtt/VKMw
	 iNlYZRI02FUZgWvuWdt3U/pDHNPGn4v2+BPzOwFCQFRXIqMw2xZu7J7NWVhPbQqISSGwv
	 sc8zb0ZmutXpcmlPUCOvbPdbjdvUNAa92nEyWOqJE90DkzBHSbzQ3nnHKAww46qM23Hhi
	 IkWPcUpVJ915xwSVfLd6+7p6WoUUnGEVzElyimvtCJ45ZcVlKBiGBkU6jd1Sgd6KwB5cY
	 0QMGXH85SbcCOYAE7gJXqNJiNYvEG2JW45nP3VDC0twOljjVn+nxlrcaz3Jrcgz8FJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172577;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=im0ltq50/KSybOcmritrJQSYRa5olV0+4jWOegQZ6o8=;
	b=UYF+M5j0NfYNTpw13YgWLkHxqTAPt/4eiWnXypX0fuq807nrLFy2QsTNo6W40j5DJXxG
	 phhW7qLrUhmT2UWzmV8c3HHk3yA7Ybu4e0bHyAdRTh/kL+j1BR30WYst3CZ4OH84ywPvU
	 sv4TEKZJNlkUJakY/jrDtzGWIuUAKuvQMDRyhgEnkHSMhVX5iXGqI+wYzZfoF25Q0E443
	 3ny/kWpx7ErqCYIV2uLJbLOCE5NqIvG8D4H4etYBfCB/VO77j0iEap81nV2MaiWM3Mfex
	 Ad1O2hat5EavJxJeaX/EpA9UPXGG3EoG5lCz7sE3NL91pIGnunmfRL7kjOLLNZg2UPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hIXPY2FI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="LmrTF0q/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57479606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57479606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hIXPY2FI;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LmrTF0q/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795172575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=im0ltq50/KSybOcmritrJQSYRa5olV0+4jWOegQZ6o8=;
	b=hIXPY2FISdutAbg1s9qFdDlxKEz+SvvTxSIem6K7IW4jskZCgo9aohZXzIDdl5YKJ+BSKo
	7GCwybEWPMPD1VMoSeZGRfZflTWhtxJ4BxnzNDcYZxjSNczcECG/9983gQeFrFJxymZFFN
	6HvZI6+MpIj1zYgU+IVgmCiV8IfGPw0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-PE3XBMgmMtu53IKpanw4mg-1; Fri, 20 Nov 2026 11:02:53 +0000
X-MC-Unique: PE3XBMgmMtu53IKpanw4mg-1
X-Mimecast-MFC-AGG-ID: PE3XBMgmMtu53IKpanw4mg_1795172572
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso405127f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795172572; x=1795777372; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=im0ltq50/KSybOcmritrJQSYRa5olV0+4jWOegQZ6o8=;
        b=LmrTF0q/SQ/RISFGc4Jw0zWY7fgNd1OQ5F2YsSviKdMWJbAJTiMDXUAgoesXPqx7TN
         vd5grpeOs2F6/UtRkKf/d4RxveCSURDAK1CFVimQgM355vjkuX9UaDRMfDSBL69ePm9F
         V5/1AXHRg4A2cnd4mNQ3UrXg6L9qO9wRguzAzZkh1JT28LbssSMD/tXjtcbWc+ZFJmIK
         S1IJxtHlHPUd2DN8bJG9qpZdQsRdnN64UBmipyjBGy3Rnv8uoYTVriB5mpIRYQc3gzpN
         jkO878sOeumvDgo3OT8pqNLXiisPrfgZA9cC8RH0HSvelT6t7WvzD8BlEeBI6QR3vrog
         LVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172572; x=1795777372;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=im0ltq50/KSybOcmritrJQSYRa5olV0+4jWOegQZ6o8=;
        b=laGa3X9UvGFvE80SbcDf8Z4CJf6FLquP8SXknGCT6lDSNxpXRwIyG1zI6vwmPXEG3h
         p+kctjwC0DPwoOOtbZv1HRx8cSyDtRDqYVAqe5wXahauXKPzjlDo+dNRlaV+RLzelKdD
         7LxfgL04Xh2JsNCWSL6ZNGdNnXufFAoHi75BtZz+aN7QjkWknPIf/XZ8aV5vJoq44tID
         S4NnmZn8ysgWEsI0Y0B4lXPjmvyWR+L2uxLx3jbc5nDZhW7PADkgOeb3SVYXNKXEldza
         eBNE77RSxtsAA4DFDl2gOm/LKsR5FAsJ9BxNfSAtX4lGJSAkZwtIVvffELfQ3stfg4Oq
         jWpw==
X-Gm-Message-State: APuU4Z/h3iBHWzSuoeyO9OsZNhJey1UDXbajnckVgajryjhcXWOHUwqv
	o+hPKNIIrtChOjecQBXbwswfE3aN0gKYcJbJi+laeaEDM6kslvsR7A/vYgLyklKBpDloTk1jbPf
	IuQo7FH+xTPHUSmshvFbSYGlTRndFE2QJQNELF1iMVUIA2qblTQAAyRsrCiyvrMb1Tw==
X-Gm-Gg: AZFdTZefiFZjPiapgOue9EsGKFK9KqEsfM0OAQGdyGbsgxjn5nLLUFckHnsnL90I62S
	NFWGSP/p1XbchCxee+hQt6wga2wBOQ58bnhy/E9lK+DKV5eGaQi4ma+cctejDgoYikRx4nEcYWT
	v0Fhgcw0Ykb+wKZptx49MZWphyMzTEo/VhHYy0/az6DHdO2S5WSdmPkm9VtId9XzLqwRfMtzzo4
	2AEYhob9cxuGKJo3GRZDEvQwTWDVnSQGgecbqv2YP8XsEuBIMCmfgCbp0gfgEUGSHy+uf20++++
	lXDsTx0JrLz2GuTcx9Z/8T41nITA9oQvs4AZjEgkUZKDApDeoB5EzuxaLu9n/vzhr44gfcSFDg7
	ifzKV5gRcS+kl6vJhqyqfgKE70rq6qRStHy3fyUQl0QNIsGiQPjPePl29bSdJfLVT4nNbIvdgJa
	1Ph2oHuaeaYqYLaSzLC+LNqzjdq6AtBmlbZA==
X-Received: by 2002:adf:e008:0:20b0:48f:bba5:732e with SMTP id ffacd0b85a97d-4abb560e1c7mr3585747f8f.57.1795172572045;
        Fri, 20 Nov 2026 03:02:52 -0800 (PST)
X-Received: by 2002:adf:e008:0:20b0:48f:bba5:732e with SMTP id ffacd0b85a97d-4abb560e1c7mr3585711f8f.57.1795172571549;
        Fri, 20 Nov 2026 03:02:51 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm5510622f8f.24.2026.11.20.03.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:02:51 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH] sched/fair: Don't let task_tick_cache() IPI dyntick CPUs
In-Reply-To: <20261120083440.GL2668564@noisy.programming.kicks-ass.net>
References: <20261119203825.2732984-1-vschneid@redhat.com>
 <20261120083440.GL2668564@noisy.programming.kicks-ass.net>
Date: Fri, 20 Nov 2026 12:02:49 +0100
Message-ID: <xhsmhv75rojdy.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 20/11/26 09:34, Peter Zijlstra wrote:
> On Thu, Nov 19, 2026 at 09:38:25PM +0100, Valentin Schneider wrote:
>> @@ -1925,6 +1925,13 @@ static void task_tick_cache(struct rq *rq, struct task_struct *p)
>>          !grp->pcpu_sched)
>>              return;
>>
>> +	/*
>> +	 * We got here from a sched_tick_remote(), meaning @p is making use of
>> +	 * NOHZ_FULL. Don't disturb it with a task_work() IPI.
>> +	 */
>> +	if (cpu_of(rq) != smp_processor_id())
>> +		return;
>> +
>>      epoch = rq->cpu_epoch;
>>      /* avoid moving backwards */
>>      if (time_after_eq(grp->epoch, epoch))
>
>
> Its early, and I definitely need more wake-up juice, but how is
> task_tick_numa() different here?
>

It shouldn't be too different, I just can't get it to trigger on my QEMU
setup; I'm done running stuff on the machine I caught this on so I can
start digging there.

> @@ -15401,15 +15404,20 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int hrtick)
>       if (hrtick)
>               return;
>
> -	if (static_branch_unlikely(&sched_numa_balancing))
> -		task_tick_numa(rq, curr);
> +	task_tick_core(rq, curr);
>
> +	/*
> +	 * If there is no root domain; there is no balancing, and none of this
> +	 * matters.
> +	 */
> +	if (!rq->rd)
> +		return;
> +

What if the setup involves a separate root domain where all the CPUs are in
dynticks mode?

Methinks the signal we want is:

  is that task on a NOHZ_FULL CPU with the tick disabled?

If so then we shouldn't do anything about it. Let the other CPUs in its LLC
/ RD run some balancing. If they're all dynticks, well then there is
nothing to do is there?

And that should also apply to the NUMA stuff like you pointed out.

> +	task_tick_numa(rq, curr);
>       task_tick_cache(rq, curr);
>
>       update_misfit_status(curr, rq);
>       check_update_overutilized_status(task_rq(curr));
> -
> -	task_tick_core(rq, curr);
>  }
>
>  /*

