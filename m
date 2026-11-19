Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.101.131.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795062917;
	b=nADqCyDcgXxcftynB2SzIVNxB8qaQ8r8M9+zMaRZLTW46XfZCeZyMS9N0Z7NQ71kJ+nv
	 x2ky0Bt7z/ItOKacgwczT5eQz5iVJCXZ2SXZXED6/6Qy9hcvPsl62JF9eH7Wl0qVfpXs8
	 txZqBo7FK9PcbpguOPA9i6G+uojr1QZ9cUVG8OHad4yBGFZFqW1hgt9pJLQvVSs4kGnBV
	 reFvTeZ1JY3uC9dO7BOfbcCn5RE2beCoblNxk2blg0z/Gnr0cbNaKrMG8u3h1fnE9fKmb
	 cZ5+6b2Of9CVj1ka/Roe7awFh7NgC0P8AFk4JJJb307wIxUb27qG6wAlNzX0AuCYgww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795062917;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cTmJof47q+b/KfH9VJxRR6BweF1uktVyJSMRr/xXAAY=;
	b=W5oKpcyHIHwQvTdQrI9ag/vzy0vC7+TmQH12feLmdl4IJcTUhyzsUgP1kxWN6d2sy5JC
	 ZllWxaH2PLhzAqDr9gjrukhcpnpWw8syblIgIXQVBuNqnTElAPKS3J4oAZbWEiuAd7A6T
	 XpoumIXR2/otijpdRuMboKQG2p+YrZXhCbqSHTLKBtzuVNR1PphrRz/Ll6rqY6B8PpCjP
	 pFBN5yLLo9SHOtOxyWICnEG5pqIL6g3LMGyvLB1oUrhOQ726Vtzfs6BIvzN16pWAMWPJM
	 aOLYQHXfRm4314irvuwOHEwwPbY7XvM78Op63oNpxlk6k0z0hoxHB8QefEWII3TqChg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	arc=none smtp.remote-ip=160.101.131.9
Received: from na1pdmzitismtp02.tibco.com (unknown [160.101.131.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA8B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Received: from cdev-nkg (unknown [10.113.40.46])
	by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id E413D8521FB1;
	Wed, 18 Nov 2026 23:33:39 -0500 (EST)
From: Lin Liu <lin.liu01@citrix.com>
To: ross.lagerwall@citrix.com,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/swiotlb: Check the segment boundary in range_straddles_page_boundary()
Date: Thu, 19 Nov 2026 04:35:04 +0000
Message-ID: <20261119043504.2013850-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com>
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com> <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com> <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2026 12:24, Jürgen Groß wrote:
> On 18.11.26 12:25, Ross Lagerwall wrote:
>> Is the change actually needed for alloc_coherent / free_coherent?
>> The allocation from __get_free_pages() is naturally aligned and
>> range_requires_alignment() requires it has the same alignment so it is
>> naturally aligned in bus space. I don't think that it can cross a
>> segment boundary then.
>
> Hmm, agreed.

Thanks both.  Agreed, the check is unnecessary for the coherent paths.
I had noted this in the commit message ("coherent allocations are already
naturally aligned via range_requires_alignment()"), but the code still
changed them.

For v2 I plan to leave range_straddles_page_boundary() and the coherent
paths untouched, and check only streaming mappings, with a small helper
next to range_straddles_page_boundary():

/* Bus-contiguous, but may still cross the device's segment boundary */
static inline bool range_crosses_seg_boundary(struct device *dev,
					      dma_addr_t dma, size_t size)
{
	unsigned long mask = dma_get_seg_boundary(dev);

	return size && ((dma ^ (dma + size - 1)) & ~mask);
}

used in xen_swiotlb_map_phys():

	if (dma_capable(dev, dev_addr, size, true, attrs) &&
	    !dma_kmalloc_needs_bounce(dev, size, dir) &&
	    !range_straddles_page_boundary(phys, size) &&
	    !range_crosses_seg_boundary(dev, dev_addr, size) &&
		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
		!is_swiotlb_force_bounce(dev))
		goto done;

A mapping larger than the boundary window also takes the bounce path:
swiotlb cannot find slots that do not span the boundary, so the mapping
fails instead of the device being handed a crossing range.

This is the shape of the version Jürgen first looked at, before the check
was moved into the helper.

I'll send v2 if you are both happy with that.

Lin
