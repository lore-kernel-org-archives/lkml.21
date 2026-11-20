Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187855;
	b=nAXqFYAOXsgcRmWzrgmKV3RyaRhdX5AMw6/uqHU02C/EFce7gDw/pKZ9hJJBD/ShEqKj
	 R+bWogXhOGza9ZVPhLiSF12xeyhwJj5Rhu4Z/k5q/tVbN2a+ie7MJcUG5qS7NBOhFgRFC
	 oeLeQ6eazX1ZwHKUNH9pPEfnQ78AjoJyFkgAJya4Uh5hPOk68nZ17/BiOgQGyh6haEsHi
	 IMQhUuoyRf7fmrtlJE+0Bp//lXbrDlDcg7jAZr0EkeV5mG9QyfWLt5Fx5q1o/evi//yIw
	 a7pXS1xAsRyZ2zVXjE6TNXxbFKJGci0eWRl+xQzk9YRbKLdukvHhZGbVcblZ2/H4TJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qAjYne+BgcE8DA63sQsMZ990H8S9yK78zgr2NZdv76Y=;
	b=elEHCqqeC+3uamit8YcQBpIAKCA/5PICiKFsvyXJzLNjlX7vhTLioH7auupw2OCp1qui
	 SFdCz6OXglxUA6LK/XT2ZSIeOdqcDEtsnPKzULJpNLhCFGYXDgrggA6MSjGkTvq2VopOV
	 PJFt0AXRrFSrGNEWpmNykDtotcjH1qV5UqisHfqf9jZo9DI0QVnhaK07UKYcJxIc6jZz6
	 IWv6xZ6JaFQ4RKnEW+e/QT2f6+Vzx7fOdsat7l88d7btGMfi9AMrzupAR8O3qySaHbh6R
	 RfyaNRmaVoRqtfqUyG02G4UsJ/AoM3Aa/v3SIWsuKrnmcbT+GqDIaplzJlV98brPCfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZsBZbY9r;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E41B606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E41B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZsBZbY9r
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-150ef97e790so7385c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795187854; x=1795792654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAjYne+BgcE8DA63sQsMZ990H8S9yK78zgr2NZdv76Y=;
        b=ZsBZbY9rhrhfiMH0sIHuSlkXAHu76ZIvXMLxoLYKzwh8PjT4CLxStoojunbuP0/iA/
         W90zitn5Ubkfby50lAuwhDOazB2L6R/imqoZQrr5T2qH6KWT0/Oi7Sz1JcBbXdE3dDzw
         snDvkyJlfwkEk6pXFI3AHJmDTiQdkJuRleFOmaN5NVQG5880pyvAK9iBugmfOftYOo+v
         rAaNCKf4p5tV+po35L3klIxGqj+ugGAu/Ok0TpBPaFpfLMMtzEpqE3GuXOGoxX3Z2t7c
         lxFQfro0U36zTDNKHVXh5rBMyIfmzQRVpydIrZoC6Q6+KZ0L8XzhdBsO2aJGCJ6u6OzM
         9oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187854; x=1795792654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAjYne+BgcE8DA63sQsMZ990H8S9yK78zgr2NZdv76Y=;
        b=bbGqd6wWPzJDHH4tA/nYh34M/qZkIhPCACNEKAIa9DljVMbUiuVJJeMeqsjp6Xoa7g
         djxreXpn5ji/kw2T5+7PQ9NGDHHz79wLR4P/Dchj6RjKr4w8N46RofwqNY3SAXf1EsQW
         JOxiX4Gdxga9toiReuWVY0GbwcdXyjivq1JXqOmW1NiZkbwCZsO6HOlgoQyYKET4wRWV
         qCWga3Ut4l95BW8p04fmyaHjMen+j+CANYQppEKWj2tnDGeKYf+kJjR8YnXGhqfDJi8t
         UpZsZLJ4yvqViT4ERYID2/hTFShyzMyyrrahATezgSsPoNWTbmBNrPfY7cpuQIIgdkyF
         lXFw==
X-Forwarded-Encrypted: i=1; AL+hErE9KKe1hVRHI7KAPiVaCfhgCMzesRA5Xj5IDMzA/lBVmHtCHrlaEP9agsunQ92MA0xP8XnG+N3jvTMovYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9usvaT7LwIXccihEHSZMMg6tncuvG1wMHZ8GVcx+ItR1g6WlH2
	tG2OhYfnHOCtf9L9JiUIrlMY9L18BGLVILl+Fw5H2A/DCTcb8XxRlZdoYhgD9wPlWQ==
X-Gm-Gg: AYBFou2qX26GHTc8f2StLLFjfHtd0OQ8sZFTEQR6TzSepEGAhSf09VsC0M4C1kv0T/i
	XWB6jAfhGWW+mcWBsxeNz+dl5NsyZOTi4rJ92O588GVk+2/nUIuaKUYtqtyCZX90WGwU0Xk8JFV
	nD+Gv/EuKlrQjwTn66+ji2YZp9Xx6Xe0lD3CZYAwlyLAgbezDLYDFTCd2NZUIoytQHBXo2pxldU
	NOOV50WP+0woTGMuHmBE8VKLoAddNscNgLblZsEfV18AZLTpapJ3E9eMxC9ll1mzUVujzgQB8uY
	oiq1w/lmIwmtWWgbtDsqWAz9Yi8hRWqYjiODibKTzaJ06ViRUNlicuKTn3W79ngBjtHT0h07BhY
	o3B0P086jSFps/sIZGrefZKh63nSLbCbF6xvyZqBuWtOcreIJKgdJzj4+I3MExPo5ecFmEuCS2C
	sdHSDdaCam2CxhH5xKtHAKjcq6MM0q83EBbb6C74OCdEJnSJU9YJmLdllLi9bR9rJ/6AOez8ekA
	W+3ytgKau18qR4MpvA/5a4ygVNud9wQFf3vif4Xms/5SIBUenrcAfBnMjyEAiDTfS/tcf53iWpf
	R6FYB6cWmJoaHYjl/H7qnVWm94/bKN+70OnpJ/05jx+OmaZiRIAPzCpZx3QxiPYh9VAkJw1eN7z
	lP4HkE/72fLxr
X-Received: by 2002:a05:701b:4516:20b0:1b3:c4ba:8e0b with SMTP id a92af1059eb24-1b557b69270mr1215594c88.2.1795187852837;
        Fri, 20 Nov 2026 07:17:32 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm7441365c88.3.2026.11.20.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:17:32 -0800 (PST)
Date: Fri, 20 Nov 2026 15:17:23 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Alex Williamson <alex.williamson@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 09/13] PCI: liveupdate: Adopt ACS controls in
 incoming preserved devices
Message-ID: <awBkg0ODE436CZy0@google.com>
References: <20261118223704.3286085-1-dmatlack@google.com>
 <20261118223704.3286085-10-dmatlack@google.com>
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
In-Reply-To: <20261118223704.3286085-10-dmatlack@google.com>

On Wed, Nov 18, 2026 at 10:37:00PM +0000, David Matlack wrote:
> Adopt Access Control Services (ACS) controls on all incoming preserved
> devices (endpoints and upstream bridges) during a Live Update.
> 
> Adopting ACS controls avoids changing routing rules while memory
> transactions are in flight from preserved devices. It also keeps IOMMU
> groups from changing during or after Live Update.
> 
> The adopted controls are recorded by the pci_save_state() call in
> pci_bus_add_device(), which runs before drivers bind, so they are
> reapplied by pci_restore_state() if the device is reset. Allocate the
> ACS save buffer for incoming preserved devices even if they match a
> device-specific ACS quirk, since their adopted controls live in the ACS
> capability, and panic if it could not be allocated.
> 
> To simplify ACS adoption, reject preserving any devices that require
> quirks to enable ACS as those quirks would also have to take Live Update
> into account. If such a quirk matches an incoming preserved device
> anyway, e.g. because it was added in the new kernel, log a warning and
> adopt the device's ACS controls regardless, rather than reprogram a
> device in the path of a preserved device's memory transactions.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  drivers/pci/liveupdate.c | 75 ++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/liveupdate.h | 16 +++++++++
>  drivers/pci/pci.c        | 13 +++++--
>  3 files changed, 102 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> index 00d6fa5236e9..b99a88c2c199 100644
> --- a/drivers/pci/liveupdate.c
> +++ b/drivers/pci/liveupdate.c
> @@ -123,6 +123,9 @@
>   *
>   *  * The device cannot be a Virtual Function (VF).
>   *
> + *  * The device cannot require device-specific quirks to enable Access
> + *    Control Services (ACS).
> + * 

[...]

> +#include "liveupdate.h"
>  #include "pci.h"
>  
>  DEFINE_MUTEX(pci_slot_mutex);
> @@ -1071,9 +1073,13 @@ static void pci_allocate_acs_save_buffer(struct pci_dev *dev)
>  	/*
>  	 * Devices that rely on device-specific quirks to enable an ACS
>  	 * equivalent keep that configuration outside of the ACS Control
> -	 * register, so they are configured from scratch on restore.
> +	 * register, so they are configured from scratch on restore. The
> +	 * exception is devices preserved across a Live Update, which always
> +	 * adopt the ACS controls established by the previous kernel and need
> +	 * the buffer to keep them across resets.
>  	 */
> -	if (pci_need_dev_specific_enable_acs(dev))
> +	if (pci_need_dev_specific_enable_acs(dev) &&
> +	    !pci_liveupdate_was_incoming(dev))
>  		return;
>  

The ACS save buffer is forced for incoming devices that match an
enable_acs quirk, but neither existing quirk keeps its controls where
the generic code saves them (Intel PCH Root Ports have no ACS cap, 
SPT/UPT has the Control register at +8, not +6). Is the intent that 
such devices just lose their adopted controls if they ever lose config
state later? (e.g. a Root Port D3 cycle after pci_liveupdate_finish())
If so, maybe worth calling it out in a comment?

Apart from that:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
