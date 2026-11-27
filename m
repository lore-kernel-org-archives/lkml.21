Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774728;
	b=RmaGyb3p23cuefvxo37OHVjTOAPUxtndmcjiuRZbKAAO5MsgvzBcyIjN9ovjJWGIiYJ/
	 uceq+0uAe5xvBUzaAKhZgDeShJ3GdEym6LTyjOjLl+sYy23CcrrZKP4nlZMtyPUJ6wbkf
	 +J4q7+9ZcRi6z3uEo8NCWP7+Ii8UcIgm03sYmll5fYCmZ5JzBF00RP/rDud3q8Ykrh8Sf
	 XBc3USaqtixlp9j7nr2Z59A/zEyYkAIfw/xq7Dyqws4E3jeZ1bFOMsU2Vcd3jDWZ/fI/S
	 bg5J7Mriaa1VVSc4aXjPlVWODXKy9ohNrdRklk4lbVgmxE2FgbsfKuriBHzRaTFLZgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pnHgXt8Wj4DjCs6r0Datq5fous4Ql1AWjQxMQJLJ1BA=;
	b=KeR+/d52kkKvsFKu8oRlbQMO7LiPN67u16F9eNJRl0QceGUVircoDMa5ArfluB2OgBrh
	 Bzgy0fomRzsa1WSE3UFuuUvs1ru+pgTpSv8yL1CZ/YYJt0kZqaDUtkTpzFDTc8y9bzVwU
	 Z1efcj+ggd/TlDpc7Sh3qAQ8zK8Z4nlNFxQ1Mex94fmebXHjWebb5U2mu0mDKZJs5yYVt
	 rnfc0i2c60zO4O3/h11S/mZsypvspw0iHfppjkJefLHZqjXWrG3swr4EqHra7PKsg8YQb
	 Vviuy/jvHp/L21/dhaUsgAHvEiQQvHsXf/fS+RsfSubGdLCRBIthPxVrIjxNtvSTkiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nr0p8C2v;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8B5606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nr0p8C2v
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb72b6e1b2so6106185e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774726; x=1796379526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pnHgXt8Wj4DjCs6r0Datq5fous4Ql1AWjQxMQJLJ1BA=;
        b=Nr0p8C2v5vtL0H38kqt9/MDV3WYZ679cspWDs5iD0dXutTb8wwvlNEwjKEHRYz/swX
         cC3YZik2rgJpizP26dfsMYmufn+Y+ks7Bqo9akOT49dBawR2MTbFMgAWlkdEK0H6dP9f
         jmes5qPaucjxltEwqrPCsaHJR9WlxbYaPhd2coBZRKXs4HakskRCRhUFU8VBzX8xWj3b
         fR+AOO1uSFbQkLJkmEWbiAoz9hWsRuEgZQN0Qb50arPFD9q7z1g2sErdqoyZYNo+2yJN
         5cnKFhdMAKaWzHNX2l4GDxadogVM9FQ3SIQgLmHnwpiqT5xjXHxR8QFBy5RzknspFcGl
         L05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774726; x=1796379526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnHgXt8Wj4DjCs6r0Datq5fous4Ql1AWjQxMQJLJ1BA=;
        b=J9sLMGJ6Y/jdg+AVhREj4nAlZ/LsKuUjbZfbbD4JbuLkid/rXG7jRmtjSNAmwv7G1W
         CFLselKtouKfXxOkvbAFC5azRx+e4vcIfcd390t3YfNbiD9GpwHAB1I3JM/BmnWTC446
         E7nyYB5Edq4sE5hzgriynxljLPZGtMAk6mLvLw53C0eQDCSZhfCiQkEVM4rWvIEjo806
         SUEqb0+3AZHJrDodnbFFna3/s/L3g+iGoLVu6frYzt11Vt7/jBXOTFjtkSYcGyixiYx3
         jAxnT+Z3hfmT83j+OZy8k3xQRiJzfDXglh+V1ke7LkXPH36FtAWOPOD8xktD2hlQLde/
         EwVg==
X-Forwarded-Encrypted: i=1; AL+hErENcAuMwuD+ogTwFR+kCMJJXXhQDyTNV/2I0H+K0w92rHaw0sAC7oHqIYLicxkrnFTME9kfTcOYPBSAzO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YpFBTw4q9q+D8ByrUhYyBFq2pTL6gJGJ2h8OWoWL4p2kXGj3P
	F2P3CAB9+t6KH2ir3YDQE9z1KkUgXv/+mFDkfzIYsJ2nLcTe1kibqJTI
X-Gm-Gg: AZFdTZdYUkp5Q4NWrR1x3k95QF/15bXiA5X336+5o4U4R0gc612Nr5lBBaq/HBwagzf
	3yJYVXVYOypDdtD2Ywi4Y6YUGR7dya48WbGKKoTtzQ48as52hALbusTRl/A5Abaa6aM1MIaOU99
	TAqMzFWBEPkONo62+HSqcQb/xBX7HrW3FOkU/qZZcSYw1bls/vrgiJdSzraJZ4y5b05W06gfH5t
	nQGeXZdiFce5pLrAPT+ScJVhQI+emlISdJqXpuBIBDXEkWcpMmN0HY/0rO9EhYhk0Lj3gpsbaj9
	+h+Gmr/NFlyMRDvSP0DebvLuZJ3hqouCG4D6qYEt493pgzBeq/xBMnk3rV/klQlHtHMiq9kq45B
	KAOjiiVLwH+es6oZECa6upo/3G7BlsYIlfMzMqK6tW6QkDynvFMZZUQ9brdeiroOT8BP38vsdp6
	kVEh/7Jey5gIUJnqdLHZ5FJJk6lvCNTlX/YJOEbhXbbyDq+3EltVOwlxh/zxy+rtTuStD/LiLea
	6epncbA/MnW9EbIe5y7BkvR9bMwppK0n2GG4RQzGyEtVk8OVHfO80lOnDDOVihWs1S6EdTAidMu
	Os57oI+7bAs3ULhrl0uhCXK2s0IDiYfqI+v4VJ7nGLfgKbXGgeAiUwXe
X-Received: by 2002:a05:600c:1088:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4bb887f43cdmr378475725e9.2.1795774726028;
        Fri, 27 Nov 2026 02:18:46 -0800 (PST)
Received: from scheduler.schedules ([85.100.65.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1237162235e9.4.2026.11.27.02.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:18:45 -0800 (PST)
Date: Fri, 27 Nov 2026 13:18:42 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: mingo@kernel.org, peterz@infradead.org, vincent.guittot@linaro.org, 
	qyousef@layalina.io, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	jstultz@google.com, wvw@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched/uclamp: Always account active clamps on dequeue
Message-ID: <awlRErm6iR2QsWUX@scheduler.schedules>
References: <20261127083542.3172843-1-christian.loehle@arm.com>
 <20261127083542.3172843-2-christian.loehle@arm.com>
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
In-Reply-To: <20261127083542.3172843-2-christian.loehle@arm.com>

Hi Christian,

On Fri, Nov 27, 2026 at 08:35:41AM +0000, Christian Loehle wrote:
> Enabling sched_uclamp_used does not update all static-key callsites
> atomically. An enqueue can observe the key enabled and increment a
> task's uclamp buckets while a subsequent dequeue still observes it
> disabled and skips the decrement. This leaves stale bucket references
> and active bits, which can keep the runqueue clamps elevated after the
> task sleeps or migrates.
> 
> Replace the static-key check in uclamp_rq_dec() with a check of the
> task's effective UCLAMP_MIN active flag. This records whether the task
> contributed to the runqueue accounting, so an accounted task releases
> its references regardless of static-key update progress.
> 
> Enqueue and dequeue update both effective clamps under rq->lock.
> Updates to an already active clamp complete their decrement and
> increment under the same lock, so dequeue cannot observe their
> temporary inactive state. At entry to uclamp_rq_dec(), either active
> flag therefore suffices to determine whether the task has accounting
> to release.
> 
> Keep the static key on enqueue, so unused uclamp still skips enqueue
> accounting. On dequeue, the early active check returns before the
> scheduling-class and delayed-task checks or either per-ID helper call.
> Limiting the change to dequeue retains the enqueue benefit of the
> static key and reduces the unused dequeue path to an active-state
> check.
> 
> Reported-by: Wei Wang <wvw@google.com>
> Closes: https://lore.kernel.org/all/CANDhNCqyXsZ6G77z+9s=rTO6BZifRG9+hVxMTah+tAv6pB6h3w@mail.gmail.com/
> Suggested-by: Wei Wang <wvw@google.com>
> Fixes: 46609ce22703 ("sched/uclamp: Protect uclamp fast path code with static key")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  kernel/sched/core.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c9890ed35df7..05b092147c6f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1617,8 +1617,7 @@ static struct uclamp_se uclamp_default[UCLAMP_CNT];
>  
>  /*
>   * This static key is used to reduce the uclamp overhead in the fast path. It
> - * primarily disables the call to uclamp_rq_{inc, dec}() in
> - * enqueue/dequeue_task().
> + * disables uclamp_rq_inc() accounting in enqueue_task().
>   *
>   * This allows users to continue to enable uclamp in their kernel config with
>   * minimum uclamp overhead in the fast path.
> @@ -1918,12 +1917,12 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
>  	enum uclamp_id clamp_id;
>  
>  	/*
> -	 * Avoid any overhead until uclamp is actually used by the userspace.
> -	 *
> -	 * The condition is constructed such that a NOP is generated when
> -	 * sched_uclamp_used is disabled.
> +	 * Static-key updates are not atomic across callsites. An enqueue may
> +	 * have accounted this task before this callsite observes the key enabled.
> +	 * Check the task's accounting state instead. Both clamps are updated
> +	 * under the rq lock, so either active flag is sufficient here.
>  	 */
> -	if (!uclamp_is_used())
> +	if (!p->uclamp[UCLAMP_MIN].active)
>  		return;
>  
>  	if (unlikely(!p->sched_class->uclamp_enabled))
> -- 
> 2.34.1
> 

Yeah well...

Hope I was following this issue from the start. Now reviewing is a bit
messy.

Although, I can't really see any *cleaner* way to fix this. And the code
looks correct. Since this active thing gets set in uclamp_rq_inc_id(),
when we increase the bucket thingie.

BTW, a little nit: right now uclamp_rq_dec_id() checks active too, but
with above that is always true since we check it before we enter.
The only other call site uclamp_rq_reinc_id() checks it too.
So removing it would be sweet. Just a nit tho :-).

Hope I'm not missing something.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>


Cheers,

Kayra
