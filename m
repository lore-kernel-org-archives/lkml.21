Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795017067;
	b=TpgHIcdvEpt8lvX00YCLAUggTzPRlMzEHoc5CJsUxbsRszNLzmQ3ofFhjVIzTHPhPxd4
	 BOc+jQXk0S05FUFxuutMv7Q4B4y2+RURHjTdREGUamNOTqDv2iYqgjlCFiLWZ78cdWnQK
	 qhxg3zTt0xgxm+7feLPKDx45cd9mC8deAaTtyJrMDeWqC00G0S8/FcB9Yv+ooFwTTDNYq
	 v4Xn5lijzGkxGfX3LY711xnl8Xi3UFl9qHtlLUVJW/59yNpx+h8ozl4AURx7KvICsvdGx
	 hnlkZSw7M9afR29KGUi42ZZPsEXsmLxYt2NA1/7Imz5gOWEce1+RJJFPpDROFT7yr7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017067;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=pG0bpB9mJULpXbPaapaUXajD9NqNGozFWf6HPR9ypcQ=;
	b=fy3GjZaHzlTBiDPNKUBiek245GGuuqJ0b2HJGqDNzYM7YhbjUhXAiJAZ3v044oJyOT6R
	 dwPdSiOC/4UvZBrhUgnTtqnx3ltiY/tjW/zfclEGDOO6aJEgvjeZPz7Vd7tp0N2XB1gRT
	 w/2ayJowd9mWBBe2t1JBONwl6I4O7YHyNBJodn9TzEYqpbrjuiC6dfbow7hrjVodY0O6x
	 TU4W8ZxsSfkX5GMYXfB3kKlUzXueYtEd7IfKJTGlYdF41SXl9ln2fV33SfEJc9fx6EyPb
	 ydb5u8A9i9kdrGHzRpv/g9mkDW7WkV4KkGLt/c32ItDoD1DFV8SaNIcoabjHvkTnREA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="euYD/y/m";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gNji4lo1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A39C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A39C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=euYD/y/m;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gNji4lo1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795017065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pG0bpB9mJULpXbPaapaUXajD9NqNGozFWf6HPR9ypcQ=;
	b=euYD/y/m31mGixO8Ku4gnO0RrubeM+1NdVkE46GzI5pk+xGz1SIosvprcByYSorgTqVlCF
	7Jk+9oMWgtQ4UfXFe02Sif4dCPkbjRgokjfqLSRGAH+RSZRk+k+azvmMkdrKQo2ytMGrxS
	C2ilAh+rf2XdIM5dVS1jfBQNilV+eEg=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-pkupTpZWMGG3yxZk8aiUcw-1; Wed, 18 Nov 2026 10:51:04 -0500
X-MC-Unique: pkupTpZWMGG3yxZk8aiUcw-1
X-Mimecast-MFC-AGG-ID: pkupTpZWMGG3yxZk8aiUcw_1795017064
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecffb6a384so476234e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:51:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795017064; cv=none;
        d=google.com; s=arc-20260327;
        b=aXpgoebPO09mQgkVXn4691Hv1ESW5Q2XpMrGMWjlgX55pAbGHHW18jMtFZkpuwAPuF
         lDMeLQZ+SiSCjlXkcAowjrOGcOC/QNHgh02m+8EOqBy3iLuno73awzEpPfXvPN59kCkG
         qQc/Oo0TDDJajI0dx52iWoFLdGq1vr42lYL7XRMXnnbO8fiUfdxIa6EMXTmA9TwH6DUA
         TKrCYdD8FBIctcqwEE2TyPldpzsPJMtjJK6d1U6Xw+IKIe/ljEHixj0BpQ3NlB34DQyC
         lpOVtHeso02b8E3vPF5+3IZpuHBFb2d32kHoFGL2NLw+dguU9nRyLFI34rTV10pWoOp3
         6PzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pG0bpB9mJULpXbPaapaUXajD9NqNGozFWf6HPR9ypcQ=;
        fh=LQmaA7jCAcUPkEHYB2nGYrtFAHAM7IhKV3Zdebq1uEM=;
        b=gNbENpTQIHd3nMJHyd4Q66yp4Qy2ZtwL/6Oi5L7C6mln4Ff5Vn5rGuMYR1kU6kGxae
         YRnpgDO8QSk+rvUhEu6jnOt+VwpxPNdcN4uCvAuoETXTVMT5chtsoqIidd3ynZehAlyt
         rQJ7reH80FgkJ/OUOxNa67HN2fcUl3jd0iLO3jTa5gFDG4E30jwRzRuinadyiJr+6HG0
         sbK5M0lBF7soBbhlwKDEoga6QDaGnvstO6+bPLC6GQYXBrbooMq5azrVC5utPU/Rle7q
         iTLE4dAfpnD6XE6tBDhi5lqGvcUzTYaAfj5Cft7F0bE8p8pX92zS80cKf7/Q9vKynoc/
         XFhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795017064; x=1795621864; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pG0bpB9mJULpXbPaapaUXajD9NqNGozFWf6HPR9ypcQ=;
        b=gNji4lo1lu16QkuoEmLkvKWcmvgLGetlEvRLOxBHN4UNjkw/CUat5y3kdYBb34+LVq
         xsTHlI7NwTVLyhaeUldobGC2nOhn9PAizJeoylcSKioHIW7g7PoUcF3abw7+yhWWD85J
         T+KWYAybQbMplz0ExSl5bCRXdKqcgBoFobny/6sEGPLe3uC7EBoUVKyVuLDQSvJDwBCv
         YIKynf4s3Odvt7Y+R6VNANDY+Sy7lWh0z/ncGMUYNuopId0RNMSUlHJz5CsYyeeb3o0l
         w2KhyjkF4vYig1U/Qkq7WbooYn4QY8QRIsl8J18r8gLrLY+rRXb5PnBLnc8A8aMmRXvR
         wOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017064; x=1795621864;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pG0bpB9mJULpXbPaapaUXajD9NqNGozFWf6HPR9ypcQ=;
        b=hVEsrYIPZwmA/twH/qtlT8BS2umwFaeWEdnbDqb4yZ2DSS612LmIxzK4dhAnPPhigF
         HGr3sPjF5PaeBv65PTdVICLgsqp0Gs2ykv7AmwlaRsEdBi/939q3nRp6txLHrQC/LTXr
         QQaW3sPLsVftXiK7ZdCixlvjAlUsDweBgmfdgHJuQUZLz7irfcDGcMfwuPwIjtWjnPGw
         IIEuictJIYUE9lFZrVZ9Q03fs+zTuO81WbuUWgcIFMRAoW46i87KZc2kE1us25VgrDYp
         btYsB0gPOD1+rVZBNNZL9KYJJmo10tGizZQmaTF5y7o9AJ59Z7vSAOas0KIpfs9NeOwe
         wxEg==
X-Forwarded-Encrypted: i=1; AL+hErEX+Vu8tPYL68muHMfZrE1oweoE1zHzvGliaIZ4w474ui8ROwXdOwaIGd4Bak/nDcw2k46Fv9iHgMek4Gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LRcfpw/GGk4k5Od9961B9gf3wz00yDkJg36P43Z3TyhkIeW/4
	OexZ2BlOVHG57AhMS7IPwp6UMtQuKWsFIV7Ma8pYu0UjU2A07YnCv+c/ZbJyWA/xGjQ1Gvo83Yu
	OZCXuY0Jcz1pW3rr5IrWcB+0W4IKwgsSaHkdKecha/I1/2XAFxNiwzZBJYL/ojj/M1/9tgOGKYa
	+cdhrJPRqNeO7l2WVqFip2/HOPaMzmHBn/MG69+2d/
X-Gm-Gg: AYBFou3D8JVzxd6nSU2RK+TbiLm/kyn9CY6zExYc26PPONVKXS6xVya7TIu0CoKAW17
	mMPcLf2KYejrePHGqXnf8Eok4U0gVZDRbaSjQHYhxbqW7h2lf+CJ4vjApuh6JAF56j0FTjo6J9p
	0q0gaeN+tPZBH86TeihjUwHBPkb196zHM0m2O0UTkvZ0WLAIcW3KI+M65P
X-Received: by 2002:a05:6123:123:b0:5ec:b8f0:774a with SMTP id 71dfb90a1353d-5ee645f92e6mr1671564e0c.3.1795017063997;
        Wed, 18 Nov 2026 07:51:03 -0800 (PST)
X-Received: by 2002:a05:6123:123:b0:5ec:b8f0:774a with SMTP id
 71dfb90a1353d-5ee645f92e6mr1671552e0c.3.1795017063485; Wed, 18 Nov 2026
 07:51:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <a2d7e7b2-5a4c-48bc-b567-61e3cbd17786@intel.com>
 <20260410092057.GG3126523@noisy.programming.kicks-ass.net>
 <CAE4VaGAZavgRWDf=ukaj_EJvOO52hTpAYKPe1JEtUE3E2q0y0w@mail.gmail.com>
 <13d982ce42116f876f01a77bae7f02d3800f08fc.camel@linux.intel.com>
 <avqYbuJPHo4zLDOd@three-body> <CAE4VaGAL5FPGUrG76pzf=9pJTaMWa60pbkLv-ZXCFjr5H2JpDg@mail.gmail.com>
 <879c23213859f24b12a23530d6ae849bbe504b6b.camel@linux.intel.com>
 <avxDmPs4rs39NC9O@three-body> <avxGoEVvohbK0nUS@three-body>
 <CAE4VaGD2idBi35zDQWCY2ybB0spz+tKEX5=59O5U5tBbjGuYAw@mail.gmail.com> <av2tdXOhCjMgLHsq@chenyu-dev>
In-Reply-To: <av2tdXOhCjMgLHsq@chenyu-dev>
From: Jirka Hladky <jhladky@redhat.com>
Date: Wed, 18 Nov 2026 16:50:52 +0100
X-Gm-Features: AclHuK8RHEi-lka1f4vwKo7gc8BYY-GutqrCIXsx4qnicI6-9Z-RbFiOI6ZmCaQ
Message-ID: <CAE4VaGBf__ktY48MbL3FkG4TvQaAQDUdhRKphjivPuou_MmhRA@mail.gmail.com>
Subject: Re: [Patch v4 17/22] sched/cache: Avoid cache-aware scheduling for
 memory-heavy processes
To: Chen Yu <yu.c.chen@intel.com>
Cc: Chen Yu <chen.yu@linux.dev>, Tim Chen <tim.c.chen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Gautham R . Shenoy" <gautham.shenoy@amd.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Hillf Danton <hdanton@sina.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Jianyong Wu <jianyong.wu@outlook.com>, Yangyu Chen <cyy@cyyself.name>, 
	Tingyin Duan <tingyin.duan@gmail.com>, Vern Hao <vernhao@tencent.com>, 
	Vern Hao <haoxing990@gmail.com>, Len Brown <len.brown@intel.com>, 
	Aubrey Li <aubrey.li@intel.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Chen Yu <yu.chen.surf@gmail.com>, Adam Li <adamli@os.amperecomputing.com>, 
	Aaron Lu <ziqianlu@bytedance.com>, Tim Chen <tim.c.chen@intel.com>, 
	Josh Don <joshdon@google.com>, Gavin Guo <gavinguo@igalia.com>, 
	Qais Yousef <qyousef@layalina.io>, Libo Chen <libchen@purestorage.com>, 
	linux-kernel@vger.kernel.org, "Luck, Tony" <tony.luck@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Philip Auld <pauld@redhat.com>, 
	Joe Mario <jmario@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Phil, Chen Yu,

Phil, on your question: the VM results were in my mail, but they may
have been cut in the quoting. The short version: the patched kernel
at the default tolerance loses the VM's 20 percent packing win
(22.47 s vs 21.81 s with CAS off), and gets it back at
aggr_tolerance=4 (17.70 s). That is the one regression the patches
introduce, and it was the known cost of the RSS bound. The refusal
is also not permanent: the RSS check only governs until the first
address-space sweep completes (~16 s for this VM), after which the
fault-based estimate takes over and grouping can start again, which
I traced on a long-running variant of the VM test. So the worst
case for a workload that genuinely should aggregate is a bounded
startup delay, not a permanent behavior change.

On safety elsewhere: with CAS off, the patched kernel matches stock
on everything we ran (NAS MG D 26.38 vs 26.45 s, MG C 9.38 vs
9.34 s, VM 21.81 vs 22.12 s, all n=5 medians and within noise), so
the patches are inert when the feature is off. With CAS on, the
behavioral change is confined to processes whose RSS exceeds the
LLC (they no longer aggregate) and to the estimate dynamics near
the threshold; processes with a small RSS aggregate exactly as
before.

Chen Yu, on your questions:

> Actually what I mean was if the RSS (not footprint accumulation
> during numa page fault) is used as the last resort if the
> footprint is 0, will this change fix the issue anyway? I guess
> the answer is yes, because you mentioned that the major fix is
> from the RSS gating.

Yes, confirmed with numbers. That is exactly the configuration I
tested (Tim's second patch falls back to the RSS when the history
is 0). NAS runtimes, n=5 medians:

  workload      stock OFF  stock ON   patched OFF  patched ON
  NAS MG D 1x64  26.45 s    41.78 s    26.38 s      26.47 s
  NAS MG C 1x4    9.34 s    11.99 s     9.38 s       9.36 s

The gate refuses within ~0.1 s of the allocation phase, so the
CAS-on runtime matches the CAS-off runtime on the patched kernel.
The RSS fallback alone eliminates the reported regressions; your
sketch's accumulation is what makes the decision correct
afterward, not what stops the damage.

> The test code is a single process with several threads just doing
> a while(1) loop, without waking up each other. First, bind all
> threads to LLC0 (socket0), then release their CPU affinity, and
> watch how they are spread to LLC1.

I replicated your test on our 288-CPU box (64 spinning threads,
bound to LLC0, affinity released, placement sampled at 10 Hz).
With CAS off, the mean interval between threads reaching LLC1 is
1.59 s, against your model's 1.44 s for this CPU count: within 10
percent, so the model holds. It also matches the re-spread rate I
measured on the MG workload (~2 s per thread in the main window),
which supports your reading of my trace: the wake placement is
expected wake_affine behavior, and the load balancer's pace is the
rate limiter. My "wake placement plus conservative balancing"
should really read "conservative balancing, with wake placement
doing what it always does".

For completeness, I also ran it with CAS on: only 5 of 64 threads
reached LLC1 in 240 s. The spinning threads form a cache group
with a zero footprint (they never fault), so the group holds them
on LLC0.

On the numa_group idea: one caution from our two workloads. Both
qemu (which benefits from packing) and NAS MG (which loses 58%)
are single processes whose threads share one mm, so group or mm
membership alone does not separate them; what separates them is
the hot-set-to-LLC ratio. So I agree the sharing signal is the
right thing to look for, but it likely has to come from userspace
via prctl, or from a signal that tracks the actual sharing
fraction, rather than from grouping alone.

Thanks,
Jirka

On Tue, Nov 18, 2026 at 9:31 PM Chen Yu <chen.yu@linux.dev> wrote:

