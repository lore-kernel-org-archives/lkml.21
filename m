Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425074;
	b=LkOcLFysuy1/nUylRGFIT9pi1HVYBGp+OoElhYWYWac+0SzusD+XDMKOF0/ifWKE/aGZ
	 zS/hKlKu/VPAXNp/693VN3XdtEFJYRDME127X6mWAny/1Mi/j+pR7RNECk0NcYO8AooTo
	 4S6L8clBeWy6CxWXSzqplEOBPhaawTXj5SKNBKyUJplDTMFkr2JLtBuU1qrCf/HDRTFs/
	 hPU0+r8wnU1YOjwpXJIlsrN28h52n2SvRe0ucAOGDaCaaE5EYIvvRxbFWl1ILkbbNn2Cd
	 ohq1XPiA+S7TMfh/5JGZ1RtAK3OPN4Ktw6qWrKR19FqCHDtiaslU7b6WvYmdOgAZ6LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425074;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+ZRzLaxXm1TGryN+k8iYwB9yxKG7+19yrzZ8vxYeHKs=;
	b=jfzt22ZY8BRKZezPHF8l8+hSH+ZkUfi0Z9iqwqcjD5W0KZEH7Rt/dunmAQJ0H4v0rBxW
	 beRfaf99CjTmxnaxZ9Ag0CkSl/05FALvoM2IdX/dcbZVAYIb5CTAg/A/vcKIYBe40tb8s
	 B37N7u94f8+kBUhQlK+BsxfghMVEvh+mjry/ijSMpqJYiM1ahqKD/XwQ81DoEaFzE/7fl
	 X5bH1mNcHapcofr0WED4oGABPts/eF05EDDlXA730BTnh0X6ckCs/mx4XDI1YcA82gaRi
	 pQ69fcU8L2ds56JeAHAVu69KsBf4qFg5LzvQALnLKNhLywGmmtoEbaoY41TXuCl587A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3189606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3189606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BBFB4244C20;
	Mon, 23 Nov 2026 10:11:12 +0100 (CET)
Date: Mon, 23 Nov 2026 10:11:11 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: robin.murphy@arm.com, Andrew Jones <andrew.jones@linux.dev>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, 
	will@kernel.org, pjw@kernel.org, palmer@dabbelt.com, anup@brainfault.org, 
	tglx@kernel.org, kevin.tian@intel.com, fangyu.yu@linux.alibaba.com, 
	nutty.liu@hotmail.com
Subject: Re: [PATCH v7 0/5] iommu/riscv: Enable MSI remapping and IOMMU_DMA
Message-ID: <awQC8jVJC1mQYUTQ@8bytes.org>
References: <20261022154603.1374754-1-andrew.jones@linux.dev>
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
In-Reply-To: <20261022154603.1374754-1-andrew.jones@linux.dev>

Robin, can you please have a look at the iommu/dma changes?

Thanks,

-Joerg

