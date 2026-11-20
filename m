Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188382;
	b=nQBbAd248vqQyVFD+D0fa1HFjZQZnYiZu9N29OFLFz5pyKHwWaGkamQGExgaW00aKrwd
	 5es44jFgexWTjhm9gHGAz0EWwMc//Jadt/JDlQwc3yKGvF5SpbEVIxZmEhgoEYN5sPRF5
	 +5/Qq68yZIoRrI7JFpS2JQeZJiqdh9t1EsNiQMPSaaD7OKcUNc2ai9S4N7+1lpf9aYbha
	 6CmY0AHUuZVS7LdUBE91vcnNN5KUU+3W1ulz5THQgw8Rs8I73Vwl9Fg9WSXK5Q2Y9qjuh
	 OSIEYlLkcF16hdGh/iX0wqtpQWqIVS3UM8TcYHuxK8b2RX1aoqr/EreJC4q31fhTIvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188382;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=IKp5sXqipAnu8+vOSKxoVLRtLqTLVKb0WJepsT5T5QA=;
	b=LAiIWYhCM/pb7KhfVocrXWEMQS9lEnN3eF4QJ6iC7Zvc8mIbqHBMLb7s+xFrDFpLAlv6
	 +HicCPrta3B9XWWuKuykRsNrmz7qlWnT/Z/WL+9ZdCXKscgs+PioopgibABfzELv8/Eov
	 V9SLpwR6Kk9LFbwgPo+7yv0EBiPPdCT3EYMi6MYh8HX2B5KEbfTPEMk+TJKwsGIKYDwmc
	 DiEN6VNqAjz3gkl3v7NGYWobrBVNZ0kbFYAdtrmuuY2E7hnKkd1IUpGZ/oAx9jEUC8to1
	 fD3Lh+qWCYXnRS1QxIJcM98Dc5/r+1UgR+Qzdd7IZZ6dWU8dbkRR6+Sq8ND4Gt/Zxlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Qh6lSEvL;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FF3606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FF3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Qh6lSEvL
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261120152619euoutp01a3d52c290e863eb049003d85ed711867~pylHW9obh1973519735euoutp011
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:26:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261120152619euoutp01a3d52c290e863eb049003d85ed711867~pylHW9obh1973519735euoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795188379;
	bh=IKp5sXqipAnu8+vOSKxoVLRtLqTLVKb0WJepsT5T5QA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Qh6lSEvLI8FK0PsurlPQxHOfrn/+J8znThDsLXqo0X9Y/ZdVC64l/dKqh/E+ZhY5q
	 hAjg/fKMfeFa9FdtjovK0vx2WL5iJaJyP6j5jBgHCRVlFMUPlsSTCa0y02fFSBXuid
	 TKcfwqZ9+0SDN+XmeWfrTcWGKs2mYN5tI1onBG48=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261120152618eucas1p150bf7f9becddb3cc91560dbf095639f6~pylHDNDwT1906219062eucas1p1k;
	Fri, 20 Nov 2026 15:26:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261120152618eusmtip28ab8b8495dadd64b1427840d1af6ce17~pylGag2Xz1849318493eusmtip2X;
	Fri, 20 Nov 2026 15:26:18 +0000 (GMT)
Message-ID: <a58ae41b-4ee6-44d6-bd4c-56e51b19df60@samsung.com>
Date: Fri, 20 Nov 2026 16:26:17 +0100
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
To: yzddMr6 <yzddmr6@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAB63uaFw9QjjN131UjiJvpp6qHM+xw+-9wEcujuNoYVzhmXtOQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261120152618eucas1p150bf7f9becddb3cc91560dbf095639f6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261120131146eucas1p2d05549af0404d6af77ce3e9385e91fa7
X-EPHeader: CA
X-CMS-RootMailID: 20261120131146eucas1p2d05549af0404d6af77ce3e9385e91fa7
References: <CGME20261120131146eucas1p2d05549af0404d6af77ce3e9385e91fa7@eucas1p2.samsung.com>
	<20261120-upstream2-swiotlb-rmem-kvzalloc-v1-1-1c5f9b503223@gmail.com>
	<7cfe91c5-4053-44bb-8c18-612fcda90e4d@samsung.com>
	<CAB63uaFw9QjjN131UjiJvpp6qHM+xw+-9wEcujuNoYVzhmXtOQ@mail.gmail.com>

On 20.11.2026 16:22, yzddMr6 wrote:
> On 20.11.2026 15:18, Marek Szyprowski wrote:
>> The change looks fine, but according to kernel rules, the patch must be
>> signed with a real developer name. 'yzddMr6' doesn't look like a real name.
> Hi Marek,
>
> Thanks for looking at it.
>
> yzddMr6 is the name I use consistently for my kernel work, and mail to
> the address in the From: and Signed-off-by: lines reaches me. Since
> commit d4563201f33a ("Documentation: simplify and clarify DCO
> contribution example language"), submitting-patches.rst asks for a
> known identity rather than a legal name, and that commit notes that
> nicknames have always been accepted. Mark Brown applied a patch of mine
> under this name to the sound tree earlier this week (bd6e011c8121).
>
> If you still need a legal name in the sign-off, mine is Zhendong Liu;
> let me know and I will send a v2 signed off as
> "Zhendong Liu <yzddmr6@gmail.com>".

I would prefer that.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

