Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984950;
	b=3RLIPqKwR7PM8uUja/6uCoCXRoiuZvTLZKeGoDWl0aBv7mdcpAh6DkFlU12cuzBIoGIE
	 SK39bdnZOEQzvTWxYNEJNgCNRTVAa4PDNE63DyUkhK/D2b+KULfAiSyTtALB7AshX9LDk
	 PJ13zJqXRH/jYS5kYiHEd44yvmlzwUisHQTMaFO2wfqcZmn1fEbpbAdbDt6FIVTfLGf/d
	 VhZUhCptemNIzrOlsl1HosrbKWJh1iIh81Ms007RunI33d2VcnJtPZUNyvnzKI9HqN5FW
	 EOn/gfxWPbwndC2k7kW3o9x2MOX/u6DbJhD6iJhMq0ZDra11SXb8BPg7gX/lDCDzyJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D3IFWTA7ou2igClaDYSbsGTVSgzRWm+OXVAzSzama/M=;
	b=r+vuXDsY0IlUEzwllylmLc8eLMofdkBlIgcgOuWq+CJQKwgO+r6kdX2X0GqT69ZQnW01
	 gKsw92omYbMgmbzP/71eIdi60KR2nwB/Lbcdg0r1aNwXLjt3G2PKdGn3/dQFsbm4YQNqW
	 qqHcNUh/Or4PynrtQXffUiovwWK88nq+FfTkLweDODqK/RGwutaJCKtwKLNEazImwV5A2
	 jqQxozFeAcInGliGqy3mIs/xXZDq13Z9x22yDFjLw7kpmTBk95xpIE9yNEbJe460MRIWQ
	 cXaeuqilc7USQIv1az62LwrwAD0oVc12BN2AaRe2IFeEWwXxrFeRdZeGBcRMERId0FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nM+9DlRr;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B3606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79B3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nM+9DlRr
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ee254f6eefso48025ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794984949; x=1795589749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D3IFWTA7ou2igClaDYSbsGTVSgzRWm+OXVAzSzama/M=;
        b=nM+9DlRrSc+VH8u2ub3VdFxYKqtFiGInc/JZw8T73N7OAqXa44YAOksg8x7jKYkkuF
         yOwhOSelLbR3ciacjrREpqKFfhwK5r7r/lk1Uuk8xfjoCoH/lNZCee8mUf7VWzgC2Bpb
         tu4epm3+IlJ0ND44vTbQq5ss3XdQK9+PEMFYKwhU6O5AlBrQKFaQWO73Goy4f29mqVNF
         kOuWgxQrag89XkFP2hXkoPYCBeCCPY7IogUEhAraGQ1G4jNGdi2k90Bcg85Nv9zDziAx
         kxmiwEPofn984RQ60OOeumbDhK4iguBvHixxVMsJ3QgsnlDAMgH23D0cSlu0yXLJ2j5K
         Zj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984949; x=1795589749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3IFWTA7ou2igClaDYSbsGTVSgzRWm+OXVAzSzama/M=;
        b=cb8UbSgmcxbM5zOmueKE/paqhRmkuRLMV+wgv4CA0tow0x3FegVwvSM5mEazBTtQcC
         N6Z384P/es/MS0s4CbRTVj5x9WRqe+S1VyW4u1YX2HzNjfIjuGCTRWdGU7GixDOxeHLr
         p0aX4AoMaiKEsuK/lN5QQ475jiEIaEWHEomPRu2DxQZpW9ox36CE+taizn/w3SbQrW/E
         KO7v81F4VkTBwJuzOcD9gtEod16jmxd0tp+Y9IKQXouEr22ctrI4dw4CAwmb42cjTnyL
         Z+sMZNrrL32BevdskA8i6CFzBIcpCfb87/a97xfUdL7PhhtJbDIb1+vvSkCUZ/9fifWs
         xlkQ==
X-Forwarded-Encrypted: i=1; AL+hErE12CWgkMgwd6wEfsJgxQezm3XIAUD7j2QIW6vHFuJJwVWYKjkoR/LxyD3qQJpsJ9kTPbhy+KPwKXXy4rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pil6UHMyw++kNtCFeqXU6LbZVCkLf2kwvIDNvsPf7ecp/UyXw
	6bv/HfCW3VbkXJEQTdl97Y/qGIRLo5jx3iX0+XUK0UJuzuE0hfR4SuhjSP5Hcwdj0g==
X-Gm-Gg: AZFdTZdLjz2XXFSU0AGLV01uTEIKG1ZkKWDR/VSTal/U5UbbswYAIPP9L5DAV8R6Du5
	UN65oDmsRadqKhAyHd12luMKPntS9VCQ8I/Kj42Twj6uV1YrH7ME+BG6jWeZWO/HCSYhjkDs+L4
	ha79l1ng6PPrV++dujhkyp+OhMl68BivbN4ZHFwtrNHBYxsnoU0SXSTjkexLYnswrqgysLqJP2P
	h9I4XP+X5UjMpN/VRU0/UHfgQ6CMvE/DcAPd1N6divkrZ45xIpsjXvD2+fb7kDFO4xrBWXn1DKe
	G7yzQoJFS9Cj9JYAc3P/IZ4io9/5ATZyPoAfH/nzYTGkm11hwSnRXNOo15in/eicx72oSYskrmG
	36QQOu2TOoJIe6gQzg97HFnLdUUrjvbUGlLBGZyZwpm+T9Uga4ulnXXpXOdgIPzflPIEaLOaoUv
	SEoBFeJP0d8iiPo07OUx5WUdkve3ws8G6g9e6UAQPG1gX/6mqd/uo4PuPeNHVpcUfX26IGlSqHO
	oR9CO/H9cgHPf2eEky8sCLceo+w0gsEsURrxuKQdFoTKSXmvGCQA0x/VlgHmzAPa5G+cKAiYIgV
	CzF+wnaV398aFe+fMz1J/aa8SdxfZS7yiCDFKRclKbPdtdLeWREWWWbm6OmWU1aE
X-Received: by 2002:a17:902:ce10:b0:2e9:73e0:2a6e with SMTP id d9443c01a7336-2eff9952062mr2886095ad.17.1794984948419;
        Tue, 17 Nov 2026 22:55:48 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm657169b3a.20.2026.11.17.22.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:55:47 -0800 (PST)
Date: Tue, 17 Nov 2026 22:55:44 -0800
From: Vipin Sharma <vipinsh@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <20261118064707.GD2250529.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com>
 <au5VMy7zhOb65xIE@google.com>
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
In-Reply-To: <au5VMy7zhOb65xIE@google.com>

On Fri, Nov 06, 2026 at 10:35:27PM +0000, Samiullah Khawaja wrote:
> On Mon, Nov 02, 2026 at 07:36:36AM -0800, Vipin Sharma wrote:
> > +/**
> > + * struct vfio_pci_core_device_ser - Serialized state of a single VFIO PCI
> > + * device.
> > + *
> > + * @domain: The device's PCI domain number (segment).
> > + * @bdf: The device's PCI bus, device, and function number.
> > + * @cfg_size: Size in bytes of the device's PCI configuration space
> > + *            (``PCI_CFG_SPACE_SIZE`` or ``PCI_CFG_SPACE_EXP_SIZE``).
> > + * @size: Total size in bytes of this serialized buffer, equal to
> > + *        ``sizeof(struct vfio_pci_core_device_ser) + 2 * @cfg_size + @saved_state_size``.
> > + * @flags: Bitmask of ``VFIO_PCI_SER_*`` flags; unknown bits are rejected.
> > + * @saved_state_size: Size in bytes of the serialized &struct pci_saved_state_ser
> > + *                    blob stored in @data after ``config_map``, or 0 if none.
> > + * @reserved: Reserved for future use; must be 0.
> > + * @data: Variable-length payload containing, in order:
> > + *        1. ``u8 vconfig[@cfg_size]`` - VFIO virtualized config space snapshot
> > + *           captured during ``freeze()``.
> > + *        2. ``u8 config_map[@cfg_size]`` - VFIO capability map snapshot
> > + *           captured during ``freeze()``.
> > + *        3. ``u8 saved_state[@saved_state_size]`` - serialized
> > + *           &struct pci_saved_state_ser captured during ``preserve()``.
> > + */
> > +struct vfio_pci_core_device_ser {
> > +	u32 domain;
> > +	u16 bdf;
> > +	u16 cfg_size;
> > +	u32 size;
> > +	u32 flags;
> > +	u32 saved_state_size;
> 
> We will need space for iommufd_token when we preserve that, we should
> probably add it now as otherwise the compatibility would be broken when
> we add it? Is the reserved here for that?

No, reserved was just to align data[] to 4 bytes boundary.

Based on David's suggestion, I am gonna get rid of variable length
data[]. This whole serialization struct will be fixed length.

I think it will be fine to extend this struct by adding a new field at
the end of struct in your series along with updated flag when you add
iommufd support. 

iommufd preserved vfio device cannot be rollbacked to this kernel where
there is no support for iommufd preservation, so, flags will be correct
to reject the change.

Do you have some other concerns when yiou compatibility would be broken?

> > +	u32 reserved;
> > +	u8 data[];
> > +} __packed;
> > +
