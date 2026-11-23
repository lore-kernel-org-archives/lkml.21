Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429672;
	b=3ed5LX6AtmhVW2uMR0oyqmfupv0hFlkFBQnX8KdRksOtLReaisexKFIV38u89FP187sw
	 +7aBXk5474xxrgPOdwVZNv4n27nQmGrmROf4fSamysB+nc6iw88PTfME46JUZci4eCezS
	 BpGC9HFnkbyRbiQLnpTOLj4enelxc16qNC84/Kiv/Cq6STge5InbtuPBgUZcpHOubouSd
	 8ntXvguNSj6jDgIfDPmHl/jmGEbewM3TXSKlaiRsR34BIHDBHpiIy+RDJNTU/fxhj1o5C
	 TZnxtLvpZXsFIfPb4bkStP18Rjz5YNB1oPHWW8leNRrFtm2jrPS4HRzYI/duFfhbadg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429672;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P/fjNOsxL+AtNCe+JS3FMFLuB7GlTW24nnaYIg5FTsM=;
	b=IPt/Dyud+z7VAxBtvPJEfR1CtLao9Dk+rM4GcyHpRHFD5zuN3h3poTqgk5yjrZMUkMhD
	 Y6XEpKSRWXXTrZxKSe4khh7sS7qWK9WEAQbY0slEDrnas+J5TJ5ceL4WGNtZ14GPJmxXh
	 b3npZTSaXA6+35//E0DR0g26HUE4NUQZCpF7vDpPKeuy7KDo325kNq5sD5q3tTtz+dvOj
	 5iqXjPw8b8DlgS+QUJuu33MxQTFMOVQCTuoDEJup7O+UmTw8iX89ScdwAMfrrnSHaTw/V
	 OBtNTv1b0Bd6tBjptiMiIpp9hxc7Cjw5tsHcGde4/avud6lydIUjZZLABi6lsX7SlqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E02606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E02606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DE41B244826;
	Mon, 23 Nov 2026 11:27:50 +0100 (CET)
Date: Mon, 23 Nov 2026 11:27:49 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joerg.roedel@amd.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/vsi: keep the runtime PM callbacks without PM_SLEEP
Message-ID: <awQVEpz3c3dlQ7i2@8bytes.org>
References: <e8114502dc91f5fb709509291fdd85e27545dfb6.1792716048.git.daniel@makrotopia.org>
 <50f5f070-49cc-4a1b-a100-5cf918fed54f@collabora.com>
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
In-Reply-To: <50f5f070-49cc-4a1b-a100-5cf918fed54f@collabora.com>

On Mon, Oct 26, 2026 at 09:33:14AM +0100, Benjamin Gaignard wrote:
> > Fixes: 917ace84b770 ("iommu: Add verisilicon IOMMU driver")
> 
> Thanks for the patch.
> 
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Applied, thanks.
