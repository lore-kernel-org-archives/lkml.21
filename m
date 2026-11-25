Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795593564;
	b=0RreFEqajHFjIQ/2YRYLtnF5PPjtYrTl/SGIBTkHiO/So+N1EGK7pVL0cLXw5HfES8PP
	 o6AwneTzCrgsEm9f4P2L/XChVbVaiFDrnXN1V99fDFSeRLxjxhfIELQnT+C5tZPZKEIOJ
	 /IUtswyAez7jn59YPx6RHJegtv3EoP4VYS0T0Wwz7oJfkhZeRvErpwVmaiOaSQbSamip+
	 pIrcqG2Q6U4oOKVVN+LhnXas45fXYu2vxewKyzB75W6s7oewJv5ltQYRwWLHDK9JoM1W/
	 hUeP5nJP78UbRnK+bSdes3gxAk3PeQAZF2Qs3qBLBhk/1y88cofWBAGAaO0zz9Kg/Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lPt1APWAuM+EKrwwPM+5moxwmnQPMXvp+cSe81HAQX0=;
	b=kxHncdFa9X4CP0GDZaEb4u7QOVimbhWrURnpkYJesh5SC6+Mv7IzwlLj7+EbUZY8nKY9
	 SJBQIDhy1pvkjQu4uD35/gTeew65rbf0sUdg5Xl70bX1krMwFZFz1OYOkSO7t2Mu31vw2
	 cdlFt0rRtUkUjF4W8EaWFmOgcDilV9MSS8zNp1OvPDQXuNz9WWH52gDRgjFBblgUbERWL
	 utWJOzxlTCQ0E+wiLEwackKApq7iSGXKYewnAmBc33I4S+b6yKQutEC2RjWKMBysjD2+V
	 gHmJtEwFisJIq0aumHs4EtwgiYQE3zgBxkosu7txKhdEseiKSOsMtdS65CYopWLrO8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pc7WeAg3;
	arc=fail smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804AC606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pc7WeAg3
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so7396105a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593563; cv=none;
        d=google.com; s=arc-20260327;
        b=AGq3TMZLYyBKDkmLaKCcYpHebJd8zbl5hKawMxi7RGWJSXPFyMZ1xzq4hNl5KM+v2B
         PMa+u/nyIyvQ001YOGOwyxTw1s+KUdZIOuVHfng1xAvAYRf+Es7W5qiN6fsm9Zr3fTn4
         MPCayDTiNiD5STm+YEsXv667pNbaPDNdQO56dY27z8tF8IrAyvPFDq3EqzBfP9uqihTr
         CZmorDR353hueBsANOrY7MwPlJW/DfbIK709MFwSmf6DW38FStFts0TItLuij2EFq27O
         Wl3hDA/EyW3A+V+XyTOuCGCR/iZNoVsB9B/b7SmnAudfczc1RFVtCnNnNnZNT3ALmrHs
         57tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lPt1APWAuM+EKrwwPM+5moxwmnQPMXvp+cSe81HAQX0=;
        fh=gpBa+Jxjifrju2N0rZ54NhgOcJTKFZZlYnoUCs7TJGI=;
        b=MtozIEOto+DCIMMvTT9IlXz9Glrt5yjIT2/oj2ZnHuweNtvwBSt3KlU65HSG7aSHO2
         i+egQ+iCUx3gr511fgzK2rO2ykZ/E3AjqVi4PJq7tdHdKmjFm2U6Av9Rd2aEVKFd20mr
         GCMALwAWVFhgUAfiOQjtZDIWEZTj9AVD/pnRtnL/nCOj3nFCWQbElVt2A9J1Eytx8ubo
         cE4L+0UGoq5B1yTKMlP95CjAIoyaBW9rRTjESuK8O+0YfR6ix97pD6+Y1z46yqLrX8RE
         DwMlCBKgbzc4AkgNgTrxb+pPLfHr7Txdk27ccp95VnEK9dQ/qXDXHIX3TSbigmuiuyTo
         ZbMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795593563; x=1796198363; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPt1APWAuM+EKrwwPM+5moxwmnQPMXvp+cSe81HAQX0=;
        b=pc7WeAg3PFpolsGeh7V8GC2dhbxFBLdAcrs7u6ZPkIeaUJf1R6Fw3I/CyF+FdKcBWk
         2D138Ya8HiMVieQLfnW3JVJ692QehF7L8UAguWp8cjsVxzcggC/FYDrIN+CvVsyXc8iS
         hQmcWHvqy4QoR9DFn50U7SbhAUWOLNmTtiaB1yyjAW0+X4mDK5SY1nFGpeFPIy7g//7T
         RhxJDU5e8wPQBYjdyFVFY7yir1OEosiVnYUV0FHMaqbH4OQrEYF//B9PL2hEuaTLfYq+
         W/vHLCDVfH0ZyMViirkpyNhNVwKkmsPVWYYLjVkOhgBjXwTW5c50jsezU2pivEuzd1hF
         POrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593563; x=1796198363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPt1APWAuM+EKrwwPM+5moxwmnQPMXvp+cSe81HAQX0=;
        b=ujFhXcUYSmMc/5HO7g+PdDp3/Xa13NQJbuCO4kiJNNDSuGtTZa3wDyD1wbes6aeGFa
         PCI8zbk4VhnIKIXH2L6HQ/qho6i3vlB/X2gk6wt82zF0dEIzBRFBnYFUTo8aEs2PYpku
         hzZ6yJFIri6nz8woCXmx9ondrIGmQTvViJoiCHpradP44OTi521RdvCDryz40Tf5PrW9
         plRfNN5ROr5SyzTYAgKowax4rgIh82SNcG2F4CuFJIxFhuAdmwA+YiAGZt3QGLTEgkUx
         mXhywzB0M0Z4SQoiSsRun65S2xsqpfQE1BiT0W1bKoKus8vwioMflbbjEwUamUTk6Msa
         2F7w==
X-Forwarded-Encrypted: i=1; AL+hErG1tQxDWPF2Et647LumBm/Ck3sHScZFIutXQhjsNcHw5xV9ib7sIQbPJwe0avmnnz4BcU7tFNRmB08qmaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z95H1riLSr3BDGTCF1421vtWVau6h3NbztDCVTsM8gKmX3sogBX
	OQWTMn8QAo2zy84zVTmrRRJnh4hazf6+f6CEUbfdFlRd2WCJogmi0ClmaFmeb6LDjjGcTb6G9Q4
	cDFaOym5GHLuW5+9zLH73odmfyB9EXIkJetTr7mq+pA==
X-Gm-Gg: AZFdTZcWIxlrZ+M0xxi74ji3cEoNnx6tA771ec9bI36/PK0wfZsLn2EBaIJBYOOzMoS
	DAV+rfkNmRmlA4eLOCruqVwztkQMJIGVPTx3+VdcI5i+Mx8eloycYP1S4SENAcZOTbO0Q+/XIq9
	5Fk5gucPaTQS4I6pMC8qGDaNujvs7oOTUvlbaTIKRBz8TSLJiuLpLy/OK+90eoU928j15vforEr
	EqPvoAMtz4BoZvR88lqBZ/BwidAGqh1bCZizcGa8JJeiUJCOoHE5c2FBTgQo7RViUG8gqEtni85
	f9og4liZKtgOgb5zzECxSHeNz2aHKv4G/RZQmQQuRfrTSC4D6zgk7VQGoh7KqqIZkxoJVOfTTg6
	eb9psngr7IeeVujiaGaBVhmi9n7kUUQbVwJZvOjG7LlsKVn8Ku+Yikb2udMoRelOS1Jk=
X-Received: by 2002:aa7:d94a:0:b0:6b4:2960:d38e with SMTP id
 4fb4d7f45d1cf-6ba37e874dcmr9501044a12.26.1795593562901; Tue, 24 Nov 2026
 23:59:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org> <20261123140513.849567-1-qiliang.yuan@linux.dev>
In-Reply-To: <20261123140513.849567-1-qiliang.yuan@linux.dev>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Nov 2026 08:59:10 +0100
X-Gm-Features: Aa3M54p2o-4OXRV5MRF0nedJcIovnM36DUkkwJL8BE3h8cyZzFyeML394K6ItNU
Message-ID: <CAKfTPtAN0K0Ly1tM-2R=-9qLx=Nh5p9+GHeqRLHy-nbeAxZU0Q@mail.gmail.com>
Subject: Re: [PATCH 00/18 v3] Improving latency of short slice tasks
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, kayracizmeci@gmail.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Qiliang,

On Mon, 23 Nov 2026 at 15:05, Qiliang Yuan <qiliang.yuan@linux.dev> wrote:
>
> Hi Vincent,
>
> On Fri, Nov 06, 2026 at 04:19:27PM +0100, Vincent Guittot wrote:
> > The 99.9th percentile are a bit worse mainly because of the decay/reset of
> > positive lag. Eternal positive lag was beneficial for cyclictest which
> > doesn't do anything while running and slowly decrease its large positive
> > lag.
> [...]
> > The test were run with the default 2.8ms slice to check for some
> > performance regressions
>
> I ran the series on a fully loaded and an overloaded server-style
> topology, to see whether the push path costs anything when every CPU is
> busy. Guest with 32 vCPUs on an EPYC 9654 host, set up as 2 sockets x
> 8 cores x 2 threads so that it gets SMT, MC and PKG domains, on

Thanks for testing

> tip/sched/core bfee16fd01d4d (patch 10 needed task_tick_scx() to take
> the new rq_flags argument to apply there). The four kernels were booted
> in turn, 3 rounds of 3 runs of schbench -m 2 -r 20 each, median of 9:
>
>   workers  metric              base   +01-04   +01-15   +01-20
>        32  wakeup p99 (us)     3116     4648     4648     4632
>        32  request p99 (us)   34368    25568    25952    24992
>        32  rps                 4327     4907     4898     4919
>        64  wakeup p99 (us)     5656     7736     7640     7688
>        64  request p99 (us)  194304   162048   161536   163584
>        64  rps                 2507     2532     2529     2532
>
> The wakeup p99 increase, +49% at 32 workers and +36% at 64, comes
> entirely with patches 1-4; adding the push patches does not move it,
> while request p99 improves by 16-27% and throughput is the same or
> better. So with every CPU busy I see no cost from the push mechanism
> itself, only the lag decay effect you describe above, which here also
> shows at p99. hackbench (4 to 32 groups) and tbench (32 to 128 clients)
> with the whole series are within -5%..+3% of the base.

Yes, clearing or decaying positive lag softens the capacity of a
sleeping task to preempt at wakeup; that's why you see an increase in
wakeup p99 but an improvement in request p99 and rps.

The push feature doesn't impact your figures if you keep using the
same slice for all threads.

>
> Thanks,
> Qiliang
