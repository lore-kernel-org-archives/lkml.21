Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583774;
	b=sPbJKjGjOPNg0YnpBcpwx6IsSFQ525LuXx5R4a1JhxVHtfL8BNuNBL+MHaIQ6cvE34DY
	 AwefVt/cPtm1bOe8paGjd0STCFaP8d+bkJh7re90n2YaDEB74w3TJDWhA+PuOlYrm4zL5
	 PYk0fg0mHnk5jDkgDL0upgbHhwb1lgD9En12uNVSioM2IEJKd28iozFQ9Bb1+Puk7+8si
	 7HolvJzQpsPouB9SG5yXg7RLuNR1D6HOBIJvKDI0osqa5KqdH5xUOZGvVQBnMgya1Ut/E
	 +GpHg0M0lAQJCp/pOsYNnF3cueNzXexQHaBuDeLU5EWUUii8jscKxfN9me/1pFQBYTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583774;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=jR76uMKfrswWIyroPa1Qo9yd4PvYEyj59LKtfnS4WWw=;
	b=agv3fe8h9M99J2UlPXKjGFrLGQsYH3BgRNNNO5A87sWALOQ8/ghTyBKFexZ+9zVcsKgo
	 wIaNHpSQyBrO07Zop/2NgKnODMU++C7aUacYFAyj6j/JvdT/6ZZKSFkyHEtfALRVOiKSH
	 b4eutazlTFxDzRVkrblxGWqHFsaQ6Yq+zFqa5bjgei7MpfMvNLZdkAz9o8++CJkfVeDUu
	 MdUtOGn+IbdxpEGPJfkWzs3p9uk+3SVXfD8qhwR+eI+TnENfWNyBuBgwsW2FjlaeT+UEn
	 a85bqm+TVIiNtDOdwXXBqAcHfURauFUL7I/ZgtUjNz15rxwTuLHwqAS+AVsAmyT7M1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76495606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76495606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A43F368AFE; Wed, 25 Nov 2026 06:16:08 +0100 (CET)
Date: Wed, 25 Nov 2026 06:16:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Cc: hch@lst.de, kbusch@kernel.org, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	kamaljit.singh@opensource.wdc.com
Subject: Re: [PATCH] nvme: reject an administrative controller type on
 reinitialization
Message-ID: <20261125051608.GA20096@lst.de>
References: <20261124133122.4167640-1-yhlee@isslab.korea.ac.kr>
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
In-Reply-To: <20261124133122.4167640-1-yhlee@isslab.korea.ac.kr>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Nov 24, 2026 at 10:31:22PM +0900, Yehyeong Lee wrote:
> nvme_init_ctrl_finish() takes the controller type from the Identify
> Controller data, and for an administrative controller it overrides
> ctrl->queue_count to 1 so that only an admin queue is created.  The
> Identify data is read again on every reconnect, so a controller that
> reported itself as an I/O controller on the first connect, and whose
> namespaces are in use, can report itself as an administrative controller
> on a reconnect.

Well, we'll have more issues if a reconnect changes the controller
type.  So please check for that just after issuing the identify
controller and reject such a shape changing controller.

And please cut the commit message down to the basics.

