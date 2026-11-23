Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795438017;
	b=FiH61FmqHeBgBwhR9ZzvgZ5bjmtu+3ZnCPjuQihYzw535VWU+sTDa2E/p/w7lAi+/dtD
	 mEda1N64aSzGkDvOfz1z8T+Rsz13nfxGCb8dExl7aFTS6w+pMJDIaYnLCYjbVck+FSy16
	 xxW841/1XPQ+oCKBprZ5IAJsQjRCP3rm8n5trCYbfnL6evF11aiqyYKPE1VziPV8zvISV
	 ox39IPR3TW7SyvRYC3kWrIz+LT6e7+lqb2gv1wydKGO/5QrPP7vQuXnKnRBIQUHsK5MyT
	 m5F3mjecOV3WLWql+w22/+2ZK3VA9bfOhzh8KPzpWSQJuqWB/5HdG9wtaJMyltuzGsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KDkZDqK4FJQoP/w58gPsz+MrboHrJj/4Mpu9CUS1Qq4=;
	b=j2bBMk3gqkIvzZIkn3XgM4PWsnKrPy5giWITdEh1Y2uacud/lmO6ifHpizPcl/6RUQi2
	 3I5mgM0xQ7L+xbmUOqp4tTZvlRwwHHVHy/7FQQaWSi/Uex+9Ik4EVbEYpqg+jzR6uUB4z
	 JecEmvqBQALvtE6XmsHXsgN61EbQmN6fmWPWBpC1gkuK5LUcAT9ppuMlXfbIUuvHxx/7n
	 TWMUkcJjRmfBTLkbNY+fght0t/hbIYajRG6Q1qo2gqOKOJ2K148dCnYx7bYyEzDilKzsd
	 cJIftqHc4DgkNBqIFKDi6LmG5o1FawManwJITybqO2GmxOoOI8CqT01XBOwkUCukCfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=pXRgNTbM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A45606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A45606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=pXRgNTbM
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso379413a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:46:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795438017; cv=none;
        d=google.com; s=arc-20260327;
        b=jxeKcJNeH94YUN/Kav3ZRHKZq7iflZdVQuOi1qEykNHKlfNR+rOWq6D0iLVB7YJVZ+
         +qB9KhfT8gdrR29FxjmJbOA8sOwPxE4t4lwWpYIM/j4hkNlLR9u/hb1Xo7591aflQbgF
         eqZRX3dEYbkFh1ZZMoWG/vR21YBqR/t+rMS35uR9a4PSdaJvR9PsKCIoSpfEUNWBYDzS
         5gDGBD2mlHCIylCN0AYUdc/Zi8MSjeQnI9ptze6IbqYovVqw4A5KW7BV4XqjTDEPFB16
         bOPtNjY4uhEBPfsKvZu53ZRv7Q7LIWfF1eVXEy6SPvZdcL6X4IK0sVSxsyL/Jj5jldvc
         f1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KDkZDqK4FJQoP/w58gPsz+MrboHrJj/4Mpu9CUS1Qq4=;
        fh=Pqz2kBLBRxJs7CPDdVEQI4DrnVfI9HhGKOHTuC01xNk=;
        b=IHsfYzLucAZABktsTZuQ3779WJZZdIF2dz2y2zsWMTjNnfkuVNIhFMRpZeRg5RePSl
         DN65b9CJGHqmEVc4fe6CwzCW5XH0HpoqsM4dGjqcGonDVXWCRlFjblKZSX6vIAd4PMrV
         k95h1ZNhGcq+p8RILLxzvMiy62mg+vtduapwAyyDC/yYY19zuAarxYqsH6KuXeQWWNq3
         SCYgL5ojhDuj/JzhUft8zjWSWNyi1QqpOjmL3Hx29uEAcWrTmb8DZGr/EJkR7ZOUp+wy
         QCsk6P3zIMeUuxuqtWP5Ik8raZUMQ55+Ler9UbgDLADgn1RSWXlKIsWmCt6fNgdqQXoc
         Gxdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795438017; x=1796042817; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDkZDqK4FJQoP/w58gPsz+MrboHrJj/4Mpu9CUS1Qq4=;
        b=pXRgNTbMkIXjMzPbu17WG0l8GOiu3EuIwmuf+7ud7ElnfnYfbsWUT2RU3cBhoqc+Eo
         bPFK6qFLclLuIIC2qPTWHHWgmZZc+SbwdqrzmoLmuBtwv/Iht3ZwAUYgH+427EUwKdTK
         o6qvchedkYZ51RSKw1no5KmHPSRDyIGHlka7H0VBYETPlwEmN2WlLbtuLivJfxlYA2H7
         ++524aGwTcmBv1zCW/4QY0SP1fL+PHgNqCL/2z3yPH3TnhcgortPr/5cG6OXrsSFPfWD
         iuaobfvQheHH36CQ4jUyTfxB7iNoiwQdk0PKfN18G51O9AZh0f5egpBN3lq7KgqYcEzj
         BcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438017; x=1796042817;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KDkZDqK4FJQoP/w58gPsz+MrboHrJj/4Mpu9CUS1Qq4=;
        b=WmeABYLZ73Gvw0+qC4eJ4kpeNHmkgmhucJtmnXfukKf6ihuT4nDiwzx1XPWS7S/xI5
         JrDt/htT1WBuJCyGpJzCXD3p7yyUcD0ZpIOaWAoiWtV8YbB0hrkfMt0EH9+Pss6bv5rz
         waCz3sSi3XSqMFzgc7SjSK2Y/XLqDo6TTMJgwd/p8EhjNPw9+x+l3E1NOEjpl/r/DO3T
         HdUGfNTwhA3ylkQTqEYxEOcjEsuKk6cAqyrjNJxVkUE98n3Dnq4ns9Qzyy8NicdTrOss
         H8GG900iORuip+ShKbnTEvGS5giDPsogh6pNu98hoo87JU3SGyCdafV6pxGXKaOhW4ks
         SOxg==
X-Forwarded-Encrypted: i=1; AL+hErHxVE2B7BPpPZP/+zFP/Vdcly0kYa7MipRZOcAelxW0lrpZUgDAL3kKLpfgmzsYuW+1PbbA1DX8hIHLGmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/04jAjoRX5qpplFW/tFPls1/7iyf/VuV5PLg1j3zCNO0obgYeR
	QkxTbikEGy8gqY/WsYREkGhcaGBoYtl6HqU/tLbTFPT/8dG1wSd1dyqyxPRk2gyNXbKRe3zXJWi
	GJi/malBYhdIZ4BiRR027fMCyTRiWfBThcQhP5l1asQ==
X-Gm-Gg: AZFdTZfsc5zU4Tv2FtMpPfj2UEbW5GgpIzQSVg7P70yq4UdGhwXkRKaw/VinHo/XAm1
	ZJ5tFn1QzVHyqW7mAdYjM1YkGbm6SrHNCba85o15vduG22mKlWEqMp5q0xEU4+2D/S44xcZu0tm
	QEyqvP+0uK0ll+/b9GuD8qRNphp0p3ZqilnWqfl7Q/9tlM5RXNnMjpez/aVipiCHqo2ilRTKi5g
	RMJQ573OhMM6Xzp0EGp4Xmzlku5UsPKhQsQTUBaucA4jLU2YVAMj2mwaydDPZRdm8TkOyOquFUY
	C6UZ0ic6yb8NmRthJzwcWZ8/Is4N3kHo04NTG1wtT6GtHQpMcL1Y38BBbxbwcr7a+JQvBYX4DYV
	Xpok0gCzJwvQLj0mKk6q5v7sED/eMuBL9dwWUU65mJn4w/7KtGJbHuhqq
X-Received: by 2002:a17:90a:e705:b0:3b0:9e2c:9b55 with SMTP id
 98e67ed59e1d1-3b41c803ae0mr16166809a91.2.1795438016707; Mon, 23 Nov 2026
 04:46:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-5687f2b53b57@sentinelone.com>
In-Reply-To: <20261117-bpf-preempt-v2-r2-v3-0-5687f2b53b57@sentinelone.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Mon, 23 Nov 2026 14:46:59 +0200
X-Gm-Features: Aa3M54p4sO9o8A2kmO51dBuRGf5c0KYrhMd-49WQIyuTD5aiNinuGhI6siMAx_M
Message-ID: <CAPnbwjpJ6z9SQPGS-hOezBeE6fRjD_bo2aCFAnKT0N0en=WPaA@mail.gmail.com>
Subject: Re: [EXT.MSG] [PATCH bpf-next v3 0/4] bpf: Check recursion per task
 for preemptible programs
To: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	JP Kobryn <jp.kobryn@linux.dev>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A friendly ping on this series.

One update: I measured the per-task array from the v2 review
against walking the chain. It is not faster. The numbers are in the
3/4 thread.

The question from the cover letter is still open:

> One question: the marking is automatic. A flag that the program's
> author sets would avoid the second trade-off, but existing programs
> would keep losing runs until they are rebuilt. Which do you prefer?

Either way the program marks can be reduced later. Each has one reason:

- Timed may_goto: its count and timestamp are per-CPU memory that
  every entry resets. Possibel solution would be to keep them per
  invocation, in the stack of the main prog.
- Per-CPU maps: a run keeps data in this CPU's slot until it ends.
  Turn preemption off from the first per-CPU access to the end of the
  run, as Alexei suggested on v2.
- Tail calls and freplace: the target may use a per-CPU map. With the
  access itself protected, they need no mark.

Thanks,
Mike
