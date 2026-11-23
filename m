Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424248;
	b=vUfTh0wkfLNxzFcWAHnV4/Cq2oT3ChH4gBw40/6XcEGCVCk05dZum2MrXLf6Kt8AboMd
	 h5SjfHLXH1tFDRRWTAV+qRJ3bpClqZ5ZinfouAs2c/W0mqa4yXE6FmDWrKNpHou9a9GDZ
	 taES69aSHPIJPIcTOBhmBeCMKVItqbzrwU9CvUnHbnnSeaOegbsYvRzrD2NylGwhXinLc
	 CudCuo5etisoaPLqMVLE6iRdFZ7759jhWlK091q9iPW4JEXrn4PVF99V058l3ZGoK9Y+F
	 fEK0wnsUJNcAdI3hZvwbdRjrUAXcEE1NXKyp9NG+p/OZT7EBHXwaHpFR0eMRt0hlGXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424248;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EN2Bg5eVxZXsvBNAnQoxpyUS4DRjW1tvWkJO+HXo9CY=;
	b=mF0KPhkPpPdx3JKS9qnZ5y4uqmeD5oyt37qeiiGuJUmzMZGAhHG15or8JjdB7GVDgrop
	 bmsufHe3Gkn0M9PUof+ncnjfQeqMkXbLSEci574PU99xOc2Iq9bpdOuqwiruKAMZIN5BK
	 0tBlqTAof2xPhB5tZ0SlVt0EcaTfFQZ7Bss/xUJ5gLrqQDKODCX8CfirdJ+SN1JrTJz37
	 /MK7BwzYUWf9HCyYyDuKTHcFNDm+5wJtAyDzFZBZ+qEF/wZjND/VWi5UM5YDkaFTxAAfO
	 Pt+TGPNZjMhJt5+cAgcqNtgW0S/igTnqwqYgRD+pxxYocXfj1lJMuuWzPOEK7zSFqjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90B8606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90B8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ECAAE2436B3;
	Mon, 23 Nov 2026 09:57:26 +0100 (CET)
Date: Mon, 23 Nov 2026 09:57:25 +0100
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/riscv: Use named initializers for acpi_device_id
Message-ID: <awP_4yyEoGoMggNL@8bytes.org>
References: <20261014-acpi-iommu-v1-1-1744523fa658@thegoodpenguin.co.uk>
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
In-Reply-To: <20261014-acpi-iommu-v1-1-1744523fa658@thegoodpenguin.co.uk>

On Wed, Oct 14, 2026 at 11:26:33AM +0100, Pawel Zalewski wrote:
>  drivers/iommu/riscv/iommu-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.
