Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385059;
	b=Vx2xRRap/ZHYA62aVdmAdEJuH5Hbptnv9PKWaJj1JBqUdO8zdUkmtbwQIgmkmdOcdKu0
	 5xvakqde75hz1RaMiFAXDFi2Knb9Ha2oEdaB+PRn5Ujn/Apt5bZ2+IHUvW+GIbfXID8f/
	 3E4cEkCeDTkwExBwA6asoeO8q+pTAA4GjGTu4jDoTj/mlZU/tL+dkJxPRyOoyLFv56WZ3
	 j4Q5fggiEhtn2TmxLJSdwYJxWQUYP7VFvj1tMFFPcPKXPVyMJgBRwQ+JEQHSbpkUSr67D
	 DX5NOsRbmXot4Odo+Ml84eZOaJZ9ApuubKHpyL90zh3epxTsRXGOArLEiMcKWScwV8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385059;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GbeTwenuttvynFN6dIKsGFbhGCaFfBzEnbn45qh8jYo=;
	b=pF7KPLpvXs4uMe7YHwmWdUpAgCj9yGyaU17MaijuYFRoW4lReNz3iIEohHP4jJ67aFal
	 Gzv1WJ8cJQtVeETVrObMg6g/hrV9uSrBAu4DATlLpLVFw/tEahgAlXGjYI2iWR0vRSL/u
	 F30+jPnZCmtiyhTSK4I25ExD75JX9oahhOtuIVuo2GWFj3vCXmt1muDCyogqPSE5Z+iVv
	 vhxcIpE8COTtxjVc4xdF0cxst3XoRq+YmIZvJKmld7wdr9FC932icPPuNfqBMcEnSm2D2
	 SyfOGRTBF1WK18Rp237/Cc05ONGx766Rfs1pqH2pRhTvAf+XLm5rRPPSPtDp6+pjFVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OticfQ3W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1E606A681
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OticfQ3W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2117E1F000E0;
	Sun, 22 Nov 2026 22:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795385058;
	bh=GbeTwenuttvynFN6dIKsGFbhGCaFfBzEnbn45qh8jYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OticfQ3WrhflN58urUGGr588Ngpq1tfbexq/+BqJVmrHz7lFbOMmT4Cbf8s1Lu1jV
	 nezu6/SmB0U+mHxI6nigFf/AvLrNIP2vENjDQ3sP5zWM7MdG+22RAZCf/Wx4eXUDIH
	 xgUMJtdXHfqzlU+yG0ZtJQlEWf9t+2z1LJj4bhD7QeL0jw+q+DSkGoVeLyeb21n5Ki
	 SGGedxpRPcUMSd/bj+2LgLduGcFoXwn4mhIOI1bvOG42UvXrX1377cdXaL3CWIHiTc
	 yh4jE9UxioOXs0lBklO4ks/WbGhmGdHbdzletENSQOpnkoo/tQMjLuwU9pYKnSRrnX
	 LHQUklM3e8uDg==
Date: Sun, 22 Nov 2026 15:04:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [BUG] topology.c fails to build with clang-24
Message-ID: <20261122220413.GA1454934@ax162>
References: <20261121-lively-delectable-duck-f7c503-mkl@pengutronix.de>
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
In-Reply-To: <20261121-lively-delectable-duck-f7c503-mkl@pengutronix.de>

On Sat, Nov 21, 2026 at 07:41:20PM +0100, Marc Kleine-Budde wrote:
> Hello,
> 
> current Linus master commit c44104f3642d ("Merge tag
> 'drm-fixes-2026-11-21' of https://gitlab.freedesktop.org/drm/kernel")
> fails to build with Debian's clang-24 from experimental:
> 
> | $ clang-24 --version
> | Debian clang version 24.0.0 (++20261119065354+16721c9d8e82-1~exp1)
> | Target: x86_64-pc-linux-gnu
> | Thread model: posix
> | InstalledDir: /usr/lib/llvm-24/bin
> 
> Standard x86-64 defconfig compilation, with LLVM=-24.
> 
> | In file included from kernel/sched/build_utility.c:86:
> | kernel/sched/topology.c:2008:29: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced-volatile]
> |  1998 |                 .last_balance           = jiffies,
> |       |                                           ~~~~~~~
> |  1999 |                 .balance_interval       = sd_weight,
> |  2000 |
> |  2001 |                 /* 50% success rate */
> |  2002 |                 .newidle_call           = 512,
> |  2003 |                 .newidle_success        = 256,
> |  2004 |                 .newidle_ratio          = 512,
> |  2005 |                 .newidle_stamp          = now,
> |  2006 |
> |  2007 |                 .max_newidle_lb_cost    = 0,
> |  2008 |                 .last_decay_max_lb_cost = jiffies,
> |       |                                           ^
> | 1 error generated.

I sent

  https://lore.kernel.org/20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org/

for this but I am still waiting for it to be picked up (or told how to
make it acceptable if it is truly rejected).

-- 
Cheers,
Nathan
