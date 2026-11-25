Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616880;
	b=dFTOTt6YwW0cnzdptp+Kcqz2q9qR5i13wIRGjSsQ/gUPCfnCXFqCY5+wJLR8w9Vl2YLE
	 pZtK8ET6uwvPfU1eiMiKiHQ2xuM627HHdSmistOcAJhP8lcNmsrw4ZWwz5hTaaSesHRzw
	 fA0Reb2ZIQhKtNtnfMU1wvcc5PnHcH8skkDMJ2O7uc12HM+9kdBu3t+W/5d/r5ZeSHwST
	 DdBVzc9NQVsrcmvucpnlGztvMV/a9WF+xIwhHWLf8aA4dMZ9uKrEdGvoIjYJCzjyk5q0R
	 vDTXe5iJVf+1BMZI8nBIjUD1m5GA6p2h/fB/NY0OzHCRcdoy46CnSxsUMxoT7S8fUQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fwFNmmqHFdJGPqkpWLh/ZhIKe/QTslhBxWmeXEZ8bg8=;
	b=afYpSVV1cnkO6gkkxiCXTKdi5tvL48wxrYb6A+Lxd8i6v5QYioMIHlDmowu9QWpjoec/
	 KNFXa49iIy+xlYHn8WginEbxVKujM3F84379CQamF0GsP70T9Y5CqHqQPvbyQyh7Yo1Ia
	 AC0zgEZIkBZDfxNL/lU6xb6FiVOAnJSppLZg2xoUv+60NWv5i9ixQYZaA/AQ8nSVSCyDt
	 gDfVtSbwh8aylhjvy9IuK59zLYTZowo3InPJ+Q4hf1W0+GToz4GXuV98FXEACROF3dvQj
	 GjO9sK1USz14vz2rCuo+36VQRGqgn7Buzx8ndNyw6EwlpPa7ZWvANuoteigwzdy02/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qpOEYbT1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FE7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FE7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qpOEYbT1
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso7589539a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:27:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616878; cv=none;
        d=google.com; s=arc-20260327;
        b=GxMcDI92/jrf4/XmKEHWQ5WPiJvHlYyS+dEpKPSb8uu2fJDWUJzW8TsJuUkMWPm5UN
         9L40okRggiuthLVaxXMtPXYPLSEx2UxQIV5iH7TlyW7Yfp1CP5qdT6WWt42KXYuX/cZA
         SSxuoDnvG/zNpJ7z2X+vua0qWlm9oUDoULjWwza4M3SUs25YmKHDBL65ufLfIHLiqhAO
         DfxdyX/k1uKK8BfQfeqAa1zbC6C8sG08lEB1TsuEgXZWBz2dhtSoj86A+r8vNQQ4cvKt
         xN6WJHQfvERNILlGuD9Di9n4WP6RBiBIRRWpXqI1BjsGIh6OmODWK76IjOjsKeCpwArC
         if5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fwFNmmqHFdJGPqkpWLh/ZhIKe/QTslhBxWmeXEZ8bg8=;
        fh=68NkoEJrRm5C0kyH+fXVVaEd7iG2g+HKm0w1lEOb5oM=;
        b=FsvQylWDTL1c5K77I0INI5dNvUYa2pYkcR8pFFMDz6wuRMZQnNFaTjGMPv2tpDLe0g
         iqdF9JH60gJCoWNAN3FRgx0prUYrbNo9VizMN1g/U2XRAwwopAZwaSwCMRVkR2gYDhNt
         zFL/umEroW3stvAJ1ssIux6630Zob6i+mCEqwHSyPols5gDzeInuO+oKVXpZg2X1iJmi
         Sm9RTMRcRGYRFruMWuY3JOM7aITJvLaKaGbeYnlpHKs2c8hGnTG2ZAtOIqN3Xs4phtjd
         z8RwLMBki/KPgmdzjmWLeW/VJ/xemUUJcTRigQQTBjqBsaLtW2+EwvwsSlGPvLZIakMH
         Q0Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616878; x=1796221678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwFNmmqHFdJGPqkpWLh/ZhIKe/QTslhBxWmeXEZ8bg8=;
        b=qpOEYbT1GsEwHd5QuTl9Y3eg517qKEQCf06fa3Nm8bt4vg5KUwFNGZB/XNto0SGrTj
         Z6VMeizciRA6VeQpUrgHqiVYE9dnH6t2/34KBXn9qBCnukUSBhm6TxLIX9mXvi909ULG
         H2kzrSL/ceRwBiuKlS2UsTDM0y0Ht3hNalkZ7D5iLEw8SN+LyPVdd2sdUmesRQQBR7Ts
         iTLcEh7BWK5UjYh2hnN1S4Gk2IuGjr36xR+MwJP+2nmMZOWMkP/wBr1EJJ+au6TRE2LC
         /pp6w/XoGujqAIzI0XUxQ55jaOpQnFtQE8ndj991C/gyzrDZ8VykNY6SL/Gt0fHCLMuN
         ZToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616878; x=1796221678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwFNmmqHFdJGPqkpWLh/ZhIKe/QTslhBxWmeXEZ8bg8=;
        b=qnQvikamYG8j/b8dv9fNs1HKJ8fl0ip3dOZuxWOux8Z3svdqekLzlsr5wg8peTI6gK
         1A4o8t8I5EfGs4x/yaIE/e26i1aATeARKOHfC2MWXCqK1Tx61a2jaukKCCqSXbN/P2An
         6uH93+i/f5h+A7CxW75Y9H7VSHkA0Yz25aG69eCYQyXLZ1FUKVLlvO1rJyuFc4Wb5kfR
         P9h0UPDgQxkV4lumylVR5YTWYnwqKEG5OTQzWRwyzsBZDfLM9bEtllk4E8DsfBz04pzo
         9OjUgdEGY5Jw8KE+tsqjLUSfUkds4s4fW82HULMQn/4OGuKjowNKuXEsQeHpUfGk8Nq6
         s/4Q==
X-Forwarded-Encrypted: i=1; AL+hErGr5hiAfbOd6sOW2Wl2xWFtvVDMVIJgQeyRMu00B2Y1//SdrKc76YMSrQXmUs5Mck0Uvl9gvHWFz61YNdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BMmDnULsX2qbKy3M7OXrWsqxE0tCp6xXk7FRE/K50RTe81TUX
	bgxWq2LKXIqnmDazUv+ylfSj7KpvWu6BZAsif1cDkveJ98skWmvk4rMH9EwklBflL2msmcYpBSU
	PJtp1dsnzysLhjlMzSp5F1D+VNb6twxSdV0txJIcfRg==
X-Gm-Gg: AZFdTZfaLIYEHCuvGcXs1oaloXvklosFbwHQA35/QXYOEr7VFWarUurerjFU2HcJcOy
	LWj6fB/NJiEXizftXmm9Axy/BG+lqpE/QEmCtpIjepZuK60Ec7QjLUdoK1qNzXYTvykbb6AdZay
	8gtN/eEonsrFc9OUWlVWJdTlhtATrVovFawmwg+53urk0LAn4xruuQWpkvv3RpbIETohsPC8WVk
	YWoG7JPeWoncGGTYV6OCALutHuizN0Ekfwnq9wbv89CrCKMTKsdPUSK9Ql9fU34zmYHtcMTdU0z
	nlKfn4HhFIcdU/xPwi7Aehuey0DNcUspVBJY34MyoCCKDsqsrj03ceugWME8OGG1h0BNEM4Q38A
	R4x38QhbigQYvnxE9sSe9chcZb0lIb7WgzJEbbXTiyCqyH4wEFOqBhKZNl4BvxtZgD1g=
X-Received: by 2002:aa7:c0c8:0:b0:6b9:278a:99f4 with SMTP id
 4fb4d7f45d1cf-6ba37d5bcd8mr9687220a12.10.1795616878262; Wed, 25 Nov 2026
 06:27:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <awWOCejxtjP12xFX@gpd4> <ce38fb8b-94d7-48ba-93bb-3b72cfcb3e61@amd.com>
 <CAKfTPtCudy4NV8sU+JWE=dcJpbKd+LVNZPZztU_0nD1a04Ca9g@mail.gmail.com> <awa3/FFd4hAnvtxK@chenyu-dev>
In-Reply-To: <awa3/FFd4hAnvtxK@chenyu-dev>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 25 Nov 2026 15:27:46 +0100
X-Gm-Features: Aa3M54rachJXiDJ8VfxTvr61OZZ2Zz0KFPkvA1XBk06MhqgBL0PowFoN8vp5YmE
Message-ID: <CAKfTPtCukFOD6nKD6oDYvjEiXXUY5fHui4w6fgnhNw+jpE=0RA@mail.gmail.com>
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
To: Chen Yu <yu.c.chen@intel.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Andrea Righi <arighi@nvidia.com>, 
	James Buck <jbuck2005.linux@outlook.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Usama Arif <usama.arif@linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Nov 2026 at 11:38, Chen Yu <yu.c.chen@intel.com> wrote:
>
> On Wed, Nov 25, 2026 at 08:51:39AM +0100, Vincent Guittot wrote:
> > On Wed, 25 Nov 2026 at 03:53, K Prateek Nayak <kprateek.nayak@amd.com> =
wrote:
> > >
> > > Hello Andrea,
> > >
> > > On 11/24/2026 6:45 PM, Andrea Righi wrote:
> > > > Hi James,
> > > >
> > > > On Tue, Nov 24, 2026 at 11:56:52AM +0000, James Buck wrote:
> > > >> Hi,
> > > >>
> > > >> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to se=
lect_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my =
big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because=
 waking threads are placed on idle little CPUs while idle big CPUs are neve=
r looked at.
> > > >>
> > > >> Turning SIS_UTIL off at runtime restores the old speed. select_idl=
e_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I exp=
ect mainline to behave the same.
> > > >
> > > > A related regression from the same commit was reported by Usama her=
e:
> > > > https://lore.kernel.org/r/20261113153157.2495664-1-usama.arif@linux=
.dev/
> > > >
> > > > On Grace, a zero SIS_UTIL budget skips the search despite suitable =
CPUs
> > > > being idle. Your case shows that a nonzero budget can stop the scan
> > > > before reaching an idle big CPU.
> > > >
> > > > We've discussed a minimum scan budget and accounting for idle CPU
> > > > availability, though a small minimum alone may not fix your case.
> > >
> > > This had problems in the past when Chenyu was iterating on SIS_UTIL
> > > where the search opportunity at higher utilization is actually very
> > > low and cutting off search for !idle core was beneficial for SMT
> > > systems.
> > >
> > > Now, for systems without SMT, it has its benefits too but a system
> > > without SMT should be equivalent to a SMT one where test_idle_core()
> > > returns true always if an idle CPU is present.
> > >
> > > So I'm wondering if {set,test}_idle_cores() can be extended !SMT
> > > to act like a gating indicator to say if an idle core exists or
> > > not much like how !get_rd_overloaded(this_rq->rd) serves as a
> > > gate for newidle balance - it can be flipped to true when a CPU
> > > goes idle or if load balancer sees an idle CPU. Thoughts?
> >
> > I tested idle_cores tracking for !SMT and EAS months ago [1]
> > [1] https://lore.kernel.org/all/20251202181242.1536213-6-vincent.guitto=
t@linaro.org/
> >
> > >
> > > > Given both reports, reverting the commit seems the safest thing to =
do
> > > > for now. That would restore the previous asym search behavior and w=
e can
> > > > revisit a better consistent strategy to cover both sym and asym CPU
> > > > selection later.
> > > >
> > > > Prateek, Vincent, what do you think?
> > >
> > > IMO it still makes sense for SMT systems since capacity on systems
> > > with SMT only makes sense if the entire core is idle and then it is
> > > just a best effort thing right?
> > >
> > > set_idle_cores(), would flip the flag as soon as an idle core is
> > > available and after that SIS_UTIL is bypassed. I don't think the
> > > SIS_UTIL cut-off for non-SMT ASYM_CAPACITY systems makes that much
> > > sense given misfit penalty is much higher.
> >
> > In fact that depends on the number of CPUs in your LLC.
> > The current SIS_UTIL is unfair for small system because you skip the
> > loop with "low" utilization:
> > - with 12 cores per LLC, you skip the loop if the avg utilization per
> > cpu is above 839 whereas it also means that you have the compute
> > capacity of more than 2 CPUs that is not used and util_est can worse
> > the situation
> > - but with 64 cores LLC, you still tries 5 CPUs for the same avg
> > utilization per CPU
> > - and with 12864 cores LLC, it's 10 CPUs
> >
> >
>
> As you suggested in [1], maybe we can give a floor value of 3 when has_id=
le_core
> is true both for SMT and !SMT case(mainly for nr_scan =3D 0 case). Beside=
s, we can
> scale up the number of CPUs to be scanned by their llc_weight, to fake
> a 32 CPUs LLC for the small LLC system, this should mitigate
> the issue of current report and the issue reported at [1].

This fixes the regression on my radxa O6 by keeping nr_idle_scan full
for llc smaller than 32 CPUs while the avg utilization per CPU is
below ~550

>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da0d9e19c457..1c0e2ac7751d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *e=
nv,
>         y =3D SCHED_CAPACITY_SCALE - tmp;
>
>         /* equation [2] */
> -       y *=3D llc_weight;
> +       y *=3D max(llc_weight, 32);
>         do_div(y, SCHED_CAPACITY_SCALE);
> +       y =3D min_t(u64, y, llc_weight);
>         if ((int)y !=3D sd_share->nr_idle_scan)
>                 WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
>  }
> --
> 2.25.1
>
> [1] https://lore.kernel.org/all/CAKfTPtDVqKyQ491MdUr2RbGmJ9ivofiiX7D7Xd-S=
h2F0NLFmRw@mail.gmail.com/
> > >
> > > --
> > > Thanks and Regards,
> > > Prateek
> > >
