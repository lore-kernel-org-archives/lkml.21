Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430881;
	b=ShsvCAKz87ptC+dqfiYk/97edMerAdoRQYtcocgobLslAUPSOncRpk+kIGrql19w9BsH
	 7NZKnU2QHq3a0eVyLYr7V+EfAGx4ezoRDtF9e91Im4b7pd8tS96F4PRMt10FnstT+pRaO
	 Agt1xf8+oz8GDJfO+E/49AcbjeenkYKY2uMhJQHzpXSvksy2xk9bC0SDb+64HOW19A/kU
	 rhN8R68OX+PrvrHjWETj06S9/L7KoLgzPOgJW8e3/F7Jqodq9D5VegUJJd5E9cVsZatM3
	 uiItdWTm1jekSZLZJS6l2+AGo1bJ6k+mUqYkwDtiHHTgIrxDLbUBTUoUdwiVCCWJPAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HvoT7Anl9hphNmVfzcXuCYVLME3jPhO7743SpeB5e/o=;
	b=nC5lPUYeoRNa/LzQJMzhGNuDt2mnNiQ2kcPXFfwj3fj179+QPkhSjhnbKl84E7j4Z9S5
	 73CfLIwRNbcurg6QNv/d97a/ROns/Rvoe9rGg5Au3s0WiPSgYenTTTu1+M4NsBuHCXYLt
	 ZZ7vmfzEdwro48mvx7vNKvUI3dKpI124R6T6anojQKdRdhjVbRfwdgOza3y2ifNwnL9de
	 VjBpFr5sq/+iZdvdR3oIFbG0EQ5wg5gMcvzCFVYltcOpKj8hS7A3nSLBbuov2NFCm4IqG
	 I+Ox0fZUaZEsFZb4Xm9UlEWJ7Psv5s716dej4589j+2xJeuy2Fe5izwYSLuRAChnOdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EzvkQHYQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3171606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3171606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EzvkQHYQ
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d581da0aaso406730266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:48:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430879; cv=none;
        d=google.com; s=arc-20260327;
        b=rwr9/QRwAGZTCkKxrMPTrbNpUvYAWUVkdd6MBsx+tQIUjDAJkD5mVfa03SSh7UYBh9
         xURwdWwOqWntZ/t0Tu6095cBO5DELtRY/qoTzC4qGyKd4dXEJ63EPtBWSTVBSvyi5ksB
         vtfIEQ+mK8ISR/NP83HqNxfSGDq0+HEm95w2DDzpjTmCr8xCjYGaS+a/53al7jo/xfh1
         njbVEeQH3Eb9xNcmheKAVmn5joXhNNdWrrZZJN5S4aChuLsOqMrWNuPXMMvAtyvXehyN
         UImiKFr9mqgcyqlZubeBK0PDL2o2kHBOGyT2vxX9W4plLFiGI4aCg4figPD28hyBXvto
         2q7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvoT7Anl9hphNmVfzcXuCYVLME3jPhO7743SpeB5e/o=;
        fh=t2JiPt/aM7pPdWRq9INrqa9i5GxEejSC/83i9CsaPFc=;
        b=YYSqbTxZvKQ03cqulkLzd5O38f7BLKFuuHeKgKeYjpnC24hM3b7cyaYkbRsgHZjpZf
         I9ggKjmQ03i7HBQUl6gkRQvcU5U+fiQyEno3Q/i0Bko1PDgMKklcxaYZN1NPwI7JTM7c
         uvm65ZUhApyBFOYEOSysyOLbph63SbaaQ/jtHecWsKBUjiZBRgevMNwtuWg0vJ2GSMy0
         lK8FzJxFfIajP24wJpkX+6mdnPVEXOEqaWWctfYS2j4FPGkY/f3Vk8l1dR5EWLeE6x2a
         qddDpKL46zBZB6s1xxlquF2iw/gMDrxaVBjnaG/nb8WuMrxaNbHSqrEzEFW018XKD8B0
         HYhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795430879; x=1796035679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvoT7Anl9hphNmVfzcXuCYVLME3jPhO7743SpeB5e/o=;
        b=EzvkQHYQol/Cq4j4qvyk4vT5eoqfh3xOMREdIutC7U43kJ7WlRjGjF1QiKiIeZJhhT
         64/scM0R5jqI4nP3Cl7VAamQcExdSP4wQZWh+dmW2P/DvguXnTf+dVwIhv6KUwoyuYDv
         hpDsMHO1YE7d7nmO5Z/5Wy7oLFz9SAwph9v0R49R+NWbwEzOp8qWwZLPgXOxijnOg4Om
         Pzawc3hy7N+Qzj5xWP1ar97rK9hEBX8dCLPDYqP/gFaUiFVS4LqiH5c1Eair1rnX4pBs
         XJJdXJJetOW9jxQ/fGnl7WiQGdZKrvqKFqzQpnbCEHv3DLTiQrdJvARCD6DRK88dZHt3
         3Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430879; x=1796035679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvoT7Anl9hphNmVfzcXuCYVLME3jPhO7743SpeB5e/o=;
        b=tGo17DTT/o2zgt3j04q+SQ8oEs+Ga5lvY5aWRvAUyLTCmdtjqMB0LG4wXUE81j4z18
         px7YbSWL9DiOMUv7DHsf5/DbGly2TEOwuX8FDaCKmG15alyxGsYQdXd+YvOOJkemt5Ig
         vFhQnmKcshzihDKaLvJrThvtkHoo/AU2tprW2fQHsL3QFJayXxh/46tOZoR08F5nXh3i
         Z5qMAKO/cvA7ndSc4AvHnCLez/3V3Tb2je6ZN3LJYqRSk3YGsv5Sbwe4LCVoferWu9wN
         mdk3pZrVIrmnWStrM0u85tsW/O89depZCSb/kwKs5zl8OgJifbhDleZ9qi+BF6jCSVyL
         ggdg==
X-Forwarded-Encrypted: i=1; AL+hErGUZXrQV0f2cEeFBuacmcwejjSxvdLNHxdtTMGfOHRzF3RDGPXkV/23FH0iBJOPdEI79qgDkKkzDXWozfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mFVZNxq0AGQpwJknotlY5nrTqZ9DWdWF/E4nbm3NDKVUZ0hbj
	6NoC8kexecxNHr7rdxk8mkZrm6zOv0c9fgslVWyTNkpFYFCHJ9ZzyCu5xSVsDpNvNmTFGK9QKg+
	UwzZLig/Y9taU8wJYrr98ESqAd7Y+CP7Y+TgBoH0I1w==
X-Gm-Gg: AZFdTZcKG1hj2rPfslLFzXFIaWSNt3rQy4j41Wh8ycqKf2Vv8O5LxSB6/pH0WEcFzWv
	WstobS1/8vf3FvIqug2yaSOE9RcPW++Ja0DJoccJEBFQUlpoETPy/o45Iu+8E6O4mM16MPRkjgN
	hnnpvKS47FHzl0o3/VWBE55CD+7/fykJZq9ENLGJPwiRQbZG+TOBy49WPkkh7/KFD9ZzY76j0hf
	MZfKf+FRC7CqfUCFQ22qWbG7mIxqsNQuH0Eb7gjSYmSvUCwlLlcJLbPVvyxRaylFzp4ozlcpGfU
	phJaKPcnWV6ks8sdv4Kbh8DVdt+fT/0yPcKI94RVVQusBu804vdWZVwCRoTq3mHithFoAiInmof
	WLqXD1abJXasAyFdLxz5UICsaGdW78EQhWHY+5ST+VrPVmPs5TfXnI9UAkhwGgZmFXzeCUw==
X-Received: by 2002:a17:906:1304:b0:c4d:212a:192a with SMTP id
 a640c23a62f3a-c513acaff9fmr662453266b.48.1795430879222; Mon, 23 Nov 2026
 02:47:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121235203.811792-1-atomlin@atomlin.com>
In-Reply-To: <20261121235203.811792-1-atomlin@atomlin.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 23 Nov 2026 11:47:47 +0100
X-Gm-Features: Aa3M54oo137bS41nML-swPW4_-JFZpCl2eqix2NZRtkklgargqyy1BBEeTkW998
Message-ID: <CAAofZF5D+ycbtMxsnUgZjhUbfD+_ZD6kYyci95OTdXug_aw-dQ@mail.gmail.com>
Subject: Re: [PATCH v5] blk-mq: dispatch kworker to housekeeping CPU when hctx
 cpumask is empty
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: axboe@kernel.dk, tom.leiming@gmail.com, hare@suse.de, dwagner@suse.de, 
	emilne@redhat.com, frederic@kernel.org, tj@kernel.org, sean@ashe.io, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaron,

On Sun, Nov 22, 2026 at 12:52=E2=80=AFAM Aaron Tomlin <atomlin@atomlin.com>=
 wrote:
>
> [...] In real-time environments, an active SCHED_FIFO workload will
> starve this SCHED_NORMAL worker and stall hardware dispatch, whilst also
> introducing unwanted latency jitter on nohz_full cores, defeating that
> commit's original objective.

I would phrase this differently. cpu_is_isolated() checks HK_TYPE_DOMAIN,
so the jitter argument holds only when the nohz_full CPU is also
domain isolated (isolcpus=3Ddomain or an isolated cpuset partition). With
nohz_full alone, or isolcpus=3Dnohz without domain, this patch does not
apply and the behavior is unchanged.

> +static inline int blk_mq_hctx_unbound_cpu(void)
> +{
> +#ifdef CONFIG_CPU_ISOLATION
> +       if (static_branch_unlikely(&housekeeping_overridden)) {
> +               int cpu;
> +
> +               guard(preempt)();
> +               if (!cpu_is_isolated(raw_smp_processor_id()))
> +                       return WORK_CPU_UNBOUND;

Since preemption is disabled by guard(preempt)(), you can use
smp_processor_id() here instead of raw_smp_processor_id().

Thanks!

--=20

Marco Crivellari

SUSE Labs
