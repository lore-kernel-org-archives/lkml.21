Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103305;
	b=LuY/kqBTPCXBDUbNAub6qFKP8TA5kFdM70CUGiHcZt3oeEfUv43zFTDXX0qoNnWAZm2u
	 PweLYIHQcVIq235TEmoyOD+A5AFfq8wivnv2HxRILPzIULEiHYzL0yW00D34WBl2bOkr/
	 NtUFXMJ+l8jrh5y+BUKOF+8BwfrhLyXdr1pvdQ65bnS8hHchIN9vRdQ38qSYjiShe/4yZ
	 Hla4O/x2Ww8dKf95GW47AAvIw3t2NQM5uR9HOhXK5XOFfQdkZyK0FNtTgAynY44kyXIhC
	 YVlYn4O9kJLCppbEt0AdKsLx+2Jp2ji/19XjoVyYgTzo2eRi6j2t1nR2PCl54st4U3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103305;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v4Z7Bg5Q8BwMgeKj6qRK5d/0C8sEm2VXp7FSC1G/t8o=;
	b=5liPLyRM+6UELDQyl4UPPtfzyi5ovVHXsyQo/+yu9l+ZhwbuDq7H/MqMM3j2LqkFAVJ0
	 NJq7gkNY9pWw4MgjSz7+GZ+fCl6Eqd3EguTxQSESTF21qTki43WMzoezPHe+UZXhVuLAZ
	 iC+DC+sZ77mXYsoSrf6PNO87wAwOTys56LSVDV5MS7i9itKpqwO0vsdIYIlS8eKP+8DbB
	 g8I5JzZ14P02XoDKKUmG98bEbvBtCqMyboBewiMZNUQ/cHUwmW1tQ4Fu4UDr5bTNFgdVR
	 QbeGtEV44JZJ1/BQthB6LiRzFBfTalXGFH1HQAnNmH7LwEGFfxcnes1dHrQLLyDj8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PNoWtHMc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9044606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PNoWtHMc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7261F000C6;
	Thu, 19 Nov 2026 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103305;
	bh=v4Z7Bg5Q8BwMgeKj6qRK5d/0C8sEm2VXp7FSC1G/t8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PNoWtHMcBjHZbdNd0OPVC5p9XPeA1nE6UC6/HDzLnjQ5DX3bZp6nTF1uuQNy7Dx84
	 5xBr+bHmMUjedKzyw7q7wkKuQZL5uxMLgekVSsLrKrRzvHT+Rjx/vH9rmJeb0mEzRo
	 jA5MANOUrTCUvG06CW/7fL57g8NACFRXESIYVGTESYSYWRukPh1l8EF5zC526rwUV+
	 6lR6+qmLL6rX2NfbTT/fnfWzLbrjyqLpjNXKT2a66prPVJ4GpIDnBLdGEjupiS2gI0
	 TZ12S2NS6As1NOCbyyxhVoDtXJpegAinK6Zo0xyLRj4jaXxrxnSrZQ+9FTTgRm7kFc
	 iH0sY9mllV66w==
Date: Thu, 19 Nov 2026 15:48:58 +0000
From: Jean-Philippe Brucker <jpb@kernel.org>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>,
	Zhou Wang <wangzhou1@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-accelerators@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uacce: publish the device in uacce_register()
Message-ID: <20261119154858.GA733257@myrica>
References: <20261119015931.596086-1-lcy8047@gmail.com>
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
In-Reply-To: <20261119015931.596086-1-lcy8047@gmail.com>

On Wed, Nov 18, 2026 at 08:59:31PM -0500, Changyul Lee wrote:
> uacce_alloc() publishes the device in uacce_xa before initialization
> is complete. If a minor is reused, open() can find the new device
> before its queue list, mutex, or driver-private data is ready.
> 
> Reserve the minor in uacce_alloc() and publish the device in
> uacce_register(), after initialization. Until then, xa_load() returns
> NULL and open() returns -ENODEV.
> 
> Fixes: 015d239ac014 ("uacce: add uacce driver")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>

> ---
> Found with an in-development static analysis tool.
> Compile-tested only with x86_64_defconfig, INTEL_IOMMU=y, UACCE enabled,
> and W=1.
> 
>  drivers/misc/uacce/uacce.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
> index 45521d4a56d1..026f076fa0be 100644
> --- a/drivers/misc/uacce/uacce.c
> +++ b/drivers/misc/uacce/uacce.c
> @@ -514,7 +514,7 @@ struct uacce_device *uacce_alloc(struct device *parent,
>  	uacce->flags = flags;
>  	uacce->ops = interface->ops;
>  
> -	ret = xa_alloc(&uacce_xa, &uacce->dev_id, uacce, xa_limit_32b,
> +	ret = xa_alloc(&uacce_xa, &uacce->dev_id, NULL, xa_limit_32b,
>  		       GFP_KERNEL);
>  	if (ret < 0)
>  		goto err_with_uacce;
> @@ -550,6 +550,10 @@ int uacce_register(struct uacce_device *uacce)
>  	if (!uacce)
>  		return -ENODEV;
>  
> +	ret = xa_err(xa_store(&uacce_xa, uacce->dev_id, uacce, GFP_KERNEL));
> +	if (ret)
> +		return ret;
> +
>  	uacce->cdev = cdev_alloc();
>  	if (!uacce->cdev)
>  		return -ENOMEM;
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> -- 
> 2.43.0
> 
