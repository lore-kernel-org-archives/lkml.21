Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519196;
	b=YPdUOLsJvhayCLwOkQwe0T+iFZuOgkrxmrBSXpACwA8jK2lMuhVBy3hj06qgiSH9dTs2
	 B2qnW/98qscw6gM1RuBodMnZj/IXZzKrPFqnR+x43q8gGspEL3LMw5vIluabuzv2f0YeM
	 Wqu3tylYpP3aCAKbbYgnPewu27R9IiiJRkojcD59ssdCcBpfIDU4bxf7lDuSGFZeNokYl
	 45ExzbueNmgI7jAVOG9ophXNqfuK1RLsQFVyhQBkbM7IwGfQkob/KyxrzV8LwvlnvGI5E
	 ci8M89FfLK4T1VkM6SpgRJs8xHxf3tcoeEzekEpTftx8NFx0ZmJgmnFPYEH7dQ8CRfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519196;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=52AOWqR9iMrDuAzfPPxARFOq4ANhhTpjk+r/H5n7QCs=;
	b=D8amkeq+kH2pg6heFwiQ4rwtyJOlKlTih6koj+hc2JDIohXAfKU7dtanK1KHSyntvQ69
	 yzi2Ajyt42+gQmYI32nEVrYrO2pIlLb41Hffyz4gx0S5PwIjGK2n9uKWB4GC8Vm9Es1kS
	 jDYLwUVOmb8y0Z7f2Z1vSqNAG/TCZ7gQTZXqtZDNKrhGiKOksTUye3a+Tkenrxik9+SLX
	 LUZ4il/cNiuxsSvpg3UIIx26p7YtCoUiXLTOnr0Tb2IY/Ra2ATUDyqRHpyEq5rsqIom+7
	 CFR06KTBYgmksnDlDDi+RaoXzDem8Qq4WbAGO0oNX2ZjigyvoTDRwzDppKvKovaCMLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oTmmbHXg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B128D606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B128D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oTmmbHXg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54FB5497;
	Tue, 24 Nov 2026 03:19:52 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34CB63F882;
	Tue, 24 Nov 2026 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795519195; bh=jNf++x9/Q1VkngX1TH6ZhRMeNG1gijaFcYP6roGSwpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTmmbHXgOg9cZ7LmnCfmlcZV5uxlPC2yh2ehMVkDJzY+t4Kj73YNzlu31NnARsXIH
	 GefjXTHtK/vvM3rCPD9AGNGowHiKxt0DtZhCN3HLXWw3+DudGkj/U3cwMpvrlIYeAw
	 0z/N9kprHBqyInhxQ47zWDOjHiyhBdwI3FrXASA4=
Date: Tue, 24 Nov 2026 11:19:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] arm64: cpufeature: Track BBML3 exclusions with
 erratum options
Message-ID: <awVy1ybf70OgllXN@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-6-ryan.roberts@arm.com>
 <av3neu-9VTv8RgeY@arm.com>
 <7f466d97-64f4-4b63-ad78-fef11bbbb919@arm.com>
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
In-Reply-To: <7f466d97-64f4-4b63-ad78-fef11bbbb919@arm.com>

On Sun, Nov 22, 2026 at 09:08:05AM +0000, Ryan Roberts wrote:
> On 18/11/2026 17:59, Catalin Marinas wrote:
> > On Fri, Nov 13, 2026 at 02:50:19PM +0000, Ryan Roberts wrote:
> >> Several CPUs implementing the BBML3 no-abort semantics advertise only
> >> BBML2, but cannot safely use those semantics because of hardware errata.
> >> Omitting their MIDRs from the allow list hides the reason for the
> >> exclusion and makes the relevant workarounds difficult to track.
> >>
> >> Add a default-enabled Kconfig option for each of the following errata,
> >> and include the affected CPUs in the BBML3 allow list only when the
> >> corresponding workaround is disabled:
> >>
> >>   3043240  Cortex-X925
> >>   3043263  Cortex-X4
> >>   3053180  Neoverse-V3 and Neoverse-V3AE
> >>   3683289  C1-Ultra and C1-Premium
> >>   3696239  Cortex-X3
> >>   3696242  Neoverse-V2
> >>   3696244  Cortex-A710 and Cortex-X2
> >>   3696250  Neoverse-N2
> >>   3696285  Neoverse-V1
> >>   4196850  C2-Ultra
> > 
> > I'm not sure what the benefit of this is. These CPUs are not listed in
> > the BBML3 capable list anyway, so the patch adds them but gated by a
> > Kconfig option, default y. Is it only an elaborate way to tell people
> > why we couldn't enable BBML3 support for them? Maybe the documentation
> > part is sufficient.
> 
> I'm just trying to make it very clear why certain CPUs are not in the list. With
> the exception of A510, in general, Arm-designed CPUs that advertise BBML2 are
> also BBML3 compliant and should therefore be in this list. But some of the CPUs
> have BBML2 errata which prevent them from being in the list.
> 
> The information is all very scattered internally, and I've personally had to do
> the exercise 3 times now, of figuring out which CPUs are excluded from the list
> because they haven't been added yet vs which are excluded because of an erratum.
> 
> Perhaps it would be simpler just to create a file in Documentation/arch/arm64 to
> track this and add a comment next to the midr list referring to it? I don't mind
> how we do it, but I do think it's valuable to capture the info somehow.

I agree it's worth recording. I'd just put a comment above
supports_bbml3_list[] listing the excluded CPUs with their erratum
numbers and keep the N/A entries in silicon-errata.rst (as you did in
patches 1 and 2). The errata is the same, live-lock, so you might as
well include that in the comment.

The Kconfig options don't add much. These CPUs have never been in the
list, so the only thing =n does is enable BBML3 on hardware with an open
erratum.

-- 
Catalin
