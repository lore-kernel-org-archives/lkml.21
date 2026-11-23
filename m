Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795438145;
	b=TzEjff7onz9z0pDv6RghiPhOnzV8k0fe+rUDYik2tirX7Eo+UtnSsViZRbjnWM+5g50K
	 EQn7q/N+ssWTnhOnGm6CbCpkqvLwzh7t2RV5l/MH7TH98akhKAClyl7676DJDhcBuqhAc
	 /o5OyY4KhkVwuB9ng7wRvOvTLzOfj6sPL3dmtAwh3f33DcCZEyoXsU+1NdUqO+piSq1ZN
	 cUM1c8eEi62yEClq1ouFT37GDqPwYi7BGBl9Ws/jrH1z8SGo4mQ3NtTY9Av45+6i5QmFa
	 qbRcf+Anc+kjmWfEMzaCQzfjjDrdf8B1QL8+09uGw21GspWXEd1Xz9DkqR2AAanoaWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kFSS5Lpx23772o0jxHiqpcMGc1EZfFQoRb+B8VLiMXk=;
	b=KZYvqXnkSQZTZadnF/aPtM5YpKrR3sGV8KnfFY4YrPG20qK2b1CBWBD7a/viNwtDvVIO
	 qep1C7DXwCqz2KIrGiAEvQskFatbQHa76JrD7lRTTdMgYD7SDZH1eI9QsjyEI0rcjfRKS
	 UVveaM3/E9Svo6RL0f1iMabS2Hoez3dYMhqP3TPe+xeplOyyOOmOQniGSp/JZnGuNP5Xv
	 rUVEwd1xXmaCprKCY+Nijw91pkrT6H8VhgL4rC5+aJx32Q2adLAdORRHssA7BDv03ZCpU
	 yJkcSd7Sa3qSWEw8OxrtgNVwOOV50bKP1+xXU+7gVvKM9i0AzSo7q71CJy68aj6vNjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=IrLGZGTM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D147606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D147606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=IrLGZGTM
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3f9cbafecso434081a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795438145; cv=none;
        d=google.com; s=arc-20260327;
        b=FjqJ2nBauujo26f3/UDKlioDtpwrwC4bBud0A83q0q2KgBi5Hr/gqp0ODHsYMZ63l9
         CxwqZfy0Lno2bEN3HqtC4IZlk6SphQp34iwn+AL90zi5+csBAwjtxCpv757G8AYACxKU
         fJlWX4oxEHB58V8iih8OB5EEdvndjred5iqe0gz4nvbqPQ1lf7UtfpRV3DZ84p1L+hv8
         B3WbpeopeofCZwTt/Yhr1apykIfCr8WPgNoWoln+yeE/aDAkyvI3ZGR5maH/jMBr3vhP
         cV3+aqCxSqQk70R3Yvy7wCkOF+ocmPj+QaPi0M136McsbQC18cxc3iwMP1twFid107v+
         +i+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kFSS5Lpx23772o0jxHiqpcMGc1EZfFQoRb+B8VLiMXk=;
        fh=6mxyMYlI2m7Gh6zwRGeRcKCjCb6LlRV3W/HX14iDIgQ=;
        b=YW39RtLcdokdcK9KV/4klQpMLzM0j0aeo3py+YeDXcOqWI/ybghGehWbfvDV7TJlVi
         0GphyNphjXCjd/5EuzEyoU4unM6PgFy2CKisj1IWxFkXoajGsFzkASVO5iX5fU+MZVkU
         OzsI5eRBs+Lj3U7ZF+6AYFDbj9V4Uc+TmpWaqcQnfNKgiKJsdcxxrPTHygVfF2pmBf0K
         nVeWK0+uQa8FvT5MKBAFiUZgwDPd0Qs2zTVLub2KeiyoL25ncABTBSskeK5JN+ad/gA3
         kq9p3Bm2Qh/2zcJtx2p4+p7MurrHRybYIJm0d0EvsLN1yn9lqXfVggDoWB1h456dQMLA
         DD2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795438145; x=1796042945; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFSS5Lpx23772o0jxHiqpcMGc1EZfFQoRb+B8VLiMXk=;
        b=IrLGZGTMUyOCRbyjw5X/ob4WE1mDOIB8tymNE6Fl18vATMykCZjkR9ZOpfSbs0dFQr
         DyDTvbD882R78Z+CNFsfT3cgEj2tf7HmIi1cUQp+JXi+dKVp+EPEPWBEVQtbs9rbR6q5
         KwVAi+pO1JsD/bNB+RLjwZ6nZEB9ZPk398zuTPP2sgxg8c63z4onxYkd8M0UXJ7iplab
         j1fLdy0neYv3JyMlkvMYoaM/WHLacvrs5edGEY+ATzeWJGtQ/eUTyWbmpQWUCsWOf37N
         J3S1IRXLnTIo2bKeEQMtL1FrA67bQg2iAO0vj8y8yq6U/ElTdWHYFKQLyaSuBqjZ9rCi
         t3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438145; x=1796042945;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFSS5Lpx23772o0jxHiqpcMGc1EZfFQoRb+B8VLiMXk=;
        b=rpHDW8wUf2aoNJMnVXb0AJEXkqiZb0AB8vkRHW+OljWOM1vrOuOaVfbsvAOV+hS/Fz
         Aa6S7788f39CWbrHMQdWgVNE6g/EO7nTc98j/Yn2jX1pclOdCJEfFNArxM4Duy/ldb6+
         bQi762EJkPnwLSWCSzgrlDO4pcgjgwpSQ3uULhTmMjJahejrrlkcGVfSdnG7YTpUlr61
         ioNi9nmMQAQ+19dsJgMmj87TzhJI3awRaSdh3eHaM32mvotnN6CgiuYuRwQMJWWxRP0H
         9CNFsx7m9gTX8vEEWHADdACKZkHHFhzCqj0x425MnN0g223I8GyFP1lBG6Qei+8GNAw0
         BLjQ==
X-Forwarded-Encrypted: i=1; AL+hErG8MS9zNn94l8ONENfZButYrasY4OVru30Ta0u8t0poA2ZTJxL1RZaDLurtPzLkp+FE9whL10cGqraXKu4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qxoWARhIRyY/7Eha5lx3yrOSpGort+D6eSyc4ef+lxMVsJm0t
	l4TkH/L2ce49eEU7/IEhzcHLOcZQYNF7tUuAH5Dv3pyWmK/NNzrx44wWAw/NixGauTsPoZ4xaTX
	/4MIFboqWJ0yhjB7d9uckpLk17wBoNsLpSKh9nn9Wlw==
X-Gm-Gg: AZFdTZd+D6jBypl5XsqDCpcONefjgLhswJT6lyRFWia5BiG1wWNNgLC4wtAOhT/5Opk
	fVtzM3bYuifPBWuwSDMQCyzdvbcmsW8w7REeeLbB3Gdna1Zey5xtKhnvpOYOvi73XPM76n8/6gG
	fvITeOofiQGwLGwHvWQQMyhWewUlxfhE78A4mPypypkXeJ2/HB8Gu9Yrw34Z2nEapFqbNcCJoSN
	6Bq79SkWJDAeH5442r87wrywi2gq9J3urZkYp74dGs87lFg9nGPNFo8sFQRW+iR7uCNG6jaaUrH
	51QUiCO1SkkAI7ChshMjDmyTV580PtEBZxzldglUP9CP9XbEfo+/Z92Cv4wXsScbQAOthfdCtlK
	yUErchUTTHMu8hPstvCYOZbyw2eWL1Ho8pjA=
X-Received: by 2002:a17:90a:c10e:b0:3b3:c92e:f523 with SMTP id
 98e67ed59e1d1-3b41c917320mr17695252a91.3.1795438144716; Mon, 23 Nov 2026
 04:49:04 -0800 (PST)
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
 <20261117-bpf-preempt-v2-r2-v3-3-586376ec3672@sentinelone.com> <8fa7eb35-950f-49c4-b60a-c00b52cc6e4d@linux.dev>
In-Reply-To: <8fa7eb35-950f-49c4-b60a-c00b52cc6e4d@linux.dev>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Mon, 23 Nov 2026 14:49:07 +0200
X-Gm-Features: Aa3M54oTl11TCFGAigV7UhZBuv7UvpVpxQ6riby4wl4QTdBGKnWaIn2NNnXrHOQ
Message-ID: <CAPnbwjqUgxYmiviUVRP0PzPPcYdOHkESrhBepkQuPqA-tdyyMQ@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH bpf-next v3 3/4] bpf: Check program
 recursion per task via bpf_ctx
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

Done. The array is not faster than walking the chain

bench -w2 -d12, M/s, median of 10 runs [min-max], lazy preemption,
x86-64 VM with 4 vCPUs, bpf-next 32b66b94c86f, in boot order.

The existing benchmarks:

               trig-fentry          trig-rawtp
  bpf-next     39.36 [33.73-39.72]  40.02 [37.00-40.78]
  series       40.10 [39.43-41.41]  39.63 [38.99-40.06]
  array        38.97 [38.19-39.17]  39.19 [38.58-39.90]
  bpf-next #2  39.74 [39.17-40.12]  41.12 [40.14-41.68]
  series #2    40.68 [39.68-41.58]  39.81 [39.33-40.49]
  array #2     39.89 [39.48-40.29]  39.49 [38.85-40.34]

I added two benchmarks to bench, with three programs nested: the
measured program starts inside the third one.

  driver (raw_tp)          calls bpf_ktime_get_boot_ns()
    fentry on that helper  calls bpf_ktime_get_tai_ns()
      fentry on that one   runs the loop that fires the measured program

               trig-fentry-nest3    trig-rawtp-nest3
  bpf-next     39.88 [39.42-40.52]  41.44 [40.93-42.68]
  series       41.25 [39.95-41.95]  39.62 [38.62-40.50]
  array        39.59 [38.15-41.53]  38.22 [36.37-39.02]
  bpf-next #2  40.62 [39.79-41.13]  42.84 [41.96-43.50]
  series #2    41.48 [40.09-41.94]  41.10 [39.70-41.63]
  array #2     41.06 [39.73-41.80]  39.67 [39.07-40.08]

The array is patches 1 and 2 plus this in place of patch 3, with two
fields in task_struct

const struct bpf_prog *bpf_recur_progs[4];
unsigned int bpf_recur_depth;

 static inline bool bpf_prog_get_recursion_context(struct bpf_prog *prog)
 {
+ struct task_struct *tsk = current;
+ unsigned int depth, i;
+ bool ok;
+
+ if (prog->recur_per_cpu)
+ return bpf_prog_get_recursion_percpu(prog); /* the old body */
+
+ depth = READ_ONCE(tsk->bpf_recur_depth);
+ ok = depth < ARRAY_SIZE(tsk->bpf_recur_progs);
+ for (i = 0; ok && i < depth; i++)
+ ok = READ_ONCE(tsk->bpf_recur_progs[i]) != prog;
+ WRITE_ONCE(tsk->bpf_recur_depth, depth + 1);
+ if (ok)
+ WRITE_ONCE(tsk->bpf_recur_progs[depth], prog);
+ return ok;
 }

 static inline void bpf_prog_put_recursion_context(struct bpf_prog *prog)
 {
+ if (prog->recur_per_cpu) {
+ bpf_prog_put_recursion_percpu(prog); /* the old body */
+ return;
+ }
+ WRITE_ONCE(current->bpf_recur_depth,
+   READ_ONCE(current->bpf_recur_depth) - 1);
 }
