Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430103;
	b=WK8glr58cum43mhMW3miV39lHPHl3CnK13rtT8N32VtniT+tXDrIIts1Vm13/2gTpIlX
	 wmQDYyqYmVolpD8ZHOnovOJqu7sw4/ZPqSpFrCvm24pwdBJTxIRWOPNXHQ9NiLa/JWWn+
	 cQIlXzgatylznNRSc176G2scF/lVOphRTmBJqKhcniHkbJgRLlEPOXxoifZEt4dwlOviL
	 0XfapEGENntWZ0qs53zX4kKvumUhR8ntX876yaNEsz9L0ZkvfbR1sIodoF/WkTxPCKD/I
	 u3FjO5FQSlK4dXklJigStixd30FxCowSlke6qJ5N2yvfp8eAl7Hzy6QhLcnefmPSk4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FkLm2QDvo0RLh/Me+j1f+/tll97oLAwEndJ2bmbVDp8=;
	b=Hu3q1Z7UBqPUehJlmcQGKmlgjoZ00ykERR8cMyfQ5CJvbYL1AOLnVmf1Xwceum9ZlXAy
	 r6jsAc24DePSFA/5em2Yez0u4jaPBD6+VmtJrt37RJmiIjtB/xI+MIqPO0p+NK9Z4kxFT
	 NXWNq2t1tHLPCSpPcjB3bACnNsgXzKFrj1NFe1yBjOjoUDEC6n/DKG8eUYYPm7mMppuKI
	 cTADiss+R5AhQfrSAglXyXGAZi1SXFTEiMhTRSYtHWVtWqmR3Tgf0YNVL/eP4dvawuk+z
	 1fajDy/ALCYzbL3Q+LJ5T1vaY69CuUgD5zgolcXRFYo5J8GJptMoJpdQpC0BYfyV6UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=txsdnX0h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEAC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FEAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=txsdnX0h
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so1454451a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:35:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430101; cv=none;
        d=google.com; s=arc-20260327;
        b=pOmHWpMqkCxOnbRRLamuzC5yfae3iC59sdznTmHG6Ru1PRE7iq+0eN0bhFhQvED2p4
         vn3Ddkcc9yE1UpRuCg2hL5oVO2+I9wFZt/gmzXHO40qz0sQQPhM5Rptwhj+5NAGULW8i
         JK34ousoF/zX+xBQ/qFidT1xDK819Kk7hWBLMpnS5WDPjQskM02xbRlaKzA+YPD0NJrg
         SRV1trjzanbdDp4I6weN3E0v8mRKIXoXS9GrDMrlTui/iOWYHNuFt4p+g7KMit7dXqWm
         wazWUgbUG8x4fcssG5JlhcG1tBKYkju9MXm8S8I5sxscncrmAIo6L9EqG9pKgTnxVmuG
         YbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FkLm2QDvo0RLh/Me+j1f+/tll97oLAwEndJ2bmbVDp8=;
        fh=c0aCPdZjpXjM16NCW8oDWy5/UwyvBy6UPRCA4hDAa74=;
        b=PGrb1KO3r+9KmLDhH9VhhzrejHUyLNX7yUFjtZs9fsqwz5aEvwWVCMLa/GQvGcD2hT
         8RBdhsKTbJvWz8+dZxAKBTsGsHMkcry1qX/33Usny2d02piPcZRr+10goh8MGIm+7Rc4
         M/tQU/r9Y6ZG3drkyMIAGYzUBCr995YQuhsIB1WDG0vTh6GQyAJWWKUKtybNUneZVMOD
         YzathXLABlfmq6NfB5thKa1ofqEuAwSwuSuZqIE2qWkgn0OWsMLWVUNOMoUfjszeCLdc
         zCFEBSqeaDytYPEwW7j03jaUDFLi0DHBf1MGgGcrDS4FLar7QFjy/yWC9XCRn8y2wLZn
         aMqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795430101; x=1796034901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkLm2QDvo0RLh/Me+j1f+/tll97oLAwEndJ2bmbVDp8=;
        b=txsdnX0hfzGgNixMYHE+ihZu7dkT3JrucEg0QinC6WjgH5wN/LOHJxJH6KugPzAkAa
         mKVBg78VzMNap4miyybduSRVIurJPFPXLLcom00Af6TMIZiLfwvlb7jJ2iSb6UvblCdA
         S2n5SioU9P0kYsYgY9Bfl+CzHL5zv2E4ZSe2MPklS/BV8sGxlzO/E+Je789hI2ws861g
         jlM+4dNXMLCK/W3h2mOxmC9w4y923FNKXJx1Aev/1wbB/RpYVvSHCbL+8E2yaUBCvbQH
         mBOfmoYdVy4zTYuYodUdKaFgKyzBEo1cGeszzSTaRHPH0D/v/+k3LLdDHbovRusdmilY
         zD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430101; x=1796034901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FkLm2QDvo0RLh/Me+j1f+/tll97oLAwEndJ2bmbVDp8=;
        b=2K9ylJQ1eOGrkvn5gMSehYAbyMAzsZGa5f3IlJBP5XHiVPn/E1n1IMZywUtEfPyReg
         77PcKfBD+9EOIntlwWyco32lDVsFD5XCP8XD0RMZkN8plYgiFg61d3kwYCEHc3DJ5FdT
         dFaz36fVjEp6NxZPvMQSr0VofMqifVUq+xvckWv2ckXDAiUsfDFWYLhMSofqmvXR9Qvv
         dc3mFCZZGRHFVNSXZDx7THTDMcL7zwwUx3xj1zdxDDcsem/NDJ5usaXjZ1VF29wY27fP
         mTsNOF0G2ZLH2OocNdrjePeq2t/tBXB7Np80eULoC98rl5v2hWfGKAcRHdkbfI9uUd37
         2s+g==
X-Forwarded-Encrypted: i=1; AL+hErHqt/ph7KswqBhW0I1+zS8+pXHuYOkDtMlyItuiv1bQjP8WCE09/Qcc23gwCVH9MjKOT5WSfow7zxX4rCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z93tuzKLHEAbdRAw0dxiJpD234F8nZE26Nn+U5j+m7H7QtGDTI6
	+mkjgZsG3wQTGYsGdHBt/6yAJmj+F+aNwGyKHpA4Ib0LxvUVqmXqKk5jqxOV47N8tBPCGs/mVHw
	yuW8btYwkxJJNBcXY56D+amDT4f4PLgTIAngzCpP1fQ==
X-Gm-Gg: AZFdTZf402OIrwKAPFKpdUKX/bZYDog6gJU2kb0wMDZudobarwqDxByQR9JfPcljwzm
	IE0L9rKx8YtHSrk5/34OUtzSYUF7iwutSh5eYqo5W7w/8Qq13tJHxLWJxcaTu5gn/UQ9YbGsI79
	O5/QID7X+faRQVKedlZQSfpT9Sfd9GuLB8PGJ1ImDKGJUnnhjLT9Cf80JR9QNSvVsY2AiOl6CAW
	rUxu7CaiqTZaLitb4lg7tI3PMhwVQiHTzWaudsylBLZrCKsOOubSqMQf4202a5/CF4F8CcSqnDC
	vrTy7hGCNXqCMI8ATiS+KAbHrJfJxlWOVgvT5sdC4wRaM0VYhzl9p2wZjw9VqXbSqLtyoix4pOw
	29peSrL29WK7VD2Ah/2OOygJo0SsCbTm2CpHi9tjCqvqZikft90gNvclEBd1tvTaGMXCeNQ==
X-Received: by 2002:aa7:db47:0:b0:6b7:aca7:2264 with SMTP id
 4fb4d7f45d1cf-6ba37e6980dmr5721448a12.9.1795430100790; Mon, 23 Nov 2026
 02:35:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122015729.2512645-1-penghuang@google.com>
In-Reply-To: <20261122015729.2512645-1-penghuang@google.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 23 Nov 2026 11:34:48 +0100
X-Gm-Features: Aa3M54pS5nfq3tiUm_gWyIlrBynlKLIymvZi5sxhT7ewjNFDS4BdqeJJrs3PYqU
Message-ID: <CAKfTPtCQpVhtVT7Mhqe1=Ukcmc1pX8Jgn9ypb64--8cJ-7G4BQ@mail.gmail.com>
Subject: Re: [PATCH] sched/pelt: Skip dormant cfs util_sum under scx_switched_all
To: Peng Huang <penghuang@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org, 
	sched-ext@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Nov 2026 at 02:57, Peng Huang <penghuang@google.com> wrote:
>
> When scx_switched_all() is enabled, all fair-class tasks move to
> sched_ext, scheduler_tick() skips sched_balance_trigger(), and fair_rq
> scheduling is bypassed. As a result, rq->cfs.avg.util_sum stops updating
> and retains whatever stale load was present prior to switching to SCX.

When all tasks are moved to sched_ext, fair utilization should be 0

>
> When a CPU later goes idle, update_idle_rq_clock_pelt() still adds this
> dormant rq->cfs.avg.util_sum. If stale cfs.avg.util_sum plus active RT
> and DL util_sum reaches divider, update_idle_rq_clock_pelt() treats the
> rq as overutilized, continuously increments rq->lost_idle_time, and
> stalls rq_clock_pelt(), which in turn freezes RT and DL PELT updates.
>
> Exclude rq->cfs.avg.util_sum in update_idle_rq_clock_pelt() while
> scx_switched_all() is active so dormant CFS load cannot stall idle
> rq_clock_pelt().

This is not the right solution but a bandaid to hide the issue. When
there is not fair task,  rq->cfs.avg.util_sum shoudl become null.
Please look at why it is not null.
It could be that the update stops before everything has been
propagated correctly in the task group tree

>
> Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peng Huang <penghuang@google.com>
> ---
>  kernel/sched/pelt.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/pelt.h b/kernel/sched/pelt.h
> index f921302dc40f..6d31e1fbd094 100644
> --- a/kernel/sched/pelt.h
> +++ b/kernel/sched/pelt.h
> @@ -138,7 +138,12 @@ static inline void update_rq_clock_pelt(struct rq *rq, s64 delta)
>  static inline void update_idle_rq_clock_pelt(struct rq *rq)
>  {
>         u32 divider = ((LOAD_AVG_MAX - 1024) << SCHED_CAPACITY_SHIFT) - LOAD_AVG_MAX;
> -       u32 util_sum = rq->cfs.avg.util_sum;
> +       /*
> +        * Under scx_switched_all(), CFS PELT is dormant and may stay stale;
> +        * exclude it so idle CPUs do not trip lost_idle_time and freeze RT
> +        * PELT.
> +        */
> +       u32 util_sum = scx_switched_all() ? 0 : rq->cfs.avg.util_sum;
>         util_sum += rq->avg_rt.util_sum;
>         util_sum += rq->avg_dl.util_sum;
>
> --
> 2.56.1.750.gf70dc682cf-goog
>
