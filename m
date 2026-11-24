Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526935;
	b=b1ifiRFc3iLY67J8MTG6oBlKnYhIj50vY4hjjRItxpfZr3e5RAQaYTD4KYT7de5RVntA
	 aodumJz1MZ3bPXABPJCjxgq3bcyfkgcNohoWrnGZH0FhPtJsc/SFyESqeXaflnDktebLx
	 CMPjkZon3ckWB4gCkhiKqpFqKVo6YS09Y2k2TsCwfymgThtTIWGoLBoGSG3/6nE9fVxS3
	 S2qydK5EJvQ4ZAG6ozdNtVN25gkkn6XekTxzv2gP3KvSrDeI6vDd2pIM1OxuHrSb6L8h2
	 FUCPU9uDSk/FkWECUmgGZO2HigsibF6RJpKN3DX3bbaB7I7N6rVo94o8zDjXpsdIcWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526935;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ppSLLPWvpI6KxcEisNMO2tcR+grD4AsFIEJZhPBbdo8=;
	b=c1DUoR75ug9inZkRrMFQtXIsMV6PQ3kJM6CmfbLQCOeAtzwAmFZlgaeRnYQKNl7/FdH3
	 /iG43qEmSDGYCA7r/drfn9jBhlQpR+lVQgNUBasbfIsWCqelH+eJkX7mRczanTLeLTL2T
	 UHhDqTCwI6YhxT2oTADPhWywD3+GEfnAljn7AcsYapZxVfQfemHoCbGjB55om5tIAxCGZ
	 ugCQht3lcHa0+EoUMKioh1ojUB69Kk1vws5xmS+v9PxbklmGlmPc2bRpmfP4BRhDxnJMa
	 RPKLXmQQCy5ESvimp2VJZ3JImxx/EsiZG0jRzRAPlVbxL37L3XO2eJUi6AGi+CahLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5Sl4Vx3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41CA606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5Sl4Vx3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA64F1F000D3;
	Tue, 24 Nov 2026 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795526935;
	bh=ppSLLPWvpI6KxcEisNMO2tcR+grD4AsFIEJZhPBbdo8=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=k5Sl4Vx3VWy0N+lpOv2sBl0aGk/HDmUvQC+w3HCjNp0ahUW8AH3gUUdtEBLzQWUY3
	 mwyN/EtC+3N+6cIA5hEa09slVNFGiFGhx3f3VBNbRuM6FH2GGRvqwfgZdqKQGe3lBm
	 qF+WPEyb0K83/aS5BKAF6eRRsNywj8pM9u/6TD+IZh85JLSFGQQjmzPmqaLw8Ec1SN
	 wPskPb6m7LxhaSCAEbB+38zCfWNStdb0ZA/3STzCfI92Qcpj4MvMuOhYecqu9UQy/y
	 YPRAMEqlpfXFLDL4ynKnrLab3BZ97RURdwNlV8v0r+KI/oougiUSzi8Wb7REVrQGUo
	 OwqkmNlFnr9aA==
Date: Tue, 24 Nov 2026 13:28:46 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] mm, uio: huge PFN mappings for /dev/mem and UIO
Message-ID: <awWPTMvlt34wPyux@gremlin>
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
In-Reply-To: <20261124131510.38745-1-farbere@amazon.com>

What on earth are you doing, Eliav?

There was outstanding review on v2, you replied to it with what looks like an
AI-generated response [0], then instantly sent this respin out?...!

Don't send respins unless it is ENTIRELY CLEAR that the feedback is addressed,
and that goes double if a maintainer is CLEARLY not happy with your responses,
as is patently obvious in this case.

I am inclined to consider your patches as bug reports only moving forwards,
honestly. Maybe David has more patience than me on this :)

--
Cheers, Lorenzo

[0]:https://lore.kernel.org/all/BY3PR18MB4722314909E880B1D77EED62C6442@BY3PR18MB4722.namprd18.prod.outlook.com/
