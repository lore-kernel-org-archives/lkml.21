Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165054;
	b=qEPEFxI7X4yqaM/ZlnOuPHiPOz8reb3PqOgCLdg6dz3rFppJ8Gx/a1DIw8GWRj2iDMrb
	 Q8iwItWJqs0mOXm3OQKQM9UOHdo6edkkJBolQhK+V/PF5sYeXBuiHEYO68KYhJ1YkM5Au
	 ts4USvHKlXro9NNRgnMnV6MdWDD5PFzW/dhANzjuWEsFuQJ452PdtxQlEX57CS9tSb8Q7
	 owfHJi0jBn+GX/sONUXL32AXEpuEYzizxypfzKhS/svKpnCU94SmiRO+TncMwAc64kchB
	 BJgjOKog9gyRDE399k7Iv6IoPLdGDY0n7AVZ6dsYXISZRtgMs0f9szGfZi/uZFDqLYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165054;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=xymtrGcTx2O+sumJ1mfHsHPYfbzzq3PCVcjjBtb8a1w=;
	b=Xh8OOQgjsWejJ62rKGwrNCN8nGCgBX50WZc2ZLFj7xcepOrd3HR9Txxpoc2Dp53sUfND
	 +0EfTPcvXpWnqs3ktLG7emz52/+NMXt9GSlLVrhn9bO+zkyTR9edxQCodkygwznGiJtqW
	 wj1dS8qNlYSNAFy22AtFOXfTbzh5tPjqzqC1s1D1Odajvc0jW8cpzayDslizhUUF+bUQx
	 cepTmygScx8r1zJWNsZpahx/pXQXCB3QU3s55SYpqLDCMAeDF0AsdZpdCvk855j2KAlVa
	 YaVhlkO8GLaY//wz1DB1/5ZQypgKAB9gmNJiWdE08+GvuqBp+/vMP2ix9ZfdZeXXVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AidKf5Oi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9356A606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AidKf5Oi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D311F000CA;
	Fri, 20 Nov 2026 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795165054;
	bh=xymtrGcTx2O+sumJ1mfHsHPYfbzzq3PCVcjjBtb8a1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AidKf5Oio20NMvG5F0VbG/mFQgb29hTdOmocLK9PTyntDsWlNaCbyKTp604nL8oPS
	 +f1BKqLFqQIzr+KlfkcJMH/UOA4nSZ1L5lVECQZ+meak99aYNSvtWrA0DwQVE6VNHz
	 S2k7Ay6gLPTvL4hszopo728gUmtj8xIO+fZ0TlYPoDSDj1cslEPBo6cls+Q6f9oy61
	 N993uEI6e0K1graLrmV3eTLH77dO59whIPGOglD51aqyzwc5n/eGnYdfm8Nvf+5Jv1
	 rl8lb33mw4EOhYhO9U9UMTPZcglXOaeJBSaEkbnCnRTqHqObXvCr2uoS4cIS2iW3O6
	 seZIStiqkY9bA==
Message-ID: <4ed0eeda-22bd-4489-ad18-d522b36d22be@kernel.org>
Date: Fri, 20 Nov 2026 09:57:28 +0100
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
Subject: Re: [RFC] mm: alloc__by: create a function for allocate pages in
 small microsseconds in boards no-MMU
To: dev12124 <joaoanandalima@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: vbabka@suse.cz, hch@lst.de
References: <1ee9b247-6758-c146-2d03-0acea98db33f@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <1ee9b247-6758-c146-2d03-0acea98db33f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 07:08, dev12124 wrote:
> 
> Hi memory subsystem,
> 
> Actually, boards no-MMU do not have an integrated MMU to translate 
> physical to virtual addresses or support hardware paging and; for this, a 
> few points:
> 
> I. Requirement for Contiguous Memory
> Without an MMU, the kernel cannot combine scattered physical blocks to 
> simulate a continuous space, making the search for and allocation of 
> larger blocks very slow due to fragmentation.
> 
> II. Demand Paging
> The system cannot defer physical allocation via page faults; instead, it 
> must reserve entire blocks in advance.
> 
> III. Use of simplified allocators
> such as SLUB_TINY or linear free-list scans (instead of the standard 
> SLUB); it saves space by 
> scanning simple lists of blocks, but it performs very slowly during 
> allocation.
> 
> IV. Proposed approach
> The function alloc_by(size, address_initial, flag) haves:
> * pre-reserved pool per size order;
> * cache fast-path no global lock;
> * bitmap O(1) of free contiguous blocks.
> This bitmap, more specifically the blocks, have the pre-reserved pool (per 
> size order)and the pool have word 2:
> * Word 1: The initial address (starts in cache fast-path)
> * Word 2: The final address.
> For example, a Program allocates 277 bytes, the alloc_by() enter and 
> verify the bitmap -> viewing the request is 277 bytes, the aproximated 
> size is 512 bytes and alloc_by alloc 512 bytes.

Hi,

I think we are much rather looking into removing NOMMU then optimizing it :)

-- 
Cheers,

David
