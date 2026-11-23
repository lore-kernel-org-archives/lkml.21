Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435530;
	b=yiBqXmnBGrBG87kiT6yn9Y8R4duiOXRAuwsN/7qUFzV2gPkOfiKyJR5D28vBizcdW+uf
	 7mCKzolVOBporos7vmWMt4OFXVd6WJiW/jPnS48aCRIFSgCjahoKl6pa6VI7Dv82S2Z+K
	 2PAlVXGQolMhrpHOc/CS+e8DeMJSObRI7m9drE+lAuDvLElDCpsjA7FUYRUnNV5YJwRfQ
	 r21KR2R2U3D4m7aFCWrv3d6oHYkGgtK8e1VtG/+X8UnwXrFd3pk2kMybJEyrfijyrSlQo
	 KLGMRIDdzg4pKewsucv5+VAVLPBBTjDrt+um7mGBUnaR/A2XhBJfGOm2Bw2bwLH9x6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435530;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TFDMSFpnPErRbunntFxo9TmJj7HbgxkIMchgGyOpqDo=;
	b=d02r9ghTphRqrZToybD7Sj+u28iABMi6Wkb3pHvo8QZziF3JORi+y7ve7CWK2bc5VpgW
	 lVmSHMb2Hh6IZa6Vn9oh39B8+SKOEnGf02yq5olhP5lcxT+DETEbUvEjCCY10hNW0UWjo
	 tLA/h/HvyhcdoyvmCokRUzG6LOQxWdxSv9rYv/u3eykmGC3n2EvEQEqzgA7NWITC8jate
	 NpB3wgigz+rPDH19qVTZ3tsNw0sZxiKp2ExEFldmvJmp2kTlTTX+DiOe0KD/2LfX/5ka7
	 UAv/kljmqayGGwXok4nxAP1tJ8Yrt+FHGc5oEZqf2pOHM4Wygppt97bd+bGsfqDTwKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eFkIqGEs;
	arc=none smtp.remote-ip=95.215.58.6
Received: from mta1.migadu.com (out-6.mta1.migadu.com [95.215.58.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE2606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEE2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eFkIqGEs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TFDMSFpnPErRbunntFxo9TmJj7HbgxkIMchgGyOpqDo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795435527; v=1; x=1796040327;
 b=eFkIqGEsxjhzphH79hnrfhdUUbUVw96EA1/H3OfRimz6YmNFeW8E9UHTywVtecWVt8nhZk7s
 zksiW88VjvIm+lSLqu3zij6hZr7Yt9z6bxIrebc5HqHOKmIdaVXSyFAiWYxOw/KX9ihT4MZ3yPT
 gGK/dBLuRAjr+EHRToLz1bMk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 159dbe6bb404d09e;
	Mon, 23 Nov 2026 12:05:25 +0000
X-Mizu-Trace-ID: 159dbe6bb404d09e
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Qiliang Yuan <qiliang.yuan@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: flush the TLB once per mapping in page_vma_mkclean_one()
Date: Mon, 23 Nov 2026 07:05:14 -0500
Message-ID: <20261123120514.4141292-1-qiliang.yuan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <awQo2tg9rzMJYCQe@gremlin>
References: <20261123-feat-mm-mkclean-batch-flush-v1-1-7e998ad13251@linux.dev> <awQo2tg9rzMJYCQe@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 11:53:50AM +0000, Lorenzo Stoakes wrote:
> You are flooding the kernel with patches, 6 series across 4
> subsystems over 19 hrs:
[...]
> Given the volume both recently and in the past I assume you are using an LLM to
> do this, so could you confirm your understanding of the problem (as well as
> those of patches sent to other subsystems) and what real-world task you were
> doing to identify this issue?

Yes, I use an AI assistant. What it changed for me is mostly breadth: I
used to work in depth on one area of the kernel, and with the assistant
I can bring the same kind of algorithmic work to other paths and measure
it there. The patches stay small, a few to a few dozen lines each. I
test every change myself, with before/after measurements and the
relevant selftests, and debug kernels where it touches locking or
memory ordering, and I review the code line by line before sending it.
I don't send anything I don't understand, and I can explain every one
of them.

For this one, I was looking at how AI training jobs save checkpoints.
Writing a checkpoint through a shared mapping was 3-4x slower than
write(), and perf showed the writer spending about half of its time in
IPIs. Counting the callers of flush_tlb_mm_range() showed writeback's
folio_mkclean() flushing once per PTE in page_vma_mkclean_one(), so a
large folio mapped by PTEs costs one flush per page. The patch
write-protects the PTEs the way change_protection() does and flushes
the range once, before folio_mkclean() returns: stores through a stale
TLB entry land before writeback reads the folio, and later stores fault
and redirty it. Besides the timings in the changelog, I checked this
with writers storing through the mapping while another thread loops
fsync(), then compared the file with memory, on xfs and ext4 with 1 to
16 writers and on a KASAN/lockdep/DEBUG_VM kernel: no mismatch and no
warning.

I'd like to understand the concern better: is it the review load from
the number of postings, or something in these patches you think I may
have missed? If it is the former, I can space them out.

Thanks,
Qiliang
