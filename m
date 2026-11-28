Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886688;
	b=hPtywL/8+dpDiq60IOAaXafo/83bU6ooNSZX1NV7LSX9JvReMmDbK63EVu91Dl0TshCx
	 PfcnJXhq/5XMJvGsV/sGYd7/MGaQz3C2B+JJKfgi8bDqHyNSXCoNTnNOqVy4SBAU2IOFy
	 PCRqIGvLt49oakuucg+P0UlvnzxjqGJWnWphozSyvF5MdR0GRzphESCRqu0Of+63J5Cn/
	 A7MLkcEARTlpnLsk4/XAJSE0iHupzJeraFsyW2T6qDmIQHyuoG4G8vCKeNbS5AVq0j8hl
	 5ZB+6CHNmPHGr5lDcEzrIKxADw390VgkQ0cyYtJlEdieS456nHnok3w0ZkZA8CP+egA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HX4A1kc6FHjjFrdzAiCfdAsyLd3uHpOMRy2Hc/fuj2Y=;
	b=gPOODgM5XbQJO5zYSHwzHrPEKuGr4pWLdq7HzLgnI9toqHdS7WDbYKehc4NOkUb1soa6
	 Vu3T8bAlRFAfkkAki++K01L8xw6TntTdDVxx0mXohfW2xk+HPE0hgUbQ2Nwv9aYncQVXf
	 u1NeNiIDDdFtIfijOAfyc9M1alP83KRp+IAG9uf4W5NUIBwUg54bHq5SZBBC/PvMDs2gq
	 z/rQ1jGywQRmyJ+5QUu2WsASUH8OiIFN3VdLBvP8ZyfWZ2+Fcij3B/uOuBpF73OJFB64v
	 kpNDlYvto3RHmaq8hbCFnz7bXR4526sXtELcjmpNBTdEe5lTQHA9SpqlC4amK/RdSmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Np/yxwjq";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87B3606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87B3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Np/yxwjq
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so8196116f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886686; x=1796491486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HX4A1kc6FHjjFrdzAiCfdAsyLd3uHpOMRy2Hc/fuj2Y=;
        b=Np/yxwjqpG9ZBUDzBM5BB55cyBfHMsm5X5fsgLHPR2wy/y0DO0M8lvx2ozawHYmzbq
         e0Yh0nXix9mCPEttu3VrVkTayDF3OWUSF4qTBF43BAgFUa3rSoDfPfWotAF6wed3zjSF
         KTOcCsDC0k8oKnUa08u8yJNYQYF1bGeXKCy68gQXcxcoqT5lxMAMRLdLRNQYGxLP3wQa
         UOM5mDyniFAd+j1O15r5p3/yaj/Ta6Lznml2HZQ1gLvbJdj0hvzj8NmbBkbn65d2/YCE
         DhFiHt+BtAyqNjskQFky/k0h7LPu5Gw6AWF5QiiUSxZDjVVvY9y7pofXnbj3HAUEMQYY
         xt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886686; x=1796491486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HX4A1kc6FHjjFrdzAiCfdAsyLd3uHpOMRy2Hc/fuj2Y=;
        b=gk4jMMlbt63CpgWvK+TUk01ocxFkmoZERq6gUfslWwR/pxnJ/9n/H9yCMfY99Qh9Kj
         PC0tRzyLOeAbw+M8XMQDHex2Hu7D6iTvFGr9evxo6qrnEhr37q3XqZoVa91HNTVRzorG
         14tHKAOnx7o1cTHaL0pi7REfTpHT2pBC82d09GlWFUXatUz30mgSO7Yo0cGiAJg8HDLT
         LglWyBax5UG+xB77Wi6WzCPWOQ0USt8D0e2gKvrjBUbtR0DvTsneJ7sLuwuWhOtsRpn4
         R6ngeXc3AOeiUQZSAv/8g1Rd83glFnnyahqk/nsZ7zXtB4rwEampPf1O7qYmunwQ5YM+
         tbwA==
X-Forwarded-Encrypted: i=1; AL+hErGyX4KW1h3ve3EpFROpw1AkIMo8dFJU/duOP08/9WUt3JJ0vu4+90rK7aW+J3lnpfn3tcSxkfnnv3m1NDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WDBWxHZHcXf5iVaZxDbzW8qeNB1blVGD0KNOKGPYhEFqnsUqq
	aruRSeV8ZbaajRqeza9/1gA1WQLKKIf5Yfl6qZpN0okx6UDp3fPue8ZT
X-Gm-Gg: AZFdTZckhqiYN3NyxbDxG8dRWD6tQl39x/IoR++rzvZWkvyA0Iy9IZbaV33rVQBzUEx
	AHdfLseuboJwkCxzvzRnhTl3PZPlDPhvQBPbLHEy7lYORrQHr4fJtJgv3MfGungav2nzoPgmx8U
	piwUkRRdAg5hncIyMDcd/uqTWtNpkWGiiRvbiN7XEGMwpeKhYy5Ki7pGjsI9IBIzuB2FtXsMetB
	y8/xs/rpuSmTTQV4BY8tCivO18KTemnb/Ilhzas/jxpsVkyfLQzSJYs9yhF7HI52nFV2FU4UncY
	2RYYpNVGdL6m237h/PItEAZnqtHOdV4xkb3XsA7obLtyARNQ2Pc13aYB0ZRE91qUlyKcgYHquXX
	2Bi/hNrzyMzMuXopBj4AkqdNi5f8XUKevrN2x2rwlJdF3OZXw8jVEPdXNiwfZM6p02nuSgA0jLt
	5tope6sYxYG5YFIxJpz0Ue8ahBufosULhK7Zrjkm4YGjo9VZl3dii6ZOuVQGfrERS7X4ooJg0kD
	Eck0T0zhURWbfY6apf/Xcf41AhXU1j1/nip/xdeG5gcre7RHrOljqsREIRYEv3pcDglo1UCXsy0
	vC2Gt6K6eo31ldVJjJa7lfZSBFbPpbpIy5ROXeG5GraRSedmkfFxCq6jElETo96bY45DQ7ZWkhY
	K8G5yRvkIRRyXvOUdVdvwQn99K2Zg00V04BGHtDS9c2jjAy3zuCgeaVIYzYw73bsxIULrcBAslp
	sWhfX8eW822p3LynDhPavfisz8AsSSI8vWJ6pn3A==
X-Received: by 2002:a05:6000:4381:b0:4a7:e4c7:2795 with SMTP id ffacd0b85a97d-4bb965c79f4mr21652449f8f.36.1795886685984;
        Sat, 28 Nov 2026 09:24:45 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9a0-e301-d19e-76f1-f69d-bf77.310.pool.telefonica.de. [2a02:3100:a9a0:e301:d19e:76f1:f69d:bf77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm54779276f8f.44.2026.11.28.09.24.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 09:24:45 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kernel@vger.kernel.org,
	syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v3] sched: Reset cpumask if __migrate_task() failed for migration_cpu_stop()
Date: Sat, 28 Nov 2026 18:24:30 +0100
Message-Id: <20261128172430.69629-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261126104049.GC49833@noisy.programming.kicks-ass.net>
References: <20261120171658.Cf9qIU-Y@linutronix.de> <20261125172018.GD2668564@noisy.programming.kicks-ass.net> <20261125193735.qrxCdHTx@linutronix.de> <20261126104049.GC49833@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Nov 2026 11:40:49 +0100, Peter Zijlstra wrote:
>  		if (task_on_rq_queued(p)) {
> +			int cpu = arg->dest_cpu;
> +
>  			update_rq_clock(rq);
> -			rq = __migrate_task(rq, &rf, p, arg->dest_cpu);
> +			if (!is_cpu_allowed(p, cpu))
> +				cpu = select_fallback_rq(rq->cpu, p);
> +
> +			rq = move_queued_task(rq, &rf, p, cpu);

This deadlocks. 

select_fallback_rq() can end up in set_cpus_allowed_force(), which takes
rq->lock again. 

That's similar issue as af13e5e437dc ("sched: Fix the do_set_cpus_allowed()
locking fix").

With your diff on tip/sched/core, IRQ/user affinity changes racing with CPU
hotplug hang on both RT and !RT (arm64 KVM):

  WARNING: possible recursive locking detected
  migration/0/21 is trying to acquire lock:
  ffff00003fd7e620 (&rq->__lock){-...}-{2:2}, at: ___task_rq_lock+0x68/0x140
  but task is already holding lock:
  ffff00003fd7e620 (&rq->__lock){-...}-{2:2}, at: migration_cpu_stop+0xac/0x370
   ___task_rq_lock+0x68/0x140
   set_cpus_allowed_force+0x54/0x100
   select_fallback_rq+0xf4/0x180
   migration_cpu_stop+0x35c/0x370

Dropping rq->lock around select_fallback_rq() and rechecking
task_rq(p) == rq and task_on_rq_queued(p) before updating the clock
gets the test through on both RT and !RT. 

>  		if (task_rq(p) == rq && task_on_rq_queued(p))
> -			rq = __migrate_task(rq, &rf, p, cpu);
> +			rq = move_queued_task(rq, &rf, p, cpu);
[...]
> -			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
> +			struct rq *dest_rq = move_queued_task(rq, &rf, p, cpu);

Don't you still need the is_cpu_allowed() check here? Both push stoppers
do select_fallback_rq() before taking rq->lock.

Thanks,
Karl
