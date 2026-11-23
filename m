Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429772;
	b=TzQYDlzJexj2CX9L7MnxIvRmVN9b4DopvEseJUK2hufbqC6Fplp6+5jrpUvD3lG8iDgu
	 2Azalj4div2vWxvlcfvIZwNABaxYll/trmmOwf8PnsdO/b2qv4rqPmW+HCwKrpdi11Mk0
	 MxQBlyrQ2obAREz8BxC4qcQjtiPuTARjEJMUA8azs/r/Ph/qQYdSiU9oOcsHhRzEvFvQ5
	 YO9yUP7PqEWbRGaQKoYFrPos1JlM98YP18aPot/mZk5VorMMGys3QZETj0PFFW6FLUR7J
	 LfysAU7Om8HzJIoUATIpK27tekQn2sEcPR7HM3H3AMaT3JV4QJZYuKflR93Yu2YiCuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429772;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jndRP0KHeEAhLbcGZ7O6vlSEpn7B250QW9w4/f7LcOQ=;
	b=XyiFRtX3GrtfUaBgUs832TfpwHUdTin74LgEDfaENuTXrz6z/jTGf93dPMWvPOdYx+1U
	 LGApwKyenmp8QXQALBINEkFFSELQ4tR0bpGH2eM7i+1AO7Zmjp7UqQgPiOfLs4HZnghVH
	 Ki/BL2iCOV0VCUMPlakq8O6OqTmx9/RrvJZY31hXP+llGENmZ3/vIOKDpgn9SEF8BQrMm
	 6RUD95+rHXDfzoT7fySTUchQCUXWI+TcHOAAMpHF+f7J4dsl+XDFlvPZGc82ZI2y4cVFt
	 43T9Y+RWmGIOuj9CirpbjRmA0i3hUMpwIJANpCY4p3srDWPX6aFhdM9UPLYxTQN3nug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0BE606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A0BE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 39291244826;
	Mon, 23 Nov 2026 11:29:31 +0100 (CET)
Date: Mon, 23 Nov 2026 11:29:30 +0100
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: aiyengar1990@gmail.com
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu/vsi: Fix the runtime PM of the IOMMU
Message-ID: <awQVfiCrm3CABa_0@8bytes.org>
References: <20261113-vsi-iommu-pm-ref-v1-0-fd917eebdf18@gmail.com>
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
In-Reply-To: <20261113-vsi-iommu-pm-ref-v1-0-fd917eebdf18@gmail.com>

On Fri, Nov 13, 2026 at 08:04:35PM +0000, Arun Iyengar via B4 Relay wrote:
> Arun Iyengar (2):
>       iommu/vsi: Don't leak a runtime PM reference in the TLB flush
>       iommu/vsi: Don't resume the IOMMU in its interrupt handler

Applied, thanks.
