Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197422;
	b=XlHzJacqJPSoINwSQYKN1+ChP3FRqjn2ayI/Ws1/Q5aeZI/fmFvIJBRLwFE3sesLAgfA
	 zhY3PJ2FUWTjYA0Y84VKCxeGCd3laOPZurcqahIPqKzw2gP8MfRxiSK9xHnLiEEQU3KJs
	 oD9JTkthhBbbdiygj0BgdgrKfccRWP5gMpSSbYrwLQ2WJA4hymJy+EBketDouN6ADtUao
	 xFp8poNVXLy8KlGyeV27NLUQt3t+vbq7Mruu28SuxXo5CNM1EFzACDCbpXQaB2/CvKqs0
	 h09hVVj2C2cIflJpV73/XJ8UDST+K3bX3CozEe/QCBS7CCalHDdmuI96QXCo46Zds8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197422;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=EYkR8mhr0msSh8nFwUE6S8O58BnOVMw5zVtGj1CTw38=;
	b=aQDzbiZNt/bvT4ZBZCs0u5cfsZFilUQfQXkw2oefpMND0I0ZjKEWJnh40G9GXp2fS2E4
	 zcCeMfrzUIT302yjXt/L7hI5uX0kTy4CNVPiuJK5x9Q7hw+kVfuq6UdHkI+yHJMrj3ZKv
	 egEpj7KOMGaYNxaSYefvploZHZZK1HucoCRNeiPdsvyH4m6aIDiaAbXUWiVXVUamLDzY/
	 GJqcfLuI7uPjEmt23Bs9dahc2WzaG6QXiBBxT/Wrx90a6of8fRu2dQxRsqNfbPGNQj0Gr
	 Odh0aXI+6sZmkXYfmnuotf327YpJNzwlr2ATH5DrxygkabSK3dDmkBrKz/jc9kzkxJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB64606A809
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB64606A809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A6BFE6732A; Fri, 20 Nov 2026 18:56:58 +0100 (CET)
Date: Fri, 20 Nov 2026 18:56:58 +0100
From: Christoph Hellwig <hch@lst.de>
To: Gleb Chesnokov <gleb.chesnokov@scst.dev>
Cc: linux-nvme@lists.infradead.org, sagi@grimberg.me, kch@nvidia.com,
	kbusch@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: report backend transport errors as path errors
Message-ID: <20261120175658.GD1622@lst.de>
References: <0099f610-a48b-4557-8515-e4df444262e8@scst.dev>
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
In-Reply-To: <0099f610-a48b-4557-8515-e4df444262e8@scst.dev>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Nov 13, 2026 at 02:02:47PM +0300, Gleb Chesnokov wrote:
> The block backend maps BLK_STS_TRANSPORT to NVME_SC_INTERNAL with DNR
> set. This discards the backend's transport error classification. A Linux
> native multipath host completes the request before considering path
> failover, even if another controller can still access the namespace.
> 
> Map BLK_STS_TRANSPORT to NVME_SC_INTERNAL_PATH_ERROR without DNR instead.
> The transport failure is behind the controller, so report an internal
> path error rather than a host path error. Associate the error log entry
> with the namespace, as for the existing access-denied status.
> 
> This allows otherwise retryable native multipath requests to reach path
> error handling.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

