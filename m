Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024902;
	b=wkyYX/ER3t8QqU3iedkh1R9JQHb5dEINcCf0sn/mTC/D8gj1CMJlIVYZVLv2N1oogFz6
	 rOp2hu4Cwkk4eC6ubJop/wynDqB3TyQyZo4JNgqpBRwj9Ih1e5LF90LwHCmshyJ0rZzNt
	 QszM6wFLeZBJ9x+paGDNQ8Wv8QRiw40tMCWFohXPMn2uNFtNBHwI44rBJ2iqx0dhKet+U
	 QuldcIoxEBg9rzIVnZuRvGquI97uX0xgg9/g1i4S4OunBmWlRFZEltPOgu3fYSXC0chxm
	 SC9NKFhqnnD04ohbOg3m01AroB8T4bat11t5bvKRgUF9hSd2xUhyZs0CbeXpLt3dRwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024902;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dOq8EsFEjMFnCQhxDJFGpo1p31eiea56FSZ835svf0s=;
	b=reXwDIAwN7Bo9j1sC+0JcDUUjSmUiQs4X39mUfd3v6VvOvAEPJOMvFPNIylV00NUOx4V
	 JCfnQ2DhXvTSQcJZPB2ZDWgE305sktoKpvF/Ht6L9k1WisSPdSZzoH76Qd88Cjz2AoRnL
	 xQMeHb4eQIDVBWU2pciplLsfDh8HjVT/+C49qOtkKo2ROL/8l7WfRLzJVD6mAY3BqN156
	 RRD8vtDjaaoMkyheSGDh6USQxdAPfy5HqXCtbl0UokdIMUJrY9ZaYrILOie9TSIbOzjWj
	 3BrzAhxjxicRomFrx4+whgi5rIas7RPHQ12kSxDnuLo5S2bs6u9HXmxP3TU+6CF9jwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YU5tz0Cj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447BD606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YU5tz0Cj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A581F000C4;
	Wed, 18 Nov 2026 18:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795024902;
	bh=dOq8EsFEjMFnCQhxDJFGpo1p31eiea56FSZ835svf0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YU5tz0CjX0mT7RIW3ioySqL0E4JKgTUvuY1Revky2r1PpPsr3xQiQDChsPuwwVf78
	 St1MmWOZ8T9W5Kp5EK6xNQnLjeGWNNFBomqSMr4lE37OG7ZZ/kmMzmP0tH/BuybXzx
	 F8BeQfhEhpNw/Ob6aN34eOK2XrzKPyy3h+ZoWphiC0fCK0d1cIyCy1UnhLHiA6XLUi
	 EwGScF4pFnnEDpQ33DVHTlFZKTcdDU3l8FTBzKwk2bsXGSHi39mooFto26G5quoWz4
	 X96L+++WTq3fP81xgB+rzb2o6STc2qhDgn1M9hrvHlIFqiXwRaz71WLY6Gyq72N2hV
	 CsoVyb+dQzO8w==
Message-ID: <140d09e9-e3b2-4f1b-bd46-4ae9f6dacdd4@kernel.org>
Date: Wed, 18 Nov 2026 19:01:35 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] mm: gup: move gup_must_unshare() and
 INTERNAL_GUP_FLAGS to gup.c
To: Rik van Riel <riel@surriel.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Yuan-Hao Hsu <aa9736195201@gmail.com>
References: <20261110-refactor_gup_fast-v4-0-e779a7674274@arm.com>
 <20261110-refactor_gup_fast-v4-3-e779a7674274@arm.com>
 <5f26a5a1e72fc999823bfac94f33b3c06465e519.camel@surriel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <5f26a5a1e72fc999823bfac94f33b3c06465e519.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/18/26 17:59, Rik van Riel wrote:
> On Tue, 2026-11-10 at 22:52 +0000, Yeoreum Yun wrote:
>>
>> +static inline bool gup_must_unshare(struct vm_area_struct *vma,
>> +				    unsigned int flags, struct page
>> *page)
>> +{
>> +	/*
>> +	 * FOLL_WRITE is implicitly handled correctly as the page
>> table entry
>> +	 * has to be writable -- and if it references (part of) an
>> anonymous
>> +	 * folio, that part is required to be marked exclusive.
>> +	 */
>> +	if ((flags & (FOLL_WRITE | FOLL_PIN)) != FOLL_PIN)
>> +		return false;
> 
> While I was playing around with some AI loop to
> automatically improve review-prompts, one of the
> AI engines (out of 6 different ones) spotted a
> bug with this code, as used in this series.
> 

Preexisting one? The please send the fix separate.

> I have a reproducer to verify it, and will send
> in the fix with v6 of my GUP series later this
> week.

If the fix is for this series, also send it here so we can squash it.

-- 
Cheers,

David
