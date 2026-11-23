Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447274;
	b=YVIfm+4JtuqrQYFdigkCBfMcbuQJTnMKizcl7zm8Uy3OiR94tfq4yYzLsTbJaEfnWV6O
	 I0HHio5CsA/SJFiUSn16GID8T9ETBq/rmshbfpyeVXZRiIjcuv9riYRh5WIqdaWWCryPS
	 wHE9V3ZFFz5pINg34Lyuh1djtv+NkAeECTfAJkHlE3pC5pdiNQF2wME0eEZNrXCfPgpHO
	 LdD5ErdkxZdyytXALL3+RSCpTQxdcQdgKC2z6G11MjnYm5ByWSTV3oQH+/HFOI5kRLzxV
	 IXTwtz1H4J2JXH68aMC2mi+lZVseBKmDc7046eSBrllWuuV2iEh+/5Wr/UvAL8p897Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447274;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=CFKgcFBO4UgwIK/cKgNY6HtHF7vgOpwxHaH3N8T18zc=;
	b=Q2dfefjkdQAIrQZGOhusPaoMQ6zz6rlAaoGqS1FRgPeOMeaEaPAgZYxlxqJn8PCkwP32
	 ij0fRpar3cF254eNBtQU8zdIkHw/reYYbA86WUj9kz8Gqnl4eogp0iWf/87arjrW4UbaB
	 JD9vgkftbAMS+PvOOEKyJOXItsW+agZjVjnR+gp01Njqey32G+gIQOF/cC4jDGCLzr+xf
	 8xIxfsTDhFjzEtfub5OUvAS/td7HDec2RhlD8+rx0HBeqlljuAuajWo3Fid2YT2k0j6h1
	 LId8ZnwC2nM7Uz4EwVZ+HI3DHOye/ugKezKUhiysNy5Qko4ub5VyD65OnnRs2ISMJiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Vg+9YLcY;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9243606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9243606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Vg+9YLcY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CFKgcFBO4UgwIK/cKgNY6HtHF7vgOpwxHaH3N8T18zc=; b=Vg+9YLcYwMFh2urJlLcSSQzVXy
	sO3umaNGynhYi+OEEeR4kzTjCjkS97OiiWU8B+wm9E2W/kyQdVkmX2pesxPI6211YJe1djTQ4ah/X
	VgrBjN4G0QZFV0Wy+dV99xfaCuY9fIpL4PD6UrR8Tz7Y6m+WVQDmlj/8WI78QZTxXdbbFIivBh3No
	GA/EUBdlLE7Q0Gy6AWrD3MkgZfUzStxbqICcTp93+czUgSHDNH7FOv95BH2Pxtfe9Y+eTZIU/hfks
	8xDRfE7xIr+sPwywf5aaPydWRxlKKF/TtHU5wGYeZBhKi6WYuXgQ6EkxPy8566f+elqXvUrA4QHsZ
	rq7+i22g==;
Received: from willy by casper.infradead.org with local (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVqp-00000002H4l-14E3;
	Mon, 23 Nov 2026 15:21:03 +0000
Date: Mon, 23 Nov 2026 15:21:03 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: flush the TLB once per mapping in
 page_vma_mkclean_one()
Message-ID: <awRZ36tj697iX0gC@casper.infradead.org>
References: <20261123-feat-mm-mkclean-batch-flush-v1-1-7e998ad13251@linux.dev>
 <awQo2tg9rzMJYCQe@gremlin>
 <20261123120514.4141292-1-qiliang.yuan@linux.dev>
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
In-Reply-To: <20261123120514.4141292-1-qiliang.yuan@linux.dev>

On Mon, Nov 23, 2026 at 07:05:14AM -0500, Qiliang Yuan wrote:
> For this one, I was looking at how AI training jobs save checkpoints.
> Writing a checkpoint through a shared mapping was 3-4x slower than
> write()

Shared writable mmaps are a terrible idea.  It doesn't surpise me that
lazy AI people do this, but your efforts would be better spent fixing
userspace to Not Do That.

https://numi.st/post/2024/mmap/
https://db.cs.cmu.edu/papers/2022/cidr2022-p13-crotty.pdf

(and many, many more articles along these lines)
