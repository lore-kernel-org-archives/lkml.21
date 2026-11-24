Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541739;
	b=tczKXuF1SqzbQayoqCmC8Bt8QIzZrS6YV4yqGUSTBJllvV6Drb0R7GA6TcHE6XXxt8hN
	 hylkI7NSxcKBZHKvKlSlC5x8QxyMDKLNsYlHT7T3A0ljLeTbvz48lTrIK7ppnkVXTfZr5
	 qcmBs04aLA69kznjuFq0X+7LWpBGFmfGe6XtJxruxM7l3uPd1WAkmtp3HpKMEDDF5rcl1
	 4vZqb8M+BX8l0DT+C7u6hWraZauKi6AI0EHD8TWL7zLQo3tI655ZlStvg19rIkUA+HTCd
	 kwLotli/s13KpCmgJR39hPzL3fCOKRmp4vMxOBzi3yMixbVqA9/A4Y/M92/10O8uj/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541739;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EOrjpQJjfBkE4q8XiTb4DK0inCr3iHWjs8GQJ6hksQA=;
	b=IUtMFhDhOtrM8hVuAV28Mm8dLuM7mcOjB1+T8NzD8B0fT/NgZRAClFxB9z2iAfAYPfzX
	 9FXnwoZXXUw3MAmati2s+GEbCATLXzJXQz7U6VBUxnKoNtp9UYKbqoUTq+k2Ay+lU4tX6
	 9BEymenDHFqd8vsS7OEDQaOrNaTXs7QTNAuDRvvU164AmYu6/E9s8rM3TZowXlB4WbgAc
	 j56TsOE9Jqc0G8JI/unG5O8MGGfZDDy/K6u5bMAZ5L0RfGrSSriitUx76IzN20Q/zVUJ1
	 1TzMe+aFMIiYZyk9DWrRG1N0CcpWuKeJ4ITtXjJJIQ3yAAMrfBtkxEo4ri3eWkxxuWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bbp6WT8l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bbp6WT8l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805FF1F000C6;
	Tue, 24 Nov 2026 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795541739;
	bh=EOrjpQJjfBkE4q8XiTb4DK0inCr3iHWjs8GQJ6hksQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bbp6WT8leTC+EudoAXk+7oAE3ZQiSJAbbkOEDFJ1Cyn+x/eHFMCRiDItv//5oYvRg
	 sm9eU6d0mbBH49Qv0vE4Zw0AxRReqykdGC9Eh2QJap+PTO2d26SleVdt71fcZRDu8a
	 8HsP2XZbn5aNufzOHtqI5eiyzmGrnWcgKO+9npc8=
Date: Tue, 24 Nov 2026 18:35:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Dave Hansen <dave.hansen@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
Message-ID: <2026112404-hyperlink-widget-ff36@gregkh>
References: <20261124160025.738362-2-nik.borisov@suse.com>
 <0dc6759e-ada2-461c-85de-809c170abd6a@intel.com>
 <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>
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
In-Reply-To: <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>

On Tue, Nov 24, 2026 at 05:10:21PM +0000, Pedro Falcato wrote:
> Holy cow the CC list is stale.
> Fixing some up.
> 
> On Tue, Nov 24, 2026 at 08:36:45AM -0800, Dave Hansen wrote:
> > On 11/24/26 08:00, Nikolay Borisov wrote:
> > > Resending this with the hope of either getting it accepted or
> > > arriving at a consensus what exactly is missing so that I can take
> > > it from there and eventually get something merged. As previously
> > > mentioned this results in real problems for confidential guests both
> > > on TDX as well as SEV-SNP.>
> > >  arch/x86/Kconfig |  4 ++++
> > >  mm/char-mem.c    | 10 ++++++++++
> > >  2 files changed, 14 insertions(+)
> > 
> > I'm still OK with doing this.
> > 
> > But I didn't want to sneak an mm/ change in via the tip tree. Any mm
> > acks or naks on this?
> 
> For what it's worth, I don't love this fix. Yes, it fixes issues in /dev/mem,
> but it:
> 1) skips any other potential problem spots (I don't know which)
> 2) open-codes random CC checks in mm, which is kind-of regrettable
> 
> OTOH, it's unclear to me why that CC check is needed. If configs select
> STRICT_DEVMEM and IO_STRICT_DEVMEM, shouldn't it Just Do The Right thing?
> in iomem_is_exclusive, etc. If not, could the CC awareness sit there
> instead?

Yeah, why is anyone letting a CC system access /dev/mem at all?  That's
ripe for abuse lots of different ways, so I really don't like this
change either.

thanks,

greg k-h
