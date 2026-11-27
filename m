Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801423;
	b=AeG87cbleQUoNM6gDAN4BSMgh9kOs60iF6cS6FMXncvgDI9Jed94P6+4R9PQQkAI0jxf
	 B3hQPZYGV0iqUDfAI0yzVxAsPMq2cy8rdL7/gRln38v+sh6w7hS9fzhWJbbrcoPHs0ZaZ
	 ulfeGbeHbCvugpZggy6tjZs4KLCf29SbAm+tt6gRyB7R4unY0n9bfFulPDLBL8WfKsbMv
	 lDKXCgsgh8EkhalrD5iiFzc3tlWYPJBnku1/8bns4kVJ98E6O33E2h+fKKkSBzcE8g6jl
	 clYNMyj0NGcAORqNvhcOTnjHxRpBtKWZNg+XmvwOaxk0JyskCXfPJmTU2chtqVqkD6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801423;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=4//c1y7R5iOay/1qB05dRfh80LMu6MjdD1lnRgqu534=;
	b=mRRcMTcRDYHi6OK9D5rhnpC8ArjPwr1Xliwd2HC4GgSd8grTMBDMseJIazTbJzIHGg2n
	 H/iqhQzBOf+yDa4+EOj8iOzQss64o/NzgqT8EqT7Mw4VBEhGKFxzbnDNu9Z8mTl+x+Fe+
	 KIs/CD578F2wW0z9mxF3lAeheUfIls8fdVRhNa9o2JtQQ+NHnki+KqCrhpCIu4yMUY2MN
	 nUYoaCYohARNOhFNo5pny0qyYQiYd9etqG4MQeTNkwmn7ZVtOGnpu1zH7IRamCFMZmey0
	 ksnFnHKe88JZCpoZHmtZvztXFV3UcqPSrP1McqrcIfslJw0yJmRqcc2znO8ozyentug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mSGioadF;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CFUQc+7b;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mSGioadF;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CFUQc+7b;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCCC606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDCCC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mSGioadF;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CFUQc+7b;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mSGioadF;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CFUQc+7b
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F22D01F7F2;
	Fri, 27 Nov 2026 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795801421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4//c1y7R5iOay/1qB05dRfh80LMu6MjdD1lnRgqu534=;
	b=mSGioadFgU4HHFtRiF7iKYor+d4NLBHh6LqlX5JJCk+ry6KRDZAw+V+GNj2B7aKWTJ//KG
	6o28tanc1pGxfauhC1xZ14SQcWAcf45nG9SRJCP2G4Evog/tc0WKSksKX+7/BoBJ1mj87o
	nYK4MhBvR78SIoeEOF3PUYlHJufmlCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795801421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4//c1y7R5iOay/1qB05dRfh80LMu6MjdD1lnRgqu534=;
	b=CFUQc+7bZAUwCAsOWXF0HebaP0jlbgM+a6julN35p2Pd+Zj3B9I26kWH6mAD5WNM86adCS
	42QW15I9Oha5ZUDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795801421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4//c1y7R5iOay/1qB05dRfh80LMu6MjdD1lnRgqu534=;
	b=mSGioadFgU4HHFtRiF7iKYor+d4NLBHh6LqlX5JJCk+ry6KRDZAw+V+GNj2B7aKWTJ//KG
	6o28tanc1pGxfauhC1xZ14SQcWAcf45nG9SRJCP2G4Evog/tc0WKSksKX+7/BoBJ1mj87o
	nYK4MhBvR78SIoeEOF3PUYlHJufmlCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795801421;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4//c1y7R5iOay/1qB05dRfh80LMu6MjdD1lnRgqu534=;
	b=CFUQc+7bZAUwCAsOWXF0HebaP0jlbgM+a6julN35p2Pd+Zj3B9I26kWH6mAD5WNM86adCS
	42QW15I9Oha5ZUDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8338134E8;
	Fri, 27 Nov 2026 17:43:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 13myKEzBCWsfHAAAD6G6ig
	(envelope-from <jbohac@suse.cz>); Fri, 27 Nov 2026 17:43:40 +0000
Date: Fri, 27 Nov 2026 18:43:40 +0100
From: Jiri Bohac <jbohac@suse.cz>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Usama Arif <usama.arif@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Frank van der Linden <fvdl@google.com>,
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org
Subject: Re: [PATCH] mm/cma: reject long-term pins of HugeTLB folios
 overlapping crashkernel CMA
Message-ID: <awnBTG3budAQqfSq@dwarf.suse.cz>
References: <20261125155108.24098-1-ekffu200098@gmail.com>
 <f79014e3-3c81-4b2b-87f6-df0c2d946357@kernel.org>
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
In-Reply-To: <f79014e3-3c81-4b2b-87f6-df0c2d946357@kernel.org>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,infradead.org,vger.kernel.org,kvack.org,suse.com,kernel.org,bytedance.com,linux.dev,suse.de,google.com,soleen.com,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30

On Wed, Nov 25, 2026 at 11:43:40PM +0100, David Hildenbrand (Arm) wrote:
> On 11/25/26 16:51, Sang-Heon Jeon wrote:
> > crashkernel=size,cma uses existing hugetlb_cma memory, so
> > crashk_cma_ranges[] may contain HugeTLB folios. HugeTLB folios allocated
> > from hugetlb_cma can be long-term pinned without being migrated.
> > 
> > After a crash, the crash kernel uses the memory in crashk_cma_ranges[],
> > but a device can still write to a long-term pinned folio.
> > 
> > So reject long-term pins of HugeTLB folios overlapping
> > crashk_cma_ranges[].
> > 
> > Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> > ---
> > The above scenario is only possible with the two patches below applied.
> > Currently only linux-next, which is targeting v7.5, has both of them.
> > 
> >   "mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory" (kexec-next)
> 
> I think that's a real problem with this thing.
> 
> The solution is not to disallow long-term pinning. :/

This patch does not disallow or break the long-term pinning. It just makes
sure the pages are migrated away from the CMA before get_user_pages pins them.

As has always been the case prior to 
  "mm: gup: allow long-term pins of CMA-allocated HugeTLB folios"
(in mm-unstable), which introduces an exception for hugetlb CMA
and allows the pinning without migration.

And this exception breaks the assumption that CMA does not
contain long-term pinned pages. The short delay prior to kexec
when CMA is used for crashkernel is there to wait for pending DMA
into short-term pinned pages, not long-term pinned ones.

Including 
  "mm: gup: allow long-term pins of CMA-allocated HugeTLB folios"
without this followup breaks this assumption, which we discussed
during the merge of the crashkernel CMA patchset.


-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia

