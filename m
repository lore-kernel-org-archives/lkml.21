Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804925;
	b=n5evVXhUgiMpluhujDnXOxgPXwT8RD/D8oNIg3WkAFZRjjUl4UJjVGOL+Jr7abn90rgi
	 /atuO0sKAWROaChcEgEYAkA48yFuJOMyPsHzZ1oOP3Ss6lwa+PpcPGgLvbRGqLrjihkbJ
	 j15Q/ERN8DzzkOSPgKSd+OcHYVjFNfAOA06t0tjI5WSO39RlppdvK6UR41aQyT8amM6pe
	 It31jY8N8VY6bAAl9zqz97ddRZlEo5ZGF/ix9PhTARmE2qmacrBKhpLEh7go0udZp2UhY
	 51eFjGMF6BujavwxO2erH3C9WECHzsgc4hPG+gFEdvI5MvaE3GfGxsE33polHRnNX8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804925;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mQxZgNKSkFZULeyLBw2vkd1drkBFs/zA2t0nGqWgQgc=;
	b=vB3Pc0pv7sQLJzu6p5SmNte/AJ1woFx56EJoOYm7957SKsf0Ckm1f4X9/Og/J3LVzIg7
	 JQfLICA9SA88f3T4BBgkUozy9XfIuguU0xy5gqQ83KWvHMWQzffqcrSk4ZW42fbg+SG32
	 a+SsEfDHmYZH+sFAwAJTFkNM5ZJv137maYdvuFjoVnOPkIeEqBC6wRNgYywMEgsSx085C
	 nAiTztD6ohoYrB9nmsKL6I7Rf5Wk/zJDawuroSMOX+WFFPdT+Jjou8wHiXehx/+AIaH5X
	 mNPkMAINfGseaXbYuvcO40v0Yfj80D7UYzdf26vHTtddG1Och65KiTMJRqc02ysFn1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XYj/5aIK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4755606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XYj/5aIK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066D51F000C1;
	Fri, 27 Nov 2026 18:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804925;
	bh=mQxZgNKSkFZULeyLBw2vkd1drkBFs/zA2t0nGqWgQgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XYj/5aIKNje6JqthDkZWWZV2dFVOaTWo1mSJQvN9E+Qg0p+X3ARO8tlqC+MYAkTYm
	 KvWle6r2yvC2Iy494gl4yy8yDy3A+r3GwKtjZl0cvybwme6L9vtdCywKy7Af1u9Vwo
	 p33FGVv0tnWC1iKGIJOSN2YesWiXpjdqxKB443FdN2G7fla33C8dVgiddJPGDvUSQF
	 Yax+2rZzmXJcpcHok+Th0zG2l+NT4Gh8GDrgRbmPt3CXGzqihILzDN++VcUPDSrg5N
	 rgh5FdVYHzW/YypwsyyvBfzGjMl/iKi5JlA4XclsWoxBkZ+gVy5HvLBYI9WCl+gQQm
	 drkcRuf7RSTCA==
Date: Fri, 27 Nov 2026 18:42:00 +0000
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, leo.bras@arm.com
Subject: Re: [PATCH RESEND] arm64: sleep: factor sleep_save_stash slot lookup
 into a macro
Message-ID: <awnO-FqQDd97ydiP@willie-the-truck>
References: <20260919121044.13883-1-brads@mainlining.org>
 <29F5ED22-7DB5-4AF9-B999-CB3BAAB9A9E2@mainlining.org>
 <6376e301-c6ef-4094-83de-83ea9d17791a@arm.com>
 <2442108F-EE55-40AB-A33C-DEFE0364F704@mainlining.org>
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
In-Reply-To: <2442108F-EE55-40AB-A33C-DEFE0364F704@mainlining.org>

On Wed, Oct 07, 2026 at 03:57:35PM +0100, Bradley Morgan wrote:
> On 7 October 2026 07:45:18 BST, Vladimir Murzin <vladimir.murzin@arm.com>
> wrote:
> >On 10/4/26 14:05, Bradley Morgan wrote:
> >> On 19 September 2026 13:10:44 BST, Bradley Morgan <brads@mainlining.org>
> >> wrote:
> >>> Both __cpu_suspend_enter() and _cpu_resume() open code the same
> >>> MPIDR_EL1 hash lookup to find the current CPU's slot in
> >>> sleep_save_stash. Factor it into a get_sleep_stash_slot
> >>> macro.
> >>>
> >>> Since that macro would be the only remaining user of
> >>> compute_mpidr_hash, inline the hash computation into
> >>> get_sleep_stash_slot and just remove compute_mpidr_hash
> >>> altogether.
> >> +CC more people, polite ping on this patch guys! :)
> >> 
> >
> >I'm not sure it makes the code clearer:
> >
> >- I see that Will suggested inlining compute_mpidr_hash, but to
> >  my taste, a dedicated helper is easier to comprehend.
> 
> Hmm... It's a bit 50/50 to me.
> 
> >
> >- The new get_sleep_stash_slot uses a mix of fixed and
> >  parameterised registers, which forces the reader to look at how
> >  the registers are used. Also using fixed registers shifts the
> >  burden of making them available to the user of the macro.
> 
> Well, will, any justification?
> 
> The macro at the moment only has one user, so it's pointless to account
> forusers at the moment..

I tend to agree. This macro is private to sleep.S, which is already
doing unholy things with the CPU registers and I don't think named
register parameters are really a concern. In fact, I think the only
reason we need to do any of this hashing in asm is so that we can
retrieve our stack pointer on the resume path.

I would, however, agree with Vladimir that using a mixture of named
register parameters and fixed registers is confusing. So I'd probably
just make the thing behave like a function and unconditionally return the
slot in x0. In fact, we probably could make it a real function if we
tail-called it on the resume path and rewrote the hashing on the suspend
path in C, but I'm not sure whether that's better or not.

Will
