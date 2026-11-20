Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196585;
	b=SO529QqDD3RIGlyBv8zeIQn+Ge6pL6Epm5eddXz0avLgJJF6r79LV1qfQAfQXeqEb3pH
	 5m7LB0tNg5/EUHoz2ygoQdx3Fhb9vFri/X3CGXgis3XDEGwuZz6hs9vfS4pn7oq54+fSx
	 eiZxqxJ9F+5RqcO5kMWIVgNq8wTS3TDW+hNFSipKtyYRyYo5nEPVbx/Tm6I9YMUaeWHHa
	 7vFLem2H7izATBRMR9UeGA2iYdsa8FgiPhMJf7638v1JnPylRKHWLD5ZukvXvc1n0la6t
	 aj5xiPkFdMtP3pAjfIIyOldbrYgwpNSRC3m1Q2KC6FOzr17HRttk29hHIjoDBE9+p3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196585;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=XPIu5x3uqDSf1Kw0x16maCUBjgEEEdDwdENGm22dr0s=;
	b=NsGmycuky2k9G5a/8Q8SEXwks0EN2L8k/4gjRgWxegNnCLV3Hxokx/yXNtTpKeVhvw3Z
	 zn/wOo0/g70dZkxlly6/lcRsh2xOQWEEMIj4GLNZaLWZggRbBHFESyD3iqExqC3jSqbG3
	 2PFlU2R58Hu1KF9IKCdbpQ+BmjHZlx73BF5r1ylq1zjwV9jn0NqLjpW9QyeEH9gfNSZ65
	 NltZ/BW2v81PA1NXuYaQWm5Gkwt9J1NmIHLxLCqcXWsvyXorQSgTw6W0stjFWNVV0uio2
	 YQMAwPTfvgMsJ0qhqkSQTsoonDZrTlBowpxDeoKUDupsjWKxLyQUlP2T9cMBBdtRlZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90C606B06A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C90C606B06A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0CE096732A; Fri, 20 Nov 2026 18:43:00 +0100 (CET)
Date: Fri, 20 Nov 2026 18:43:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Stephen Bates <sbates@raithlin.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: look up the P2P device under rcu_read_lock()
Message-ID: <20261120174300.GA1408@lst.de>
References: <20261116022558.560013-1-lcy8047@gmail.com>
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
In-Reply-To: <20261116022558.560013-1-lcy8047@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

>  static struct pci_dev *nvmet_req_find_p2p_dev(struct nvmet_req *req)
>  {
> +	struct pci_dev *p2p_dev;
> +
>  	if (!IS_ENABLED(CONFIG_PCI_P2PDMA) ||
>  	    !req->sq->ctrl || !req->sq->qid || !req->ns)
>  		return NULL;
> -	return radix_tree_lookup(&req->sq->ctrl->p2p_ns_map, req->ns->nsid);
> +
> +	rcu_read_lock();
> +	p2p_dev = radix_tree_lookup(&req->sq->ctrl->p2p_ns_map, req->ns->nsid);
> +	rcu_read_unlock();
> +
> +	return p2p_dev;

Not sure what the RCU section is supposed to protect here.  If we
don't get a reference the result can be stale as soon as we're outside
the critical section.  So IFF this is a real bug, it isn't fixed as
easily.

