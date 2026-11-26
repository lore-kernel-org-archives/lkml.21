Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679448;
	b=OqV7ZZ6T0sIBnVqoqJgRrrHerV8hucnLVM2Hk4SS/aLz0fd29x7WBCBnxtWL/2J0IHQQ
	 fwqulnzkTQ21nI7tuKwLOeqDhcx8iZQSLLkkmodwINgnuxnRkvAbxpvW7uow99vQDdya+
	 1eD4/bm4JJmH2vtGofm/Kjfn/wizOg6LATb0TJ99j+8ArNa3jS5PDnYkF4l8C8BR73iYg
	 sPo3LxQRT+Eq/stnIR81ipb9E1jKNdrY+2BFOGdajaQRF9JnrHDXZpwKpFIYydWUhSVLK
	 Y2YAFdWc8vbD9X5Dhis6dMA6HIlddfWxWYI8/zAcZ/GztBc2upWlewNIrQLaePObpOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679448;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tLLvx4aW8j12AYFgqqecOInlyvHBX6zbpR45zco6qGw=;
	b=de/i9v9cDBKdlmb1OfqMpUv9KJc+hfqCy1s5wAV8YjXadjPwHAeZu2O9siyqvl14m42g
	 yyYh6J2b80DeKWy/3WkepTxC3PSzmLj6ucUakaX4NtlcybcLYapkUNk3C22rcWnyv0Y8Q
	 KM7c23vEwU/fQCVKZJsYDCrqmqdg6O4c3+fbt+MDTfSEeWiM7nUbEtbDaZnTyGtL2Sroj
	 tii6SYmohXrbbiLR9g4z7xlbL0Rv3wPpCLzb8FzafIgcZVGCEAT49Utae0mTvdqm7Rrfk
	 LnmbOKFE14fxGTRTZRNiCtxB0nJ3pePl0J9XNwaOQiiKRz1itUNG0UP68Nt0WfCIn1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3IWt4R3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5D0606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3IWt4R3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6111F000CA;
	Thu, 26 Nov 2026 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795679448;
	bh=tLLvx4aW8j12AYFgqqecOInlyvHBX6zbpR45zco6qGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3IWt4R3bgOtHxksgGuaH7zSEpIkOwiS3LhmWsrRFvdwKoeKd0Dpbqii+GHtPzll9
	 rfbrVCvr06xSaevPtZluXQXb77v6KPF51IHyaA4WLNthrwWY1qfzQTYjZDpSe5TMao
	 snqf518gIe0u1m/7q06/geHFhZaLapPifnxn+YFYueg9lJrdXluBLPwECSke7nDjn+
	 Pg61gKcVsl7MuvTcj4EDLQXSrgJ3F5hGY4Wefag1YR2FSA5vIm3Yeet0yVpwr49bbt
	 myTrXaFFYtasLBsy11Oc97cf30O5ZUc+NLOatZwCfRUdU2dOO4QPjmDRuoJx/7ubZn
	 X3YrcL70JuO8w==
Date: Thu, 26 Nov 2026 09:50:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/9] x86/mm/pat: don't BUG() on inconsistent page count
Message-ID: <awfk0TYrGze4vWoa@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-4-791adb8d6670@kernel.org>
 <4edee4db91a92b3231644688afbc950bb880ff8c.camel@intel.com>
 <awamPtNjztFml17Z@kernel.org>
 <be835cb27636fab892e60c50f7231bb6ba1de0c0.camel@intel.com>
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
In-Reply-To: <be835cb27636fab892e60c50f7231bb6ba1de0c0.camel@intel.com>

On Wed, Nov 25, 2026 at 08:46:14PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-11-25 at 11:11 +0200, Mike Rapoport wrote:
> > On Tue, Nov 24, 2026 at 10:57:39PM +0000, Edgecombe, Rick P wrote:
> > > On Thu, 2026-11-12 at 18:31 +0200, Mike Rapoport (Microsoft) wrote:
> > > > If a step of __change_page_attr_set_clr() covers more pages than remain
> > > > in the range, or no pages at all, that's a bug in CPA, but it does not
> > > > justify crashing the kernel.
> > > 
> > > Agreed, but does it also justify special handling to try to return an error to
> > > the caller about the bug in CPA? Why not just change the BUG_ON() to WARN?
> > 
> > If we only replace BUG_ON() with WARN_ON(), either rempages wraps around
> > and we keep changing pages past the end, or we loop forever.
> 
> I think the preference for WARN_ON() is not to make a large effort to survive
> bugs, but allow for the possibility of keeping the kernel running in the case of
> one.
> 
> If we try to handle every warning condition we will be doing defensive
> programming against the kernels bugs. So if sometimes we loop forever
> (essentially a BUG_ON()) things are no worse then the BUG_ON(). If we run past
> the end, then maybe the kernel stays running long enough for the user to take
> some protective action. We are just not jumping in the middle with a BUG_ON() to
> say, "no you don't even get a chance".

set_memory_*() as they are today are not recoverable. From the caller
perspective a error return because of a bug in CPA or because CPA failed to
allocate a page table is "oh, shit, what am I going to do now?"  situation
anyway.
 
> AI probably will try to get us to handle all possible bugs if we let it. It
> would be a big change to try to do this.

Even checkpatch wants it :) 

> > In any case we must break the loop and returning -EINVAL seems the most
> > appropriate action there.

-- 
Sincerely yours,
Mike.
