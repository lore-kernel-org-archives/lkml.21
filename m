Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540990;
	b=QSxmyq07i1Zpkl0fcBFETtNH7hJ2iEcMUz0ELzObYVoH0i2Kod9+zvu9RXnVsJKnoL1Z
	 RK1ZL6oez/BnHqdXlszDZkf5Hhj9NGbnq4ErqW+7UoFGv17YYv+cwL1ooD8dDz3a9JV+O
	 EKQGKqTd2+tYto6PKMch7EJ4N5tEsuXUQ8lPC40xTIxq3zoV34uLUCdllNBngMlfRTsCE
	 BSVLd7tZDrodMH8GlJxV+HQ/k/RK9aaXE5jBOPUrLTTaa5Gsosv2VLfdNqjOg1FFXhygS
	 BkuqyHpbqiCFarikHct902NI31i7ZPi+84q4UbyzFkHNb44vnNNid1MCZoazil6UK/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540990;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ISLuAv+WyTAin19m+4GFCxS3knd9KXbnCR1jZVMEmIk=;
	b=A8xBYpksxUg37J57RJj/97KIGd1pU4wFCwS3V0DIJjVnP87iFVdrJGK5+igYfAR9zNBs
	 IQf7eWPlr1+GNyrZqsY6supyUEEwDTcTVJp+M/kNyceOG8gQxcqu5scR70p/Slzojb6pe
	 dnmnoKeblI7tp/sb2yOEVs0VxuMZYbcnM3bDJ4x4VwWjmSmtiu8BafiNR5Uiws/m7cS2w
	 OypkRn38UVxsV2nDTR5im71voG8hu9Px9Z446oMntiNjA43+hPY7LB39pC9o9AGOhplTH
	 9waX7349juMHKkQ9SSt85jsBnYmhj1TTuaBkuBfienUe8GnY+d6EDEInTDw6cPcSBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q3hqHcR6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66137606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q3hqHcR6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5869D1F000CA;
	Tue, 24 Nov 2026 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540990;
	bh=ISLuAv+WyTAin19m+4GFCxS3knd9KXbnCR1jZVMEmIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q3hqHcR6IyvIp3CIR96l6pe8MvRJ3w0NF8ApqhHrGE5UhwGDcSCGwCPTwfhhV/DUn
	 cycehnC4syzJ5mQmbeQkV58eWYwLaK/bb2aU5siZBLS+qPiyEboe9O4tXe29PGjViE
	 yVSpXf5NEOGWEB4Tf5JIPNBzsGB/0Ai564nTTb4DoLO2HprRIb3TrUEFDe5ks6Q5D6
	 QVSjYu/XiMzGTQ31qeoa96QytvhqZgKqFPEqOTvAve95oyvpE2zIrPHyM8qurkaCFh
	 umTXf2tiIA/CQzLCtUNK1NRmuDUDVUOHzFNPg1b7+sINbpues4iksrmE8TEDclplbg
	 ++ZFYLW4FcLiw==
Date: Tue, 24 Nov 2026 18:23:04 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
Message-ID: <awXH-Is5s6eqx8mT@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
 <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
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
In-Reply-To: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>

On Thu, Nov 19, 2026 at 12:00:15PM +0000, Fuad Tabba wrote:
> Hi Sascha,
> 
> On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
> <sascha.bischoff@arm.com> wrote:
> [...]
> > diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> [...]
> > @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
> >          if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
> >                  return 0;
> >
> > +        /* A previous map timed out; do not overwrite its pending L1 entry. */
> > +        if (READ_ONCE(l1ist[index]))
> > +                return -EBUSY;
> 
> Sashiko's review [1] didn't go on the list, in case you missed it.
> Sashiko found that l1ist[index] is read twice, and that on a
> non-coherent IRS a map completing after the timeout leaves a stale
> copy of the L1 entry in the cache for later allocations. Invalidating
> the entry before it's first read would fix the latter. Invalidating it
> on the timeout path wouldn't, since a later read can refill the line
> before the map completes.
> 
> With those fixed:
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> [1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com

Hi Sascha,

I am taking some time to revamp the current approach because as a fix
it is getting complicated and there are corner cases that I don't think
are fully covered.

I suggest we drop this patch from this series for now so that it does
not hold off the other patches that I believe are ready to be merged
with very minor tweaks.

Thanks,
Lorenzo
