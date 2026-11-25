Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795584332;
	b=ysS2r/ZXUiV8/swlk/qx0UoAF8VLy40pcf+VajoclJ+5VoNQzhcE2uOOcuiP5UAkTjYT
	 uVYFSIeoUsHat2CuqJyhVkuVVb+Z/x5d0CndMSvH2F39hXxZ/n5WrAgTnJSNI2jG9dLkn
	 WYdXrF7v41nHl4DFtmGHJq+3w4XV419s33ZptbC9VTDG5XqwQuCPSkEmeS+HnD/nsugIx
	 EA1GdZj9REZ4gGSfkfYKukzqIyJHJhI4KBLpepq1kazi1L8VtnZ2yGFBN7ZCsC8ZrpwY4
	 +URPqvWDHYBTomOk40ryuu1Dxv5Z7GTHu7nZ8MEUKiw3SUaID8vLWcmKbW1LonGku0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584332;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=yEju/UDuzsoEZFYhqem8RCot1duiKzAGUN0hQxlAtESN93RDo5JLq759nQEx9llWRxBu
	 VSxY2R/DOGE8b0OYPB8BOGjapnQfho4LLoLyRzAvfOlggbhgLWngtSGaZulBIQuZu4Ef4
	 WG5OkAzP8lkvg6UTh54gjIhbrMeP4n981RbvOdrOANwY8a8M2uPWH3wI/7XBjEbxDpILZ
	 8gc5vIz4ukPmDQ3CaVDSsRJzyFJtl4X750UZ3Qx4qSipEK4bZ4j9CkFtGb3y6fQOa/p1H
	 SGOzEi9dfKsA6FYUGgqk3zXa0y1YoRWbB0rj9WdZmQVJ3/3h3N1PrXY+oOG/Yrs1eYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222A3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 222A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A5DE468AFE; Wed, 25 Nov 2026 06:25:28 +0100 (CET)
Date: Wed, 25 Nov 2026 06:25:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrew Stellman <astellman@stellman-greene.com>
Cc: Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	Steve Wise <larrystevenwise@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-fabrics: limit nr_write_queues and nr_poll_queues
 when parsing
Message-ID: <20261125052528.GC20248@lst.de>
References: <20261122233951.8912-1-astellman@stellman-greene.com>
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
In-Reply-To: <20261122233951.8912-1-astellman@stellman-greene.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

