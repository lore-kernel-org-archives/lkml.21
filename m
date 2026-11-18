Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000850;
	b=tcMTqlDM3aF7jaB3cOhSvWSjCEWwtE/aQxXqCpddmcz7gweXbJSbiUXRDDACkqYubl5q
	 kD3wHgP1ENkUOuv/Vng6BybnzipZG8CRpTD8+JagO6zyhLc3jntxGyQsYW+HopH4rCMih
	 OIlj/FbbQNBRYq+Bgut1TWg9cgtP9yf9L5eM4Xn8c06dFUqM1YWv2GRSyr9mA3mRjczN9
	 R7pqk/gP8tKy/kTpgrs7J828RhAcj/suVn3i8kxeUSaFlKHnEm5E689NHfEFQ27BxN0qL
	 XnUcZsKv3rl70nWQnBwXlJI7f7zxMyoOV7vQMMwGLO17FLx94QJsIMWdz4Ltuh15RTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000850;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UYZeLko8ARh+TMZJ/jcaVMaBZpqH4WAJB7a5zPUzakg=;
	b=AJKtGzpANkB4IXKrdzJbKMeN2xKutliwjpsm5byORetU2l/BiGEyWkadTi/xNbq1w3Sx
	 ZvUNZBopHHHLV2HmE2XHE7o0ZdCiQcCTWnevPkDUIVVT3DAZCBdt5oPuKSkDlPlFvaCR5
	 PLWI1z6JDijugig7+MCpxI+PIfgeH5ec0hnO0Mdc/Tti5WXdcs3rrQvWF4KXx9hE+t4As
	 GI9GhKIFwNAwNw3iRZP0rO10hZn8kcgRGUSHqdtCiMDIE3Mi0MJSbyGzxHAAX2FR+OOpM
	 KKUPo70gPZRP8zh2dm+Z86xMZ7ROgBAgfUWaG9WcknW1f2LD8hh9Bn99bDT2CY+8/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iORFFgFd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GpL06LLH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BB4606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51BB4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iORFFgFd;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GpL06LLH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795000848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYZeLko8ARh+TMZJ/jcaVMaBZpqH4WAJB7a5zPUzakg=;
	b=iORFFgFd322gO9ZgYGy1IvDR74Gf36yEqNGJxd4+VfnSq0mZFQdnH9+yCpx8U86A6I9LPH
	JpHIUxeOoDT7gA1XSbyb7LQOPjXqz0u8A7H94AuXpi5sYcdLE1YWMFt8IGbXONS1johxXg
	eE2ofvemC7h+RRHZ5H5HchRrYgU04No=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-zZeXyon3NSqFobyT77aymQ-1; Wed, 18 Nov 2026 06:20:47 -0500
X-MC-Unique: zZeXyon3NSqFobyT77aymQ-1
X-Mimecast-MFC-AGG-ID: zZeXyon3NSqFobyT77aymQ_1795000846
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb680f0ac4so5384725e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795000846; x=1795605646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYZeLko8ARh+TMZJ/jcaVMaBZpqH4WAJB7a5zPUzakg=;
        b=GpL06LLH6he6KY83Kswtjf5NHWlqseEgBMeWpf2WQ9het2uamRVdPeeUrDLQVbR8Ox
         Ihmv8Dm7c5v5zBi5IjZccJR6pEt6C5XIvcsNl13QVzxOELXQqg4jacsBtZYJBI82gSnF
         umpvBG6Js4CqPHi0EOoMyzjVGBEfZ6XkWovAbifhSzhGHTl+17Wv8+v/tHqY/zsZJ2kx
         VZsk2YPsYg+VEb1uqA+vP6I1CbgFYe+ZLa4GUU/o/FO+WGBBllgGRvxjlbmuq2UnWK6f
         klwuHSjRZY9jP/SIH2Q7ejD96q1Kv/pVsiZoDEhIrEVyaPJKv5jXtojriGafP4FU/TSI
         BMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000846; x=1795605646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYZeLko8ARh+TMZJ/jcaVMaBZpqH4WAJB7a5zPUzakg=;
        b=1EW2ztgM68j9mmtL8e30bhB+vKTn0aF6jCUoZ1ML3RVgbyfgEkU90vBgSLBcjjB8vh
         msvCWas7sO2G1220pGzHK8SXDWlS7pvLx/H/mrHnOddrclANahvj0JLkqz7wlM0PdOFe
         OJaMBIsmOjY4y8qCi+gEEXwJZnDzam/B+AldkC1EWHvzp/HYFYBgw20fDw5kyiFqhb7A
         HlzPhVDcSn93pruwt2WLjJzxPXBq+GMdF1fNKZEkEsbWV0bUnnxnp7XkK0lD7G2GYwcy
         1QxgQOWT14yd/3QWAfB6TWVMSaYVl3T6/CIVGzCXjnQcAYaYzTcYAL4Yxi3v+9kMrwAs
         gPnA==
X-Forwarded-Encrypted: i=1; AL+hErF0JoV97EV3fJeIX0Cx61Leb3Iwx52b3SMlyIgZ0Bx29Rp4nWSmNAOJSlSxjvYmd+SKFm1KWbZKAWIoI4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z92lx6kSp+7SteCap5P8dcMCYPyF6Smb1afPNKDAnzivnoGv8c7
	/adGolHG8jlPr0xoVcU9sarcx8oIGGsghxVzjm/HL1R/jsWYxWK1k716w5+TwASgtHFU3ljqqbG
	mPAHTB77M/Oy7rpn67sVm0uDO3MgG+CJn/L+sqjvOMebK7gj7SgjaVBN/NlXB1BP2uQ==
X-Gm-Gg: AYBFou0u/X40zbIRnd1i1FZa15TgprWcQyxj0RBxe0DRUwltW7+vJem2HIKNQ2uIaC/
	tlAqSxE63nqhnsnbCvfGALktSBwd7rgTxFgSzkwvly4DH7mFnhhKZI5C7HnFZk4bF1RANwMRg7a
	32B68ltTQlLUwiVdga+vB9o/mIaIWgpUo9vLfYiMB7zObGrIWObglJPp1NQi1E2Uy0ayBWNkXki
	UmXFdlKrjqcUvldROsc5ltujt6yI8NZWv38SPQBAgtpIl0qIiSTxFziwjB2CT+qUfC/nHh9y8Zq
	pQN2dRv2PkND7JT/KSiO8fCy7QsxR/NaMGARRlbb1vQZ4N4KNFyp3wrtPi8hmbO5v30Dx+BY9gq
	gFPrdmuRplayElTuj7jV/X2SjTHFtA8yUorqaajwc2Vxogw1rR3BPNUDVK8jAfdSPbIXrWcgsMi
	p6tNI=
X-Received: by 2002:a05:600c:8b02:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb7da1b48dmr39551975e9.17.1795000845961;
        Wed, 18 Nov 2026 03:20:45 -0800 (PST)
X-Received: by 2002:a05:600c:8b02:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb7da1b48dmr39551335e9.17.1795000845561;
        Wed, 18 Nov 2026 03:20:45 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm195748985e9.8.2026.11.18.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:20:44 -0800 (PST)
Date: Wed, 18 Nov 2026 12:20:41 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 04/40] sched/deadline: Do not divide by zero active
 CPUs of a root domain
Message-ID: <av2KCeKAnXAi6saN@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <31f723a7dab4d58045cc60fac0fea09ea1841c7b.1794922146.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <31f723a7dab4d58045cc60fac0fea09ea1841c7b.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:
> __dl_sub() and __dl_add() divide by their cpus argument. Most callers
> pass dl_bw_cpus(), the number of active CPUs of a root domain. That
> number can be 0, and the division then traps.
> 
> Commit daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl
> tasks") added extra_bw, the bandwidth that deadline tasks can reclaim
> on a runqueue. A change of a root domain's total_bw is spread over the
> extra_bw of its active CPUs.
> 
> During hotplug, a CPU sits in the default root domain, which can then
> have no active CPU. This lasts from the rebuild in
> sched_cpu_deactivate() to the offline, and from the online to
> sched_cpu_activate(). A debugfs write to the runtime or period of its
> fair or ext server divides there. A write of the current value passes
> admission in the window. In 8-CPU VMs of v7.4-rc2, a loop of such writes
> oopses at the first offline and online:
> 
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   RIP: 0010:dl_server_apply_params+0x335/0x380
>   Call Trace:
>    sched_server_write_common.isra.0+0x1c0/0x260
>    full_proxy_write+0x58/0x90
>    vfs_write+0xcb/0x550
> 
> By reading, two other paths would divide by zero:
> - inactive_task_timer(), for a task that left SCHED_DEADLINE or died,
>   if its CPU went offline.
> - sched_setattr(SCHED_DEADLINE) on a task asleep on an offline CPU,
>   with admission control off.
> 
> Fix this by changing total_bw alone when the root domain has no active
> CPU.
> 
> With this patch, the reproducer survives 20 rounds with no warning.
> 
> Fixes: daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl tasks")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: stable@vger.kernel.org
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

