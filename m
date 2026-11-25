Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566258;
	b=pnkc1vwhmgcA+535bibuv2St7Ik+qFmHXi+QiHBrYjqxiikpjgK9oBGRCnI5sgQRvgKT
	 ay808hYA1rF6y73oNVIp4kibRAybPtuJLYjRFH41Lg88TfCcovTcG2G/K9hYy/CVcF4rO
	 omAH9W7x4Ru1sDuq41r0SIV/9dSpp/49bQvpNR3lIqJnf0rPR5CFclDQWtkLUM4YZIJYR
	 qHix5bEp9g3tgRJLK3CV/HaGskywW3ZFEFPOqNlxtK28ZUclOH57WonOu3vs3FZvDvq+b
	 dGoAzXOBH8Zgo73kIXKKoQAYoiO4E2PaR4Ddz8ZYcTz93dJgAwsne2TUtS/dJyhphxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
	b=sk5zh9XRfKrGTSqNlfoZtCo6SETbK1XIKjBejw4qsuUNIPLI0smszDfzGDzBaGSf7oor
	 OMnhuK7qDDL/cc+SrsSmaN4I/gVevvutw2P3e6XGztGi3WwpKrwgRRjyv2xcwHE/5gEax
	 JRyTwgytt95GUxR+ynHsNnRREmq7CjVbsOMsXwez4IeoTOE5S+OTn/q29m4AD/LVRi9jg
	 ftC39HUTuNBHEwFE5Re39ArGEEfv+Geo5sQlsdqg5IYGVp8gnsqeikkOZv3tHS+c18hJ9
	 +3IJbcygbJWhCc8Rcjhgotb+qtkxlJc7OdvEChJeS/uSqhIX/XntEXFzCvZtg0np0+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nvA4xsJY;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE9606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DE9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nvA4xsJY
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0afdb97abso162585ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795566258; x=1796171058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
        b=nvA4xsJYbyjlVUxR+uk4yXS/M0iXumDNQvEFcjik+fzfX0hxCUG8igTP+aEBUQKhWU
         01rPlsYZxijr1nIFh0HnhmIqvQDte+9GB9vgwkcgoDmEZlgpGqs5n719qFTdxZxpqmHD
         smlvTgzd2MsCxkh4iC3Pj3xgW0A8Vxl/d+etRiBo7TyLfUmGaEDmFSkc1zKYBT1NH1su
         QsnQAeJzEmHi0cQJ30I2MOkUNe8XLlufgoLeZ9DETN2Ob5Y/qQNwZctS+bf7T52hpQPK
         WciL243GxjFlJ67fODnf4z60/dH9j68n9GubZQYbMlxniUpHCzE0u2iUedJtX7wAGNLR
         a8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566258; x=1796171058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
        b=hv7Yi//66DEPUkcJgg7cbHRb+U/q1jyu4flCiH4d2iYKWzNoYQbwH3ZondE0hQQawq
         rWXurJF/YuZCfXNsoVqswVLDvV3YfRUKM4ZBE9RZ9hjybrFekD+5P39vO2Jn+fZX9rkY
         JQF7xqEOHiyH1WQYI4T+uA+Vsx7ySGqzOHqZra6anOxacK8JX2cbxgyrPOW6EuIBfbAl
         BA5J42LgUxw0rkrtqWVAqBo+69sDsX8C/531YCrwm7YfFDDGxQ69MJiuR2/cQhItWXHO
         mhdC9F6ZEzFFgdeZiuB+GWvUpWtaAtEY38oxDj0IOyJHMcynqP/c1sKOFv/2MAlXzKCv
         yOGg==
X-Forwarded-Encrypted: i=1; AL+hErHgYFClwI4uyfHnL9Mezk8v9hbWlR3HXcr8VcCTpEKhkZkHUd0sBhRhPWiriyuN4jAoWxLP4FjxTihlj6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/oAk8oMHt4HMASJMODhxKejWt1yHDsk3Pb3i04sNJsx756wSX
	xs6YjZ7FA+nJeeFqdPu4UsGkJ4l3ODvlOCjSz93HwuOY+qQOXRXhvJ5THY73zVCoEw==
X-Gm-Gg: AZFdTZeO/iRlyD2kF/05fSw2Hx/r+v7xJFJtPfrLli++vQFFELNZB+mB8t0lNodIUip
	6Pk0fbP34wiI9M2UZdITmJ+YOBbCNJjNFZGIS4Jq7e2/6WqrCICoVieSDFFmp/ld91u1igWMJHG
	Zq+v78W8rbJ82ZP/kZamtLMo2yTKB7Hpx9AR87jJnaNWn2YSWrXYNJtO8VhRrTwaUMRqVibMvyI
	XstX4bAN+07bRh2uVHtU3XNrzbPtHVjs/yLxw/L3knOCcCSmehtO2BFcWd3RNChKk8A8D8Y5k0v
	3KrrU5ZvvTE7UroVa2eWfMNqPoHKRWsmW5gsrwLRBDexcnYflt0gjJuu3pO2jqndHOF+qkATOod
	OQs8rZSN1bsfaJ4rRZ/vCoWtG97UfYBUjsAD/Z64mL1Ydvb53RS0BfJLdMYV1pA8R5PtdtqkfoQ
	sTxDnb90gUbK3371v3OiBO1w539it7hE5P5aFpI5M38FKjpLUi4f3uQvMkLjyTNtkQM9fVO00zT
	LQqLolmt5KkoLv6hari/mCaU8BWC37izPta6q0NYGqHi37jXlOdkRGkVHxY302Vbl03IANsv6pO
	tJk4y5lV2wpshNjGblPE+3BlAJpeWEF2tbdgfVT0pjjZDniL+BvwZMAW2BLKMJHUeVdHIaCzz+1
	Jb25bB8vIc5eb
X-Received: by 2002:a17:902:e950:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2f06242bd42mr16475105ad.2.1795566257244;
        Tue, 24 Nov 2026 16:24:17 -0800 (PST)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cff4c1asm7632022a12.15.2026.11.24.16.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:24:16 -0800 (PST)
Date: Tue, 24 Nov 2026 16:24:12 -0800
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, 
	leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, 
	pratyush@kernel.org, rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 12/27] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
Message-ID: <20261125002302.GC3545683.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-13-vipinsh@google.com>
 <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>
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
In-Reply-To: <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>

On Thu, Nov 19, 2026 at 04:19:34PM -0800, David Matlack wrote:
> On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> > diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> > index 12557d45dfee..e6ca4c3fda06 100644
> > --- a/drivers/vfio/vfio.h
> > +++ b/drivers/vfio/vfio.h
> > @@ -11,6 +11,7 @@
> >  #include <linux/cdev.h>
> >  #include <linux/module.h>
> >  #include <linux/vfio.h>
> > +#include <linux/pci.h>
> >  
> >  struct iommufd_ctx;
> >  struct iommu_group;
> > @@ -446,4 +447,21 @@ static inline void vfio_device_debugfs_init(struct vfio_device *vdev) { }
> >  static inline void vfio_device_debugfs_exit(struct vfio_device *vdev) { }
> >  #endif /* CONFIG_VFIO_DEBUGFS */
> >  
> > +#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	struct device *d = device->dev;
> > +
> > +	if (dev_is_pci(d))
> > +		return pci_liveupdate_is_incoming(to_pci_dev(d));
> > +
> > +	return false;
> > +}
> > +#else
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	return false;
> > +}
> > +#endif /* CONFIG_VFIO_PCI_LIVEUPDATE */
> 
> No need for the ifdef here and 2 definitions here. If
> CONFIG_PCI_LIVEUPDATE is not enabled then the compiler should be able to
> optimize vfio_liveupdate_incoming_is_preserved() to false.

Okay, I will remove it.
