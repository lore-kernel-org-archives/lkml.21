Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464899;
	b=vrM8HIfT6IbZDPuK+oyBsd8rGWc0/wtEBNMQdSGp0OFrULU/2luVjfXjWNuiJNDuwWJO
	 rn/ohrE1gD5O1EtuHVtfyncX0pEtCXV3BCY6DU7lZWj48t0GizeEE8adaYTIFCXcGgtAz
	 vA6EuzoFCfAuXPjNMGbHjVIsCRrBRGyuwAlMnuAx8s01EoKf068wSuw7a5QMA57A2DRy/
	 Fyjy8rEAlOB8BBUGPDj56fmQ7MWaie0UflhhMqCb3Wc3CPEwOWAm4P/sUWABc0C1Uj9GA
	 i9EmfXN6tdsMY6DZdXAyPIobzv19Cn3isqJ7XDQrufaZ11aJrqQEeCTZEpWqLAPLNaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3iVV+dRSm2zIDxtyL3qbfDnQ9dT1JLFeDEbsWCFcW3Q=;
	b=tPGg5LUa+Vm5OUUX1WIb4UlN96LxdgkuaWtB/3G4I24EQsTp7ayl75To3HEkRE04Ur92
	 QADys6c6Dn/MTjoYaJjLXXKL0Ge7bVoJjfh8DcMi3tXBnpY0uE4h9jkjkol6CVKl2tVO7
	 kOVOPTdt2xP+t7wUB034XZuYf5ifH27c9WKBSJQ1SgCEbDgDpwUdsyxOEQrv9uxAl/Opf
	 YgHvEY9lHUkw+vV6ARtemr7Hh3/8rIVy0l8BNpvV0L9oKb6s8e003q6bZZpgOzqKrFRHI
	 ddPxoPoxPpHllA304Wiv51ANuDkOn7pL+UxHtGiop/dNvoBh/lDzwPpKIsdJkrUP86Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HXv4E2HB;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8D606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED8D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HXv4E2HB
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-194d0c31715so10808c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795464898; x=1796069698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3iVV+dRSm2zIDxtyL3qbfDnQ9dT1JLFeDEbsWCFcW3Q=;
        b=HXv4E2HB67t2305saIm4CMwa71wtMKMrF+7QuPRavuxDRPcPuob35dF3+E84dxi6zW
         wUBaO2sy2Qo/OI6LdSldU81NdEAgULf7UgWCHytKxgrp0Cl56LBZIrjsc/db129j3LdD
         rAlWeANIgjngrcY2M81uQCqGBhw2FsNxf4toM2UGO5M5qTj/sIgTdsENSlMEVrKUIxB+
         +eMBKyEUn9g7u1Wl6ClNikEAmQ/Us1cdQECAMNMpD7eoc0c4auuXMdUOq89Al4GsDi+8
         AL91KWBsoy9le9bWqwdPOMiipum4nL9LLeZQRO0xewAGHAUfYn3w+uNbu9Ukg9G0iMsR
         dPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464898; x=1796069698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iVV+dRSm2zIDxtyL3qbfDnQ9dT1JLFeDEbsWCFcW3Q=;
        b=b/4BaaHO2uAMSe8ApBOsQ+1cfpahoUv2npMmSeo4E0xlr0RzZUOIjafQfND38iLcXp
         X/hZQNnO342+yJA+y2wXo2Men1Jxai0MAhCNZNj22TJ+DVh+/nrq40GMTp2k1uCo3UQj
         6xgwvrq7o2HqqiMLOgcklVlVVLzqAKlWWTIT3RBxu9JtNd+5osowYK4oEyhRkgxbmXZt
         PdCZPZckOrsHe3Z2hAu8RjGVis7AIq7JiwPm8lRtc+nT9XG3SqOPk3AjEAHnvdX+wgmI
         OJF92nAjXK/twmF9zA6gk5FxTgQu4zgD6cMsJJsgKALm8B2nHdVcc0keAEHOvo3RW0PH
         3Igg==
X-Forwarded-Encrypted: i=1; AL+hErEGlPyYEwj0n8S5Bi8TJNiB7eKJsJGFnDvmjXXuulAi+okCVYvDFCOwMtOrHt+zJFEa1Oe7PzFpgBMmHx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NWeLhnKQC3cLK80jUPvhGVyiFX5Xh6Pa6A6SpwPpBFbnxWLEl
	d9vor5tXvNb8GxqogmqlUL7+5wB40oqE0l7UfImXH9OSBY/vS7Eo433bsPf+EPXP6w==
X-Gm-Gg: AZFdTZcl5F/xfcshHeYI+6NAB6dEL60nP7GR846Em5ChottiZfCIjyS4Ty7gutND2MZ
	TRNvN3lziVNi004BCK8JwTchgxfioGFfeiue7y7bWd/clr+pUvYgMKDT9SJGUyE1IONQF9+9Fw5
	rfFW9B2sCKKyWg9vdsjv96tUULD+vDH3rzW10RlEmtNXOc/GO/C0AcYUsJHMyZIIBkt7KO8iJA2
	ThOh/7BrAKrSlHE4P+dEXSMqiyXQitTNQKct139ZTwVMRJy8XHKN7frSzYBh7XRKvjUfBpz7Ht8
	Ub+z6mg9z+T4aV01aPDrEWcfnVvoEtBAdM9dvv/gp5TrYrKpu53XCdq1eJgaW5gG2oWL/VBXdum
	2ZpdM5JHypfZVZKItyTTAMYRrmUzGdcrHF4Z57JXa7A8hHiyMnZxwR0cY2GXQsKJ3+gPLPMrkls
	UhP0O9LIv6V+9DFnwRCD/1mgSGOvMOYO5wpPpmZNJhG6y0VxamMzjmVfD1iIUIgcb9kUnzunoli
	KtxBzoHn7l8GHuVMKnQiTyMbK84iOyjjt5PwtizididsXfN2AX0bpb9yXpUOwgQ3S8V7xU8swOi
	14M0pVaY8AMpPWssNXSQzcktkRP7UkgLRk7xv+lrZElE9lcMbkV14FnVP1qGl6nZYDk=
X-Received: by 2002:a05:701a:cca2:10b0:139:90c3:391b with SMTP id a92af1059eb24-1b56336e369mr2019600c88.1.1795464897663;
        Mon, 23 Nov 2026 12:14:57 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm35108129c88.7.2026.11.23.12.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:14:57 -0800 (PST)
Date: Mon, 23 Nov 2026 20:14:52 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] iommu/vt-d: Avoid relying on pci_ats_supported() for
 rbtree removal
Message-ID: <awSevGXj59a1gmBA@google.com>
References: <20261123003805.2828580-1-baolu.lu@linux.intel.com>
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
In-Reply-To: <20261123003805.2828580-1-baolu.lu@linux.intel.com>

On Mon, Nov 23, 2026 at 08:38:05AM +0800, Lu Baolu wrote:
> Commit 89436f4f5412 ("iommu/vt-d: Fix WARN_ON in iommu probe path") made
> the device rbtree insertion in intel_iommu_probe_device() conditional on
> pci_ats_supported(). To match, intel_iommu_release_device() only removes
> the device from the rbtree if pci_ats_supported() is still true.
> 
> That relies on pci_ats_supported() returning the same result at release
> as it did at probe. If it changes in between, the rbtree can retain an
> entry after its device_domain_info has been freed, resulting in a
> use-after-free during a later lookup.
> 

FWIW, this already happens today for devices whose ATS is disabled by a
quirk and that are added after the IOMMU notifiers are set up (hot-plug,
VFs): the FINAL fixups clear ats_cap after the IOMMU probe. David's
patch [1] fixes that on the PCI side by moving those quirks to header
fixups, and this patch makes the vt-d side robust regardless, which also
covers Danny's change.

So maybe this (and David's patch) deserve a cc: stable?

> Checking RB_EMPTY_NODE() to track rbtree membership is common in the
> iommu subsystem. Since device_rbtree_remove() safely handles an empty
> node, call it unconditionally in the release path. This makes removal
> depend on the device's actual rbtree membership.
> 
> Fixes: 89436f4f5412 ("iommu/vt-d: Fix WARN_ON in iommu probe path")
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

[1] https://lore.kernel.org/all/20261110003353.1824793-1-dmatlack@google.com/
