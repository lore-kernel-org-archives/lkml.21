Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795087399;
	b=P7M4gPJvPLFMB4H0DPhsTIA5rbFU6sTWgPsPzWILRxhb/NpaCAMG2nfRD48z6gC27gR9
	 400aLr3ArneEKqVqtrRaQt6CuZk0OA8L+dThJLAJqO2Y3FT6gZ97pnHYrh6d9nV8jKGt6
	 IWsqgKDWr8d9YhsjelnR+VPRfHtLNONYTKeEQzdDlVliPKx3053wSRLVMrTzUPdRfDQ9k
	 HZ0cfETaxCpI3Ftp9K+G1Ddgy1AEReq3aq4vPglkC2q56Z43BQ1xId/HwwVSY3dLoJgmf
	 uxwiIaiFdGTHzqOTqv5BgBT9K7+ED+mJhK0G/NlNmGDYCpn0Wq+hX4VePjJJyoNhWtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CNGbqnTZ1olkQY7Z2o/JWgpP8+K0KLvFPBkRnaSJ2gU=;
	b=kQ4mygsRx7zdwRaK+vMQA30XFcJR0UjYWzOJ7BqeNsvsANaUfiWDPVIYt1e6YIZ89PqG
	 Z5xXsMBqbYJrKlouTxcxMhHEBfmtCgH1q94O3lNKC8HoCpJgR0p2JZbcT5FXrCkngHWRf
	 ipSeQZUwkA2ZQTQ1lZBL6GUnZ0n1gQ+lYVuFvNfav/t9tyOAMd7UNE0SzqUYIn+m1B0wu
	 qqfOFPuabDxVVZwJ5CpED8ryAAIK8CEvMvqqhtwyLPq4gDg4MIiY3sVTnI3kazpPJY1s2
	 t3cL6uL0uTVZuz3lIrNdwaCFxb5rtCkwAEruJscTegOUh5Xl9kL6Ef6MwfuCpJqOgcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=l37DDBeX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7249A606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7249A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=l37DDBeX
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso195637a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795087399; cv=none;
        d=google.com; s=arc-20260327;
        b=O8u9jMgYHgWPV0XFX+GdXI7IJMIFYXpks/l6Q+raiKt8MfGD3BciOJBXFxfDWrzvAQ
         FLIcMPXnmXP0lwgkTpSw4RXbzCAR/7I0FhiTx0GpTJLCuNatwReo/DbLbCRadyc4GjIQ
         ySlQDBedXGpw5WfKSBhTHxLT27n2Ba2aG2nZBqI0CjPjMw13+oj3S6CHGfRZZC1c8f1t
         jo26EwlZ1R5DAzW9m4VXZqRlEqpJeVu7xeL2UgCQ6sxmrvqydzasoPQDwF+Q5hEI6k1A
         YeSY15Phb0wCf/nI+/A1bwVIE/EzELLx2bDbAn8QHQUVzKBzft5ryy4qa1OVK7otKMXv
         A59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CNGbqnTZ1olkQY7Z2o/JWgpP8+K0KLvFPBkRnaSJ2gU=;
        fh=9ASLPBllMEsqJd8PMfocFBsby2V5yY5TPHo01S7ZbNA=;
        b=SIkjCBgTqd9ADMxbARYfDhrBAO7cUmLS9lkMY9VGYjC0kRxVkGjwWfRzCYenyyz5eO
         wS7q/P4d56HHoXZvjPKATMrtvZxgr4MgK8tJlpsnEmG1L774LjELkMU7Z4CPhrnnnWxT
         408RKaDfcWA4RagQaKgoj9m5b4hTx24gcKK7kQps6IsYOr6Hesk+f6l9n1PUYx6OvRNx
         8jn+PWfKB2kqsU9u6lDWZLeQOtNkFvECvHdNblfL37B6kQh4z0165rHcFL53j74PAH+F
         4RNGdd9wO5N1p60On386hNY3tFdYHYLXwRFZsUou8jLBpnHpQgwgJ3eNHEm+JIRVPFRf
         kAFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795087399; x=1795692199; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNGbqnTZ1olkQY7Z2o/JWgpP8+K0KLvFPBkRnaSJ2gU=;
        b=l37DDBeX6BLHDrkTWQMXuxzojs056iL2RxA5zvzDgwUEMIqnfYNY0TRkfHchtXJmeO
         VKpH3cgTQ58pMyY6pvZ5HqOZi9xa696QKQviWaPGo2N9/9aY2AHUwchwBP8gQwsGsuC9
         CYdg8iPsIs3G2A0YH5TjC480+PYSZbTcwf/VJVB+mGylkKGmvjy8QMbHRzfMexzoeP5i
         D1LYI3p/14q06ICAkRJQsOltmONqwAiyQ9QiRhHvwxzwC4nx9qmrDRGr/WB0F+ge3OMt
         fOeQuFmNfsPprwWcClxJfLxoOwq17T/luu4kb/19RkleCSw2F6AA6zuYj3QEZsgBdUy5
         VIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087399; x=1795692199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CNGbqnTZ1olkQY7Z2o/JWgpP8+K0KLvFPBkRnaSJ2gU=;
        b=A0YQGnTaxNY6gjDkllRByUuTY/uUIqIYTvIbooyA69x2Fm3Qjzn2068NdalpQ71ma2
         G4Uzkl8kTMz1FXPQiP1G1gkEpkQJfPvZl+ieITuIcWWV1momXpbS+JL53krCAGKoUC88
         bwY0Eb3lLPZnQLAFJSSS4YUkEs01ntz31P4ang7glu4UZ7LVgUKqdbou3v7yx2TUx56i
         IRG/dlay4L85O91z2ahB23cBx0y6zrf7DgNeQ2awBk1UueUofGuzM7AQdVduQ6CqOyeV
         PazqCgY4EYPy4ljfcJcvKH/6ODe7zxDm53fajiuWyYd6iGQNlig+gGjL60PluKWREEFz
         DOJQ==
X-Forwarded-Encrypted: i=1; AL+hErEjysSr+qu9VUuVmDqneLDVg5fnXthP9CJLoLuLG7k9TPIWIy3dcfCs3R3tcEjp6FNxAeO3I/lbDyOBjiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r5lgcSVD7v/1ecwAnPfzZDBpaZCNZz/gHhorlcbGQ7NjTkF+q
	funRDiSWTxDTE6uI/f4LJNtFOk+2JlADiv+BTkvu+IKdfUvgyHO+uUGTiHuMtFcneC2wWhQNXYR
	Fy5CfNCTdk5jEsBPV0V+GqWBof9jPAB/jvu751FEbZg==
X-Gm-Gg: AZFdTZcdpMEHLSTKYnG6mdu10bBGSmP4AGX7g8zNyGsv+lymMFcvDnmuU4o8DVqG1x7
	Y+chbr6VecFt9rGoVvXZJ6HJ+hEq2TIMA2UTG2gGZ5yoKXlgBsM7TG7q8wmTBbmtIwKr6G5CkUw
	pAVh6AZPeSaYCKroCsZGzEGoHcDwHzD6sBPjSp7ZxgVyDJ0iyknGbiAGBIhHL+rrksHaD8LF7g1
	ZZo7HEEI+5KAR8Vepon5M4SB+KQxiPhF5hMRaLhpjw0CElwhjkOJIqq1Go5G/gGbUAOkCCA/Gyw
	Sw4FVnI9xlbSdOv54GweS9NGwd4Kt7iN9j6FRHLg+BJwEA6sf/SuW/32lZ40WB3WtlWycORfQYt
	i862Gqu8hSn0NipZRWVXwXmyhxrBAIM2NiBljeMrQ27M0Ukt63kQDiMo=
X-Received: by 2002:a17:90b:4c11:b0:3b0:9e2c:9b55 with SMTP id
 98e67ed59e1d1-3b3d06bcc48mr9846006a91.2.1795087398721; Thu, 19 Nov 2026
 03:23:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
 <20261117-bpf-preempt-v2-r2-v3-2-586376ec3672@sentinelone.com> <a51c74ab-35c4-4b7f-b269-cd650700a632@linux.dev>
In-Reply-To: <a51c74ab-35c4-4b7f-b269-cd650700a632@linux.dev>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Thu, 19 Nov 2026 13:23:20 +0200
X-Gm-Features: AclHuK-d4tp1E6L1c3S28pHL6JMWNb87DDYIA46WIXFDMbqGTV_so9pDSZPVRWI
Message-ID: <CAPnbwjrDV4nSyvL5cXEkdFZw+cq9RjWJN+mrs-vJu_M63x6EOA@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH bpf-next v3 2/4] bpf: Mark programs whose
 runs must not overlap on a CPU
To: "JP Kobryn (CrowdStrike)" <jp.kobryn@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Martin Kelly <martin.kelly@crowdstrike.com>, 
	Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>, tyler.wilson@crowdstrike.com
Content-Type: text/plain; charset="UTF-8"

> Would explicitly opting in avoid unexpected regressions?

Yes: a new kind of per-CPU state needs a new mark, and an opt-in flag
avoids that. But existing programs keep losing runs until they are
rebuilt with it. That is the question at the end of the cover letter,
and I'll do what the maintainers prefer.

> would it make sense to make it visible via bpftool?

i think so. I'd add it once the marking is agreed.
