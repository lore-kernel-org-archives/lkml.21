Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425911;
	b=2l5u+Awh7jwX02Qn5QXgKRyjGcoulcZkx6FCuYzHoRfnJ4AZmhSgmYlW7r/q8njyvWku
	 ylQRnfRPts1zq0ub469T0gO+/ctUEp9wXh0u2ASFvNqjXlTD8sqyhQaYp0WXT31DbPZzd
	 n9K/MpzIMtxhw167gNEllF/T8ovh9IX25uKm4z1YM+wWUJ+Tua9fqA+mccGcw4CnU7eAB
	 xqwPbf+/BuvhOPRRinPZ0ZGmJU4trMAPaxuUUJdz2eiEoxncO4bbVuwGU6Z76hipySqjA
	 E1sRdgHMvZ9B5tLL0n/x27jjzUWYnw2Acj9IAm6MitcZ4IeZ0pfnz/uD99gElUNDXJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425911;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EGHXVFudJQgrigdJDc3r+sYIi6a6KP1wbs0YNcEORm0=;
	b=xaO2cHZlSihEeobBKUckVLCFyCGdEOFQN73SeU1XlWEjCyN9admfUpE6QRGMblsWLyd/
	 6y8WUdH37KkqioxiquCadYVkJE+QBeq0rlJaDsUp6gQ1LljEQQdvxGNMzXk3SeoeFtJcG
	 qK1J0XXfHTXheaIyV2bWPtLvUYhURb7rPAhZcllSCVWlYRI6Wi4om4xyLo6nXHfGGBgE5
	 LYYmKQebcXYDwdiPzTbTjQwQbEEUe+IkHqPlQFqlNkRBzVX6NYf7bsBjaXkbNX6kVSPaU
	 OXSVBsyP5U1nujO4/4/fp66u0d107x34YnzyNrsDBhYVBOPJSsrwbwZtS8ld3ZMfuAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F98606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F98606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ECAAF244CA1;
	Mon, 23 Nov 2026 10:25:09 +0100 (CET)
Date: Mon, 23 Nov 2026 10:25:08 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: fangyu.yu@linux.alibaba.com
Cc: will@kernel.org, robin.murphy@arm.com, joerg.roedel@amd.com, 
	jgg@ziepe.ca, jgg@nvidia.com, dan@reactivated.net, vasant.hegde@amd.com, 
	kevin.tian@intel.com, Ankit.Soni@amd.com, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, guoren@kernel.org
Subject: Re: [PATCH v2] iommupt/kunit: Skip the page-table leak check on SMP
Message-ID: <awQGZIKqZOHcuTqP@8bytes.org>
References: <20261031085536.18555-1-fangyu.yu@linux.alibaba.com>
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
In-Reply-To: <20261031085536.18555-1-fangyu.yu@linux.alibaba.com>

On Sat, Oct 31, 2026 at 04:55:36PM +0800, fangyu.yu@linux.alibaba.com wrote:
>  drivers/iommu/generic_pt/kunit_iommu_pt.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.
