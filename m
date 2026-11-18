Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988293;
	b=ilbbYldorhJHmn8Mh1yv3JG0d9o06IR7wnbApThQHdZBpvclGRks69HsXahADo7PtZCT
	 404dDzWIeU611VacIw0eeSF1AeberNBV7ADOmGy11oaFIDozlCkxNO4yMiFRLoF6dXnBw
	 cUfd2h5xF5XG9SmmQA2hWP5xVp80da9h3ddyfehLoqNLcuA02HNk2CzF/60K5zq3X1BVi
	 9zmgvqJOauJ4lZ+weHzCisKoOc/k2+wRt97f7QimunzPQSDGhCZgu7Nn5oe+tkvrt+RON
	 0OnLGefc659h56PvqqqRamuWlrbVAXh8Wf7+79oZy6aU2kwNMD4FUZiC0wHh92uz2Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r1RbWjqFm7axK1WA6d2qj68hL+HcVofiqBMMK2TnnVw=;
	b=sZ1k8rwjUkFC7ApXM0Z78LYRt+2asSdmLRoxI+sgbHh5R3Zpna3M4XAdoTarf3IgHa9E
	 NElZQrSveH5Z1yAidNK1i2q5xdShAORuwgmFT6O7bI8etCQ3/5qkU25UtryeqPMSN4RHW
	 oEQrPhi6iBUughWepFt4nwGqh+1rpEr2Wbi4prn5y124Ynrc6ShA6pq3xUHyre8q56+d9
	 VHYPfjmHyYeah03xm4Bpkfa/RJ/G9uaUt0ViR3RKD98UucqcDnzaXAvMt6MVWLCkJQukM
	 nAwp14nozxN3wlw8xtWv6BI6NUmJWyd6Ig7AYcjkq30CXE9Pnra9H4VQDXZ30JDkveg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LUoPGOVC;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AA4606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8AA4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LUoPGOVC
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ee254f6eefso50655ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794988292; x=1795593092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1RbWjqFm7axK1WA6d2qj68hL+HcVofiqBMMK2TnnVw=;
        b=LUoPGOVCxwIAV8eWwoj8F3n1uK5UqmtzFRao+C0cCZUHq9IsJxO9vTwDbY2zSYPI8p
         1qfumvCJfVUCN5vKDO1spF1y7T91lMRReIpLQbHWsxPfGc/nbjXdqXvs2CQUZLMzNBj1
         aBFV1zfO2nYpMyw6C7gOvO9658HCrQbGItVnradArYhcMNZoTKTZ7QcGuKxMwyE4Bb+7
         V4gS2B6y5+UoHy28L9hMkvKhoYBVR1FS3LZ1S/Ut9d5YoLGHmEwTuoPwPJ4bqAArFBGs
         vHIkUJrjVYAoPkaNmVt9+FCPEOvYIHehWIWX3F+AosUqz6qs8XVD1oxRPHrsGj44E7gx
         Y5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988292; x=1795593092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1RbWjqFm7axK1WA6d2qj68hL+HcVofiqBMMK2TnnVw=;
        b=I9PiOW0xdxbYxO5o9svemot4P59KsHF/vW+NAVO0BEj7GaFfWtI7iJQbx/tjvbg0qa
         mpcJBjxfc/fd48viMRq1MuIPPn1BQrtG0Y6mhAkKnJy+bkf6RodYaGD2uWL+dz1G7siR
         bFKY11HhZIii67zIPoLmGesZHfBbiE/VKHOMMY4nMa/ZR9AwOMvMn2NbGXNQ9ev9csyt
         vd9TAu1Dsv2scrt4LSJVkhxmvXWjD0lgLgC5o/vUQ52Z79Xfpb89G+Rz2BAvbnKB3Ocm
         DYlBd6pULGe0gyFuFByBhFQK/Qfvgbwm6lL3FqasHgdwUjYhGRCDX0eCyFHKtVZS494v
         mOrA==
X-Forwarded-Encrypted: i=1; AL+hErF6QFNxePdtx0q7qePwqqyGgYEZn+FGGqfJ+anwYLBHAGTmTQ6FVjfik8wgxEY6by8jC75SPOnp5NGLu6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UD6P6+FNw5IcxKvjQ43lc1BMjakJwh4V/gC+LRuGGbc6udmxs
	67XLnTfs7ythdFkoxozJOsuZQ40/gxME8dYI79UfyGm6GdY8aqzzPRFDX3bhQy4b6w==
X-Gm-Gg: AZFdTZeo4uYaw0MY5b4wjPdxxzIZ7ZBuetG5Nr3uSLzHD1JWSgtpyonrZn2u52xhUkF
	8hqtaty8MylfwBAlUc8LbikjhPZWjdW8JHCsjDJjCcOySqvR1oS6yITlQMH7uPRS3yLsEFKEZpI
	2CXTjjC2xQkB1w9CSoC3JvkxGrmmdu40C9GYTLXKnIco3QTF5CnKenvSrAsFP+/rLF1WIbNCbpT
	rnfw4cPTp/XET84nZOfFwVtDUIvnmQ5t3WZFTJmXZI9Zp2gJWCKGyDLAteAQnaB1XC46KTwy+3d
	UTqgm0sOhvV+rnKsGmRI2MZqEWgD9njEyS1NepLXjY9ckrCCSYTT7wUDnlvZlRgwJOCVICzQ9Ne
	s3N2Ex/KE0WHdfgVHpwdxmbEJTImUCAqgSsoPXVjkLyehtrGQm0Xp6r9IlX2Akwg0k6BTh1zwHS
	cA/RVaLckbgChN3+qW+fM0fkSm3u/V4VwHZL7YRzCEeTo+b6KtNstPsHaveGAo4CqQgFh1Xn50h
	SJUM8CK9rezzzMESknXlsUmvrCTYQG6jd3H86fY9n4+BXsP3SJU4PWcp2ifQK4uPAqacGrbMqlV
	5Kryvn8091tCquTHUfsrIdATBIIs9HWV/GkxmDtXjyqgdW9xjaStI2IDyServuHTDA==
X-Received: by 2002:a17:902:d544:b0:2e6:d25:d874 with SMTP id d9443c01a7336-2eff98d30f9mr2984215ad.10.1794988291451;
        Tue, 17 Nov 2026 23:51:31 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ab352sm1000229a91.2.2026.11.17.23.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:51:30 -0800 (PST)
Date: Tue, 17 Nov 2026 23:51:26 -0800
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
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files after
 Live Update
Message-ID: <20261118065653.GE2250529.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
 <DMOAT4VV939P.2DI8CEOMMSKMY@google.com>
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
In-Reply-To: <DMOAT4VV939P.2DI8CEOMMSKMY@google.com>

On Fri, Nov 06, 2026 at 05:19:28PM +0000, David Matlack wrote:
> On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:
> > During retrieve():
> >  * Validate the handed-over struct vfio_pci_core_device_ser header,
> >    sizes, and flags.
> >  * Locate the registered vfio-pci device matching the serialized domain
> >    and BDF (requiring device->ops == &vfio_pci_ops) under the device
> >    lock. vfio-pci registers the vfio device before its probe completes,
> >    and the probe holds that lock, so a device that is still being probed
> >    is not returned.
> [...]
> >  * Open and return an anonymous VFIO cdev file via
> >    vfio_device_liveupdate_cdev_open().
> 
> Here's an idea for how the device file could be created on retrieve,
> which I'd like to hear your thoughts on.
> 
> The patches from Pasha at [1] lets userspace pass a
> file-handler-specific argument to LIVEUPDATE_SESSION_RETRIEVE_FD. In the
> next version of the tmpfs series, I'm planning to use that to have
> userspace create the file and pass it in the argument, and the kernel
> then restores the preserved file into it.
> 
> I wonder if VFIO should work the same way, e.g.:
> 
>   struct liveupdate_vfio_retrieve_arg {
>           __u32 size;
>           __s32 fd;
>   };
> 
> Userspace would open /dev/vfio/devices/noiommu-vfioX itself and pass
> the fd. retrieve() would check that it's an unbound vfio-pci cdev file
> for the preserved device (domain/BDF, noiommu, incoming, cfg_size),
> attach the incoming state to that file, and LUO would track that file
> as the retrieved file. VFIO_DEVICE_BIND_IOMMUFD would then take over the
> device as it does now. Since VFIO preservation is new, the argument
> could simply be required.
> 
> I think this could get rid of some of the special handling:
> 
>  - There'd be no need to fake a cdev open with an anonymous inode, so
>    PATCH 09 and PATCH 10 could probably be dropped.
> 
>  - retrieve() wouldn't need to look up the device by BDF, or reason
>    about racing with probe under the device lock. If userspace was able
>    to open the cdev, the device is registered and probed.
> 
>  - The device file would be opened through the normal cdev path, so the
>    usual permission and LSM checks on the device node would apply.
> 
>  - It would be the same model across file types.
> 
> A few things I think would need care if you go this way. The file check
> and the attach would need to happen under dev_set->lock so they can't
> race with a concurrent VFIO_DEVICE_BIND_IOMMUFD on the same fd. And the
> incoming state should probably be tied to that specific
> vfio_device_file rather than just the vdev, so only the file passed to
> RETRIEVE_FD can take over the device.
> 
> It would also change PATCH 12. Opening the cdev of an incoming device
> would have to succeed, so the check would move to the first open of the
> device instead: fail with -EBUSY if the device is incoming and the file
> being bound doesn't have the incoming state attached. That one check in
> vfio-pci would also cover VFIO_GROUP_GET_DEVICE_FD, which opens the
> device right away, so vfio_liveupdate_incoming_is_preserved() and its
> dev_is_pci() special case could be dropped from the VFIO core.
> 
> The next tmpfs version will also add a way for a file handler to say a
> failed retrieve can be retried, and a helper to claim an existing file
> before restoring into it (so a file LUO already manages, e.g. one that
> is preserved in an outgoing session, is rejected). Both seem useful
> here too, e.g. so that a mistake in the argument (wrong fd, an fd for
> another device, an already bound fd) doesn't make the device
> unretrievable. I'll Cc you when I send it, and I'm happy to share the
> branch before then.
> 
> What do you think?

Overall, I agree with the strategy. I think VFIO cdev retrieval should
happen as the flow you mentioned above. I want to hightlight two things:

1. This will lead to lot of code changes happening in vfio core. This
   means VFIO PCI live update code change will spill in vfio core.
   Should I create a config VFIO_LIVEUPDATE for VFIO core code. It will
   not be visible menuconfig option but selected when
   VFIO_PCI_LIVEUPDATE is enabled.
2. List of other inflight series that this series will depend on is
   increasing. It will be 3 (reset function, pci saved state, and
   restore into fd).

For '2', should I send v7 without changes you are recommending in this
patch and future version of this series can transition to the approach
you are suggesting after LUO changes are landed. VFIO liveupdate series
will go through more iterations, so we will have opportunity to make the
change. WDYT?
> 
> [1] https://lore.kernel.org/kexec/20261103010216.3447716-1-dmatlack@google.com/
