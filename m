Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795608216;
	b=sJ1cJoc1mHwhNrWohlkxaZU0GxrQ3qyy8m1CNdMCrh/CxD28ya9uTZIWixHlBHe44yWH
	 XDD2XG1Wy20nJMGBzC8rbgpjWUQdskBaTNpnEbn5Nt2XpwptcmhVjMe/pL6nKWTZBQJ4u
	 ZP4uNcFATh36GLvd2v+rkemtHcPD+44Zz6yfpncV86838yQNnxcXF8HCZtAY3RaxUPGII
	 ZQRzkU09BJRJv4vUlzLvUlv5Cj+ZCIy25lKfEkdrQh97p3IrjZZevTqiVhqcTWUcy2H12
	 yXKgBzq3yCMr2kS1t13TsJlc/A+JqoFC2OQHtINrGIsT+l2C/YCcGL9w9l9AoPwiWew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tup9wrbU8nf0eWmfjcOGu/NZ/iv8Wqyf43zvkmJl048=;
	b=Xo/GkHLvN1Yrch2HfIIELbZbe+6bwvRm/FDqvbFbDEEktxbPqF9RDNJhk1VCSb+1/nwP
	 8nrttOwp4xmI41yPabqa7fmVMMjV90D/w4vzSscFU4WgOO+R1zLiYPypy80oHQ7qMkaKq
	 8swlUXCMDdH3v5JXBxdChJtUmP9tUB/6dRz5kG66hZPe1QEMEIeNLr4E2s7NGoLhfd57g
	 8LmYY+TLgIN8adf8I9vbeHgk4FbgSC+XdfPuNTMTHqNitMYbQ6dShA0SiDREpN+Qs2E0Z
	 dbWuNSC6cUgWYI98vl1NBF9tK3yTheO+Dhlk0dEMrIzptXsBqJIo8Vvz0ASZL0kqLRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b="Vs6Ga95/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB7606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACB7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=Vs6Ga95/
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb86da313cso124403a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608216; cv=none;
        d=google.com; s=arc-20260327;
        b=Hu3K9FObACcs0wYAPwPNUOBoaLG6iUMDDcNjoVUeidUrz7nybmhGkWEIikE3YZ4I+g
         70Xultfo1d0Urje3d+FZQjUahxJHy5HE/BfEIZkm368nqTA9mEO/FMIwOcLMclAs+JQ6
         wpX0JDIBgl0BgTRqSoaaeJywAzhR0+PZAILEkFh+FF/qrKq6h6YlaONcIeEW5Qs2Iq+0
         NQX6scoqZ8yCpsH6qOP/ZDw42ZUFagiarZ20Z8O34xdb+ls280jZFh4T2xfpeOGxk9Ja
         O5oCPZnHPTuVawes9PHJYsZGkPVzE50j5K5+cJ5M202q02K5Dg4CXOa9qLk0N1j/gF6r
         dyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tup9wrbU8nf0eWmfjcOGu/NZ/iv8Wqyf43zvkmJl048=;
        fh=0V2A8vgDERxHMqOaWhf5t9HoMEgJXFfhMtp9wppQWyQ=;
        b=U/kR7IjYql7IlSbjLneM3NnSue7pqe4ar3tI6C9EF6Eo7q7PVcUCIamzVzbu1oJxub
         1zE3R+30Go2V4NcZYr7mcoHk2i7aQGbyHQda+BoospBsVKcxfpJvKQUmOFaeyeHA7fhp
         kc/VvCmYUbki5JBDMoP/rfG6K8DWYv4YI8aic319V/2bCyR+TrrA+jI0WlOMhAClHJak
         K9LcmeDuN5nL9pk4HH+fJIlZZiQlRWHraYfn0zGEmBcdmH/OJS7/hxv72q0+tKodQJZL
         UIVKPZxIC3OCmSVOBttZF/RU+I3gF3XS+4rLLTePk/Uglmjx8Z8MkLg1DOdVbhSJqori
         nQgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795608216; x=1796213016; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tup9wrbU8nf0eWmfjcOGu/NZ/iv8Wqyf43zvkmJl048=;
        b=Vs6Ga95/mRaUREGKXZ9E4vdoMP0K1u9J5ZpXSDocWX2J/AeqvLDgfwj209rKQRafb1
         p7Seom0kCONOkXHyUXxIOsSFwZ1qfTJxeAhYpEamQvZwu5PW8C3lKiMG3FjLgBoAmfrs
         A7E5+JIuzjNhhWEm+MRBVT/DvhQ1+uzse5Po9d8OXJ+D1ivxlOQMIk7y0hB4Gif2fLBD
         GS/uTRxI57SYIJj6HSKCfeJpH2jzpzvyyLwi1eeS5DX91EWIT92HC2J+HL8OBbXrNbIH
         oTys+Rzp14daPGst8Cc5CAkfolTWfg/wAy7f25XrKdYcDwKGF+2u2m6JC2/AkZLvM7fk
         3cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608216; x=1796213016;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tup9wrbU8nf0eWmfjcOGu/NZ/iv8Wqyf43zvkmJl048=;
        b=1PAj60JuT8voITRCdA9GhnDNCS+ViVHMmHcglBE/GYlrCnrVAPMj1r/yHmuly2P2Cu
         9pTNrlOTL52TxJt1BkGWztayiyJvT5q4AnS/mluMlceqlFe8A77uDl+g0X9FIkCTBlX5
         X8HL/YuW6Z4YWFHGtkVXdQePPEwWdiwD5aH8uRhCPFfPg/INDVIMccb3UABrQ/RH6Kom
         qQDp56kc5kVfCjGSoSZ8nvih4KkLqsMQ4x6aASQhyv/yZJHqu4EMO5RrKJjccHQhcbXx
         wKhHZGiIl+gQ6iLnEPBLBZAi/SFLtYC3yow32ZS7Y1Eghy/G31cr1bXx+TnCwPztj1l7
         z2LA==
X-Forwarded-Encrypted: i=1; AL+hErGLClJ86DmS/GLwt5PtdIKlfFkRkeWGE7HU8heG0hJw7XLelxodME1k3u1ZhEfWWICHoxBVVb3NxzB+i60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WduqUr4H9n1CBwhjl+BkCHZwpk3lDUUs1myFOfOwOI8PyDHFb
	g4mmuVIX0eNFwZErsXe5KFRBrj7OHHsvb2mcR52+BwGMxscC+hAp1+CRiZwKlWh7Qges0AI9EaF
	Ny+wz0RUVAjABpOXkR/FkyK5abcz4j0RtLnakN+KaQQ==
X-Gm-Gg: AZFdTZdhqwtgncGs1IXbW0Gr6KGV9lVRtTsZxy3Ve/+4G9gAB1VSAxioaphfb4XDyYk
	+7vaX9ss0Ls7/NEIloi8T7bm4ijdLbwF91BdsL1a9/CNo6XZ5ldlU6tlC3ZV9Pg5I3aiwHhPuX+
	Bz2vHFfpaucU7wD6JrabMpme6qBt2MEuWknbkexDmqLg5vpUbEHHY/NQbXu17GvVVu0awWlw2fy
	R+PwvF5Pj7zicswofO5NZBb+dbtV7hEuSVErSedCm0bjLjWWBWZDEIKXGiXs9zh+B1XTKyIhZ4X
	+G7fT/q8d3BMjhB+dOe6QJqp/LzL74WzNxILWO9OJZuRdpY6qA57a4JvNW/riWg0YZfn9lnMyre
	VIy+Q4DgsxYwgqApvbzRGmEnoxQJz8rdmaUM=
X-Received: by 2002:a17:90a:c10e:b0:3b3:c92e:f523 with SMTP id
 98e67ed59e1d1-3b41c917320mr29094246a91.3.1795608215341; Wed, 25 Nov 2026
 04:03:35 -0800 (PST)
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
 <DN38312WXPDJ.2KLUTCWSDFL3P@gmail.com> <CAPnbwjpP9Fin=CyD0WiA2c4sxqbfyK7AziE64PCX4w9kbz55Kw@mail.gmail.com>
 <DN3Q2CZJSC2C.IM2EYLF1NR9X@gmail.com>
In-Reply-To: <DN3Q2CZJSC2C.IM2EYLF1NR9X@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Wed, 25 Nov 2026 14:03:38 +0200
X-Gm-Features: Aa3M54oy1asy-clEA0aiBgUJI2wZjpNvBPoFr8M2_NvkO6W7Ay5C4UmmNBOTtyg
Message-ID: <CAPnbwjpLcyJF70D5j-q23L3TQSFXebB_RndQRmDe+_5h02YazA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per task for
 preemptible programs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	JP Kobryn <jp.kobryn@linux.dev>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 08:26 PM Alexei Starovoitov wrote:
> Keep count and timestamp per-cpu. Call bpf_timed_may_goto_save() in
> bpf_prog_enter_run_ctx() and bpf_timed_may_goto_restore() in
> bpf_prog_exit_run_ctx(), like bpf_timer_cb() does.
> Then the preempted run gets its count and timestamp back.

i tried it, it works when the run that preempts finishes first, as
with bpf_timer_cb(). With preemption it can be preempted too, and the
preempted run can go on before it ends:

  task A, cpu 0                  task B, cpu 0
  loops, preempted
                                 save: A's budget into B's stack,
                                 fresh one in the per-cpu struct
                                 loops, preempted
  goes on with B's fresh budget
  exits: owner is B's, no restore
                                 goes on, exits: restores A's,
                                 which nobody uses any more

A fentry prog spins in a can_loop loop, 3 SCHED_OTHER tasks on one
CPU, 4 runs each:

  kernel              runs  dropped  longest   over 500 ms
  bpf-next            4     8        250 ms    0
  save/restore        12    0        1253 ms   7 of 12
  save/restore        12    0        1752 ms   9 of 12
  save/restore (*)    24    0        2263 ms   22 of 24

  (*) 6 tasks instead of 3

You can see it in the run times: they land near multiples of 250 ms,
one extra 250 ms for every fresh budget a run picked up from another.

An lsm prog has no prog->active, so the same test gives the same
result on plain bpf-next: 1253 ms, 8 of 12 over 500 ms. The overwrite
already exists for all progs that can be preempted (lsm, cgroup,
struct_ops, uprobe, iter, sk_msg, syscall).

A fix for all of them has to change how may_goto keeps its budget:
lsm, cgroup and sk_msg progs never go through bpf_prog_enter_run_ctx().
I'd rather split it out of this series: v4 takes may_goto out of the
mark, so tracing progs behave like lsm ones today, and a separate
series fixes the budget for all prog types. Does that work for you?

Thanks,
Mike
