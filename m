Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678494;
	b=02yOdbo5f/wsjsHFqi7pB5w5ylg3+smn/B7zQlYbOYyUaQHsCNEO1/JakMR2Pid60DG7
	 MpNDshMWphgN/QNW1b5/mSK7/FwvJobd4iA7ItFtyj1NUzCkuv8eXkhPp1kQPWISMqsU2
	 1CrWzkanXlYTYITndoDxoFBXOHS5IAN6l26SpduoFYzAtsZ6K9370Bf3kXKJNwQXs0qY1
	 cUZiVdp/arTlyO+0HGHBdHQuUU1OQckCb0yaAlwbniV6btTohMoCvOb4Bf2GUI3Huxx1e
	 uanIbD1gjgAp6/76nBHQQGtpmHrZTwuL/fWV8rN+nWdWeyZBYscFQgHSWdDb4bwVl0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678494;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=dMDZ73imNQncTXB/cR0yOUuH/4Fhuv9lVMxLbvVhF5I=;
	b=nUCDciKADyXF+yg8Y29000eb+n8Wi+jhaI9IXO7G1/HUFvidzFIDzAUrhmBAE4ZT7MgR
	 3IyrEwS5BNx1tJvNvgWmbw8x75nQvUIg2k0/Mfk0X4ZLoNZ4rnJEnKis3M0wlaCfFu0tU
	 F7mUDFxATwv7gjXeAfJ+OIyC+T+6Y2dRk9EGRJ4nxUr23cJbx6+w5YJFfdnywp9bUt6O3
	 BAmQhxSLhKBePwMz3UbrxZt0a3MMvTCQxKmDMtbcWACiVL4glC7ZqZZ8tVVEdjPwpknI8
	 TYSATBQrztygL4IR+B7pTsVrQCZBYZzPSFii1cv0JKdDKIp0GR/XzyiTiyMWZaohI3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1sZUSQI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E717606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1sZUSQI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248391F000C0;
	Thu, 26 Nov 2026 07:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678494;
	bh=dMDZ73imNQncTXB/cR0yOUuH/4Fhuv9lVMxLbvVhF5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h1sZUSQIdJsuK6gntWhtic59kWXoMuxJmqG2Q3DBM4FOeOkCbZAU6k74t/UP5ctKN
	 Je6KoSyAXBB9qItn/uTkdqu5Mwg69sgcAT77HQhJy+0ETLw8aoKZ9WI6ThniLQi3De
	 s7KBqmjRnruCszt3HgW7xqm0u+WcrdJMo7c6h7gxO/66AdAeTBjhbINOlkDTwHOvjD
	 s0efrGAw3laHwlXLz+po8txT6tONqHfmnSiPYOehM9Ch60CWnjNrfzoQjPUe+KB2sL
	 sE7PwO5VbmLpYFu11ayq5Jw5a5aaSBzGHyz54njqAaWSoh9A8I2ZRIGRXv/PaBBjnW
	 /UPXn32VCcQCw==
Date: Thu, 26 Nov 2026 09:34:47 +0200
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
Subject: Re: [PATCH 1/9] x86/mm/pat: flush the TLB when only an alias mapping
 changed
Message-ID: <awfhF2GIwALm1dD0@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-1-791adb8d6670@kernel.org>
 <b7bd4a18c420fe65728f4d50b69e2be0d1d39aaa.camel@intel.com>
 <awajjPwS-dKPnsKT@kernel.org>
 <6b5c846e80f8bc0f8239a553caad57bcf9b7117d.camel@intel.com>
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
In-Reply-To: <6b5c846e80f8bc0f8239a553caad57bcf9b7117d.camel@intel.com>

On Wed, Nov 25, 2026 at 08:38:18PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-11-25 at 10:59 +0200, Mike Rapoport wrote:
> > > I think this^ only added a flush where there wasn't one before, fixing a
> > > different issue. I don't think it is the origination of this behavior for
> > > the
> > > case of when the primary target already has the right permission, but not
> > > the
> > > alias.
> > 
> > Right, it was c31c7d4844ea ("x86: CPA, fix alias checks") that moved the
> > alias update into a copy and from thenn the alias's flag never got back to
> > the primary request.
> > 
> > ab5130186d74 only adds the unnecessary flush when alias does not change.
> 
> So the order goes?
> 
> 1. c31c7d4844ea ("x86: CPA, fix alias checks") introduces missing flush
> 2. 935f5839827e ("x86/mm/cpa: Optimize cpa_flush_array() TLB invalidation")
> introduces optimization, and different type of missing flush then this patch
> addresses
> 3. ab5130186d74 ("x86/mm/cpa: Flush direct map alias during cpa") rolls back
> optimization such that the missing flush in 2 is restored.
> 4. Then this patch fixes the missing flush in 1 and marks 3 as fixes?
> 
> Or some even more complicated combo? I think a lurking missing flush is a bigger
> issue than any extra flush that is not hit in practice (from the below). So 1
> would be a better fixes commit.

The right Fixes: is c31c7d4844ea ("x86: CPA, fix alias checks") IMO.
  
> > > BTW does this type of permission change happen anywhere in the kernel, where
> > > the
> > > primary and alias start mismatched? How frequently does it happen?
> > 
> > Like the cover letter said it's "unlikely to happen in practice" :)
> > 
> > Currently there are no callers in the tree that could trigger that.
> > 
> > I'm working the generic set_memory_core [1] and the bots keep yelling at me
> > whenever I touch anything around.
> > 
> > So while is a defense against potential future issues, the change is simple
> > and I think it's better to have it. 
> > 
> > Might also save us from reviewing several LLM generated reports that would
> > find the same thing ;-)
> 
> Yea duplicates and AI false positives are a problem. But changing the code to
> prevent the reports seems backwards. Though I don't have any other solution then
> just drown in things to check.

The change is more to prevent a potential future issue than to stop AI
reports.
 
With more and more use cases using set_memory, adding code that ensures
there is no missing flush now is better than hunting it down when some new
caller hits it :)

> > [1]
> > https://lore.kernel.org/all/20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org
> 
> Neat... But I think set_memory() was never the ideal interface for kernel memory
> management. Maybe this is step towards that?

The very first one, yes.

Right now it's a total mess:

https://docs.kernel.org/mm/kernel-page-tables.html

and the first step I'm working on is at least to make all architectures
behave consistently.

-- 
Sincerely yours,
Mike.
