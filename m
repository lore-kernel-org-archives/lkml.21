Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795674149;
	b=mOq9zsFryiaG3+fOG4qoTkMepI2CMwEU1uIuXiTN9uC+ptSGKSo3807sHAs0rzofO6ri
	 oTVfg+SsxUJkNO++ZYb+oX8fAiOZa2uLUVww4PcLwYJYftYa7VWIjGgox+O29xCzDW1K7
	 sx+Grc3GML1X2paJ4oQbeujdxMfjmXg7jQL0F2BIQ2unF3bAqjaqMFs5pGana7SrMvQLv
	 T7aywtLqqXzkTdjNdX2tXHvdLgdgEB7QvSruO/80dAa2VGY0sRUrgqlXIg28hVpbAHXuW
	 h1X/beg0PJ0LHNGE3+tqH+TYQHgoT00bmg/qCnAZz98wOpCDqSFYSKsU5A1CV6/pLIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tY9nLIb8So44YCfk+ukYGW/gxV4FoPJpDhdzBs8SYwU=;
	b=hzJmPf3cgpXwI5rf1w1d2Vb75Tj8R11cEB6J5SERKb/W5jgg8DFAqWXRGce00N/CuEB1
	 bjEBgMtQ5n3pzsz6+XPV2r1kwapDyLqqfaN1e06JoJfKDVeX/feP9fVIhZgVruiD4iWPc
	 wshdgOTMU9xXNytQZE+a3NpkaJJBf/JkfxylEyGsgNQLsfbOZCyHhAAeahUyReWi73gLW
	 p/AuC1p1T4dfNVpZedxgEgdYUd/pVNDLYTi+hYAlrItrweiwtFVGYCC41U0PdFeUXSHNf
	 xGXDpB6BP6zuij6Kmfp3MBhERP9ko+AIXy8Ob5f7VMZlPE04ykG3LOmxl+AdQ9y8AwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e+Dr+BXC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E680E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E680E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e+Dr+BXC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so12620955e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795674147; cv=none;
        d=google.com; s=arc-20260327;
        b=qSJR+0/uFirF3x9OIcqcgg4zeCCMHkW3A+bvRfQcBjMzAOHeuZcTKbJ3W4/NXOFFrX
         2W07DhVU6dWDRPQl6c7eUA32W93ExvJw4Cxr+xYhSDmi8RMojehY9Bu5e/xzJPUf/Um5
         nDAIxWVgBa9SYDJy28tc3ellLMVbYImreWiowdGAHSyM0vxaAj+HktkITvq710i0vcRq
         SOPhlrI4RK+FxDGoffgB3AONkjEpLttLa/NlHtX7NZCYV6vrwQ3THLosDGynRINykD/J
         tBc9o8Bt31AVFiQHoCFwZ356Dn5VUPO87P2StzmLjRAroLAi+K+VcYBuMW5uEg1tL6Bg
         Ovww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tY9nLIb8So44YCfk+ukYGW/gxV4FoPJpDhdzBs8SYwU=;
        fh=FYIzBgXJaN9LSB4FO5ms+N9f1yL1cKORdoVsd2swGEk=;
        b=RwNsW4PT9RQDyoI0sTedM7bAc9Lk4tCPR2VoorKaD1GvrayW9Tsd7oQq7PFL43U8Gn
         xpZf8BnSLHK1iD7YnK02FQy15IvS6arbEHUtuGoMZ/+gmOREwUluiHK+F4No4AacdBc2
         /wvG0JSRCZGYIK+yJgzZMRstErIfV/sZk3wsRH+nSBTSKnaIe4GQEOBks3ZWcjO1sg2U
         xBlLjt4WJ1/t2HXG9leGBpJNxxpISW2/UUtzxAfl1rEvufA6FP1WY2/Bt/VB/f+kvE3N
         cVuULoM9GehGzjm51d+C0/XikvCllf9Agpw0s/k1PvdVodFbxEIw0YvRdFg9MgmECP4u
         eE3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795674147; x=1796278947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tY9nLIb8So44YCfk+ukYGW/gxV4FoPJpDhdzBs8SYwU=;
        b=e+Dr+BXCWxgb8Lji0uabx6S4iHxjrfoopUAHJW2oX/xtm4OJe9XokAzfrF840jUtJR
         G4yNath6QphIFy5jFphmANsEYcLI3+MFBAO3NiKXCyAwjJo38KWvmhGwN3Ar2y4SBm1J
         X6zo7YKBeGtA+IzoeA7yhY4RvcaGkYHA2L0MpzmRvY25Hvp13ul7J4SHVXXFxkKnuain
         rdw35HcVcMtzSXhz/8h0a1bhqdqYjnCJRGml+St2/+Og0E0qN6A8p3j2lz//hsHr9SHz
         QpHm1mkjGRXEym4QE7uY7m0M0egxPPNm2jI/hDTVTnO7ziXEBja1tVqiSoBajUjfROz5
         6x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674147; x=1796278947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tY9nLIb8So44YCfk+ukYGW/gxV4FoPJpDhdzBs8SYwU=;
        b=AzS+YRAFqvxeIeUUGsHdT/nUSb4HVYq53EeYUWhKXECjWDcfWD6irt+eI6e6ZdS06H
         QJ8DrTqjVK22fbfzdmu+UbOXOFYB8Ii2cwWzt/m74wdcR+2a6gG9q2gGdRdwX9q3p9K3
         TDWdzmkwlutoEya6pbtaxH1rCDKsWh/Aa/U54etSWIf4jFN5fD/vi7fEzSSf44tyuNuM
         t/h4srSX2+6DGzynbVAXqvZKavCKIpX1aUSrmDNkP8jj73oHkso3wCkKX6z9R3RSur0j
         s+Bz88mfrTHD1zzn99u9uIOUPbeLHXCf5pNBUx/vGrq4ks9ymcbwDpacrGCsF7u3s7WJ
         8raQ==
X-Forwarded-Encrypted: i=1; AL+hErFJEpHJgFhPbEdw+ZO7UeDN8z76yjsI2Wk5XMFc9g8Prbavkw+8WvShOXfxQUpKT1moA/AIe2nRZ0gB29o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TOsdiJ5ObR1qtNf06kjobJ0UjbikYAeeOrycgtGu70ZrcRGwb
	tImTDcklQGd+//mIrKKq/SYCvr/3V4caz7y7lf9lfRBy2CJijUFhJY3AmZJAKPMcSP3558PVnG0
	U3pujjeoU9G2CmMcI2a+2yu00apSwACVFlgMtU4I=
X-Gm-Gg: AZFdTZdjrBrlnjpgGNZ0rGAT3JAqnxbyadw93pTw8ERPfsIITilVC4e9rH472QqnRu+
	OtMBVlfUcAR+Hal4gYjZnM75/VOYit4HE1vcXSTLAuxBmbruvdvzMha1ivOFuTgdVS5trCCBLap
	0n1m/Rp0Oonwy52iE+5bBdoDS0PkK3tdZj8tu50EuPFxJvKA1OS+RHliWE2xaAKJKqag2YxXJ25
	9dMJfejgEC8Rh/S5jC9KEwcYxV/hvnhGpNE+5lwPeJ8ojBs3ePeUqbxUMO/yr6RPz/Rrghq9Kld
	AaAFEavNDZ+2tekmXfo+YV4klPKgbZnymOLOJmrqlShkyXM1l4Fl6ErD2MARbwimLIXJfPoFl3N
	f/oV+6uNK4pDp0/rlJ804tL5EseCWZMPwlzbD1i+1SMsEwBoGR5LAzYf6cptfKaEKF2L1lCvV5m
	zWaucmBF+VB/6Fo+Fz9mRQmgkqlfSTq/pgTHVZBkb8JpHqUjIuWIGMLAHQlbK2vbhnAWRAyIEgr
	DjWxeu+DVCovH1rS8efn/As/prly+NU3tOFO+YIx1EiP4Kn9PIvu0IYNCWyZzAO85TuXg0dRuw=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id
 5b1f17b1804b1-4bb88819940mr465372465e9.30.1795674146565; Wed, 25 Nov 2026
 22:22:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023220431.1106611-1-jstultz@google.com> <20261023220431.1106611-8-jstultz@google.com>
 <atx1U_0FC-fazkV7@gpd4> <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>
 <auDPxCTyGbStTWJD@jlelli-thinkpadt14gen4.remote.csb> <a3bb6028-52f9-4545-a5f1-08f56fa6ac2a@amd.com>
 <auHH9ixQvWQ7RYA3@jlelli-thinkpadt14gen4.remote.csb> <1bfd6376-cc69-4c55-ac3b-6ea12b8c6c75@amd.com>
 <auHQJ8vq6VtL2Uf0@jlelli-thinkpadt14gen4.remote.csb> <faec8c94-0837-430b-ba60-00fa4a8a5eb4@amd.com>
In-Reply-To: <faec8c94-0837-430b-ba60-00fa4a8a5eb4@amd.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Nov 2026 22:22:13 -0800
X-Gm-Features: Aa3M54qhWulaS0hyEKcnewVHBEQv-fTmWx3uXK_swsC2i-Otcb97WhRPMzaY2x8
Message-ID: <CANDhNCrZZAOnuNHjzDSGFDZq97twR9XkbJH77fP10hP4EcYaHw@mail.gmail.com>
Subject: Re: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrea Righi <arighi@nvidia.com>, 
	Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Valentin Schneider <valentin.schneider@arm.com>, "Connor O'Brien" <connoro@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	Suleiman Souhlal <suleiman@google.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, 
	hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Hui Su <sh_def@163.com>, 
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:27=E2=80=AFPM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
> On 10/28/2026 4:06 PM, Juri Lelli wrote:
> >> Ack! But this is only needed for wakeup so just:
> >>
> >> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> >> index c0ebdcde5fe5..20c388b55c50 100644
> >> --- a/kernel/sched/deadline.c
> >> +++ b/kernel/sched/deadline.c
> >> @@ -2657,7 +2657,7 @@ static void migrate_task_rq_dl(struct task_struc=
t *p, int new_cpu __maybe_unused
> >>      struct rq_flags rf;
> >>      struct rq *rq;
> >>
> >> -    if (READ_ONCE(p->__state) !=3D TASK_WAKING)
> >> +    if (task_on_rq_migrating(rq))
> >>              return;
> >>
> >>      rq =3D task_rq(p);
> >> ---
> >>
> >> should be enough then?
> >
> > It is enough, but I now fear too 'broad'? :)
> >
> > Looks like dl_task_offline_migration() ends up here via set_task_cpu();
> > in that case the task was throttled and found the cpu was running on ha=
s
> > been hotplugged so it needs a new cpu at replenishment. All bandwidth
> > accouting is done by dl_task_offline_migration() itself, the task is no=
t
> > WAKING so migrate_task_rq_dl() has nothing to do and bails early
> > correctly. If we use task_on_rq_migrating() it won't bail early anymore
> > and double subtracting? Adding !p->is_blocked seems to cover this case
> > as well?
>
> Ack! '!task_on_migrating(p) && p->is_blocked' should cover all cases.
>
> That said, the way dl_task_offline_migration() migrates the throttled
> task off an offline rq is interesting :-)

Juri, K Prateek!
   Sorry to not get to participate in this while the discussion was
going on.  In the patchset I'm working up now, I've got a chance that
does call p->sched_class->migrate_task_rq() downstream of
proxy_set_task_cpu(), which partially addresses Andrea's original
concern, and I'm going to add another patch to tweak
migrate_task_rq_dl() to soften its check so we don't bail out early on
p->is_blocked && !task_on_rq_migrating(p) as suggested by you two.

Thanks so much for your review and constructive suggestions and feedback he=
re!
-john
