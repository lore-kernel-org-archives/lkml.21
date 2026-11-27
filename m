Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769522;
	b=EOySXNA+0snXegPKphQ8LBx8B+UHHfVux6FrxgRVvW6lPY7Q4N6+smdwpqyF1vkqZkjE
	 /nw+RgLW4Ua+H3ZgtGvNDQ7spQBEM3Z6p1sIDb5sNehvTBzko7kq7UNpQ1c1R/QBLbmKl
	 v1UVh0VMM12hxozrxoH67TY6vlAUv7FYJS9WJnMg+wyuvadX+/LLB70I9oljhCE+EDoYq
	 Q7ZYpwMHvuBlbNrGZ9Pp4g5gYVf0fZdYKGgzLdcy6Ife4PNWJ3KB54UQZEkLIOFemNcDn
	 LYLF5AeHaDLfnGE/HRwHsbOjkv4onF3fDqRbUtCxR3E6xpToYTVg4DwFablvi3jpRNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769522;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Az5My2Vhz9lFn8TPP5jwgIX1srC4R/ukf0qyT9wQ/eA=;
	b=L7mlhkEb0urffdbIL/DwBkOqQqD6NTg+nt/G20zPoGCztw654kXovdFsja3OgRbc/AnZ
	 bUG8uzBRwJK44HW1mRhruGGVbV9bT2JAZn1xNxKC2uPRgzirNoAgZb3ROiNa54J9Bwoi1
	 Hev9ttHDE2PGudifZGqpmCraBV1OAG1KINpy8UCuaqzSz0g3wmvcmIb4OZuJHdWnyGRuJ
	 LTqDJ0agWT5n5gMdD3SmzBF3QDHOcRgx3u7JOdTifaZH2ObeBtRUYEyqmTCLRGXDyzqJU
	 phr22DAeQIcVd95tMlUgS4/bODtzfPWaBCDIzeFvIniG4XFgkiDK5BzpXYECYc5EhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYJjFLaZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C7606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYJjFLaZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC821F000C1;
	Fri, 27 Nov 2026 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769521;
	bh=Az5My2Vhz9lFn8TPP5jwgIX1srC4R/ukf0qyT9wQ/eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YYJjFLaZwHwd63Uz/wXb6h08h8pIpRPW0RSBo0PiRLxl4x9pk2hjDtwvfu/2vOpOU
	 vucIPBC89kKlrCcLuYZ9nCHMSRIuIG6cEYn+etqLqPAfQh8w1cAgYNBEIQvvMicRHa
	 OyGQhc55e0tQkZEpYeL/sQluV0WJUP+5ZoV5zmmcaGVSdQA2bkt+z7V45M7H4pI1fg
	 bU9xvw/jVTMl5qxy1hanz3skstyxFtUUiGCC4MkStSOaWC9sppHe2sZ7n/BVmSI9hD
	 f+mk7P0Cr2hUL2OBf3Lpc6+O0vXhPtC7A5+Gt4Cellvy7uZRFyN/dJeTxbbQ5tQjfv
	 wIX36FHeCoCug==
Date: Fri, 27 Nov 2026 14:15:45 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Pedro Falcato <pfalcato@suse.de>, Dave Hansen <dave.hansen@intel.com>, 
	x86@kernel.org, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Kirill Shutemov <kas@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	David Hildenbrand <david@kernel.org>
Subject: Re: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential
 guests
Message-ID: <awlC1qLOp31OL1iD@blrnaveerao1>
References: <20261124160025.738362-2-nik.borisov@suse.com>
 <0dc6759e-ada2-461c-85de-809c170abd6a@intel.com>
 <awXBtrPSHfs51Y2f@pedro-suse.tail5790ac.ts.net>
 <8500860b-d2ff-45c1-8604-28a2b3d66382@suse.com>
 <awcMnXKDWjTvxumG@blrnaveerao1>
 <d642f950-6423-420d-927c-991cbb5c2669@suse.com>
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
In-Reply-To: <d642f950-6423-420d-927c-991cbb5c2669@suse.com>

On Thu, Nov 26, 2026 at 09:17:49AM +0200, Nikolay Borisov wrote:
> 
> 
> On 25.11.26 г. 18:51 ч., Naveen N Rao wrote:
> > On Tue, Nov 24, 2026 at 07:57:05PM +0200, Nikolay Borisov wrote:
> > > On 24.11.26 г. 19:10 ч., Pedro Falcato wrote:
> > > > On Tue, Nov 24, 2026 at 08:36:45AM -0800, Dave Hansen wrote:
> > > > > On 11/24/26 08:00, Nikolay Borisov wrote:
> > > 
> > > > 2) open-codes random CC checks in mm, which is kind-of regrettable
> > > > 
> > > > OTOH, it's unclear to me why that CC check is needed. If configs select
> > > > STRICT_DEVMEM and IO_STRICT_DEVMEM, shouldn't it Just Do The Right thing?
> > > > in iomem_is_exclusive, etc. If not, could the CC awareness sit there
> > > > instead?
> > > 
> > > Well, you are right that if we retain just the select
> > > STRICT_DEVMEM/IO_STRICT_DEVMEM it might fix the immediate issue. I don't
> > > know why eventually Dan decided to also add this check, I guess it's an
> > > instance of "fail fast".
> > 
> > Actually no? On x86, devmem_is_allowed() allows access to the first 1 MB
> > area, so STRICT_DEVMEM alone isn't sufficient.
> 
> For the first megabyte of memory (BIOS) is return 2, meaning "Just return 0,
> rather than trying to access the address range".

That applies to read(). For mmap(), the accesses are allowed causing a 
#VC -- though this is taken in user-mode so the application gets a 
SIGBUS.


- Naveen

