Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190850;
	b=yfhYC6ozgdL7Pi9JnlcaSc3fWm3H1hAouetVt2vGdgFDrM/dTJQAgK4/xDZ8+JjVmnbP
	 5JIvSEUkyXqjopkinEdyGE179MYqdZE3qflvdhbw6tQvvC8rEfaZXbkM8p59mzqH9a82K
	 w4aK42zx/XIcINWkLXQuS1a7Am33xPFwSbwhaKuU03XdGsgzKgBvBPUApwi8qoXD6XLMD
	 kqlQF7X2unC4jkdG3vn8IHTYrBRqWD76rBeQW28yAlZm6ag9Tja1MQzXSpV2slyqmhCmL
	 pCi75Yvnqp7UeZ8jcGMXXcSU2o+YlQa0O/5naS1rbqhjfClK3V/UdOfH6wNy8R7fmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190850;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DSoDSKmnZ/wdtbN8f5BTziBY7icX60tf6nSq2u0pRPE=;
	b=Gny3TJ/vVaMLmKJyzEPFRRFJRJfmds0g1SU/2TsgvK4ox95oEo67jM285xWAJbBfPBlM
	 9xvHIbeLkzHJyLRpp1fUhtYnxOoxaiziregAGrm+yuOpvI0T1iEVJl/3J26K60KemIfj9
	 cWZAUnpZ/+zGmWIHq5C8bQIsoINxW6yFMBQYLv1yVctJjKCEQc6f+FIoF9CX08QHJ/5aR
	 McF+/P16ECLQ/C2HP41/WinwfpHSSTUebXF/VvcQyc/uNSRSB2mfA+PAZqokNlal7Q4rk
	 EqDyTEEovNTrfEIwedDB3dKeYIp22ehMmLgxex6MExzF1KptItNdnbat8fefH7tIemA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hl8o8j9S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2688606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hl8o8j9S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1066C1F000EB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190850;
	bh=DSoDSKmnZ/wdtbN8f5BTziBY7icX60tf6nSq2u0pRPE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hl8o8j9SX4fS3/4g0U9SSVDWI4a+jSWasD3SFFWYLn1PhmJR0H04O7BS2LMfDEQkf
	 el5BitvRyUgLaki0Ef4KKOEhqKdzbaxVhmTDElNYfkGSIII2Aie1olIRw4vSvwXm35
	 EU9IEQ2fKrGlGsZ5SMlXUu4ehrBW/+15fZbjGb3tKlMDU3ElYnzRnk9Q0Ib153p88C
	 teeb+5VT39SFDq97hOLpNQ4rQhhcb5+wfP3mw3fJwSTaQHGL0isJeW2Mg0GbBNYcGX
	 ZkyvaJJmhBo7OQTFwqdMItJhutIiBWeQnYzDUwzC5dVcSe1ilI3H7NkbJXQR5ZWKBK
	 sO0gAfhTRQWBA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso714184e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:07:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFJrd8KB0r51DBJF5qInFS216+MdzIuIoPfdFHBdrigEaBsMn7HFJdSBXkcR+d39mPfWmNbRS6UFc0HP0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z86UWPOpZxdOFDzsnU4cCN2Q4tgMJTFft1BzQORicFF5RDjTRXo
	NLifrjEAlJd0ZhvipwBvrtzmDYfeRNzK/R1bxJ/tLuW8NZ3xlAVbBDhK/ASkT+rdnHTBsHiD4IJ
	lVhbhliBk5kFZUXeLs9OWxVWpfRPrxLY=
X-Received: by 2002:a05:6512:6602:b0:5bf:bd7e:197a with SMTP id
 2adb3069b0e04-5c1bc8488c3mr1018881e87.16.1795190848325; Fri, 20 Nov 2026
 08:07:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108145028.2483131-2-thnkslprpt@gmail.com> <CAKfTPtD5vLv_wqfGxVB7kEFDQmB6BQDTvJRGLkHXNZ3d0GHuOg@mail.gmail.com>
In-Reply-To: <CAKfTPtD5vLv_wqfGxVB7kEFDQmB6BQDTvJRGLkHXNZ3d0GHuOg@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 17:07:13 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hn=vO_3Z07p0vf6j+XmF2RQJ19pGwsTwbCkkmQ8gaNow@mail.gmail.com>
X-Gm-Features: Aa3M54rxB6zdVFiahCV7PF3SFDbV3bRDLKf3AI81jweJmWVXHkK_2DFII5eyNEA
Message-ID: <CAJZ5v0hn=vO_3Z07p0vf6j+XmF2RQJ19pGwsTwbCkkmQ8gaNow@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: schedutil: Skip busy-CPU hold when NOHZ is inactive
To: Vincent Guittot <vincent.guittot@linaro.org>, Avi Weiss <thnkslprpt@gmail.com>, 
	Christian Loehle <christian.loehle@arm.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: viresh.kumar@linaro.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, zhanxusheng1024@gmail.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:52=E2=80=AFAM Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Sun, 8 Nov 2026 at 15:50, Avi Weiss <thnkslprpt@gmail.com> wrote:
> >
> > sugov_hold_freq() uses the NOHZ idle-call counter to determine whether
> > a CPU has been idle recently. When NOHZ is disabled or fails to
> > activate, the counter does not advance, causing schedutil to treat
> > the CPU as continuously busy and potentially prevent frequency
> > reductions.
> >
> > Skip the busy-CPU hold when tick_nohz_is_active() is false. This
> > also handles systems where NOHZ was enabled but never activated.
> >
> > Fixes: b7eaf1aab9f8 ("cpufreq: schedutil: Avoid reducing frequency of b=
usy CPUs prematurely")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

Applied as 7.5 material, thanks!

> > ---
> > v2:
> > - use tick_nohz_is_active() instead of tick_nohz_enabled to also
> >   handle NOHZ enabled but never activated, as suggested by Zhan Xusheng
> >
> >  kernel/sched/cpufreq_schedutil.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_sc=
hedutil.c
> > index 14405a614991..50249cc1a594 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -397,6 +397,9 @@ static bool sugov_hold_freq(struct sugov_cpu *sg_cp=
u)
> >         if (uclamp_rq_is_capped(cpu_rq(sg_cpu->cpu)))
> >                 return false;
> >
> > +       if (!tick_nohz_is_active())
> > +               return false;
> > +
> >         /*
> >          * Maintain the frequency if the CPU has not been idle recently=
, as
> >          * reduction is likely to be premature.
> >
> > base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
> > --
> > 2.43.0
> >
