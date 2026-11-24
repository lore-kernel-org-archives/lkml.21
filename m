Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539347;
	b=bm5GK/e+bB8fr7qZ2ctc8GF9KJ3dzT2XckzsxrLD+0fG6q0kpoQSw2IJr7S/BLtQF8JW
	 QsKB+cLax9FJn0uliQ6kwmjnRz5BVmRT4rnz+aBdRDKWeBa4aJ+WZkY6hn7QzcRAOFlo9
	 o1r2H3cgpMm/clqbf7C6mQEJnHVLT3TMkAbLHy9GvPi1H7PYHXqsX39QFVWffFk4k1eIX
	 b9eH3VuZbYXhvbyP9kSceV/5dZeb5/QsSOwO5We0DDXP0mGh4+0cAM1cWW/kMgNIFmF0l
	 DrSUGlbvWJvWCKFeNMKSljMSUdpKu8hyohrW+1gvJ68hTAjQDLhfB+dtoG95wqEwiAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Eidq/u0B0uHPbaz+QN/RsKm5aUjYoNx3Hsqs43GeY5k=;
	b=acOlHYRzCAPfmJ7EDNA0PimM5Yhf1aP6wnVEOzRS5pWu6/B9pHzRkQrizmxsH8Yk9gZT
	 jSDFd8DuE0q3ahGwSzt3LCiqT4l8O7Sj14BqmlCvk+kpq9ToS0vKl3BTjCyIWeRvBHwMd
	 B/Q5EUkuRQzOlBlXq2eTzambMAdm0zCYHtnUTiKTS38qZOOUUdZaBVz30qmV/rJyc8YU5
	 UcLnv9vTxcJ8iUTkOULYfrcjI5mDpzV+T8lXGEIKdK18aR3KNoMG/jQ3tycTd58c3JB/W
	 eA5g5RDHtpPpgs8n9FF13UOeWPOQte5u8KTySsZSmNJeUbZFRC8jYfTfVcpFdwRO7Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sbPhVwUu;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDA606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEDA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sbPhVwUu
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3475498b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795539345; x=1796144145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eidq/u0B0uHPbaz+QN/RsKm5aUjYoNx3Hsqs43GeY5k=;
        b=sbPhVwUuMo0ML11i6dL/aAmKDlDuMNtHoHPStcBow7//qphCTOL57iFhZdSYFOTTdR
         qdBTwWrbkzorPSH+kjcwvqhV2FB2fZnrrYV5g6onstPrEXI91BwubWFP7vcYN6vBWXZf
         /6uAr1Jhdhhbf2ZnXfXHlCI9x6MUbwFDhXc/bP+xtyaoG3KegCgDE82r/ZTig5QRm0cn
         rqpexyaev1GbA+8D4T5Rz63DVWTMr6b0GnRvzKXIw33aPh5T79w6SOpNnot+aVgNQovB
         eBoaw+XfCsLiLImg75guBApuACOXGtYdJA/mcDgBWikZkAVHNsJsXzDcw7rbZw40hlI7
         WNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539345; x=1796144145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eidq/u0B0uHPbaz+QN/RsKm5aUjYoNx3Hsqs43GeY5k=;
        b=U+wGGo51yvmXv+xDH5UJv/haS7o7KKH1mne2435NaC0jCFAHMe7nE+35uuswy7X4XT
         HAftprHqAYna8Dd5AVyEmEc1yHPfjz8uwUq11aVeRzK/64J0kTZdn9R6CpTOYfl1nxzi
         XzYRclF+l/8uHmpFm4c30JHbTB/KC6LnCoIJpKiYTf1Y5CmXp9HRQVuGnzvoDZdGNuMk
         enMBJq04F0nUJbjHaAiU2lP4U/J+6Rmxc4kBTyw4heHZS7r16wMS3M1tmNvMWnwxi5JE
         mf5EIStZiLGDNCvygf+zdKbTTDpUXMh7pmbOPpXuohBa8opbKqWZNdCVuvpt8FohVPme
         hZLw==
X-Forwarded-Encrypted: i=1; AL+hErHsk9VnNkjAvrIye8RZp6E4LYUHaeU2nXU2LgwJr1FhwU+OHK2NT9T29I+hXJmw9pC6k3//ZZ39iHV9hjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dcDH0yIwgoy4ds1x0bZJpvQdE/XWuDQRvsWEtI46oRqM45RM7
	x0b5dRYSgBbXn4oduYkNPfaT14+we8UO3ncmUZQOQ2vxVR+WaxZXuchCXSILzmAITbA=
X-Gm-Gg: AZFdTZdFr/R3CmbhnzVWOjK4+NciPgpm/HpVHmYWyxGAVyJdvhqJYAUqNmMeHjInxBs
	1U6CF45O+U4aGwxePb5NVGMDLXLO8HSFuvm9sCd6SCcEGmezOUEgJIV7lrgIjVHIP8BZmUKRP0X
	BxwiKRgQUSvmSBtoKOnIRHCNDABOpWrfEl3Kb9MESOhcLBlB9kpOjKQ08ptTDPL9TeodDKurXZJ
	vkZH10Gbwbmzqga7bTUtcORxAXEk1t/jHc++iHTKRaQMGt0tPWU/qLYRjgxOQD2H1rs5FDwHG9D
	+uHw+clNkBavwVCC6FGaQldjrCx+BimuiNzrJO9nLkWMk4n8ryZeqwaxts9k3+G07JUqs5KE5qI
	jrgKyfgfZKWVSCwoEKUAMCjbQaeT2Gi+dpppQXo7Y4JBbTJH6X0PUiTgfZYvf5yYdEvMCGdECyf
	Okukp98LcEpsO/+0p3II7UPsa7+rtoVX35lNKa+J928t9b1v4GqpCwzWCnLt7xmc9GUjiCoXw5y
	Wjf++JkWobHyK71JBqF9gTrm9zOuFHH+IckWKFmaLjwWvIqYFTrAFLpKPUMSsXHothum/HLiedy
	fmRCtsYKK4pfleFG0H25pbGj8ZGzBEw=
X-Received: by 2002:a05:6a00:bb8c:b0:89e:2a91:4fd1 with SMTP id d2e1a72fcca58-8c8794b8c20mr13015434b3a.6.1795539344765;
        Tue, 24 Nov 2026 08:55:44 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5349:b6fc:237c:41e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b889sm7546809b3a.42.2026.11.24.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:55:44 -0800 (PST)
Date: Tue, 24 Nov 2026 10:55:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] remoteproc: virtio: Decouple vdev from the parent
 pdev
Message-ID: <awXBjZ9jqXW1ETNZ@p14s>
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
 <20261114-remoteproc_pdev_decouple-v2-1-95235dd056aa@valla.it>
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
In-Reply-To: <20261114-remoteproc_pdev_decouple-v2-1-95235dd056aa@valla.it>

On Sat, Nov 14, 2026 at 09:06:33AM +0100, Francesco Valla wrote:
> The rproc-virtio platform device can have a lifetime different from the
> virtio_device it registers. During cleanup (e.g.: when a remoteproc is
> stopped) the platform device is de-registered by the remoteproc core,
> but the related virtio_device might be released later; if this happens,
> rproc_virtio_dev_release() will try to de-reference a NULL pointer as
> part of vdev_to_rvdev(). This can easily be reproduced with
> CONFIG_DEBUG_KOBJECT_RELEASE.

Can you provide steps to reproduce this problem?  Otherwise I'm good with the
simplifications provided by this patch.

Thanks,
Mathieu

> 
> Remove the access to the platform device structure from the cleanup path
> and interact instead with its backing device, whose refcount was
> explicitly increased during rproc_add_virtio_dev() and will be
> decremented as part of rproc_virtio_dev_release(). The same is done for
> the pdev de-reference inside vdev_to_rvdev(), even if no more used
> during cleanup, to maintain the same access pattern.
> 
> While at it, fix the comments on the specific matter.
> 
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 29a3a4c18097..b59f4acbb630 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -49,11 +49,7 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  
>  static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
>  {
> -	struct platform_device *pdev;
> -
> -	pdev = container_of(vdev->dev.parent, struct platform_device, dev);
> -
> -	return platform_get_drvdata(pdev);
> +	return dev_get_drvdata(vdev->dev.parent);
>  }
>  
>  static struct rproc *vdev_to_rproc(struct virtio_device *vdev)
> @@ -348,7 +344,7 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
>  
>  /*
>   * This function is called whenever vdev is released, and is responsible
> - * to decrement the remote processor's refcount which was taken when vdev was
> + * to decrement the platform device's refcount which was taken when vdev was
>   * added.
>   *
>   * Never call this function directly; it will be called by the driver
> @@ -357,14 +353,13 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
>  static void rproc_virtio_dev_release(struct device *dev)
>  {
>  	struct virtio_device *vdev = dev_to_virtio(dev);
> -	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
>  
> -	kfree(vdev);
> +	of_reserved_mem_device_release(dev->parent);
> +	dma_release_coherent_memory(dev->parent);
>  
> -	of_reserved_mem_device_release(&rvdev->pdev->dev);
> -	dma_release_coherent_memory(&rvdev->pdev->dev);
> +	put_device(dev->parent);
>  
> -	put_device(&rvdev->pdev->dev);
> +	kfree(vdev);
>  }
>  
>  /**
> @@ -372,8 +367,7 @@ static void rproc_virtio_dev_release(struct device *dev)
>   * @rvdev: the remote vdev
>   * @id: the device type identification (used to match it with a driver).
>   *
> - * This function registers a virtio device. This vdev's partent is
> - * the rproc device.
> + * This function registers a virtio device with the platform device as parent.
>   *
>   * Return: 0 on success or an appropriate error value otherwise
>   */
> @@ -448,7 +442,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  	vdev->dev.parent = dev;
>  	vdev->dev.release = rproc_virtio_dev_release;
>  
> -	/* Reference the vdev and vring allocations */
> +	/* Reference the parent device, which will be used during teardown. */
>  	get_device(dev);
>  
>  	ret = register_virtio_device(vdev);
> 
> -- 
> 2.56.0
> 
