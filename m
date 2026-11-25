Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583167;
	b=Ojr3gjx2zXVsQIJf6RGGmk35T0lVgIo/x8Z/dqyEncH8Eu6+yBFWQUaURY5lUCDh8PRe
	 DTS0SKQsjjMwQoLisP/wjQIPa+3q3+b7/fISNec357O/GuWbg+yzGr7nkNe5+KPMrIabK
	 vHJwWgEpSXtfMpXz5lC8DZWYJatXP2LBLw5SqvJxkCGi5ove/rhACqoWf0jNd5rAnUR6B
	 B//Psu2TVWLRRcGOfTORafgOln4VcxBJuB5azeBBfG3nZ4cHFksP9gXODJrmQoxnMcP5N
	 SrA1Xmob0P3wZTzdnuhK/TaNQzCw3yYQ9+LTluFMqWeJZIxuR/8UBHMo8pF5N+b/PNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583167;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Uz/lRB43XRntDAJzkH7ycnHE4dBan8nKXw3o4HGoSjE=;
	b=oQODLyoKlUunAEnqJ6ZqGxIu2z0waF3QtuKyB+dm7Ow3f45JL/Cry4rJ+SHVjEZmmTEd
	 apUPX66+Oo5rRBBSEPEQH3dVAi7ztCrBUYKjpaICRUfsx3UUwlhKydAHLRV/ndt2b6iCt
	 6F5Ri0lAKAra52JwL5oN6kndvClq1h+cpXJwAkmaPzTLV1fJ3E8Rr/KsHPRsE7ehpXkbc
	 FRxGjNhO3WyYTFziT7jIvOK/IqvVljieO4DfKm8SBriXfRWivTNAaqDrzFrSoFadiQfWo
	 f35ajMKte7ZcX+NxDfH82AbkSUNj+meXqmLnS5nVjHFMvOlX7mlmpFwrkxkVvbw6PeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HlXDUdBs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA312606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HlXDUdBs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392EB1F000C6;
	Wed, 25 Nov 2026 05:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795583166;
	bh=Uz/lRB43XRntDAJzkH7ycnHE4dBan8nKXw3o4HGoSjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HlXDUdBs2uLBBs/puvB7zu8QlY/VjjLdP0hmISSus30YRf4hL0tV1W2VDoWCetPW9
	 k6GUWglGmvzRaVJf5K/o168KBMpWmZ86xKCVZKu3vATMtNSEABNCV1AkNfvPcjFmBg
	 IOIZnu2BAzE8a3gNJopeLTbH2ZE03IWUZdBhBopU=
Date: Wed, 25 Nov 2026 06:06:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Pedro Falcato <pfalcato@suse.de>, Dave Hansen <dave.hansen@intel.com>,
	x86@kernel.org, mhocko@suse.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kas@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Naveen N Rao (AMD)" <naveen@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>
Subject: Re: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential
 guests
Message-ID: <2026112533-juncture-skyline-91d5@gregkh>
References: <20261124160025.738362-2-nik.borisov@suse.com>
 <0dc6759e-ada2-461c-85de-809c170abd6a@intel.com>
 <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>
 <2026112404-hyperlink-widget-ff36@gregkh>
 <15d9c032-a8cd-4469-9272-0964e8d9ac9d@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15d9c032-a8cd-4469-9272-0964e8d9ac9d@suse.com>

On Tue, Nov 24, 2026 at 07:53:53PM +0200, Nikolay Borisov wrote:
> 
> 
> On 24.11.26 г. 19:35 ч., Greg Kroah-Hartman wrote:
> > On Tue, Nov 24, 2026 at 05:10:21PM +0000, Pedro Falcato wrote:
> > > Holy cow the CC list is stale.
> > > Fixing some up.
> > > 
> > > On Tue, Nov 24, 2026 at 08:36:45AM -0800, Dave Hansen wrote:
> > > > On 11/24/26 08:00, Nikolay Borisov wrote:
> > > > > Resending this with the hope of either getting it accepted or
> > > > > arriving at a consensus what exactly is missing so that I can take
> > > > > it from there and eventually get something merged. As previously
> > > > > mentioned this results in real problems for confidential guests both
> > > > > on TDX as well as SEV-SNP.>
> > > > >   arch/x86/Kconfig |  4 ++++
> > > > >   mm/char-mem.c    | 10 ++++++++++
> > > > >   2 files changed, 14 insertions(+)
> > > > 
> > > > I'm still OK with doing this.
> > > > 
> > > > But I didn't want to sneak an mm/ change in via the tip tree. Any mm
> > > > acks or naks on this?
> > > 
> > > For what it's worth, I don't love this fix. Yes, it fixes issues in /dev/mem,
> > > but it:
> > > 1) skips any other potential problem spots (I don't know which)
> > > 2) open-codes random CC checks in mm, which is kind-of regrettable
> > > 
> > > OTOH, it's unclear to me why that CC check is needed. If configs select
> > > STRICT_DEVMEM and IO_STRICT_DEVMEM, shouldn't it Just Do The Right thing?
> > > in iomem_is_exclusive, etc. If not, could the CC awareness sit there
> > > instead?
> > 
> > Yeah, why is anyone letting a CC system access /dev/mem at all?  That's
> > ripe for abuse lots of different ways, so I really don't like this
> > change either.
> 
> You are missing the point, this pertains to /dev/mem in the guest. There are
> a bunch of libraries (libhd for example) which reads the first meg of
> memory. This causes the CC guest to shutdown in both AMD-SEVSNP and TDX
> world.

Then don't allow those libraries to work in cc guests :)

Again, why would you want anyone to access /dev/mem/ at all in those
types of situations?

greg k-h
