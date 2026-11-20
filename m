Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185889;
	b=jEl/VvIRtum5q0bXxTr3r7NLP3V/RUYSPSP1qigY6Bue/9sW9zrS0JdygZ10QnX8IVE3
	 l1tD4CcqSn+TpFovUd91nXG90Cinxs7RrgmUfUju7kyqArkATCUXLH6EC6NEkY7ywkmGM
	 FoNLUdj75qocaR8jrAS+uLUngrOr9ObzAbmDQtQEz4swGjQSLSLVldgv+eMJsUZxlwf4Y
	 p3acZX8LLQHteRJE+x2ZK4uXSg0xJGs/XsNIFnEMUABj4n/cfJrKuawlcipMdcWx2ygnS
	 0o4Jn2VboNCTsVKEMTvGm4c2WdTV+Hyi6yRha5os6tMOd04ibIZfe4AxwK1NK3ThlJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UAmEuVaLj2um1QYSHCqaR42KS0RtEEeYHE8D0ahDr3M=;
	b=TrpT77vNeHL6EeCY+aR9+qTQYJ/V38u6eWRefrgm+YGVaD6KHoDsytTBSdYAs1h0dZxk
	 3pc/SEC7CH8AEnbUD3K3fg7U5ggvwtVYbOJbpmBlIlavcYOOjqfnGEE07shPog83dl8Dj
	 4bkNcs/rOzbeghsbR3Fk7Hi3Mkm8rQPb65bmypcejZASEBS3lfOKN9jI8hAlGxPzLS48f
	 7U9FIi9bLTd1my3+l/G++B+UpcrVCMOFENIvJd0kC3J3A30wMfq2sdtpFYPEMO398vUkU
	 M4DrOEMq/VPasZhNwBlvmNhU3O81QDHnA3LuQKjAqoQ40UIS5e/dZEq6IzzJSHuCqvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UafOjWj2;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967E960A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967E960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UafOjWj2
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so308651cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795185887; x=1795790687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UAmEuVaLj2um1QYSHCqaR42KS0RtEEeYHE8D0ahDr3M=;
        b=UafOjWj2qya2A4DjUwYc1dvmiVY3y7Yj84AgIaf3lwE0VabIzpOxlh7v0dWgybaoRL
         f+aEIbwPwYlQLKv7D3DVSsUs0eD+0/W1mI33E7/+1DoAhkbeKlWXpPAhmzPfaTLMDfU4
         osHhLK+HYgmOncAFpueqSfQ6v1hud4mzsTL2cPBHj91sHw/ySocCzFWPBKnbqJQAGNDZ
         xHZLzqv3XpioTqUPROOKnkyzw2Km5eHTcu2FBj8GTdQVHdVJiyDISBZoNV/K7nqDfV/a
         vtYdN1Jv8PFRaEuA0eiZVJuhAYqD7JedknH3AF/gCHF4iJL5NAyOUZT+BOQlH6aFMGRe
         sawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185887; x=1795790687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAmEuVaLj2um1QYSHCqaR42KS0RtEEeYHE8D0ahDr3M=;
        b=CH0aGp57JPISM54cwisz+tANvx+nJkxD+lEeyAOrgbh2Lu2hGcDC9RVZNvfoUpRu/8
         Z+eNYtj6saDVpqzGyXhtyzng6uvkjdpM6FLguI5lOGwMNDpnsETk4HAOWsd7eTp/fsPL
         kfhaiY7hCWnuvc1/NZSaTlP0BMRqQC7+/Rm+Auz3gShW9hoFp+f07C+HXirrNwLzNRcP
         p2Swl/eg5eNNC9X9e+ziMKgCmKvYA2dc1ks+DKymN21/Yvjvk2bOJQ0Kc+CgTlXW9Uyb
         vNl5Ml6HEV27ThT8tRqsLTKbHF0TOw3uROJQBu0A7LFijTSzcVGciAnCCOwJF/oAbP0/
         t0ww==
X-Forwarded-Encrypted: i=1; AL+hErE51se/lubxUuzo1nX3jkICcGdp9cfZxplxzS1n46+GoQyn7uwGGI/3SQc0/zEI/fRRJxL3okBuyRErfAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ESFRRijK4EGutwojEnefPmAHk92/yS2EcX5poA5cGF+v6sp/6
	PuVPZToKoDzjDXmRxmC0WNsobfJ6tAOm6TZiI+FNGX8XI3RBLCs7Sng4UbIeV0g3xA==
X-Gm-Gg: AYBFou39faYEujgMGM7KwiBz9AjFCTyxS6Q5cQ/wWuj/BhhATDxq8iO1p+oT8LIZGhn
	yAMk7OwVGATfwa+pAARzgh8W7TgTbbts1o2QwwFh6hInhx/8VZsnHKxJYcqlVmGTIc83tyyvJfq
	E1pgfVPkpSWnZpX/i+2OAD+HTHn2YyVfmmbvX4NHXsx2QYCpnrFMdgCWbt3E/ehGY8cgw6qRWre
	BRLCsSx3gA4l1Z+1vY9yqaCFjw1qGanVuE+uhL/Xsy0+mONRuBDiAWbcX2BDACEEq6zR+y5Icwc
	OCql2RGfKbKxx43YHYqQF0+m+Gyc+0viQJLChsWWt4yYrrEnPgOV+C7R1YJ3krqbR9Bd5ZzHKwz
	Nt1d+ShEZHZM/ZIvhRTnvVeqbVHAnCmb0DNiAJ6IBb4x4SEZz8x+SSNcqOlxgEaOG61cntN4pQG
	Coz88Z/nIa4byOXldH2Lampka8P2DWcbqi9OwJWH8vsaXtxjs9pa5UfsbmTuLyfhaIzaPpjBfXV
	EzIbP8Nz1HqfcjIp2DYWX2epTaAeUZgosWkiZwg0eyjfKyXtIBWEkUJZnGzyUccOJV14WLaq7lY
	UKrsAnN9iYgTkqd8U7/rS02RkK1T+hb6fIJ4unuys1Os5ZKcH1ASTGNQa7Sjwr44W7sm7VFFSer
	YCKNPltqIiLmG
X-Received: by 2002:a05:622a:2b07:b0:536:6ea4:e6a0 with SMTP id d75a77b69052e-55d7a35af5emr17844321cf.11.1795185886849;
        Fri, 20 Nov 2026 06:44:46 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028c80dsm14013017b3.13.2026.11.20.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:44:46 -0800 (PST)
Date: Fri, 20 Nov 2026 14:44:34 +0000
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
Subject: Re: [PATCH v11 08/13] PCI: Save and restore the ACS Control register
 and Egress Control Vector
Message-ID: <awBc0m4oW9nW4hgX@google.com>
References: <20261118223704.3286085-1-dmatlack@google.com>
 <20261118223704.3286085-9-dmatlack@google.com>
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
In-Reply-To: <20261118223704.3286085-9-dmatlack@google.com>

On Wed, Nov 18, 2026 at 10:36:59PM +0000, David Matlack wrote:
> Save the ACS Control register and the ACS Egress Control Vector in
> pci_save_state() and write them back in pci_restore_state(), instead of
> recomputing the ACS controls from scratch with pci_enable_acs().
> 
> This makes ACS symmetric with the rest of a device's saved state. Today
> pci_save_state() ignores ACS entirely and pci_restore_state() re-enables
> the ACS controls from the kernel's current ACS policy. As a result, a
> device can come out of a reset with different ACS controls than it went
> in with, e.g. any controls programmed outside of pci_enable_acs() are
> silently dropped.
> 
> This also lets a later patch adopt the ACS controls established by a
> previous kernel across a Live Update rather than assigning new ones
> through pci_enable_acs().
> 
> Save and restore the Egress Control Vector as well to keep it in sync
> with the Egress Control Enable bit in the ACS Control register, which is
> now restored from saved state. The kernel never enables Egress Controls
> or programs the vector, but the firmware could have and they need to be
> kept in sync to avoid changing how P2P traffic is routed.
> 
> The Egress Control Vector Size is a HwInit field of the ACS Capability
> register (PCIe r7.1, sec 7.7.12.2), so read it directly from the device
> to size the save buffer in pci_allocate_cap_save_buffers(), similar to
> how the VC capability relies on its HwInit fields.
> 
> pci_enable_acs() runs when a driver binds to a device
> (pci_dma_configure()), i.e. after pci_bus_add_device() has already saved
> the device's state. Refresh the saved ACS state there as well, otherwise
> a subsequent reset would revert ACS back to the configuration left
> behind by firmware.
> 
> Devices that rely on device-specific quirks to enable an ACS equivalent
> keep that configuration outside of the ACS Control register, so don't
> allocate an ACS save buffer for them. Keep configuring ACS from scratch
> on restore for any device that has no saved ACS state.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Reviewed-by: Alex Williamson <alex.williamson@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
