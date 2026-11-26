Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714960;
	b=y8lRT4G1JLNlWUHnOSt5IRRsRSCINDb/73fm62zeMa8yrYAeyzOE+PiHMK9MUSjrdGMv
	 RiRgYQEpISNS5FtK8wqEwYZNDS9ln7WkvlB6RmByZz757IWu6eIUeB76flqAmWm9j8QBH
	 puLoG5dDhrEzkdCw7CvTp/65YvpVFlA0FGwL46s2n+tJRS2VKtACw0hCGzRJEE5ZZCGI+
	 AZ+tqYsNC6pFcEUNmkRNiqo8Cwe12p8+kZmiTKPRLHU2Vmdnj6mb6wyXxbiXIMLsaGpIK
	 7P2pDXbGdkIk6mWWMznwLmjGma1HtGBijCthDIoSIcxTXNeqoTJrq9rGf4ZdYu/cykQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VaynkGYxT3RkBplBQ3i+pW/VHTdONidTB0tUfhc3D1c=;
	b=f1PnxoWyTviHPcsY8rWZJR8Chy1kSwSnVufojEuOti9xqT8FB3l1a1XGmJDK7u0Qgtzl
	 NrLqch0qqDQHshFyOwcaeC/lFiVAECtAnwmdw/iplHSLU7chknqizJ9rIUKkZvDGr0CFf
	 fJooUQ1uXEu+jixlwZbrwLO7UHtgdz0WU3qZ+DlNwWGPeIiYUJ9rub/tZknngCNRXl2Hw
	 DMB9f4/JfSTDKL/RV4WTWjv0v0B3ofT+Blb+YCs2FuXHr+opcER5lsmKEAvm/r9V9aL8w
	 B42M69lQg/yah8YEuhoDVjfb9f5oDYHPU5Q2lEcYG2aFp5opoOwUokiC56p7fmWAKvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d9wPuUuJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B29B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d9wPuUuJ
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0d126f631so63503737b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:42:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714958; cv=none;
        d=google.com; s=arc-20260327;
        b=dYAPGL483q1mGpxUjBWpcvFkPdiGJ1IeuDS5XAPvY0SfgM6ZMELIoVEnI4Jz8YZFOg
         6en+rYUT2QsEiyPoBzZkfdGB8FjPgNwko3DVhgLjNGVJNpgUZp1TIVPodJnL7N7izTrK
         lstVMyXmaEefym3/hiRLDT7eYKvsP4qbMmN8TYma2MUBIUQC/1SF9koeDxKUxIFTyKMq
         W9J6E1xi+cesJLD1lSUkEEk9u6ZE2UsrJybAtxhPZMqfEyYY7/QmCsSqNfaLhngZZnu9
         36gbNaWUl5Zc7mMS3jk5RVat6r08PiqgIHUBWxpI2HMQXSrjSOJ4NWpZL6DfXQZRfDV5
         gEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VaynkGYxT3RkBplBQ3i+pW/VHTdONidTB0tUfhc3D1c=;
        fh=3N8C6OAJPo2oxIMgMw2Zr1DdTb4h51N40tFDdeyAd9w=;
        b=kGONJk7pmtUGlMgFGPNALUjYBlUg2GCT9tvEZ/Te8pWqICJI4kcuTfTqClkOXAKfEl
         n73H6aEfn/0e/OlJPS34+BAMYPUaGmAx+xB35GO5KUgQYeqnKCxGwtZlHWy4gdV4kgik
         q4HeDksInmzXSBpWi1wBVa0hsHnHhPPl3pRdwt9FIn0i2TZybIcnuwum3PZV4Eeb/hOp
         RMEx0dRYahwGDyV09H5aHEkVq0o+sWxWgyghOhbZxL3jZf/EwhqW9d8cD5o6ck1Fg/PA
         NY2+q9N8N5aga3MIe7Mj55Gcak5EjDx2HutldGWA3vyC62MzRYtUoyKFNEabCPT7MtO6
         VVCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795714958; x=1796319758; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaynkGYxT3RkBplBQ3i+pW/VHTdONidTB0tUfhc3D1c=;
        b=d9wPuUuJgFU6QwSFh6DCWfnkKCH5YaZivAml29sN1ZGzTPbxj8oMNhb6sd9esBDfHJ
         c3GgZGns6sswweCVlIJJzibGJADRsHZ6SPpvQKi7Zheik06QwqYQxjU4AO5Ay6FfqlLQ
         l+ZKQ6qZTNu5SdLWmo8A0q10qBaPSjmbuYbw5qte5P8/GqoAq9eRvw84bLedSWx2c9L1
         Sp8L1dR5EcuOiKEx23awKvTkKHSP+XNWdQXaCekVYOZ1ky/f2tbOUc7zSYEIgQdWCqLE
         rM+xichVh/PSfDgaVG25VQFMnEaExgEsRhQbGWh5JgaXcJvp0jalS0BtDRIy3e7SMWAu
         McHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714958; x=1796319758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VaynkGYxT3RkBplBQ3i+pW/VHTdONidTB0tUfhc3D1c=;
        b=nIMxfx4b3HY59QSpJpC/ymR0QsX8d/mr77AM1NBWKQWQOctYHTtKm3bnkHkyodQdDx
         nUUux4V9enPr8aYmMvoD/jDCtDTpE+y0nYTwFaxQyWAFzIr9iEBXgW6Q8pNU8Pzocur8
         wWahUfS1HcoWnnUzy18HzDEaeRjFSFZksQhZoNV0f0tCRHyh1bEFTJPt8ZgD/tls+csT
         yqXJF52zxlXPXT5X9zkIKnFarXkMJGN+PILouYCCWfL/IeC9i4LZkusZN/lCMVU0bQlL
         /hmp/sq5jCSmOUlgz5qlBPcoRZuvm8/rkT4w8mJ7S8//VQPzq2XaSuEl6fCNIZclJMmD
         7oOQ==
X-Forwarded-Encrypted: i=1; AL+hErHEVuxcslnKkK/mIWa1EX2e+CCdCbuq0ebhRwvj5Ltlj0csP0JGtVpwFEUEKJMotWgr4ch5Wvx62v4QQyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z85L5qFQ/86xDECtYyPhUZcwUJ481iCRuFoj/jz1aGmJxpuvEQf
	LOgOOffUtRihwF6BdcqVZfvBYWDyUCCw9I4zxl/LqhzYb3fTza/YC8UerjM1ZW5Ba4I3Nymgn/O
	R1xaibXxLDM4X+4gvV+F+6h1LpDNagYtRmGEjQyrMFQ==
X-Gm-Gg: AZFdTZdvEqjA5t5NnSuZbwbsKbhjXZEXOgl9gDqUFtVh3QN8fL+ukBSko3hX+tLXfhz
	SnxBm7hjDn9l6+Hrq/9T9KHTX5n/GzVH+t0WpjtxhCK90RBcDHm+CHbub81UPGrM2T1MYdOmvRk
	coDVD6d99r04aI3w0WoV0gfY4PJfyAFBUTiCbBrudPfsGhXHI2TaXAEhjVvBc9euVzf+Z2h4HZi
	S5OdsyGIOAyzCGSQf2ManRdw4Knev6uaqzWjQQ0lVpZ5vpigaL0X3drLXgeGrrpWWu45hEmiHJ9
	KIlFVC4JbIP28kS3BOix06MQUgoFEnJZeb2qsCToFXg/JzEqnm20bVLKXACusylfC8yN8TPFdqr
	fXCBKO6aIhRpbEXpF5czC8Inz0usOTJSa9q/HCLxFoaTCpj2RFOyS9S++pPnrXhA6CPKRQus=
X-Received: by 2002:a05:690c:4a02:b0:8b4:c71b:e4f6 with SMTP id
 00721157ae682-8b520318ba1mr80009607b3.3.1795714958293; Thu, 26 Nov 2026
 09:42:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
 <20261114-remoteproc_pdev_decouple-v2-3-95235dd056aa@valla.it>
 <awhhVRBokzbdPJB2@p14s> <awhi3Kg6kdELdT0d@bywater>
In-Reply-To: <awhi3Kg6kdELdT0d@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 26 Nov 2026 11:42:27 -0600
X-Gm-Features: Aa3M54oqASU5s2O0JyDBOVttrzuqbNsOoDRdWxI1aIJEkgnWkTadU5uajOSV97Y
Message-ID: <CANLsYkyoT7dVj5OGJvqzLQ7X9U-z5vbaPdsnDDY6+PuW=WCkBg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] remoteproc: virtio: Drop rvdevs list and
 associated functions
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Joakim Zhang <joakim.zhang@cixtech.com>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 10:59, Francesco Valla <francesco@valla.it> wrote:
>
> On Thu, Nov 26, 2026 at 10:41:57AM -0600, Mathieu Poirier wrote:
> > On Sat, Nov 14, 2026 at 09:06:35AM +0100, Francesco Valla wrote:
> > > The rvdevs linked list is kept at rproc side to track the rproc_vdev
> > > devices registered at runtime and de-register them during cleanup, but
> > > the same information can be obtained from the driver core using
> > > parent-child relationships coupled with driver name.
> > >
> > > Drop the list and all associated functions and de-register the virtio
> > > children of a remoteproc using device_for_each_child(), with the
> > > following benefits:
> > >
> > >  - increased separation between the core and virtio parts of remoteproc;
> > >  - reduction in code and occupied memory;
> > >  - the platform devices whose probe fail are now de-registered correctly
> > >    during remoteproc cleanup.
> > >
> > > A dedicated macro is used to register rproc-virtio platform devices to
> > > avoid duplication (in code, not in memory) of the same string.
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c     | 34 ++++++++++++++++----------------
> > >  drivers/remoteproc/remoteproc_internal.h |  4 ++--
> > >  drivers/remoteproc/remoteproc_virtio.c   |  5 +----
> > >  include/linux/remoteproc.h               |  6 +-----
> > >  4 files changed, 21 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index d5fa9d23bd5c..296b955f415f 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -431,17 +431,6 @@ void rproc_free_vring(struct rproc_vring *rvring)
> > >     }
> > >  }
> > >
> > > -void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> > > -{
> > > -   if (rvdev && rproc)
> > > -           list_add_tail(&rvdev->node, &rproc->rvdevs);
> > > -}
> > > -
> > > -void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> > > -{
> > > -   if (rvdev)
> > > -           list_del(&rvdev->node);
> > > -}
> > >  /**
> > >   * rproc_handle_vdev() - handle a vdev fw resource
> > >   * @rproc: the remote processor
> > > @@ -513,7 +502,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >      * as device id, then we get duplication in sysfs, so need to use
> > >      * PLATFORM_DEVID_AUTO to auto select device id.
> > >      */
> > > -   pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > > +   pdev = platform_device_register_data(dev, RPROC_VIRTIO_DRV_NAME,
> > > +                                        PLATFORM_DEVID_AUTO, &rvdev_data,
> > >                                          sizeof(rvdev_data));
> > >     if (IS_ERR(pdev)) {
> > >             dev_err(dev, "failed to create rproc-virtio device\n");
> > > @@ -1212,6 +1202,19 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
> > >     return 0;
> > >  }
> > >
> > > +static int rproc_unregister_vdev_pdev(struct device *dev, void *data)
> > > +{
> > > +   struct platform_device *pdev;
> > > +
> > > +   if (!dev_is_platform(dev))
> > > +           return 0;
> >
> > What other child of a remoteproc do you expect isn't a platform driver?
> >
>
> Some Qualcomm drivers *do* register children of a remoteproc that are not
> platform devices; see for example qcom_add_smd_subdev() [1] in
> drivers/remoteproc/qcom_common.c that defines smd->dev = &rproc->dev and
> then uses that dev as parent of the new subdev's bare device in
> qcom_smd_register_edge() [2].
>

Ok, I pretty much expected something like that.  Please add a comment
saying that you're skipping over devices not registered via
proc_handle_vdev().

Otherwise I'm good with the other patches in this set.

Thanks,
Mathieu


> > > +
> > > +   pdev = to_platform_device(dev);
> > > +   if (!strcmp(pdev->name, RPROC_VIRTIO_DRV_NAME))
> > > +           platform_device_unregister(pdev);
> > > +
> > > +   return 0;
> > > +}
> > >
> > >  /**
> > >   * rproc_resource_cleanup() - clean up and free all acquired resources
> > > @@ -1224,7 +1227,6 @@ void rproc_resource_cleanup(struct rproc *rproc)
> > >  {
> > >     struct rproc_mem_entry *entry, *tmp;
> > >     struct rproc_debug_trace *trace, *ttmp;
> > > -   struct rproc_vdev *rvdev, *rvtmp;
> > >     struct device *dev = &rproc->dev;
> > >
> > >     /* clean up debugfs trace entries */
> > > @@ -1258,9 +1260,8 @@ void rproc_resource_cleanup(struct rproc *rproc)
> > >             kfree(entry);
> > >     }
> > >
> > > -   /* clean up remote vdev entries */
> > > -   list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
> > > -           platform_device_unregister(rvdev->pdev);
> > > +   /* unregister platform devices */
> > > +   device_for_each_child(&rproc->dev, NULL, rproc_unregister_vdev_pdev);
> > >
> > >     rproc_coredump_cleanup(rproc);
> > >  }
> > > @@ -2521,7 +2522,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > >     INIT_LIST_HEAD(&rproc->carveouts);
> > >     INIT_LIST_HEAD(&rproc->mappings);
> > >     INIT_LIST_HEAD(&rproc->traces);
> > > -   INIT_LIST_HEAD(&rproc->rvdevs);
> > >     INIT_LIST_HEAD(&rproc->subdevs);
> > >     INIT_LIST_HEAD(&rproc->dump_segments);
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > > index 3a742ef6ef60..d587a3301811 100644
> > > --- a/drivers/remoteproc/remoteproc_internal.h
> > > +++ b/drivers/remoteproc/remoteproc_internal.h
> > > @@ -18,6 +18,8 @@
> > >  #include <linux/io.h>
> > >  #endif
> > >
> > > +#define RPROC_VIRTIO_DRV_NAME      "rproc-virtio"
> > > +
> > >  struct rproc;
> > >
> > >  struct rproc_debug_trace {
> > > @@ -122,8 +124,6 @@ struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> > >                                                    const struct firmware *fw);
> > >  struct rproc_mem_entry *
> > >  rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> > > -void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
> > > -void rproc_remove_rvdev(struct rproc_vdev *rvdev);
> > >
> > >  #ifdef CONFIG_HAS_IOMEM
> > >  static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 6cfdab831185..403519e78ee3 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -549,8 +549,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
> > >                     goto unwind_vring_allocations;
> > >     }
> > >
> > > -   rproc_add_rvdev(rproc, rvdev);
> > > -
> > >     rvdev->subdev.start = rproc_vdev_do_start;
> > >     rvdev->subdev.stop = rproc_vdev_do_stop;
> > >
> > > @@ -588,7 +586,6 @@ static void rproc_virtio_remove(struct platform_device *pdev)
> > >     }
> > >
> > >     rproc_remove_subdev(rproc, &rvdev->subdev);
> > > -   rproc_remove_rvdev(rvdev);
> > >
> > >     put_device(&rproc->dev);
> > >  }
> > > @@ -598,7 +595,7 @@ static struct platform_driver rproc_virtio_driver = {
> > >     .probe          = rproc_virtio_probe,
> > >     .remove         = rproc_virtio_remove,
> > >     .driver         = {
> > > -           .name   = "rproc-virtio",
> > > +           .name   = RPROC_VIRTIO_DRV_NAME,
> > >     },
> > >  };
> > >  builtin_platform_driver(rproc_virtio_driver);
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 00019b1895e6..77ea0e1067e0 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -228,8 +228,7 @@ enum rproc_features {
> > >   * @carveouts: list of physically contiguous memory allocations
> > >   * @mappings: list of iommu mappings we initiated, needed on shutdown
> > >   * @bootaddr: address of first instruction to boot rproc with (optional)
> > > - * @rvdevs: list of remote virtio devices
> > > - * @vq_srcu: SRCU domain for the virtqueue callbacks of @rvdevs
> > > + * @vq_srcu: SRCU domain for the virtqueue callbacks of the virtio devices
> > >   * @subdevs: list of subdevices, to following the running state
> > >   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
> > >   * @index: index of this rproc device
> > > @@ -275,7 +274,6 @@ struct rproc {
> > >     struct list_head carveouts;
> > >     struct list_head mappings;
> > >     u64 bootaddr;
> > > -   struct list_head rvdevs;
> > >     struct srcu_struct vq_srcu;
> > >     struct list_head subdevs;
> > >     struct idr notifyids;
> > > @@ -351,7 +349,6 @@ struct rproc_vring {
> > >   * @subdev: handle for registering the vdev as a rproc subdevice
> > >   * @pdev: remoteproc virtio platform device
> > >   * @id: virtio device id (as in virtio_ids.h)
> > > - * @node: list node
> > >   * @rproc: the rproc handle
> > >   * @vring: the vrings for this vdev
> > >   * @rsc_offset: offset of the vdev's resource entry
> > > @@ -362,7 +359,6 @@ struct rproc_vdev {
> > >     struct platform_device *pdev;
> > >
> > >     unsigned int id;
> > > -   struct list_head node;
> > >     struct rproc *rproc;
> > >     struct rproc_vring vring[RVDEV_NUM_VRINGS];
> > >     u32 rsc_offset;
> > >
> > > --
> > > 2.56.0
> > >
> >
>
> Regards,
> Francesco
>
>
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/qcom_common.c#L351
> [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/rpmsg/qcom_smd.c#L1495
>
