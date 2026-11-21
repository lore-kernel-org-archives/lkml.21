Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257315;
	b=UIGjYspNMbNXDp93rxEJnV8xIDj+E089xD2TI9k9cRuNSAbV3VkHlftmd9MSplheYOQU
	 fFdHZoosjXbuXCVldWCVJD5LZkwhlZxLZ82bCpThcjpbzY0GqXrTnO9rBCQdg4wmWBmnX
	 eD1Uv1979eWpsmmK6p/SJlzv7yIbbDSInIgylwErnKXDCE8sXE3DaK70pnGNfM+lQfEuL
	 mQbqkqKJu8LAUvkzL+6L3pEv9DQuMdGsX52l0SWlVPPlAbH6BjZeyfnu1ZWVQ04OvD7Ho
	 TXmd1xziyR1r/m7dq/Lj2WugjigHnI1oEORjHOlclAoCNSLvCygTt42bK33kc+pPBoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257315;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=9bsvYKUqqiIEmbO2aiAG3E5Ax6t0fNk6OQ/rRTGZEtM=;
	b=CJg1F7dQz9s0PbKcTXa+E1Ne1CM8bjaktOB6zIWazWX5Dr+6Y8B4zGJ6i68ctGZOaPrW
	 Ol2CogWG+2/mZXT4QJzO7WDCsRlwS+J/wjtQE8h6fKK+ULEkw/3Q1x2mkazDzSyu260O+
	 g1pxhFnG5eyo7s+KFpGWZk+fkhz/Vsko/gBL8VaUu8iulfu9xq2Lp/i458rxHiYlEz1Hs
	 EQn9svvNsGwcngE0cyYg3i/CzvPazJYYP/AEnVJXhPEnWOR3NNKaxXCyTidZ0fX9ZgX5o
	 NxTZ3dYy1q0F2J0AVuHLIMxB5DMqeQ8d+zASGAliquUk6F3vbxRournAoT6PA7dL87w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="T06V/NK5";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GH8CCjzs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E6B606A332
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E6B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T06V/NK5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GH8CCjzs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795257313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9bsvYKUqqiIEmbO2aiAG3E5Ax6t0fNk6OQ/rRTGZEtM=;
	b=T06V/NK5+dY7JdHwvdPwQG8fzDOLDWPMkf/lRpaDG95YoizlwQc0kJMdv3bgQu6AyJjqr+
	OLVUjH+zk1SGdk6p7pYXwARhx6bYHMvBJG0mjcqLMgxZ2s2jLbef0f5fxAu6G3MMJ4Yzch
	Sv406BK65IXypEE9peNczxOaiJFdCnI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-_oFcwsEKO6GrLTJqjTuy4g-1; Sat, 21 Nov 2026 10:35:11 +0000
X-MC-Unique: _oFcwsEKO6GrLTJqjTuy4g-1
X-Mimecast-MFC-AGG-ID: _oFcwsEKO6GrLTJqjTuy4g_1795257310
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a799d93bc3so829121f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795257310; x=1795862110; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bsvYKUqqiIEmbO2aiAG3E5Ax6t0fNk6OQ/rRTGZEtM=;
        b=GH8CCjzsFzumr78PhysOTQ9fkumvDAoN8Fd/Xl2Jo6xyS6KMUDENRwz1Jx2iFo1n5+
         EcV/Xbf5P9qsSu4nEiaLbb1wZdOknxRBuqvVKndZ51WHNh2VlCkM+3TRDLx+ldjBxuPa
         w+7Q+vaegvCwQA2zsgRC0iQXhpKl5Jj1PmtyVI2SLPq8haKyssNY0bv2isx+daLX5Iao
         0LEAblvztaCa2gOplJidMPyYtd3oi3j05ddpAUxlXu5kXd8fMH2wswRikDhUE1T3R1Hn
         IVTBk90gxbpJCldrV+Je54Oh79n4oeVmcH1NSXowvr4TML8scYFuB1LGFcRbO9mfXs7T
         fhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795257310; x=1795862110;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9bsvYKUqqiIEmbO2aiAG3E5Ax6t0fNk6OQ/rRTGZEtM=;
        b=wSnW8uqmc1aECfRPCcSDd7wJZr4FhZ22ovBlH5JRvau73HNDpf77LDrjtC7HMM43EL
         y88SskjrUPQunigt4Pb5YYGtp7tknyqG5mANzJtAYpixIy/A2gsH2YMiUg9Bd3qncFuT
         PKPjk9JYtXXpqkxkrJIzcZVcfbl4R+JCoir6rr2S3JykRoPTKRocKM6hKZcm7a7g9CdQ
         LT7MX70Clu8tZsYxqqbSlzB+wL9IgaKFYUaOLdiFs9dpquV9vKGdEBCnFri3HfaO/XDV
         ebXj711iqU4Hf84CoCQcnGr7e5vK0/nTHPdvDoPIh/e8Y4C+fw3PEZXZ3ew657HW9ToY
         cJ6w==
X-Forwarded-Encrypted: i=1; AL+hErEn7PXrIXgzWAFxmVeo4DbSCNimUySMu0yW3B94bBHpyetHhnkb2rjx7l4Qh1jkRD75Tw+BgzgXXnYn2tk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IRKxDl2P5gF8t3yrc6b/z0Cy88EZR+3hkkclNY8/X4LLtRmmQ
	t2FjmE/z632DAaprykUJLOv3vr/EYPGR4RRGKi1Cmpdf52UxnBMYgA2WvCBx1MmZJUuW2PMSJSL
	C/CR7GrGxSXze8Qvteqv/5x6+9PGo+Y6eiASjhDsTR+eYHcvMWmElowpkdbrCwj26YQ==
X-Gm-Gg: AZFdTZduFIPIYBulsHzKbLVxzm5JcGom9qlfXyHVEFe42KUupaJ64i7SFnu0snNrz3z
	bSjf+2L/YHK4dF3rVFpwS4UBzePUL4D2irGRb/bB/Z3h8l6wsR7pk4hGJclRlViKE2rwNwrVlPF
	d/ETDCgaLSLdD8MOG5hLMrQ56cf4Gtba6/uNaaV+eF7VYkh0ZW07zhEluUtfHHEQsURusOHkSAP
	aHs24j10fNyVkRqXJzEHfOGfdTBKsnmCrILc2HC5GXQEFsZx4asN5adPXjIWfVcvTBoxes/lEgo
	6+ixqmVWExkQWCToQXVxV3wtymx30P4B4tm1RyzmoiBs+1Uyr29C5GTWoFdPkF11h1/Sjk+fYKG
	o0WCfhfW2c8XgfpR0H8SCK4aaLmFlUanX1k+phnK5rCMeVMHHSlV+30/DaOS6cif60v2DKnydQc
	yY
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr123102035e9.9.1795257310564;
        Sat, 21 Nov 2026 02:35:10 -0800 (PST)
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr123101795e9.9.1795257310278;
        Sat, 21 Nov 2026 02:35:10 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm165089265e9.5.2026.11.21.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:35:09 -0800 (PST)
Message-ID: <6c3fa853697803c63e2b87c7f8a9d4ff2f561820.camel@redhat.com>
Subject: Re: [RFC PATCH v2 2/9] tracing/sched: Add IRQ preemption lifecycle
 tracepoints
From: Gabriele Monaco <gmonaco@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers	
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Ingo Molnar	 <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Andy Lutomirski	 <luto@kernel.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot	 <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,  Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
 <vschneid@redhat.com>,  K Prateek Nayak <kprateek.nayak@amd.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,  Randy
 Dunlap <rdunlap@infradead.org>, Wen Yang <wen.yang@linux.dev>,
 linux-trace-kernel@vger.kernel.org, 	linux-rt-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 11:35:07 +0100
In-Reply-To: <20261107171252.25090-3-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
	 <20261107171252.25090-3-kmehltretter@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-07 at 18:12 +0100, Karl Mehltretter wrote:
...

> =C2=A0asmlinkage __visible void __sched preempt_schedule_irq(void)
> =C2=A0{
> +=09struct task_struct *owner =3D current;
> =C2=A0=09enum ctx_state prev_state;
> =C2=A0
> =C2=A0=09/* Catch callers which need to be fixed */
> =C2=A0=09BUG_ON(preempt_count() || !irqs_disabled());
> =C2=A0
> =C2=A0=09prev_state =3D exception_enter();
> +=09/* Sample before tracing bookkeeping can change the observed context.
> */

What's this comment for? You're tracing before disabling preemption to sche=
dule,
what bookkeeping?

> +=09if (trace_sched_irq_preempt_entry_tp_enabled())
> +=09=09trace_sched_irq_preempt_entry_tp(owner, preempt_count(),
> irqs_disabled());

I don't think you need to check the static key manually, arguments are expa=
nded
inside the trace_##_tp() after checking it, so you can just trace here.

> =C2=A0
> =C2=A0=09do {
> =C2=A0=09=09preempt_disable();
> @@ -7664,6 +7668,8 @@ asmlinkage __visible void __sched
> preempt_schedule_irq(void)
> =C2=A0=09=09sched_preempt_enable_no_resched();
> =C2=A0=09} while (need_resched());
> =C2=A0
> +=09if (trace_sched_irq_preempt_exit_tp_enabled())
> +=09=09trace_sched_irq_preempt_exit_tp(owner, preempt_count(),
> irqs_disabled());

Does the owner here makes sense? Do you use it as the /initiator/ of the fi=
rst
switch? Is it only to match it with the entry (although, as you said, it ma=
y be
somewhere else, running again, or not running at all).

Thanks,
Gabriele

> =C2=A0=09exception_exit(prev_state);
> =C2=A0}
> =C2=A0

