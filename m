Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426823;
	b=SQHrBqbheY+EHjAcbqu3ABlrRtu9pvvdl12ph0t8ga7do+9zV8Ltakmp/6oiHA5CNCpD
	 r8ZMJgnlAwRoUWtBSnu8rOyQqWw28D9UZdVz8LyozPoTILP8UMXLt8hNyY4iOaL2sSCAm
	 1uRUJv7X6iD6XhfTnVN2GzLy4VslfDpHY3QzuT6GzJvmG87Wwb91GdUlnWhO9dLJ0sMZy
	 ejmHrGOxY26NcsIA/Yr6llH0mQbqRx/WMnNyjitK4O6x4886xKEssZ8PhCCfVM2FfhNhl
	 payGI2pUQJFM8yKJfY7GUq4qpuD58p5q/WZXvN3A9h+6Kh+Rj4iWbz8iJmXHBxdxyGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426823;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LTDf95qdwRLFA2ctM5WM0AhRXmDQTgYwwKUGT48lXbQ=;
	b=3Odrh0BA37WzFlM1nWFGE07/RvGbzgNozw+OWyy3v8x+W1BgpKNnL9IQFBj/3RSJixkD
	 8vbFLn/IYn/nmIDlG/L0xoi1YlznvzMm4cSK+ViQIeZRxPtbcnD5Q0UupA8nfAY4SInU8
	 lfQqGBPB2fnbD5avvSnCQq1YN9oobIAGOiZV92aThNgGIIgx5lcPXRaX1DFnI7SxI1WuK
	 dc6i3TRjnRwTWPloJpe5Ul2JW5o0EI55u83mvuk+eDJR3i9z1X2ic1iABoRR1zLou3tm9
	 WHQo5KavOxXiWd/8TzSg11ztVGO2NMFbEkm88YhxYMz1O/1of2bJFNtLCh1Dng/dBbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7DD606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7DD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 769BA244826;
	Mon, 23 Nov 2026 10:40:21 +0100 (CET)
Date: Mon, 23 Nov 2026 10:40:20 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>, 
	Yi Liu <yi.l.liu@intel.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] iommu: Fix attach handle publication ordering
Message-ID: <awQJ9aMCtQVDF1j6@8bytes.org>
References: <cover.1793729087.git.nicolinc@nvidia.com>
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
In-Reply-To: <cover.1793729087.git.nicolinc@nvidia.com>

On Tue, Nov 03, 2026 at 10:06:59AM -0800, Nicolin Chen wrote:
> Nicolin Chen (5):
>   iommu: Unpublish the attach handle before the group detach callback
>   iommu: Unpublish the attach handle before the PASID detach callback
>   iommu: Unpublish the old attach handle before the group replace
>     callback
>   iommu: Unpublish the old attach handle before the PASID replace
>     callback
>   iommu: Reject a same-domain replace in the attach handle APIs
> 
>  drivers/iommu/iommu.c | 88 +++++++++++++++++++++++++++++++------------
>  1 file changed, 63 insertions(+), 25 deletions(-)

Applied, thanks.
