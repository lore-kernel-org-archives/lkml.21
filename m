Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378869;
	b=qVRza+E1khgKlW/sJ+QpmEA+ny6tUvRuFa6fAEnwE6qs2CfQrnVEi6dhzcOU3Hf1V4uK
	 EmOm2sHkSMUAjWFtEOEcJFuCYmIQd7RGBfdA9B7YQSI0WTzb4mDh8DGJkuYWURIaBISnS
	 R/xXQjXWLslb7UayuhL67k9kf5B7D6bzlOo6kQPnTJlIHr83aDNRWlbmGYTS+V36xekQp
	 jKhL+pQu43HraC/p5P7JAVjHxmOIbfJ0VDhDIBuTdcHmTtip1/IxQidxbEngPyOHUAme3
	 LhVMrbmkZ3CF9KN2Im/x7sZB7Hz6mrcP/6yRwvF7l6oO3pVxCQW5x7+OPXogu2qy1rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KoXhXnM3oUjZYemCskQWf/r+E20vle0w0i0hVE/eaXs=;
	b=w8ejdl/x5oIoGJCZE07DAopQWj3ma11sRT01BD8rkCvJEJ/Fp1ONLneXQ5K+8Q7HVNPR
	 w6KkMVomuu9kNWLScK4m0ecbv+1aCH0BVwxqHsUomMT5glc9r/VQeTNKp46McPE3JsHZN
	 3SBkMJnSGjL+MuZWODYxJtD+pXHBIzMzqBFDJ1oUHargM1sQhK3glDzUzidbTaZE2BMX/
	 dswrg4rRXyyXNKL2Pxihcios9ADgWZgcbuJ4/vtYnZSYZsFOYRhNZWiSxkO+SkfzBJy+s
	 9pqXpgbd9zC0GS5l01avmd8uW6p0hLadUeFIs+i4yV6vSOv25xXfoaVLWMNeygFoQZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Aiko/QHp";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074A1606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 074A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aiko/QHp
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4aa5833c263so2463943f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378867; x=1795983667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KoXhXnM3oUjZYemCskQWf/r+E20vle0w0i0hVE/eaXs=;
        b=Aiko/QHpxS4m+8HRxXBSv5+ixx06RuTCPhMu4FgAhsd94YdYr+nyapSE+UdjBEyQDX
         aFhMRUB6psPuLOJcrI6+rwr7lOWuSVpFW3qDdkr/dzfmJ9imzuedEJ398ConmVuXFwVA
         Z6WsFP2ooogDcTrARJ6/mGNpR746L/52C2OD8qmO7H8dW1fbp8oV6AdSmVXV3BYsomDU
         vad0Lv8VSl9s6j1c8CLaJFyW7TC55nAIzu4wZphZhEsFL4YkzOh3EWywDQ1NaJUuIGEm
         68MFJujoTgXIXv3zPKYfyqdgLaE+WnSn+G0+s2qnVFHHt92q34NMz3/nLB86jorPq5LC
         32VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378867; x=1795983667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KoXhXnM3oUjZYemCskQWf/r+E20vle0w0i0hVE/eaXs=;
        b=j6pM9v+pPi53SkHJa1OIfIoLiR02P7iYfyT3i36E3XYNV1+c5MwqRHMIMSGBRiCtUj
         DwMYvYMI8sO+d0RwTJ/4es5Z6X3M7Raru0+1ev0Lw2Xg6XFQQD05uaj+lTMvjPuSmIRJ
         Lh/JCvCiZFDOSpDDrh+JI7YwotWmnsqkRKkQouyX8IaR86KRiSJtlm6Hi5D5+nv4H1v9
         GqGiQRvWQzt1+OO2G14Y2UVPMaVjL+63xCa+pNMKc1wcMzPGgZ5Vd30PZrA+xrAUN1qc
         RVygk20PLRYv4CfmVdL6sc6HVH5vdiEil0ciqEopRPrTOIHoQykQHLMaA2DGJACa1geG
         YSwQ==
X-Forwarded-Encrypted: i=1; AL+hErHMaaPyoBa18BV4Qi7BYacZV8pGIK+FxLSfNrRWnkJuRBc4bAAoyO6CO7Sdax/5eLtwguLhNn3CqObp9dE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H/Y38zQGFqbaCksQSyVz6CePNWPLuP5E4moNAvjSTLNlt2IXp
	92ndL+n197V0CKFR5fqP089NkyOUn8oMdt34dWXdARFnUG8dYLxP2oTD
X-Gm-Gg: AZFdTZeh3C+BOckGtHjtKAzkQ8/fYADsdw4Sx/ofA8JNzCe1OccEdKcT9yNybUS95kg
	ZCRl2Y7bkXqmatdHjMRmGxCupcr8ZZNa8jJNahBbF1i7vP6AfpyDRVyuFoEDvnIh6OO8Vfw7kdJ
	4zHy7xNcKr+89IYhFXUAtv/3MkwxcWmeHNeHThY/gpVvhca4CVXjZY7CGg58pqG5TPzGb2hdyu7
	QnOq3fgFEyrev567dG00E7/C3smMOlrWxeCXS3Ry8upokyBU/jIOUG2HQia1nuVLFbujcQ6h8E5
	N4gt87NghQmjh4kMILZanCGOuH6nDgF7x30OyTcNetgM67M117wAZg7VYoscDHBqL9NaS1/tvpN
	qotwLdHG9+xsTXjv9iAd3mCGlj/Inr7xtN2PevelCu0WhLIHI0Vacxlugfgny7rQgRiawz2Amsm
	a0WsLPzwYPNaCzUiE4hbXjbk7cDGu9BQuGy40IBOGlZRYnwhLpzQTicgAuynWNjXPWhY7B0wX4J
	fCNT9b9H1U8PYQlNrCdvQq64KoT6u/VvdKa6p95XGqzNYyeZephpTB0Vg4GJM0ubqG6vk0RNQKi
	y48paVYkeZGKroOkEhIyamUt4PKlxHqfNEluVHo8YNEjvPTNXPhxYoWSLWVxFKJmNA8dAfiWhI8
	xWssqIqEA3toITMHNX5j70sphChQE0By1zGorx1a45Llyz9tq3/n1h80vuayZUf6i2nAQCBGb/f
	WEQrBh2WrCRbT9sdwdv9DzKScciKGQOA==
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr235773315e9.9.1795378867083;
        Sun, 22 Nov 2026 12:21:07 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a14a-2801-2d6d-9df0-1f3c-62cb.310.pool.telefonica.de. [2a02:3100:a14a:2801:2d6d:9df0:1f3c:62cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm381533945e9.0.2026.11.22.12.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:21:06 -0800 (PST)
Date: Sun, 22 Nov 2026 21:21:03 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Wen Yang <wen.yang@linux.dev>, 
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 9/9] rv: Test IRQ-exit softirq provenance and
 handoff
Message-ID: <awNNrVvXCFVPhgk_@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
 <20261107171252.25090-10-kmehltretter@gmail.com>
 <e8b9a9afb9587ed1f41c0fafd486ec9be82928db.camel@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b9a9afb9587ed1f41c0fafd486ec9be82928db.camel@redhat.com>

On Sat, Nov 21, 2026 at 03:01:13PM +0100, Gabriele Monaco wrote:
> On Sat, 2026-11-07 at 18:12 +0100, Karl Mehltretter wrote:
> > On PREEMPT_RT, verify that worker events do not report hardirq provenance.
> > Do not run the synthetic inline IRQ-exit cases there. IRQ exit defers
> > softirqs to workers, and serving-softirq state is task-local rather than
> > encoded solely in preempt_count().
> > 
> > Snapshot reaction counts inside synthetic IRQ-disabled and hardirq
> > intervals, then evaluate the KUnit expectations after restoring normal task
> > context.
> > 
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> I still couldn't read the KUnit tests, but from what I get quickly scanning
> these, it's massive. A total of almost 3k lines of KUnit tests for 2 simple
> models is probably a bit much.

Agreed. I'll cut the KUnit tests down to a much smaller set focused on
the monitor transitions.

> 
> Keep in mind you are testing your unit, which is an RV monitor, so you may want
> to stress transitions, mess around with the environment as little as you can
> (e.g. disable interrupts) and use mocks/stubs where you can. It isn't always
> easy, but the fact you're touching softirq.c doesn't look right. Your
> unit isn't the softirq machinery, you should interact with it as least as
> possible.

Makes sense. I'll drop the test hooks from softirq.c and simulate the
events instead.

I'll address your comments on the other patches as well.

Thanks,  
Karl
