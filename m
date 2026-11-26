Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678982;
	b=AhA/Gfj26FBTlFcXfHhsowkrJ9Rhdhs2O/AxjIqfnBGF6E9umnMCpOefrmT3JMtRVdw+
	 v6E7kkL4a5g5hH4txsSce3Kc1MJYDS+ru5BCVwhCPJsTFbjL1H/EjXRR0elEeqpJzlV3f
	 da0lSgZfcFPFbd4dxOjpBg+F52/qWahoEJpWO/YvtYioWoejTN6euKvV3+BASrw1ZTf17
	 g3QtOxvseRPktuTGY/74wi0iUwfx5VFDV6QttyYV0vOJkgz5E04LUIySqDReNT5Yjnidn
	 Krj5IyVGES/Pyhrk0AJk0ZScSxYmvjxfL93Z2jariPyNXk+I5fmI0rQA/OVt2fqwY7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678982;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ANICIHcPs8J94IHM7ZufhiRuIz0E3perpxiLg/YhFaA=;
	b=Zd5R+A+JfZzWGtR4OBl7wV0wfFHJ491H1qoj13w13CpndrOPJtkRwpnj4OXZ4yfROUhv
	 xC9nN7nEbyWMbDmi/FNCTS7tPG/pmowthY9bnWlW3DQoYGrTXyBZdmCjJy5hsyo4/b5oV
	 3OLKR+3yVC3wd8YxfAZFCu66816kotx2riEsrBuu9PIP20qjoxpE1Sqzl9kYhUDbHUlzD
	 NpGp9hOBYNPVElVS2Msn5k0gLreN3FqZxdN6Qe+7j2+zlmIAL97Dhn3yZtryhHLfYQQPc
	 Ap+kLXG2o9H3ipZ6MlXP+/wV1aq+fZFQaX9UsSWX0y3FaCh5pUQnNN92XOvy3l7jwyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ust+7bTB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760CB606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ust+7bTB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8449B1F000CA;
	Thu, 26 Nov 2026 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678981;
	bh=ANICIHcPs8J94IHM7ZufhiRuIz0E3perpxiLg/YhFaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ust+7bTBreLB0I+Ih847Gwz5BfsEKFKHbcGxv+Q+KH8B92qFBd4B14AH9j1H59yPu
	 VD2ZajuIFD6MrgB7bEmd6lz8a/3s745j2BkjTTrylBhLR7037aqEXAVrPlhwHCaq1Z
	 4DEzH9oR6ipU9jUQLTPKQpPzbk7V5DKBmawRO68LhPojA2Lkl8O0JuyZzMK+46Oaid
	 4ZDXBUhA151VGnzStgRZjSkS1S2wrK4iWjV3uu7LNa6sQsgLh3d+chv2xv8dJ27DLb
	 xPhgRtcjZCb7ceASeoYPA5xkfMuhXkZbBqi8PvV6MIIMK62rbKcHq3dH9MAyExyi6M
	 Mc/GTxPS6DQhg==
Date: Thu, 26 Nov 2026 09:42:54 +0200
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
Subject: Re: [PATCH 2/9] x86/mm: don't set kernel_set_to_readonly when write
 protecting fails
Message-ID: <awfi_ub52YQodJ10@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-2-791adb8d6670@kernel.org>
 <afbc0c7a79e880947962fec09885a9a8937ba7df.camel@intel.com>
 <awak8ysyQqt6jQ06@kernel.org>
 <d17f02d54846e26cceae8f042756204b3dcbdb20.camel@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d17f02d54846e26cceae8f042756204b3dcbdb20.camel@intel.com>

On Wed, Nov 25, 2026 at 08:39:14PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-11-25 at 11:05 +0200, Mike Rapoport wrote:
> > On Tue, Nov 24, 2026 at 11:01:06PM +0000, Edgecombe, Rick P wrote:
> > > On Thu, 2026-11-12 at 18:31 +0200, Mike Rapoport (Microsoft) wrote:
> > > > mark_rodata_ro() ignores the result of write protecting the kernel text
> > > > and rodata. It can fail when CPA cannot allocate a page table to split a
> > > > large page, and then a part of the text and rodata stays writable.
> > > 
> > > Seems like something very unlikely to happen before the kernel has even finished
> > > booting. Probably other worse problems are coming in that case.
> > 
> > Yeah, most probably we'll crash a few cycles later :)
> >  
> 
> Is this a low priority AI bug report then?

It's not an AI bug report.

I'm changing how static_protections() checks are done, and this is a
prerequisite to close one of the corner cases there.

And also I want to make set_memory_*() __must_check at some point, so this
is needed for that too.

This entire series are small things I and bots found during my work on the
generic CPA and since they are all small, self contained and have value on
their own, I sent them ahead of that work.

-- 
Sincerely yours,
Mike.
