Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624494;
	b=goYAXU7rO4RU/vflnb5wApb9FDoFWAn4zhk8krykDR+GHyxKEbmROrst2Lovp7JgiY1e
	 eTm1aloTrTzp0useCzAcmo2mfc5dxTfRACvXOmD5RyLmWek1I7xhdt0AlatCPmjjBer9z
	 l68CjWCoXum1gscWamTms+afwtlSHqVlTw0t9Fv+HmKyoFmAS+Zox84119ReOAH8PVm+Z
	 g+Oqwt5W0kDZBn6knM9kKvsP+l5PS2rergXK15SbcshwQM0adLHnPvss+i+1VKPsvfkNs
	 g3Nka3IyqcFtPuHiXI3sQPPJmscL+1GgsJxAT93bgYxCqPcKXt1stg1H6KyrSFqonDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bJ5E0fdCqL4+rjycIXyiVbTu73miWgl9GO4UagLkTso=;
	b=YxOK6Q/oBI/m+GBtz2GDTkP3uT6mmTNFZLnV9mNCVxvCg/Y0DZGEl+iNlAYyFH9jZKpx
	 IZsnUmasNJ9s1WRKfMp8+TIoxn0u91t0iOFQU7DlKa9KTJ2Ek4GaY7NtsOj/XYp8khfEL
	 OAPsUnJv5agV1q5Vm0KuaZh/WwKtk2e50xLe411PM59fD+j+RDmsltNp83+1aPmjugjrJ
	 xnF+pzBTzHUIE4Za+xz9tfk2fAlL7uJwYoNEgEv06FYffJinyh1ICQ3kgoGcckaM04BUk
	 lN73FSeuo9dyd7bK9pOyVJLme3/PgcnOIOhVMxcXBGVdidhiQuOS16K8Fwrt+Sb9DYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGuDzXPq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570F606A683
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5570F606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGuDzXPq
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d581da0aaso838327066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795624490; cv=none;
        d=google.com; s=arc-20260327;
        b=j9NDVlTpBnuJK+MxR9cq9k5iylrQRiaPFp3Y6oZUJNWQEvJqR/kuZFNUOiiJfM0jiF
         WOWGZmRZeOupeEEFYpkYT93ePAcE4AOoEXDlLp5A+NvLax2bca2M3XHK3xQzm86Z4msH
         zwzCOW2RRe7i30fnMlQ2loB+EOJDYobuI9UQ1OK2mE7KMO2z8qeEAi7s/dj7ym0tohq1
         Osil+OXZqcUUi4i0llGJBI+P4BK2ePLI38GNlK3V+0OBkXM17He2db4mZi4Jm0Z5TE5y
         1zZpCPrWrEeEB2TSSAVAaNzeyACkmLcUDrxuwbkG6LBH45oJMaNt+33lAnCfrdzCbd5F
         v6pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJ5E0fdCqL4+rjycIXyiVbTu73miWgl9GO4UagLkTso=;
        fh=sPpUFPwHqR1A3vTNRpvnM0zf2ecmk+7gWlKzMv7COTM=;
        b=StJJIpf/oeelYJa6cDmVHeqh5y0L0p2kqDFAjDPoX5QMP/RmD+zYzNGBjz11WQcdID
         h55qD4NSrZB3LUqCSeJm5NuZepzZu2sduCYMU6AmR9TSoDcRyVAiGtu+ABAqsyk5NtDP
         +qRYnX7BpP9UnCUS550Kc4YkCQ49X4cPQpuU9CsjFBKS+OorlU3HBggzxh1ZRh2/OgFT
         8Vpz0XQmK4rdssIQjmrL3tibLfaLzv0tkLc5wRRafomsLREH9epDBXNVqzksEX/9vd6N
         jI3t40L/gRLRS0JqS4qxyz2oHrmfebyQ4Y8BvKDxV52NbeMO+EDZhKfgBA282tIuIy1w
         vboA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624490; x=1796229290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJ5E0fdCqL4+rjycIXyiVbTu73miWgl9GO4UagLkTso=;
        b=VGuDzXPq+r/QGXzOPqdgi1nqJkB6E0qYlimtTV3iW/hH0zJsBG2kYwtzWt3l4HRYs8
         S3VrBa/FImdyf/l+3l5j0eXyr4WH/9kmLkJaGPcWj2H8q/D5DW2aF7pD7MHRZwBrBUeU
         t6ADr1BeIo9Rw2gC3FFGLskYb8bFwAX0y7d/YEQZTapZHYlkoMtjLK8GSzKrm+zxQxDI
         Jrvxd88HQrwYS7jR4QzJI4GjQbyZfiZV5vTWXF0VFRSoOFgKCcxobYjQkTUgZRRQxFOa
         9EOhgXq9eosC7VhFPNaFlZpc+mpCJ+olURSH+eCVKUBGtww/iMV4Oeirs6cHIQ27rE+n
         c8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624490; x=1796229290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ5E0fdCqL4+rjycIXyiVbTu73miWgl9GO4UagLkTso=;
        b=mwTA8h63z3qSmItGTIdhEPvEDW5zjdko1+cpxGR0Lqc7MGflj2XgC6WDdZWeChrANd
         VaMz03ps/YZN6Z1Z2yBKUNBxfA7w3PPsPTRbxomIM5V5B1xM8dOIgkloKlNgs3ARZaEH
         Ml5w1IMI4xfd44jK6s0Vr2Az9KwTCQTNLy8l2yDAzy6EEg06iR69ezq1XNphJvrtoGvT
         xrR/8+edgf4KBk+AeCnrmH34/RSeYXOKhJSp4JX2xNCm5zdn3EOsMVUUR+VzNLo+myDY
         EXbpr+zTbOROTb67sTycm8A2JqM7PL+lc/kA9byYssYlgYNPnzxV4dNyq+Q40d6qDu0U
         px8w==
X-Forwarded-Encrypted: i=1; AL+hErHi+O6Jm7LTo4Le5GvelxXtlVWqmEdLFKGrJihk9SeU1AFCmRwqJz/SVBN00TAudCjF/v2RDtbS1JKbAog=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+H6bCSQ/nvhuhHWptKvnffwwvMPQRjQBuepe8QifDHodfMNgT
	Uh62mgW4KeaEi57KdQdaFy8g9Eukt1WY8QIiHT//t7SQyf3r2+Sw8DvhoBvYFtvM6q2s9HOWoHX
	qUPtmiGDy8aP7fOpouddBPyuDcj796yY=
X-Gm-Gg: AZFdTZcmNlD46r/SIbtR/alL3Fcpjtvhl2SogAeHZOvcMPlNc3JdD4rYL7TA+HZF4nF
	3Nuiyb+hnEvzhfulbZ90s4XJiXIywnoyjSEVtKhMJBJPi14YpR8xaV9XhRssYAnwq5Mv5h432EK
	Yrt0b+5WxP1r/nOHwfcvTcN60Ep7eQQ2IRQArCMmA7pFBxVxhWimND9x17vgNeir37AY9MSSXQ8
	MC7Oc9R1c7M8aYG92Cu+agOXz9tPTvd0xDGtVgIfKs5fO4V8uR4D9b5YRP1SrbfSf6NOWWJEcMW
	qFtb4Q37fD7w6u/qkpwOjeyTVFvXv82kViJEYRCcVVtDuydhXy67Z8Lt2YMuVKtEoDcndSCdecB
	xo/5ZuaMsv5Euz7YV9/dZZ5wbq35LC5N90Tb7XW65/t8owjxQSQhE0FvwQ/6XLvuUTfPMeg==
X-Received: by 2002:a17:907:d30c:b0:c51:b939:c993 with SMTP id
 a640c23a62f3a-c51b939cdb0mr154300766b.27.1795624489326; Wed, 25 Nov 2026
 08:34:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122155620.319722-1-bestswngs@gmail.com> <20261125102602.66ac1738@gandalf.local.home>
In-Reply-To: <20261125102602.66ac1738@gandalf.local.home>
From: Weiming Shi <bestswngs@gmail.com>
Date: Thu, 26 Nov 2026 00:34:12 +0800
X-Gm-Features: Aa3M54qid1eMKeyqSBOPPt75hk0e3eTHgRHvjsuABBZ2rPqcSx_7nUU0TBwFei0
Message-ID: <CANgPUi33QdEo-78THiOmHmJ9H40SpnEVuRMP=PGbmr=N9u-Omw@mail.gmail.com>
Subject: Re: [PATCH v2] ftrace: Finish removing subops after a hash update failure
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, co+bba0c6b49150bef3@bugs.sh, 
	Xiang Mei <xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steven Rostedt <rostedt@goodmis.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=B8=89 23:26=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, 22 Nov 2026 07:56:19 -0800
> Weiming Shi <bestswngs@gmail.com> wrote:
>
> > When removing a non-final graph subop, ftrace_shutdown_subops() first
> > detaches it, then rebuilds and installs the manager hashes. If
> > rebuild_hashes() fails, the subop stays detached with its ENABLED and
> > SUBOP flags and manager pointer intact. If ftrace_update_ops() fails, t=
he
> > subop is added back even though unregister_ftrace_graph() has already
> > removed its graph slot.
> >
> > In the fprobe path, ftrace_free_filter() then warns and returns, while
> > __fprobe_graph_unregister() marks the shared graph operation unregister=
ed.
> > A later registration follows the stale SUBOP state into an empty manage=
r
> > list. rebuild_hashes() leaves its output pointers uninitialized in that
> > case, and ops_equal() dereferences one of them.
> >
> > Complete non-final removal on both manager-hash failure paths and
> > initialize empty rebuild outputs to EMPTY_HASH. Keep direct dispatch
> > disabled after an update failure because the old manager hashes may cov=
er
> > functions needed only by the removed subop; normal dispatch still appli=
es
> > the remaining subops' filters.
> >
> > Completing removal also lets the caller free the subop filter. Split gr=
aph
> > unregistration into removal and callback-wait helpers so Tasks RCU wait=
s
> > run before saved_func or the operation can be released. For asynchronou=
s
> > fprobe removal, remove the graph operation immediately and defer the wa=
it
> > and filter release to a worker that is flushed before reuse. Gate retur=
n
> > callbacks on fprobe_graph_registered while cleanup is pending.
> >
> > Oops: general protection fault, probably for non-canonical address 0xdf=
fffc0000000802: 0000 [#1] SMP KASAN NOPTI
> > KASAN: probably user-memory-access in range [0x0000000000004010-0x00000=
00000004017]
> > RIP: ops_equal (kernel/trace/trace.h:1011 kernel/trace/ftrace.c:3416)
>
> So you can only trigger this via fault injection. That needs to be
> explicitly stated in the change log.
>
> > Call Trace:
> >  ftrace_update_ops (kernel/trace/ftrace.c:3464)
> >  ftrace_hash_move_and_update_subops.isra.0 (kernel/trace/ftrace.c:3795)
> >  ftrace_hash_move_and_update_ops (kernel/trace/ftrace.c:5095)
> >  ftrace_set_hash (kernel/trace/ftrace.c:6006)
> >  ftrace_set_filter_ips (kernel/trace/ftrace.c:6020 kernel/trace/ftrace.=
c:6769)
> >  register_fprobe_ips (kernel/trace/fprobe.c:290 kernel/trace/fprobe.c:1=
020)
> >  register_fprobe (kernel/trace/fprobe.c:979)
> >  __register_trace_fprobe.part.0 (kernel/trace/trace_fprobe.c:838)
> >  enable_trace_fprobe (kernel/trace/trace_fprobe.c:823 kernel/trace/trac=
e_fprobe.c:1483)
> >  fprobe_register (kernel/trace/trace_fprobe.c:1553)
> >  __ftrace_event_enable_disable (kernel/trace/trace_events.c:913)
> >  event_enable_write (kernel/trace/trace_events.c:943 kernel/trace/trace=
_events.c:1995)
> >  vfs_write (fs/read_write.c:665)
> >  ksys_write (fs/read_write.c:719)
> >  do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_6=
4.c:89)
> >  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> > Kernel panic - not syncing: Fatal exception
> >
> > Cc: stable@vger.kernel.org
>
> I wouldn't even add stable as this is something that can only happen when
> the system is already having issues.
>
> > Fixes: 0ae6b8ce200d ("ftrace: Fix accounting of subop hashes")
> > Reported-by: <co+bba0c6b49150bef3@bugs.sh>
> > Link: https://lore.kernel.org/r/20261103175832.3374540-2-bestswngs@gmai=
l.com
> > Assisted-by: LLM
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> > Changes in v2:
> > - Merge the dependent teardown and graph-reader fixes.
> > - Use Tasks RCU waits and defer the fprobe callback wait and filter rel=
ease
> >   to a worker.
> > - Rebase onto 4405c18c95d2 and decode the reproduced crash trace.
> > - v1: https://lore.kernel.org/r/20261103175832.3374540-2-bestswngs@gmai=
l.com
> >
> >  kernel/trace/fgraph.c          | 53 +++++++++++++++++++++++++++++-----
> >  kernel/trace/fprobe.c          | 21 +++++++++++---
> >  kernel/trace/ftrace.c          | 22 +++++++++-----
> >  kernel/trace/ftrace_internal.h |  2 ++
> >  4 files changed, 79 insertions(+), 19 deletions(-)
> >
> > diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
> > index 6d87143b3..3760795d3 100644
> > --- a/kernel/trace/fgraph.c
> > +++ b/kernel/trace/fgraph.c
> > @@ -1406,8 +1406,11 @@ int register_ftrace_graph(struct fgraph_ops *gop=
s)
> >       gops->ops.flags |=3D FTRACE_OPS_FL_GRAPH;
> >
> >       ret =3D ftrace_startup_subops(&graph_ops, &gops->ops, command);
> > -     if (!ret)
> > +     if (!ret) {
> >               fgraph_array[i] =3D gops;
> > +             if (ftrace_graph_active =3D=3D 1)
> > +                     ftrace_graph_enable_direct(true, gops);
> > +     }
> >
> >  error:
> >       if (ret) {
> > @@ -1420,13 +1423,27 @@ int register_ftrace_graph(struct fgraph_ops *go=
ps)
> >       return ret;
> >  }
> >
> > -void unregister_ftrace_graph(struct fgraph_ops *gops)
> > +/**
> > + * unregister_ftrace_graph_start - remove a function graph operation
> > + * @gops: graph operation to remove
> > + *
> > + * Remove @gops from graph dispatch, release its array slot, and updat=
e the
> > + * graph and subop state. Existing graph callbacks may still be using =
@gops
> > + * after this returns.
> > + *
> > + * Return: true if @gops was removed. The caller must then invoke
> > + * unregister_ftrace_graph_finish() exactly once before releasing @gop=
s or its
> > + * filter, even if the subop hash update failed.
> > + */
> > +bool unregister_ftrace_graph_start(struct fgraph_ops *gops)
> >  {
> >       int command =3D 0;
> > +     int ret =3D -EINVAL;
> > +     bool removed =3D false;
> >
> >       if (WARN_ONCE(!(gops->ops.flags & FTRACE_OPS_FL_GRAPH),
> >                     "function graph ops unregistered without registerin=
g"))
> > -             return;
> > +             return false;
> >
> >       guard(mutex)(&ftrace_lock);
> >
> > @@ -1440,16 +1457,17 @@ void unregister_ftrace_graph(struct fgraph_ops =
*gops)
> >       if (fgraph_lru_release_index(gops->idx) < 0)
> >               goto out;
> >
> > -     fgraph_array[gops->idx] =3D &fgraph_stub;
> > +     WRITE_ONCE(fgraph_array[gops->idx], &fgraph_stub);
> > +     removed =3D true;
> >
> >       ftrace_graph_active--;
> >
> >       if (!ftrace_graph_active)
> >               command =3D FTRACE_STOP_FUNC_RET;
> >
> > -     ftrace_shutdown_subops(&graph_ops, &gops->ops, command);
> > +     ret =3D ftrace_shutdown_subops(&graph_ops, &gops->ops, command);
> >
> > -     if (ftrace_graph_active =3D=3D 1)
> > +     if (ftrace_graph_active =3D=3D 1 && !ret)
> >               ftrace_graph_enable_direct(true, NULL);
> >       else if (!ftrace_graph_active)
> >               ftrace_graph_disable_direct(false);
> > @@ -1460,7 +1478,28 @@ void unregister_ftrace_graph(struct fgraph_ops *=
gops)
> >               unregister_pm_notifier(&ftrace_suspend_notifier);
> >               unregister_trace_sched_switch(ftrace_graph_probe_sched_sw=
itch, NULL);
> >       }
> > -     gops->saved_func =3D NULL;
> >   out:
> >       gops->ops.flags &=3D ~FTRACE_OPS_FL_GRAPH;
> > +     return removed;
> > +}
> > +
> > +/**
> > + * unregister_ftrace_graph_finish - wait for callbacks using a removed=
 operation
> > + * @gops: graph operation previously removed by unregister_ftrace_grap=
h_start()
> > + *
> > + * Wait for existing graph readers, then clear the saved callback. Thi=
s may
> > + * sleep. The caller may release @gops and its filter after this retur=
ns.
> > + */
> > +void unregister_ftrace_graph_finish(struct fgraph_ops *gops)
> > +{
> > +     /* Graph callbacks can run where RCU is not watching. */
> > +     synchronize_rcu_tasks_rude();
>
> Graph callbacks should never be running when RCU is not watching. If it i=
s,
> then that is a bug.
>
> > +     synchronize_rcu_tasks();
> > +     gops->saved_func =3D NULL;
> > +}
> > +
> > +void unregister_ftrace_graph(struct fgraph_ops *gops)
> > +{
> > +     if (unregister_ftrace_graph_start(gops))
> > +             unregister_ftrace_graph_finish(gops);
> >  }
> > diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
> > index 47d565a1e..29fc2bfc4 100644
> > --- a/kernel/trace/fprobe.c
> > +++ b/kernel/trace/fprobe.c
> > @@ -14,9 +14,11 @@
> >  #include <linux/rhashtable.h>
> >  #include <linux/slab.h>
> >  #include <linux/sort.h>
> > +#include <linux/workqueue.h>
> >
> >  #include <asm/fprobe.h>
> >
> > +#include "ftrace_internal.h"
> >  #include "trace.h"
> >
> >  #define FPROBE_IP_HASH_BITS 8
> > @@ -279,6 +281,14 @@ static struct fgraph_ops fprobe_graph_ops =3D {
> >  static int nr_fgraph_fprobes;
> >  /* Is fprobe_graph_ops registered? */
> >  static bool fprobe_graph_registered;
> > +static void fprobe_graph_cleanup_workfn(struct work_struct *work);
> > +static DECLARE_WORK(fprobe_graph_cleanup_work, fprobe_graph_cleanup_wo=
rkfn);
> > +
> > +static void fprobe_graph_cleanup_workfn(struct work_struct *work)
> > +{
> > +     unregister_ftrace_graph_finish(&fprobe_graph_ops);
> > +     ftrace_free_filter(&fprobe_graph_ops.ops);
> > +}
> >
> >  /* Add @addrs to the ftrace filter and register fgraph if needed. */
> >  static int fprobe_graph_add_ips(unsigned long *addrs, int num)
> > @@ -286,6 +296,7 @@ static int fprobe_graph_add_ips(unsigned long *addr=
s, int num)
> >       int ret;
> >
> >       lockdep_assert_held(&fprobe_mutex);
> > +     flush_work(&fprobe_graph_cleanup_work);
> >
> >       ret =3D ftrace_set_filter_ips(&fprobe_graph_ops.ops, addrs, num, =
0, 0);
> >       if (ret)
> > @@ -297,7 +308,7 @@ static int fprobe_graph_add_ips(unsigned long *addr=
s, int num)
> >                       ftrace_free_filter(&fprobe_graph_ops.ops);
> >                       return ret;
> >               }
> > -             fprobe_graph_registered =3D true;
> > +             WRITE_ONCE(fprobe_graph_registered, true);
>
> Why the WRITE_ONCE()?
>
> >       }
> >       return 0;
> >  }
> > @@ -305,9 +316,9 @@ static int fprobe_graph_add_ips(unsigned long *addr=
s, int num)
> >  static void __fprobe_graph_unregister(void)
> >  {
> >       if (fprobe_graph_registered) {
> > -             unregister_ftrace_graph(&fprobe_graph_ops);
> > -             ftrace_free_filter(&fprobe_graph_ops.ops);
> > -             fprobe_graph_registered =3D false;
> > +             WRITE_ONCE(fprobe_graph_registered, false);
>
> Again, what's with the WRITE_ONCE()?
>
> > +             if (unregister_ftrace_graph_start(&fprobe_graph_ops))
> > +                     schedule_work(&fprobe_graph_cleanup_work);
> >       }
> >  }
> >
> > @@ -679,6 +690,8 @@ static void fprobe_return(struct ftrace_graph_ret *=
trace,
> >       ret_ip =3D ftrace_regs_get_instruction_pointer(fregs);
> >
> >       guard(rcu_sched_notrace)();
> > +     if (!READ_ONCE(fprobe_graph_registered))
>
> Can you explain the READ_ONCE()?
>
> -- Steve
>
> > +             return;
> >
> >       curr =3D 0;
> >       while (size_words > curr) {
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index c7d74b33d..7c712d99f 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -3672,6 +3672,8 @@ static int rebuild_hashes(struct ftrace_hash **fi=
lter_hash, struct ftrace_hash *
> >       bool first =3D true;
> >       int ret;
> >
> > +     *filter_hash =3D EMPTY_HASH;
> > +     *notrace_hash =3D EMPTY_HASH;
> >       temp_hash.filter_hash =3D EMPTY_HASH;
> >       temp_hash.notrace_hash =3D EMPTY_HASH;
> >
> > @@ -3713,7 +3715,13 @@ static int rebuild_hashes(struct ftrace_hash **f=
ilter_hash, struct ftrace_hash *
> >   * will not affect functions that are being traced by other subops tha=
t
> >   * still exist in @ops.
> >   *
> > - * If the last subops is removed from @ops, then @ops is shutdown norm=
ally.
> > + * If @subops is the last subop, @ops is shut down normally. Otherwise=
,
> > + * @subops is detached even if the manager hash update fails. The mana=
ger
> > + * hashes may be partially updated, but still cover all functions requ=
ired by
> > + * the remaining subops.
> > + *
> > + * Return: 0 on success, or a negative error code on shutdown or hash =
update
> > + * failure.
> >   */
> >  int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *=
subops, int command)
> >  {
> > @@ -3753,15 +3761,13 @@ int ftrace_shutdown_subops(struct ftrace_ops *o=
ps, struct ftrace_ops *subops, in
> >       /* Rebuild the hashes without subops */
> >       ret =3D rebuild_hashes(&filter_hash, &notrace_hash, ops);
> >       if (ret < 0)
> > -             return ret;
> > +             goto out;
> >
> >       ret =3D ftrace_update_ops(ops, filter_hash, notrace_hash);
> > -     if (ret < 0) {
> > -             list_add(&subops->list, &ops->subop_list);
> > -     } else {
> > -             subops->flags &=3D ~(FTRACE_OPS_FL_ENABLED | FTRACE_OPS_F=
L_SUBOP);
> > -             subops->managed =3D NULL;
> > -     }
> > +
> > +out:
> > +     subops->flags &=3D ~(FTRACE_OPS_FL_ENABLED | FTRACE_OPS_FL_SUBOP)=
;
> > +     subops->managed =3D NULL;
> >       free_ftrace_hash(filter_hash);
> >       free_ftrace_hash(notrace_hash);
> >       return ret;
> > diff --git a/kernel/trace/ftrace_internal.h b/kernel/trace/ftrace_inter=
nal.h
> > index 3235470e6..abb7776a2 100644
> > --- a/kernel/trace/ftrace_internal.h
> > +++ b/kernel/trace/ftrace_internal.h
> > @@ -52,6 +52,8 @@ static inline int ftrace_shutdown_subops(struct ftrac=
e_ops *ops, struct ftrace_o
> >
> >  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> >  extern int ftrace_graph_active;
> > +bool unregister_ftrace_graph_start(struct fgraph_ops *gops);
> > +void unregister_ftrace_graph_finish(struct fgraph_ops *gops);
> >  # ifdef CONFIG_DYNAMIC_FTRACE
> >  extern void fgraph_update_pid_func(void);
> >  # else
>

Hi Steve,

Thanks for the review.

Yes, this only happens on an allocation failure (-ENOMEM) in
ftrace_shutdown_subops(), forced via fault injection (failslab) in the
reproducer. I'll state that explicitly in the changelog and drop
Cc: stable in v3.

Sorry about the leftover Tasks RCU calls and the "RCU not watching"
comment in unregister_ftrace_graph_finish(). I'll replace them with
synchronize_rcu().

The WRITE_ONCE()/READ_ONCE() calls on fprobe_graph_registered were left
over from an earlier draft where unregister_ftrace_graph() itself ran
from the workqueue. Since unregister_ftrace_graph_start() now removes
fprobe_graph_ops synchronously, and del_fprobe_hash() along with the
caller's RCU wait already protect in-flight callbacks, the check in
fprobe_return() isn't needed anymore. I'll drop that check and the
WRITE_ONCE()/READ_ONCE() calls so fprobe_graph_registered is only touched
under fprobe_mutex.

Thanks,
Weiming Shi
