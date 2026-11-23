Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429832;
	b=EpjuAlNojybqR0RBK0JGigukb9FVbC8+c/KzjQRJVOr9GDVSZYW058s7rkM1HT7HDN21
	 GT4MdoOoZhxsPVeeSUA7GJh6QKv1CxdgRbOJuNnO0fNoUZOpIddhmgVmQId6X8EeAlSYV
	 yiSBt8Nlq4xpkht3d6UO8a/ZoY0uSZChTFgQYjjmpjmeJpQa8jJFVAf/oFM+ZXCRI1c5+
	 6bZmBD1q9YHfLH88E7m95m5DgJG5q6XLLXsdCs0awDZSjz+hGOTY10cGypG5JTnPnZvqD
	 nLP2TdVUDQvbq0WSjQFuibeautfHkhpnu7BinrvfcKVm8mpzrrmvjFRaQR9XKLrO2rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429832;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HZquuzvV18riLhVL8pdJzlAV7xVd4ucIjKc24kt0UaI=;
	b=g1V82dFlrFLaGhcQihC0qrd6nqEVuVE8FAKutxZgc6gyo5QDeuSJiMHKgcAcYjCFPc9T
	 lyfP2Tq/z7jY5TB3uZhllE8RBYmi2AO6HKm1Pgr4Rl4PZvX06arcILELtAkTMBcP/moum
	 ZhYj/a5026ay6HA0cevYZy0Z2pLjD+Dd2+ONZdADGxvd7rZat1J4+p0w40doSGXLwmNSB
	 hwPCHZ0oYdS9tRI3extiz+AY/1c/mR7KRQLumhAHlvSfBaOya8arw6b+plloNzkdJumm+
	 uUrysw9qHKJzohH2tiAokMa0Dtgr/x2ZidKLtldTmfWKSEBZmqnG+2e+07JDZyNJ8/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D995D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D995D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 85EC62436B3;
	Mon, 23 Nov 2026 11:30:30 +0100 (CET)
Date: Mon, 23 Nov 2026 11:30:29 +0100
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: aiyengar1990@gmail.com
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/vsi: Don't write the enable register on suspend
Message-ID: <awQVuJHpH54HAd0q@8bytes.org>
References: <20261113-vsi-iommu-disable-v1-1-94f7f44540b3@gmail.com>
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
In-Reply-To: <20261113-vsi-iommu-disable-v1-1-94f7f44540b3@gmail.com>

On Fri, Nov 13, 2026 at 08:06:43PM +0000, Arun Iyengar via B4 Relay wrote:
>  drivers/iommu/vsi-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
