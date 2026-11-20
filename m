Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184323;
	b=HP/7iPcx4esl+70yeJwHdZFXtHvLYtHfbm4iYsuVrABQ1IcCCLIAhfEZCOFj5kb8LeUy
	 VJKOBlhUP2OgAtyM1MLHYRQCjyZT1JEu7/GMIIFVAaW4eyLB++2yakcN9efan4ExV0Sa+
	 Xl4Oc1wAdl771vOUmIr7OdWsM66cbHU98G5GxbnbBtedYkwdJl52Q8vz8HyfNUWrzxXLZ
	 iSAXsWCp3r51cIAN/zkJU/GXuY29AqUdjd04bYWuuWEJU8ihBXD7sUmTTL9f10a8/sYox
	 YDYY1lGelNXQ6BH7a0GOus3DT7Awpy3eOXbj6ZaOYcPfZjriR4ROK5LZTY2kZPEU0pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184323;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=tchBVgJeJy04vBo/BlAAOzVIUxBgTws/k6WQKEwIWWw=;
	b=FPTAzfUh66hL6aGnmQS+1tbsRl4F3c/xklijhl23G5L4pkWTWHNzEwCBxf8WXx4v71o4
	 TnkrU1pMvigFwDWExCXIEBEp/dKVTxx/sISX1wplnQyavykZhQVkpYx3/tyHoLZqHxr/J
	 tpraGvzqz518fnWvQOWlT9lp4zTGgAGh/AdRNO512osrzGIUaQg8Jxa6g/uoOM9l4aWnA
	 0HOhMk7SMlkSDFhgiCm6bX0X5K0+9YzRlvj5cWrB2MDxNnsaznEKoYNOqQseZl9B44qRq
	 tvvldf9RFfRE5sKyZVXv/4XjhAAUH2jNCGOdBVH0i14+tgZbEnhOj+h1fMtNMjx4JqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XI6AB4iG;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9F1606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9F1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XI6AB4iG
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261120141839euoutp02e557a236305e7e000e427331e46901b7~pxqCz2QBa0192901929euoutp02I
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:18:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261120141839euoutp02e557a236305e7e000e427331e46901b7~pxqCz2QBa0192901929euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795184320;
	bh=tchBVgJeJy04vBo/BlAAOzVIUxBgTws/k6WQKEwIWWw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XI6AB4iGzg8JTHnOsvNZvZFYWTjE3vniGMB74Dcz56hRhFZtclpVGEuZ3oWzfj3/E
	 rdaTT+i2pUm+MKDdmVycwR6y5GtozK2lp1fhRu7TSBUGrzWQJJwQWnYJG1Xw5lJ4MT
	 twM561yXSqAKdt+UcI64uox75FiVGZv8+ExO8tk4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261120141839eucas1p147101d35489752f566d91b788a75dfb9~pxqCihgoM0385403854eucas1p1t;
	Fri, 20 Nov 2026 14:18:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261120141839eusmtip24357cb99294f8e6577a6683ab3a0f3fb~pxqB5949W1268112681eusmtip2Q;
	Fri, 20 Nov 2026 14:18:38 +0000 (GMT)
Message-ID: <7cfe91c5-4053-44bb-8c18-612fcda90e4d@samsung.com>
Date: Fri, 20 Nov 2026 15:18:38 +0100
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
Subject: Re: [PATCH] dma: swiotlb: Allocate the restricted DMA pool slot
 array with kvzalloc()
To: yzddmr6@gmail.com
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261120-upstream2-swiotlb-rmem-kvzalloc-v1-1-1c5f9b503223@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261120141839eucas1p147101d35489752f566d91b788a75dfb9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261120131146eucas1p2d05549af0404d6af77ce3e9385e91fa7
X-EPHeader: CA
X-CMS-RootMailID: 20261120131146eucas1p2d05549af0404d6af77ce3e9385e91fa7
References: <CGME20261120131146eucas1p2d05549af0404d6af77ce3e9385e91fa7@eucas1p2.samsung.com>
	<20261120-upstream2-swiotlb-rmem-kvzalloc-v1-1-1c5f9b503223@gmail.com>

On 20.11.2026 14:11, yzddMr6 via B4 Relay wrote:
> From: yzddMr6 <yzddmr6@gmail.com>
>
> rmem_swiotlb_device_init() allocates one struct io_tlb_slot per 2 KiB
> slot of a restricted DMA pool with kzalloc(). The struct is 24 bytes on
> 64-bit, so with 4 KiB pages and the default MAX_PAGE_ORDER of 10 the
> array is larger than KMALLOC_MAX_SIZE (4 MiB) for any pool above about
> 341 MiB. For such a pool kzalloc() refuses the request with a
> WARN_ON_ONCE() in ___kmalloc_large_node(), the pool is not set up, and
> of_dma_set_restricted_buffer() warns that it failed to initialise the
> pool. The devices assigned to it then lose the restriction without
> their probe failing, and use the default DMA path.
>
> The slot array is only accessed by the CPU and does not need to be
> physically contiguous. Allocate it with kvzalloc_objs() and free it with
> kvfree(). The other pools are not affected: the slot array of the
> default pool comes from memblock, and the buffers of late and dynamic
> pools are limited to MAX_PAGE_ORDER, which keeps their slot arrays
> small.
>
> Pools of this size are needed when large buffers go through the pool
> for their whole lifetime: this was hit with an arm64 Gunyah protected
> VM whose virtio-gpu resources stay mapped in the pool, and a desktop at
> 3392x2400 needed more than 341 MiB.
>
> The problem was analysed and this change written with the help of an
> AI coding assistant.
>
> Fixes: 0b84e4f8b793 ("swiotlb: Add restricted DMA pool initialization")
> Cc: stable@vger.kernel.org
> Signed-off-by: yzddMr6 <yzddmr6@gmail.com>

The change looks fine, but according to kernel rules, the patch must be
signed with a real developer name. 'yzddMr6' doesn't look like a real name.


> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

