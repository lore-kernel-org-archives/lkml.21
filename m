Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597201;
	b=HEAKLPcnY8ifDFUPf3eM7RPT1KQO6YqXGe7fZZDsAUm9SUSSXSEhsOugUyv4hSkhdkU/
	 PtRqxlgdPssQ9kpmBQsURLDdwIDoD18N+qZh/C7kIzybeZZMb7/rVNH9B9rir3WToo9M/
	 KzVTEPuXyq138V16y8cIoxBE+uDOJQb4Vqeo3qKUppx4T0PBGdEmKrbV/zBhKOuDug4Nr
	 JYJvQM8ED1ZIOt4o9DGIQ6ikv7tWTzA8s/sXSMiJRgX8J/KmM5NJ7HwhlS1tPAda8XAE1
	 wnFVbBh8IX34qb3oAbs5688Z+0u+RQfiRNfCN+6N2MIw9cTWX9v5dRYoPwf9QTjCpCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597201;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=fmE63y5GbvGD8xqUFsMKla9Wy+0GhyWaclGZeGjPSXs=;
	b=BMpdzpgHC1XqMkC8UC/8EPYh6sGcVX63wLVCpkEY73TjugYZ3Ac/qGMCm3g/x1rh1wm4
	 omoWqoDwqHtITJAY+++jbfJA/gLpbYwjwx07jy2t+uznnfdAISHkJ+YLxl8YAypqULG0l
	 Ap218t5Gcd6YaNtjB8WUbuOqPes8hgWn8dsQ/JoCoO8qzvSBJssQOOkijUELZeGfo1bN5
	 hcYiwZN/yZQX1aEDh1eOv5N6JFKnYu2IHBtXAC13H1LUKRP4i71o7b+t0buRrf18yvIwy
	 yADs4AVbG4RePUFZfGdt8q3Js5NvncjjcRDXWBTVvqXTftENBMKcY3dxxbC0fR/AxCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=t6IpWgNP;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E083606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E083606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=t6IpWgNP
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261125085958euoutp01abad63b0cceef1ddc71617af1bc1e73c~rPiNnveIN0063600636euoutp01M
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:59:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261125085958euoutp01abad63b0cceef1ddc71617af1bc1e73c~rPiNnveIN0063600636euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795597198;
	bh=fmE63y5GbvGD8xqUFsMKla9Wy+0GhyWaclGZeGjPSXs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=t6IpWgNPp3LldJKuqPzJKYc5SnTiDVN2/4qCyWxmKNwhV9rbb1crQM4I5oVoJWSbZ
	 Htnp511kw9IvVegsKjEbttHuS4Q2088AOxT82nlKfxr4aP0t3kvV5KIHlAuK2oqaZD
	 7mLFDiBdL1j7PIQga1QROH1oBax67B89njoJ5svA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261125085957eucas1p25af1d716812754c32457b6bf7eba2913~rPiNR1Ahl1208612086eucas1p2B;
	Wed, 25 Nov 2026 08:59:57 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261125085957eusmtip1aecd70be8475f54e95bb1974d4ec22e6~rPiMxn-GO1659816598eusmtip1d;
	Wed, 25 Nov 2026 08:59:57 +0000 (GMT)
Message-ID: <513ec8b0-406f-41b2-98e7-7d0a6b45865e@samsung.com>
Date: Wed, 25 Nov 2026 09:59:56 +0100
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
Subject: Re: [PATCH v2 0/2] dma-debug: Avoid uninitialized mapping dumps
To: Avi Weiss <thnkslprpt@gmail.com>, robin.murphy@arm.com
Cc: ailiop@suse.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <cover.1795093513.git.thnkslprpt@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261125085957eucas1p25af1d716812754c32457b6bf7eba2913
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261119131338eucas1p27f9133a1cd8163693686c18713518313
X-EPHeader: CA
X-CMS-RootMailID: 20261119131338eucas1p27f9133a1cd8163693686c18713518313
References: <CGME20261119131338eucas1p27f9133a1cd8163693686c18713518313@eucas1p2.samsung.com>
	<cover.1795093513.git.thnkslprpt@gmail.com>

On 19.11.2026 14:13, Avi Weiss wrote:
> Booting with dma_debug=off leaves the DMA-debug hash buckets
> uninitialized, but the debugfs mapping dump is still registered.
> Reading dma-api/dump then traverses an uninitialized list and
> causes a NULL pointer dereference in dump_show().
>
> Patch 1 skips debugfs registration when DMA debugging was not
> initialized. Patch 2 removes the obsolete debug_dma_dump_mappings()
> helper and its only caller in the legacy AMD GART IOMMU code.

Applied to dma-mapping-for-next, thanks!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

