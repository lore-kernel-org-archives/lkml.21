Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592970;
	b=JuyJTPjpEI37Rlun72/IHp0bkHRx1UXavUWSI1x4rRh9u8gnU5dFOWYBz9CUZRrWIc3v
	 oC2gldtRBV/4yqthEca2cmeNZzTxdpmsFpZy3r7NwejVGD3pI1iy5zwit8LFdV1t92vMi
	 KCQfUNJ/W+mCGeYieFc2D7UAzFP1oBmJKm3t5rG+1qPNpKc7O2RB1R7jbasNIvbQbMCld
	 nTgqLPUKIRTtNGLrsRb8+JDBMmzFEYrIcxAb6TQsiGLAQiVP+SMZ36H8eyaAxMWUF2egg
	 bvwYlM7GkO4Y8gfa83/VV7L0KXbdbBtMEDDCvi3trcQq32DECIViLeWvQRAiIR71pig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592970;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=moULo+zYqg9swYV2aKHcAmhUVeIT6ck6nZOqYtJcyA0=;
	b=p2U2lH+Cuk5C/kZwOG+rMoMP9q6hhXtMYVJQN7n8Cjrg9FGt/DGVH44WbqA1XgvqeeBN
	 rTmmMofqrjS1tS1JPQ5KBi5fbP0Q8kPkQaJjWko3SixgyGRzv6UtmyZaIZsQzxFc2Ahiw
	 BNtxRnOElKrUa4IY/7KM0QrAbmbLQgqjFidKqF6OlHnFIl0q2dvEb/4paTeShAoNsopIs
	 2ZjiRQL++tCQFJkZA9r685ArtKsV7zP8/bCLwtyXguV5Z4asPuYqnDXdX6iyyI6wVCp7T
	 oOGrEx/qTqsxwMfAF3fZp6bxF1KZTTG/IasMDt5HSpxx6Pb2dbJhb0DxxUjFNRBkCrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="HzE8z/K7";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61E3606A336
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61E3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=HzE8z/K7
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261125074926euoutp02690b3ca2f9785aec3123de797d2fee53~rOko3cYXK1127211272euoutp02F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:49:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261125074926euoutp02690b3ca2f9785aec3123de797d2fee53~rOko3cYXK1127211272euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795592966;
	bh=moULo+zYqg9swYV2aKHcAmhUVeIT6ck6nZOqYtJcyA0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=HzE8z/K7YIo7l12YV/WBlCx/dzvLRQck2HKCLMwZ3251NSKWzDT3hQGVaEf1Ty211
	 30Tx1DzsTky7ZE/NQtIt+isMxW3Mtq4GSt62e00wU2iVvnuCABhCH+70pVHMoP5Xkf
	 nJv5VJZGMGRVqpZaF9xbfes/3qQpbNCB3qgqREG4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261125074926eucas1p18d5e57c2c8f3be85a85a007270c860be~rOkok6o3m0116101161eucas1p1f;
	Wed, 25 Nov 2026 07:49:26 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261125074926eusmtip28e4bfe207a1ea602f1386a1e9d05e2fd~rOkoEOvjx1909919099eusmtip2-;
	Wed, 25 Nov 2026 07:49:25 +0000 (GMT)
Message-ID: <bfe80e4a-572b-4362-834d-8c4a26c6d03a@samsung.com>
Date: Wed, 25 Nov 2026 08:49:25 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] dma: swiotlb: Use system_percpu_wq for dynamic pool
 freeing
To: Kohei Enju <enju.kohei@fujitsu.com>, Robin Murphy
	<robin.murphy@arm.com>, "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Petr Tesarik <ptesarik@suse.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261125-swiotlb-replace-system_wq-v1-1-83807c6afb75@fujitsu.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261125074926eucas1p18d5e57c2c8f3be85a85a007270c860be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261125003956eucas1p215758cc5f1caa01a5389246c60b1d79a
X-EPHeader: CA
X-CMS-RootMailID: 20261125003956eucas1p215758cc5f1caa01a5389246c60b1d79a
References: <CGME20261125003956eucas1p215758cc5f1caa01a5389246c60b1d79a@eucas1p2.samsung.com>
	<20261125-swiotlb-replace-system_wq-v1-1-83807c6afb75@fujitsu.com>

On 25.11.2026 01:39, Kohei Enju wrote:
> system_wq is deprecated, and queueing dynamic SWIOTLB pool teardown work
> on it causes the following warning:
>
>   workqueue: work func swiotlb_dyn_free_work enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Use system_percpu_wq instead, which preserves the per-CPU workqueue
> behavior of system_wq.
>
> Fixes: e13d4d9a4915 ("dma: swiotlb: free dynamic pools from process context")
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>

Applied to dma-mapping-for-next, thanks!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

