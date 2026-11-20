Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195578;
	b=NxurHmA4GKMuonfeDaXTMFoXAscpDMSi5LwUTChiTGbvGgIdtFBcbYGIY62vRGFFsfsa
	 zsO+yWbdE+bTbXHI9VoHCBFs809Oy80Zkc+gwUnayxyYEm6m5aHi3NvTkyNGkOqoyqFWI
	 gCcY8+o0/pSkl1SheSiYu/tKxebPTuxU64XZqe6B/PfGhJ6iqne6aFl7PtwcoLz/ueZY3
	 nEX1ityKzCsb+Q/RBoJnMzC5psaGrr43SODTMczawU5moXI5d1c0zuwwkIxUzMBOIhLEr
	 aCIHNZr8UM1Z+3Cqd633He5xWOTICO80HRWRKIh46kLMiD2KI6kv0FX/g2cBCoQOQzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195578;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=fj5lo260dYvQAeAPMJArWPIv25ADO1FHWkm4Gpv3BMo=;
	b=vspMbXLqwizE/qV0OypSDVMgC55dZSeAGSu8+7+em1KjAOc/kRNPUZMb3VlhJLsV2cnU
	 aGOTFrG+likB/M5Y12p1WbdtmXCkUaOCA+PqeIxSrGx29ctMPq8lordn+i1ohHibjYbSB
	 Z7bQ/B14Hoalvo7NSg7/WnFn7cUCuotUS9FKubnKYh2BQ44645Bv6agXPbwP07xa031a+
	 NjjM/4juuWDn9ty/+wAmNrX/Owdf3JXEwy+wgDCCMeBeJFQhbE9oyFfmj6xhUizgbs/HL
	 LKd6MG+7/Gwj3hhPH2LIVJ8sWWkhNPBEllRpsCc4aPdGM4TmL3esZDryn94cVlHpWAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8808B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8808B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5595F6732A; Fri, 20 Nov 2026 18:26:14 +0100 (CET)
Date: Fri, 20 Nov 2026 18:26:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH v5 2/2] nvme-multipath: don't wait for a grace period
 in nvme_mpath_set_live()
Message-ID: <20261120172614.GD941@lst.de>
References: <20261119-bug-nvme-mpath-set-live-srcu-v5-0-e1483e2e447f@linux.dev> <20261119-bug-nvme-mpath-set-live-srcu-v5-2-e1483e2e447f@linux.dev>
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
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v5-2-e1483e2e447f@linux.dev>
User-Agent: Mutt/1.5.17 (2007-11-01)

> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -712,6 +712,11 @@ static void nvme_requeue_work(struct work_struct *work)
>  		container_of(work, struct nvme_ns_head, requeue_work);
>  	struct bio *bio, *next;
>  
> +	/* Let bios that found no usable path reach the requeue list first. */
> +	if (!poll_state_synchronize_srcu(&head->srcu,
> +					 READ_ONCE(head->requeue_srcu_cookie)))

Let's use a two-tab indent here to make this a bit more readable..

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
