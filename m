Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144731;
	b=sT9zAOTW0xXgEKPy7bi4owdGB7cWqOEq+x8tqrgnh4yCAZUSMC5d0vdTYdYs4NEfurR2
	 eTOrbHXro+wNQAmXH36rbFUJi7mvHd08M3/q/VtjZA9T7By25lUBpAWT1cm4xHUN3afeP
	 VrcLiDnFU6ZWFb8Q1al0+A6Kckd1mMMJvO1JMeZCW1W6jqgD4LI3UNMBY+UmXM6hYDUQW
	 N7Z5fARG/rUWYzGlQLo0SAs7Jg3Q1PC+r/1JESXS8yIyXRE6lle+8lnpU+8Tqn3QztCEj
	 ixUCualeNR17BPryT3bUqv/T8fRDhwq6o+3MHYJS/R3r1ymgaf5EJ/xNyAm/M2kg/Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144731;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=HNYE8591wUB8/79nPQDHApG4rsC5MtTjglQgWJo7pxM=;
	b=Y3/slmsYGu2EWFxycnL1i1LGxYjOEu8j8MuR5b5qOxutlJwu4YbagZBfiTNQhUQNwuZG
	 mm/MxIXaOPmVoNdLO7V0O6D9e/O9EzQYS5tqSnG7TN371RdwH0BKdeKa3q9qR+U/WSYwv
	 g8r6GGdesfzdn2wIsOb6d2wooed3nm/wFGheiHoIqBNtcL1liUo6CM4d4rfx/aecZZaUh
	 vkUZi71ZTMEOCsUSH41juIWKXXGjgrzMVZ5z3EaSiTVuU1VkNm2GMnIR0+Ax+UFsApGI6
	 tSSYT2+7uz4BD4apc8Hkp+BEAFxwqgOHwN1SVHvj9U4YO88gcToxZJMSP+He6CcrD0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F1Kl65h8;
	arc=none smtp.remote-ip=95.215.58.114
Received: from mta1.migadu.com (out-114.mta1.migadu.com [95.215.58.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58942606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58942606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F1Kl65h8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q9PUeTqtN9PXprzWPvfSmObbAJDOGZe7PNuxs9Ku0zI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795144726; v=1; x=1795749526;
 b=F1Kl65h8ocGLl16wb6EL4v90jeLPKGW5KJBWZD8SNBCYz1TzaDmZaTO/zOZKsRWkpz+JQIoJ
 fU8cW/uLfyQ3u2fbMzrmt16WI+cBzLsG0Z/SJ4G/YBdePiKtHMv5zUqj+8h6ihDOarxjt4QzuX7
 RjDiFgZqfF+Rc3s1GyxSElEs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 121549abfa02dd46;
	Fri, 20 Nov 2026 03:18:45 +0000
X-Mizu-Trace-ID: 121549abfa02dd46
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 03:18:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: fushuai.wang@linux.dev
Message-ID: <9ccffcd29373dd9ab6b598ebe07eebbced04c156@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2] sched/core: Fix a TOCTOU bug in
 sched_non_preferred_cpu_push_stop()
To: "Peter Zijlstra" <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 sshegde@linux.ibm.com, linux-kernel@vger.kernel.org,
 wangfushuai@baidu.com
In-Reply-To: <20261119090728.GN2668804@noisy.programming.kicks-ass.net>
References: <20261118065921.98260-1-fushuai.wang@linux.dev>
 <20261119090728.GN2668804@noisy.programming.kicks-ass.net>

2026=E5=B9=B411=E6=9C=8819=E6=97=A5 17:07, "Peter Zijlstra" <peterz@infra=
dead.org mailto:peterz@infradead.org?to=3D%22Peter%20Zijlstra%22%20%3Cpet=
erz%40infradead.org%3E > =E5=86=99=E5=88=B0:

> >=20=20
>=20>  kernel/sched/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20=20
>=20>  diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >  index 5ed660f099a5..6f9374aa3f19 100644
> >  --- a/kernel/sched/core.c
> >  +++ b/kernel/sched/core.c
> >  @@ -11314,7 +11314,8 @@ static int sched_non_preferred_cpu_push_stop=
(void *arg)
> >  rq->npc_push_work_pending =3D false;
> >  update_rq_clock(rq);
> >=20=20
>=20>  - if (task_rq(p) =3D=3D rq && task_on_rq_queued(p)) {
> >  + if (task_rq(p) =3D=3D rq && task_on_rq_queued(p) &&
> >  + !is_migration_disabled(p)) {
> >  struct rq *dest_rq =3D __migrate_task(rq, &rf, p, cpu);
> >=20=20
>=20>  if (rq !=3D dest_rq)
> >=20
>=20I think I like a comment with this. Perhaps add something like:
>=20
>=20 /*
>  * Racy: is_migration_disabled(current) isn't stable.
>  */
>  if (is_migration_disabled(push_task))
>  return;
>=20
>=20in sched_push_current_non_preferred_cpu().

Hi, Peter

Will add it in v3.

>=20
>=20Also, I wonder if you'd find more of this if you stick something like=
:
>=20
>=20 lockdep_assert(!task_on_cpu(p) || in_task());
>=20
>=20inside is_migration_disabled().
>

I'll add it and run more tests.

Regards,
Fushuai.
