Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795198386;
	b=DQG05/8BI0n+qvxHbZPMx+RHJehIevR4KD53j1m2R6qm71ThkrGytWTHpWXKwmTMw7mp
	 PMHbRD5TYxZKE+qCYKfSH58mT28C7n0V3eiDQi4oErowx8VujrS2kk6ZxrzDTk4lYcYOs
	 eV5k25n8bBTUuWjaykC7sMZDpGkPbxH9vVso9cOxLMLcoP57RaGIHs30E79LSBHF0IBFN
	 vx5TK7TpQcwBBm2MXY1yHOvTHzjlJxiq6uokI/9I6XqpRGMNJFcQLpUmXjz/yMvGUY6Gc
	 PpjwawdOFOKy7bysV482GIWsBYxnznOxAiU4lyUhQh6o47Z/nSthLh81dL2vfp5Vw9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198386;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=+PDt4EhAr0I6LcXqqsbR2+EI1b4ERLPM8lr0a4ICYS0=;
	b=nEIsGOKI0wKCn1lpGH1bgR0CEhLujqkQ+Yo+EBQLf9WMcgyumeWRjmgZbu9XZUOVCPtD
	 rmp00v+jfCQdEcm+/m6RnANPmYrSUdbu6LbrsZg9u9sHtbqPZfeM+8sdlZiJ/3OtEqXzy
	 MeuY50o/R2klLC3Wc+MYjfO2Sr0z+55AIaTP61pphPQdd6ibQf+SZZNekK6jJ5cHPNTGJ
	 JzNmBHmn7VXulbXVW/OxtpH/snTkgMnxvtAg4wfLUBw8H/xNr4vd3nbC36jelQ6ugtAvS
	 5YfWOlR8ld1niUTl1ot6NSCqy5LAQjZ5gUZv2TjCAfit2vnWcod4yysE0hVcYGQXGNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JXDsh00x;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fB6rdO3q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6E606B9A6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF6E606B9A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JXDsh00x;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fB6rdO3q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795198384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PDt4EhAr0I6LcXqqsbR2+EI1b4ERLPM8lr0a4ICYS0=;
	b=JXDsh00x4oh2ceyrINz6WJweV7TjCQaR5YTtuDI+U3Y+DxmiXfX8GIDN/vwJn1wKCIcuEz
	AIjoKIGi7vHvo1etP4KBI+YkatKgBZemPV7kGKcuhwuWv5sz+GueMA53+KhbSkci+5iFDk
	foZkk/NFHLRCj/rXcqX73A2qfskl63A=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-Mawyxv5uMnyd_APMxuwjFw-1; Fri, 20 Nov 2026 18:13:01 +0000
X-MC-Unique: Mawyxv5uMnyd_APMxuwjFw-1
X-Mimecast-MFC-AGG-ID: Mawyxv5uMnyd_APMxuwjFw_1795198381
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc36b97a77so288670137.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:13:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795198381; cv=none;
        d=google.com; s=arc-20260327;
        b=QOmKtTq0FBRuYfCNCqV0vwQGV8X69f9SoPC0hcxat+8D1iUeV2HONN9WMA4OLURKD7
         1pafaqidumvpFO+XpAQQUDBrCwDQ97yUpjObJwBtQ6jTfUR7Fals8HcVibyJbKZteagY
         BNaE4IYLNaU0RHFpwrQVYFZ3eDYLQ/hUNy9mB9DQaRTcIjjBMn5yk8/yHVw/7N1qDqSc
         js0Zl88DL6RDnL61JXJNi+DmM3P9/dJjui55XI0KKd4RQxHAaILlK6s2Iu8eut3l5H/w
         xVU/94ZgXNokiGq50QqFIjFrYAslaOwAAnOUicr3deDTWJM3GOP1JaRD6AfsHH9ftFz7
         vBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+PDt4EhAr0I6LcXqqsbR2+EI1b4ERLPM8lr0a4ICYS0=;
        fh=wdFCPxLVl6MyeklKZ7cEitIr/40gvguuaycBK73qDFc=;
        b=f822FegzXPdgTU5+o02cpvi/Ynb0+Gn5yJ9eXJh44PJwEC2ZUIibYOsx/Yx6Ztl/Ka
         gehMZ+E8KTfty/HdhYAtRtHY41qyymsnXULsyiGGDzm+sLe3sUr+dQjdYGFFstgq9mST
         ueTeQG4vEMO6kTpi9h/5CvJbYun6GFFS3OsxxEnC4HG/3WHFXmwZ6AXCpzUqv2a4yX14
         sWCKEMpQi+mCsvtf+EnIHs9sUso+9LsBOufokgNs379IP5oDHKDbmMDJZU/vxLx3rNdS
         131VyesbiZxIglHa62+s2FMYnK3myCP7dDSlU0hgwHceCmwJIJryuHJn2JmQ0XBjHcal
         RSLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795198381; x=1795803181; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PDt4EhAr0I6LcXqqsbR2+EI1b4ERLPM8lr0a4ICYS0=;
        b=fB6rdO3qvNg2YdMsZdilf2Xkrhl1PFIF6eBz8DgYMKwA5pvo4cO+Y5Yr9K+LogWzCl
         R5fqGhv0kDMuCXb6OfROcFzmq7cQck/SwP1xasBvVJYirhudJbvPPvdaJifIsA95z6+C
         xW0qCzzzHam8TpuwXxvO0lcij4NBw7m+yDC2ABf8mzzOMNqYknYZy4V8qimjxDN5E+Jb
         i3WvtLPftTTnbIdpajbIQysWp7gfDCSzr5BM0IMQBC8tda0SH7rR8rUE+0KcYEmh8Lgr
         w3kaOSVMuS/5KomZFYATrit8PV/VmnqxevTcfnCQkcNlvFzhjgKdtgcmElXbs9OGxXqP
         vuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198381; x=1795803181;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+PDt4EhAr0I6LcXqqsbR2+EI1b4ERLPM8lr0a4ICYS0=;
        b=sqICiG0g4KYEb/xjvs1lQ2wfaGV68s2hcqlpahNgETJ1QqCLm+Ya3ZD9N5ARZu6NQC
         IxXxco/yRK/y90+LdUYt+0juMPoFhYAhSJCz2T1n+I439lKjDhQMurgJpI8GMvLgEdmr
         CD/aOqPKhhDFa3ZE0f64itfWf7gimp1mrR7H3vchGyBDm5mjMNHJwfrg1qXQrrb4KqIJ
         dk3UA8eFqKGucIbeciF2PjzuYVHGy0OD4y5+MIGKE18dkPbN1j5J3OjK7u1kjSuY24T3
         NmsBUrW0vDf94sDlSePMzXSW6xbYozNWyt4+WQDstuCnF7ep+G64OhHxZ4M0LaohZC9a
         m2hA==
X-Forwarded-Encrypted: i=1; AL+hErHAt2f/96v/6wgO3kn3iphuPozl9PwDYO7MTdtIsX58b/9hmW99YUYXOtRg8Omi9c1vGE6qfQ7f+vyZfgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jc9uDWeNEUGWSAdc6l9vLtWEZWFJK1yCsBG/zKU7CN9fETEbX
	lMVz2ZDpfmXy+gQODQFKi9LKMe6QTm87kXdJ+5dO4LUqLn3SAEP48Ppx9A1Clq2cqqS0kMAVLdU
	VwUSr/ZUdRTVyFd0CjG3MxUeogbjXBaTNU10QTvocRcRB7TGtbbLqbtDGAQwL7c1KuMGg34QqgW
	xDyBttgEis51sAc/loO1IkE9LmmIWJ+pB0UoaF0k8H
X-Gm-Gg: AZFdTZcPRYmraxKiaJB+0dqdnJb8z5M/7DAKBzDv/py9XpmDhgr+N2S27VAErPL2I/t
	UYwVoTZ+4T/Bx4xH8mF8sQPPqNTXBzS+TN5GpaSmutz/vwb90Wvt9QxNVNxO0Ut/i0fj5/VMjve
	onLPrZsJF51J3elwHOL/SP6TP6J22sv21daCCsLVhHLdmcSYsi4phXb9Hb
X-Received: by 2002:a05:6102:5613:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d7395e3287mr1594275137.25.1795198381068;
        Fri, 20 Nov 2026 10:13:01 -0800 (PST)
X-Received: by 2002:a05:6102:5613:b0:7cc:2cd0:e73c with SMTP id
 ada2fe7eead31-7d7395e3287mr1594270137.25.1795198380610; Fri, 20 Nov 2026
 10:13:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002164619.1455143-1-sshegde@linux.ibm.com> <3e9d9576-0af3-4922-b8bf-37f9127cdb01@linux.ibm.com>
In-Reply-To: <3e9d9576-0af3-4922-b8bf-37f9127cdb01@linux.ibm.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Fri, 20 Nov 2026 19:12:49 +0100
X-Gm-Features: Aa3M54oS9zaowfMoEkZpf46FhinIzcrTuU3uxDY44dv7rI7s1IzCEF21KLsQg28
Message-ID: <CAE4VaGD3h2C4BHgM-v2tyP5mEbRtE8yn7fJ1u4GPen=t6GiTmw@mail.gmail.com>
Subject: Re: [RFC 0/3] powerpc64: Preempt count optimizations
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Samir M <samir@linux.ibm.com>, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, 
	ritesh.list@gmail.com, peterz@infradead.org, boqun@kernel.org, 
	will@kernel.org, paulmck@kernel.org, maddy@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Shrikanth,

Thanks for the RFC and for the pointer. We ran it on our POWER10 box.

Short summary: functionally clean, but we could not reproduce the
performance gains, and the stress-ng kill regression from the
ppc64le dynamic-preemption discussion [1] does not improve.

## Setup

Same-tree A/B on ibm-p10-01-lp13 (IBM 9080-HEX, POWER10, pHyp LPAR, 1 core
SMT-8, 64 GiB, ppc64le):

- baseline: v7.4-rc3
- patched: v7.4-rc3 + this series (git am, applies cleanly)
- config: seeded from our ELN ppc64le config:
  CONFIG_PREEMPT_DYNAMIC=y,
  CONFIG_PREEMPT_RCU=y; dynamic preempt default resolves to "lazy" on boot
- SELinux enforcing, tuned virtual-guest, stress-ng 0.21.03
- interleaved rounds, full reboots between all measurements
  (n=27/kernel for stress-ng, n=20/config for hackbench)

## Functional: clean

Both kernels boot and run without any dmesg findings.  No
scheduling-while-atomic, preempt-count imbalance, lockdep, RCU or NMI
splats. The NMI-folding (HAS_SEPARATE_PREEMPT_RESCHED_BITS) and PACA
preempt-count paths work under load (stress-ng, hackbench, perf).

## stress-ng --kill 1 -t 23 (the RHEL-216657 worst case)

    baseline   58,722 bogo-ops/s
    patched    57,378 bogo-ops/s   (-2.3%, 95% CI [-5.0%, +0.4%], n.s.)

No recovery of the kill regression. (Noise floor on this LPAR is CV ~7-8%,
single-threaded on a shared frame. Effects below ~4% are not resolvable
here.)

## hackbench (20 groups, 1000 loops)

                        baseline   patched    delta
    process, socket      3.601s     3.653s    +1.4%  (p=0.09)
    thread,  socket       3.860s     3.895s    +0.9%  (p=0.014)
    process, pipe         1.619s     1.608s    -0.7%  (p=0.60)
    thread,  pipe          1.778s     1.771s    -0.4%  (p=0.40)

We could not reproduce the 2-3% gains from your cover letter; our socket
configs point the other way slightly.

## perf profile observation

Paired perf-record runs of the kill stressor show __rcu_read_lock +
__rcu_read_unlock at 5.5% of cycles on baseline vs 4.5% on the patched
kernel, so the RCU read-side component did get cheaper, but avc_lookup
(22-24%) dominates this path and total throughput does not move. That
matches our earlier root-cause analysis of the dynamic-preemption
regression [1]: on this path the cost is dominated by the weak-ordering
barriers rather than by the preempt_count address computation this series
optimizes.

## preempt=full follow-up

Since our config defaults to "Dynamic Preempt: lazy", we also reran the full
matrix with preempt=full on both kernels (same tree, same methodology,
n=15/kernel kill, n=10/config hackbench):

    stress-ng --kill:   baseline 53,995 vs patched 53,901 bogo-ops/s
                        (-0.2%, flat)

    hackbench:          all four configs within +/-0.8%, none significant
                        (process/thread x socket/pipe)

So under full preemption as well, the series shows neither the gains from
the cover letter nor any regression on our box. For completeness: the mode
itself matters more than the patch on this workload. Kill drops from
~58.7k (lazy) to ~54.0k (full) bogo-ops/s on both kernels alike.

Thanks again! I'm happy to share raw data or rerun with different parameters.

[1] https://lore.kernel.org/all/20250210184334.567383-1-sshegde@linux.ibm.com/

-- 
Jirka Hladky
Red Hat

