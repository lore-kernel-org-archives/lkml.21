Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116522;
	b=JBiTw4Arv7nlozpvuG1Km5Q/xw4QMNsqkjqGpzeeMOUk1uY2cakQln5RQWxmBIVNYNDL
	 EW86qrd7qY0frEGjNFJZrh9O/htQyZUywMA0/JrOz9FEyEXu7cHc3Vith2Q9AyirmNQfH
	 1a5UrjvmrQNK9tZmSUkAuqvm8I58xP2nseotB2xeLER2gKDwJtmofaRU3wioBvjZ2GJnO
	 /F12bhA1Dd8udYhegwLbQuDwXXPlg6vnqJdvr8yrIQNx0atTmHZwJa9arSPhL/cKjOAcy
	 6F3G89WKxBGnnE3Nt5r9MX079lfvb30qmFrB6VItckt7y2TEzG0KIaYCvT2gvsbg+Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=daCieWNeyyAkEEfSGL+gig14C8b2lK6bD4Sqxa/vxJ8=;
	b=IOYP22fVzNSr6fkzT2d7N+/edb9P84ZHBve8y/xxwrHcY8l/5tTTtcqTCxO6lv5FkWGH
	 K/d+SJuPw7YBeiZmQxjpzvPo+staG6caT8/ZInDazIFhxMgz0lhqBtlbmj2FGJl6qEJ0C
	 h2fUu3H4epQOGVYmrrk1dY6YPd5eKEW3ed+huM7I0KBMaaT3w1Z00Qo5lArhV8VdXyPlq
	 MdcUCR6MtquNbvPVR86os2CySfRSUoJ0xXhJvYrS4GCO3rQeEfeT/2drJnRMGgE3+vUj2
	 Gpf5+R6TJ/V7hXgIDd9dgliJEtxutLEhZ+0wU0Mj3np9ufJo6JtHrj/PGfdhlzW57LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tu20Gqk/";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0AF606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC0AF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu20Gqk/
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso28086f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116520; x=1795721320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daCieWNeyyAkEEfSGL+gig14C8b2lK6bD4Sqxa/vxJ8=;
        b=tu20Gqk/R+74eslqU7J+Qfe6fCPgO4z10zl9W/g+ahjktmWwy2JW7Pyk5DMtk7Npri
         DWK9YC+vyF0laiaM1V8JE130P3Pqean1axFhXx+ax8wiPIS8RTV2CI9DzjfJpEtsZS9i
         395vPURZPnd/woNmWSQGqV1wsOaaS0EvS07d6VsHDfCXlJIFEcJeHbMBg+1mGEeyAP9J
         9jEn4aCTbjergCG7KG8jEJP/Bc6R4SurYMYyhWGcjp/uKMxa57LL3Xh0jIct8EWFkklv
         w7xXc2qeAuPOJWrEowkLN7t9bplc32MaJzEPItjHzhJgE0XGCB24Rv04zi/6it5NEALW
         oY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116520; x=1795721320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daCieWNeyyAkEEfSGL+gig14C8b2lK6bD4Sqxa/vxJ8=;
        b=OvbQfrIdX34698e7BSePw1mbZ80SouSQD2dq5XhuL3qKJneqEGteuNHkE67R/7y2bD
         P0LytJD+zJ/cJEvfUtOcxLVg+XDp2rwqhU45Rgxht/f+y5Jfphzb87RY9ORoRjd1v92O
         rWGTTv2Ae6OZtQVoWUHvsI9h/n7NcNKoBoI+M8/hTXFCtDStXh8RLQH0xewKTRsj0e5x
         W1OWSlK49RnuJJ6ixvD6a6fabFuN3A5SKmN5Ris01UDluQsY9+FGw5LazBz+NtNChXfB
         zMxmxey3F2E+chCyJgLql4/veVxaRAGOJGSchO09yzf8sfdx57eKjNdHZUMPKsFRtRg/
         1qnQ==
X-Forwarded-Encrypted: i=1; AL+hErEOMIhHitytHEf2kMaLdaIZQHfGufZc3j3VPi2Xa/Re/6GVKHRV29no2vY8IR99Ynm1wehka7DpKer+OMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W71sNa+gcKv5/2LONLTs8vcVr0t+4JI4L8NX9ZBDH18UoT71X
	AORS0HCe6M/zEhrFBvb0Y0zm3yrCk/OKVGd5goFoIG66ezBFI1s6NhVJ
X-Gm-Gg: AZFdTZfIaY5e+iiY1coKYtCYNKUjMEacrxvmbbfCYiM9oUx2NVYpzBd0LGi3NqSNOOk
	9H09OXD8PVZuTJLct5n6x/CD/7pu/hOwGpXJQePpp2Qw7CrkAXR1ipytHhfhqRD4vNLMFjiiIAo
	vD5jIZJHURqHa/9W31kmTZFjvEeKnqwAdIXHqE+xADnNRxhP7afIg8Pd0E13xypZhbHFhIIr4BW
	hGJK1RZmw50+SOTB4G3qmYU4k1M/6Pp/qn2SXUZb8RBxFtk7eR5tlHK3lbpzLxndqxdcRK0Gzz6
	a67z/IQ2FhNvnaT+1ApO3o+btdrbqIIP0t9aBsgeR0YEL0d2kOt4UYr8iPu6RGzPD7+w/8W4tKV
	W2iLHPraEfB21Ou6L8m+C2XmFjLN5Pe6OdAoYFgMylGWEURoaCOwd9CnipdKHvnubwYHhV+dCNk
	AwhxOW3ba4uXjqfglLdVWC7YwS1I3gk4Ui2sm+qFud+H2pxZEQDnJuSGxk3m8DTdGWoS0jp4mMf
	DeflqVmQj2LE8mN9xKQquwWZFW8LR4UDnCU7JebYpZq5b48/bDyiqnUSZQJERrHEzZO6l+rdmDD
	JPFh6IGNBjIq2uc46V9yMEZjDNu2mKe6MT/UjI0=
X-Received: by 2002:a05:6000:4b1e:b0:48c:7143:610c with SMTP id ffacd0b85a97d-4abb2910b8fmr809897f8f.36.1795116520113;
        Thu, 19 Nov 2026 11:28:40 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm1477581f8f.21.2026.11.19.11.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:28:39 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 19 Nov 2026 20:28:37 +0100
To: bot+bpf-ci@kernel.org
Cc: mike.bazov@gmail.com, song@kernel.org, ihor.solodrai@linux.dev,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
	yonghong.song@linux.dev, emil@etsalapatis.com, kpsingh@kernel.org,
	matt@bobrowski.net, rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v2] bpf: Use an on-stack pt_regs in the raw
 tracepoint helpers
Message-ID: <av9N5RqhdRhW1fVh@krava>
References: <20261119-bpf-raw-tp-regs-preempt-v2-1-e1e1b90857d6@gmail.com>
 <77d978d7f9343e907651b4d4d81ec1c1405dce42f75e33b169f729f208029fcc@mail.kernel.org>
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
In-Reply-To: <77d978d7f9343e907651b4d4d81ec1c1405dce42f75e33b169f729f208029fcc@mail.kernel.org>

On Thu, Nov 19, 2026 at 11:14:51AM +0000, bot+bpf-ci@kernel.org wrote:
> > bpf: Use an on-stack pt_regs in the raw tracepoint helpers
> 
> TL;DR: Without the per-CPU slots, nested raw_tp/fentry programs may hit the
> WARN_ON_ONCE in bpf_perf_event_output() (panic with panic_on_warn); the commit
> message's claim of no more -EBUSY also looks wrong.
> 
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> 
> [ ... ]
> 
> >  BPF_CALL_5(bpf_perf_event_output_raw_tp, struct bpf_raw_tracepoint_args *, args,
> >  	   struct bpf_map *, map, u64, flags, void *, data, u64, size)
> >  {
> > -	struct pt_regs *regs = get_bpf_raw_tp_regs();
> > -	int ret;
> > -
> > -	if (IS_ERR(regs))
> > -		return PTR_ERR(regs);
> > -
> > -	perf_fetch_caller_regs(regs);
> > -	ret = ____bpf_perf_event_output(regs, map, flags, data, size);
> > +	struct pt_regs regs = {};
> >  
> > -	put_bpf_raw_tp_regs();
> > -	return ret;
> > +	perf_fetch_caller_regs(&regs);
> > +	return ____bpf_perf_event_output(&regs, map, flags, data, size);
> >  }
> 
> Can this reach the WARN_ON_ONCE() in bpf_perf_event_output() using only
> raw_tp and tracing programs?
> 
> bpf_perf_event_output() still has a three-level limit:
> 
>     nest_level = this_cpu_inc_return(bpf_trace_nest_level);
> 
>     if (WARN_ON_ONCE(nest_level > ARRAY_SIZE(sds->sds))) {
>         err = -EBUSY;
>         goto out;
>     }
> 
> Before this patch, every raw_tp/tracing caller first took a
> bpf_raw_tp_nest_level slot, so a fourth nested caller got a silent -EBUSY
> from get_bpf_raw_tp_regs().  That function's WARN_ON_ONCE was removed by
> commit 3880cdbed1c4 ("bpf: Fix WARN() in get_bpf_raw_tp_regs") after a
> syzbot report of this kind of nesting.  The WARN above could only fire if a
> kprobe, tracepoint or perf_event program was also in the chain.
> 
> With the slots gone, a chain of only raw_tp/tracing programs can get there.
> For example, a raw_tp program A calls bpf_perf_event_output() (nest 1),
> and its __bpf_perf_event_output() calls perf_event_output().  Fentry
> programs B, C and D attached to perf_event_output() also call
> bpf_perf_event_output(), and each is let through once by its own
> prog->active check, so they run at nest 2, 3 and 4.  At D the WARN_ON_ONCE
> fires, and with panic_on_warn the kernel panics.  The same depth is
> reachable across task, softirq, hardirq and NMI context.
> 
> This also seems to contradict the commit message:
> 
> > the helpers no longer fail with -EBUSY when nested more than three deep
> 
> For bpf_perf_event_output() the three-level limit remains, coming from
> bpf_trace_sds and bpf_trace_nest_level.
> 
> Should the WARN_ON_ONCE in bpf_perf_event_output() be dropped, as
> 3880cdbed1c4 did for get_bpf_raw_tp_regs(), and should the commit message
> say that bpf_perf_event_output() keeps its three-level limit?

+1 we can now nest more than 3 times, hitting that limit shouldn't warn

jirka

> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/44508926690

