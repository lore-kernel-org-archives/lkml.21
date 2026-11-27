Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790162;
	b=o7lT2726Qd5khnSUMSig1VoYkBOTo37I4fnL42hbUP4HQsOCHwiFFt2+NnaVkFgu84I2
	 Yka+DdmGm4hQVooJrjx0+oycJP/t4bXx7W3EcoMEPJ4TBYiB+7mJA5+soOuzkgQQW3VeR
	 WUyqDKI1U4Xg7PmUprTEixzgDAvcWPjY+Y7D5ohnCIaR27ezI/v6wtyn/YxmCYDblndEI
	 CWHktdMfbB8xIfTX59ZPNvHAiwwtmhMlt2Dt7+yC8jhbYDmcs8TSkyJGTP4r1K7kpYsB+
	 aa/IkYd4tXbLJVJO4bAKZjUXIorvrjfX3oLdeC2tmkzxApr/LcG8PHoq3aMHdl3EObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790162;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h1AojE61+j7Hu8c46cBtAoEcmrt58ic58oLtqQYdsTE=;
	b=c+IAYofH10jl7OjyiuXrD46EkL/OqoY5RyRkxxe9u2vG4XqdDrZMOxkYSXVudXnySRjb
	 x+TV4V2DDM3XRd4VuGqrNq9PpSk/iVb664P+gS4WKg6i/Jdkeo0DZCtJ9eRokz3CjTSpg
	 16Hcy4nRolKXXvaxnhBOm0GQx9hi4f0VozW1hCEiX85xbND980Qmq16FvVd14FZb3xtbg
	 /heFXDpCo1/pnbErGKXWtyxhg82so8+3zjiSazqI9iNBq4mmXNWG9hQDV7tKW4VT26dyR
	 jm+8Kg0DIdb9rxSOh6eljQ0bVpY1F0cUNW+YVswnZArwG2lbDI7GRfJzQETgtg/7ZxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iebjECQz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="YUi2NU/r";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC54606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC54606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iebjECQz;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YUi2NU/r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795790161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h1AojE61+j7Hu8c46cBtAoEcmrt58ic58oLtqQYdsTE=;
	b=iebjECQzhZRy2OVSvJ3nvWXQIqagHLRu8C4LeWag41iAgzR+sFw6AV/Q8iRtW8vbaXTAYK
	nb4y8Jv9ZhOPj0PLob7lmT5u5Gy88krbZHhkCPwi2cxWsFETOBHxCMxOSTFwf1VDKRTVqL
	nYT6YoQxzB/tZqvVX1s5b2NCZoIm648=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-HL9wX_iVNTelP0WuLmUsdw-1; Fri, 27 Nov 2026 14:35:59 +0000
X-MC-Unique: HL9wX_iVNTelP0WuLmUsdw-1
X-Mimecast-MFC-AGG-ID: HL9wX_iVNTelP0WuLmUsdw_1795790157
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e00f3929bso4693982f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795790157; x=1796394957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h1AojE61+j7Hu8c46cBtAoEcmrt58ic58oLtqQYdsTE=;
        b=YUi2NU/riWu8dJ1Bpb9ibOz1HKYRepeefZNbTqZkw8vDiy6XaYE0Aemfn8zi2tPb4I
         HKSZXwV8pLIQHNg+DDKI7yB3EzsP8tbFpydJJK3L2Kelosy+B3420ZACUkk5pCqkuyi7
         pN0MwNCfmS9LMgDmcAS8FUN0DDMOmUgQyVPqpM10dksunSa9z64wCpFon54YGzz1CTxa
         BsvCFijnBaGuXRTAY5587K1IWVL1Bi51xdJ2RjUxf5AGBHyGHTHHcTpcsuUt35IvCrcJ
         +e9zVnUjYxI10oTvOeranSXfE3nMQXPN57y+fubkQfmIomQIh9iXk+74a65MVeXJQIlN
         6+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790157; x=1796394957;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1AojE61+j7Hu8c46cBtAoEcmrt58ic58oLtqQYdsTE=;
        b=bVysXP0Y61EAEHZpqqUzebgbf5sCHryt17pwdvOdyw7No0BIFX6krw8lJRzzcpK4w2
         To8JchTpCmxYo3o+c9AgZstFsPFehXBI1DPtG3WBlzi5NmudAIQZF1TkCn3gIiZQng4M
         VK/5IHHAuHco9cRvfSExtD9aE70sEUCScihD8fE3ayc1IPPlp718tuwbPCMDRXqqO0I+
         YoqZI1CmUqSMg9sPfdJql5TnU2jOAJSHPMKLK/UHd3+r2etIlUOIzN0fsUG40jjSDloZ
         6A6EwZzFKuWqZPMKk1g57YYmdxaWOmt+fgyCZYiOVglYoXHXq6vYshBQ7EdfBm2qwpcr
         sF8g==
X-Forwarded-Encrypted: i=1; AL+hErGXw+qMOyY0w9gmf0qtsctHDRchZEBB5LfIP7i79A0CpgPgnGZev8qCpVbaw5TeUAJr7/wvJ2qV0r/rShM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YLfed4Khe3BFiCWA0k9+rAMNBRF+CGsrycpw15XRRsnTG2FMl
	hQeXVdhO/olhZ9ZQNjkkmV+U4vrjLz/2e74wYa1WgU5XD3svtwgCDdKjtTdViFjFGTkAJwyu0Eh
	DLNMJF/svjHu1+kwJ7Zk1j1vAYxg68j7u6/fAbY97iLYd8WNLtNTJIdrlltOmm7G0bQ==
X-Gm-Gg: AZFdTZfMHK/8CbVNk7h1ZSqERZwInDwlPjOqQtMD5AdP5L+oL3oDS468BZyknlU4wcZ
	/sdrU7Nd9yk0uEf42McZr3k8lXC/AhNt1ZaUJ9I6Ep7Jz1fMTPnvDfq8COgRUDxao6OrI7Lki5a
	wNE8bwnKaPVueFN7/TvsPSQx4zWrkWdeSiPXtOAe3Y4XMPQeNpCFeH/jfYqpQqX8KwwqbUYT1aO
	jPH61E5GQPWcRBkkUYRMqHkubMus+9SjP/xR9hAAJucBn9Q3Piwt1Y+DxGea9zMGQqcPjeP6oUL
	Quvd4iyXANECdPVK1kOtkbpHL9hT0vtpEw0puT76XXdCeld3fgFh/A+xmoGwMG71u8PnIxi9xAj
	FcdNEZZNZ1w1tOFfEzR73t8c9Nz7HvAz9drTf+CEbzosI7738JKrmeMTooRHkuswzxDNHyipO0t
	l0IT9q
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr478907705e9.7.1795790157272;
        Fri, 27 Nov 2026 06:35:57 -0800 (PST)
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr478906835e9.7.1795790156736;
        Fri, 27 Nov 2026 06:35:56 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.146.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm924349095e9.0.2026.11.27.06.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:35:56 -0800 (PST)
Date: Fri, 27 Nov 2026 15:35:54 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: luca abeni <luca.abeni@santannapisa.it>, Tejun Heo <tj@kernel.org>,
	Yuri Andriaccio <yurand2000@gmail.com>, bsegall@google.com,
	cgroups@vger.kernel.org, dietmar.eggemann@arm.com,
	hannes@cmpxchg.org, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	mkoutny@suse.com, rostedt@goodmis.org, vincent.guittot@linaro.org,
	vschneid@redhat.com, yuri.andriaccio@santannapisa.it
Subject: Re: [RFC PATCH v7 00/29] Hierarchical Constant Bandwidth Server
Message-ID: <awmVSkc4T0AuFntw@jlelli-thinkpadt14gen4.remote.csb>
References: <58cb2cbaf82c0f671213eaca46465cd5@kernel.org>
 <20261119151416.33f90a64@linux.fritz.box>
 <471bf8d446becabfca00041fb2a78067@kernel.org>
 <20261120120659.2e902463@linux.fritz.box>
 <6fef47e08a37079c08806b3c57994778@kernel.org>
 <20261120212418.10221f2e@linux.fritz.box>
 <06f4c157677f99fc5386dba4c9d68cd2@kernel.org>
 <20261123084345.4e24e3ca@luca64>
 <awQTy09VbrDn9RpA@jlelli-thinkpadt14gen4.remote.csb>
 <20261127114828.GS49833@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261127114828.GS49833@noisy.programming.kicks-ass.net>

Hello,

On 27/11/26 12:48, Peter Zijlstra wrote:
> On Mon, Nov 23, 2026 at 11:22:03AM +0100, Juri Lelli wrote:
> > IIUC reading your RTNS'21 paper with Stephen and Jim [1] right, those
> > are its conditions (1) and (2) for semi-partitioned systems, and
> > together they keep the system feasible. Did I get that right? The catch
> > is that the paper also needs changes to the migration logic (no throttle
> > bypass for tardy tasks, and the pushed task not counted in cpudl when
> > looking for a target) for tardiness to stay bounded, and AFAIK we don't
> > yet have that in mainline.
> > 
> > So today's DL isn't "pinned aware", but we already live with that:
> > fair/ext servers are pinned and simply added to total_bw. I don't think
> > this series should fix that too. What I'd suggest instead is:
> > 
> >  1. keep the interface per-CPU as Tejun proposed, and do admission as
> >     above (sum into total_bw plus per-CPU check). When a config is
> >     symmetric across the CPUs of a root domain, this is the same as
> >     today's uniform reservation, so it works with the current DL
> >     implementation with the same guarantees we have now;
> > 
> >  2. accept asymmetric configs too, but document that, until DL becomes
> >     aware of pinned bandwidth, they come with no tardiness guarantees
> >     for DL tasks (as with non-default fair server settings today).
> >     Once the migration side is fixed (the paper's changes, or
> >     something similar), they get the guarantees without any interface
> >     change.
> > 
> > This also avoids the cost of the max approach, where 50% on one CPU
> > takes 50% of DL capacity on all CPUs of the root domain, and it should
> > be less code, since cgroup servers would just follow the dl_server
> > accounting paths (dl_server_apply_params(), dl_server_add_bw() on
> > root domain rebuilds), but Yuri should keep me honest here. :)
> > 
> > The root entry would then just limit what cgroups can reserve per CPU,
> > on top of the above, which I think is what Tejun described.
> > 
> > Thoughts?
> 
> Still slowly working my way through all this email :/ So bear with me if
> I missed things already discussed elsewhere.
> 
> 
> So my suggestion to make all this cgroup-v2 only and couple with cpuset
> is exactly because of the bandwidth accounting. Specifically, cgroup-v2
> makes it possible to map a cgroup to a cpumask (exactly like we do in
> tg_cpus()). This in turn means we have a natural limit on the bandwidth
> consumption -- a cgroup's deadline servers will never run outside this
> mask and will thus never consume bandwidth outside of it.
> 
> Without this, you get to account every cgroup to all CPUs, which is
> incredibly pessimistic; to the point of not actually being worth it.

With entries keyed by CPU (as Tejun proposed), I think we get the same
limit without coupling: a cgroup claims bandwidth only on the CPUs it
has an entry for, so nothing is accounted on CPUs it doesn't ask for.
Coupling seems to be needed only for the form that doesn't name CPUs
(your runtime/nr_cpus), where the CPUs come from the cpuset.

> As to bandwidth accounting; I once started adding per-cpu reservations.
> Sadly I never finished it and I seem to have misplaced those patches.
> But yes, that is something that wants to be done.
> 
> I'm not sure I see how all this can function without having that TBH.
> All this runs on a giant pile of per-cpu servers; without strict per-cpu
> accounting much goes out the window.
> 
> The basic idea isn't hard either, give each CPU 100%, subtract the
> per-cpu demands and hand out the rest to the global pool. When demand
> exceeds supply, reject. The only somewhat tricky bit was that adding a
> local claim means you first have to try and lower the global supply --
> if that fails the whole thing fails.

I think that's what I was trying to describe: servers accounted in
total_bw (lowering the global supply) plus a per-CPU check on what's
pinned on each CPU. Fair/ext servers would become local claims as well,
as they are pinned too and today they are only checked against the root
domain total.

> A cgroup setting bandwidth for CPUs it cannot reach -- fine; the value
> will not be used. If the cgroup is grown (through cpusets) to include
> such a CPU, it will enact such a value, and if bandwidth reservation
> so demands, block the cpuset mask extension.

IIUC this is close to what Tejun suggested for offline CPUs (the entry
stays configured and takes effect again when the CPU comes back). The
question I see is what happens when the cpuset changes under existing
entries (cpuset is often managed by someone else, and a sibling
partition or hotplug can move CPUs too). Either the entry's bandwidth
stays claimed while its CPU is unreachable, so cpuset changes never
fail but that bandwidth sits unused, or it's released and claimed again
when the CPU becomes reachable, which means growing a cpuset can fail
because of the cpu controller. Tejun, Peter, does either work for both
of you?

> As to the whole max thing; am I understanding things right if I say this
> means the cgroup itself will not have a constraint? I saw talk about one
> cgroup having mixed constaint and no constraint CPUs? That's crazy talk
> and makes absolutely no sense. Please don't support this.
> 
> Either a cgroup has a constraint or it does not.

AFAIU, "max" means the cgroup has no servers of its own on that CPU, and
its tasks are served by the nearest ancestor that has an entry there
(or run as plain FIFO/RR if none has).

I tried to come up with (forge :) an example where mixing is useful in
[1]. The gist is delegation: a container P runs a single RT process,
with critical threads in P/crit (cpuset 4-10) and other FIFO threads in
P/noncrit (cpuset 0-3). The admin wants to cap what the container can
reserve, so the cap goes on P (P/crit's file is the container's to
write). The cap needs to cover CPUs 4-10 only: with entries on 0-3 as
well, P/noncrit would be served by P there, and its threads would either
not run at all (zero) or use a reservation they don't need. cpuset keeps
the two sets apart, so no task moves between a server and the root
runqueue. Luca's follow-up [2] is about doing it without mixing (budget
only on P/crit), which works if the admin configures the whole tree, but
not when P is delegated [3]. Admittedly, I'm still not sure why one
would want to run noncrit w/o a cap, as crit stuff might depend on
noncrit, so happy to be convinced this is actually useful for real. :)

1 - https://lore.kernel.org/all/awfe_r5McCTzr84x@jlelli-thinkpadt14gen4.remote.csb/
2 - https://lore.kernel.org/all/20261126155736.20e64e65@linux.fritz.box/
3 - https://lore.kernel.org/all/awhfdTbfDhpklaTN@jlelli-thinkpadt14gen4.remote.csb/

