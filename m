Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.101.131.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068775;
	b=xCxRD0T4Q6U1/9DGQ7c4x9kysrglm4cGVLAQdcfoL301OSKwtavCUOGdkY7yxwQozsFR
	 KrisOTWc8SdfOvVcWgbf4y2siCv0XowJdID4DVc71eyHMa+CZJeXKTPWcQAJ4Z/5meb5H
	 ssjfuJBJ1F0UUNfgr3xZnnW9LzyRbI/oCFNs+qKptBI7GohfnuJBWKgtIUiXFfC4n++HB
	 EtmPm8JP5FYs3F/vRmx2raA2TbXTfJauTXJSDY0gjWBOoNbOGAvatLXEnWQjVrrZh9Sow
	 V0L40KHI26HoxABPtipY+2GYmU2+nKxfsw6Moc8bh+DWdXdadmeO1s6upZ029J4qKxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068775;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xuH/DsH2B3m/szVpUJ5yxwbb7c6XFDflQWGSrQEmBsg=;
	b=euAO5IKM4EXmwTb8LrcP/nqxsP/jZqMYw0QoGpPeBUl2DvH+5udlcGiCkRlMGUUHdePn
	 Ac7Qp4SqcTrskoNiLnVtyXazVvXFQQFP91BdW82JPsXxkzmk41LolE1la43uL+2cXSEL+
	 gFgkFJ/6Y8m8e6rlze3d/4J+u3NEngkSvepvEH/eim7shnS/bXgfAQpts9hp5cot1YltJ
	 exR40je8w7evez919KiMzl3nFoyYmrlwiSVbfxZ5+/rB1OqEIyhS4b3mPoRY2fhcqvHWL
	 OtrELF0Mpos109qXPwDqzVhWs/zZeEp8PAO9hjHC/uQUjD3pct+HfkL53GG6R6FDRtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	arc=none smtp.remote-ip=160.101.131.9
Received: from na1pdmzitismtp02.tibco.com (na1pdmzitismtp02.tibco.com [160.101.131.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE74606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE74606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Received: from cdev-nkg (unknown [10.113.40.46])
	by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 7FC20852A6EF;
	Thu, 19 Nov 2026 01:11:23 -0500 (EST)
From: Lin Liu <lin.liu01@citrix.com>
To: jgross@suse.com,
	ross.lagerwall@citrix.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/swiotlb: Check the segment boundary in range_straddles_page_boundary()
Date: Thu, 19 Nov 2026 06:12:48 +0000
Message-ID: <20261119061248.2016804-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <8262d7e0-75e8-4bc0-932d-1d4e40b716de@suse.com>
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com> <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com> <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com> <20261119043504.2013850-1-lin.liu01@citrix.com> <8262d7e0-75e8-4bc0-932d-1d4e40b716de@suse.com>
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

On 19/11/2026 05:59, Jürgen Groß wrote:
> Could you please add a comment to the alloc_coherent path that the check
> isn't needed there due to the alignment guaranteed by __get_free_pages()?

Sure, will do in v2.

Lin
