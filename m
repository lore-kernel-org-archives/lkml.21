Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629987;
	b=lzxJjANXNZhxkqNsN/AM/P5J0wXyqPgrILsimaPkxFrfwWY7uBzTdcrSFJF6krgpur/9
	 ATguLdyg4LJBy+bvYGYZIt1KF+EZRfC7ujFnYLiAos7lMJ6K2ZTHQwyWOF9E36GEeRddX
	 L3zkxFExM/n2FLX3r4qrufXNjtpyiIzx0UznpfmEAUAHmXWFmvENsZ9XnAVqXSPZDM0d5
	 ixei+kvORivqW93vcewSRT2mxpqNPLbXbymE7rqIwwZMpQ8vqMhH0EtJx217kMFQy9Wsf
	 EtdvR5QpZPIJpVNeqPa40QNERI7dy5CvJXVr5IHxub+yG7YTGEyGawtyCPPvZnzTERg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629987;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=R+Af9eWwgldLTUDD7Otvu3vGqJ6bqfzJqODBgc++zE4=;
	b=2GGz4PjjlUkv6oxTHn4qyfYqAVF+UE6QPYiWlX/y1W/SBDSiNIvpec4Cye8VBu8u2OXR
	 yfQmHvEKDEZ93yyKdeNej5CTyeD1EjaRAeFOJ6gGBtDbucCiCADnx7mVHkI2TJVTMWZaD
	 VDcoyJQTjGRlUHAOW+SjhNTkvBVDPin/NOyNUF+atda8uB2q/t4S0iy4k/Pj04kTp+UBX
	 cojrKcaVYgMF62uDnLwclq2PRkmgrm/AzW9J7UK51oIVa1wuR2wKUqZGHHHX1YGwtnCDd
	 7+Rkf66iuKNEqZ8q18nKcl6IkfMpRJ9VnK+fmXRMtGdBjlCeCD5jbaYUBy3vNKUtlrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GE8M4sfL;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Jr3xhjPh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC22606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC22606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GE8M4sfL;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Jr3xhjPh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795629985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R+Af9eWwgldLTUDD7Otvu3vGqJ6bqfzJqODBgc++zE4=;
	b=GE8M4sfL0RPyCgV3UfnzuMVnt8sCJaWgJUOk3dtaWJ0mtkV5SJFxSWpAxXC0ewwsvVpQfI
	BZEjO2HVZQSFz7u4X3XVVkOBY8Uap0p7tL4lQH4GFq0jT6qeuoCwVrW4RQ9Bz/DvJE1l/k
	1eJmAGcG6E0lEipcZJhpfkr8Wbet2dA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-9O6t_xM5PveynNfazdxqJQ-1; Wed, 25 Nov 2026 18:06:21 +0000
X-MC-Unique: 9O6t_xM5PveynNfazdxqJQ-1
X-Mimecast-MFC-AGG-ID: 9O6t_xM5PveynNfazdxqJQ_1795629980
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso53475135e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795629980; x=1796234780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+Af9eWwgldLTUDD7Otvu3vGqJ6bqfzJqODBgc++zE4=;
        b=Jr3xhjPh+bq1MRRmg7RNC/l4XwYSW0YJwOUumeTb8pyM7P50WZLRYnUUH67FsJ+BFO
         kCpCfXfre9tHlfaXMIs0OOyJAr1Il5LNKUeo0qtzt20ZowdyfPEju7JD75A0HnMPxfzq
         LEAzDgHzy5GYVbz4Pg4TbieaYNeT3T0g6yXHeuEyb5t4OFuLmdPPLTwnJln8ac4pSjAb
         5I5anQnwB951iOFiYXN1Fw/FSOs7vknEJeD8Mvv+PQwy4hLDiH6HvuIoVj2U9itu14gY
         BjNi3QUMzkko4TLapiXQxEjAcCPan0IRxkz420skShtRCCFcd+AJJ1jxQ9e0ILGZQFzW
         sn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629980; x=1796234780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+Af9eWwgldLTUDD7Otvu3vGqJ6bqfzJqODBgc++zE4=;
        b=U7HQE6wzxW32+6QsCiyBXY5dmxKE6wRVljAATFp23fs/xCfEorRAkGtYwOl+QvDgY+
         iNJ7a01xkpaTpZ8aR943iUwbV18J+OuvgB8bbyBdscaltQot3HiA1P6YiJ9N4zJuMuaK
         6hM+uHfHvCc2nYUfYF1+np7E8ePVTg9u96rR/haI0gOz3XDKTSObCL6I9QxYQ+pwCdHp
         LQ4SB+xdJxbWnQqqQdUgUHCI8hkcUGGUHgaMl+he5BPX6Ks0XX8o5AppBkePqv/XPNbn
         cbdipJqTsX5IBfPZAkX4LrD/b0yr2q2IC7jFnWkkKAPR6Q6S1xec/BRURbRj8F9xzUQG
         00uQ==
X-Forwarded-Encrypted: i=1; AL+hErHSPBLcu5xiJv/rFtyddnxHyh2sa1upUnwApUWH/HejnTQo+r4J3H93+41O6d6GMlg/F7pQUcW4/d3BLHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xXZJ0c0U6V+4Vyou8hOaNgwX8CdpP7nXdre9Hn17FvMghWfox
	JoSGfjFfefId4f7girWx3KFrn9OyJlagGwBECGq1w1V+hRy+bRcyB1IA+DZ8z/NDh1g+4Ndrnx0
	aBZTrQ6iPZbqvLyY6dHs7pkx6DJx5XNjtW6ISSo8/nl/mBhjdDyQZDUqhEzgciLh1eQ==
X-Gm-Gg: AZFdTZdIiyFrSRWTBQ4gS00/cbFhbrzRe/R9qzQhmbMyzjXMpORv9/6BTDR/nOGdvRk
	Db7zkspAZlwfobMdvw4P1rQM5/ZJCiYUwDi5hfzg4R3mYii57j/QAofy0LG33JdffWbmnFeFsjZ
	ZQ0jtP/W0ncjU+bi8uQSNUxCBDKn1Rg79G+7uWNCWUhCqPAq25xYFeZXhLF82pLJfcS1ysuaxaT
	9N83xGmexOGyhR81LWKWRRQlxro04/Fwf7g7JprRV1xULojzpIRm6eInb7iX8s4oChYN68Xmyyz
	+K6BHinhL2QU9Ia37DY8wmoymnh/Y1mQFwJqFJEVP01eNbmJD7LQ1PTjpja4eruZW/LZf+bcC2s
	2TGGfz1vUR8ZB2PAnVsYtLs+v8kS7Ge4NwfdwSIkSEUU=
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr424523985e9.31.1795629979899;
        Wed, 25 Nov 2026 10:06:19 -0800 (PST)
X-Received: by 2002:a05:600d:82c5:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4bb88822642mr424523545e9.31.1795629979374;
        Wed, 25 Nov 2026 10:06:19 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1529:2e00:86ec:bef7:c309:ba1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm597334515e9.3.2026.11.25.10.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:06:18 -0800 (PST)
Date: Wed, 25 Nov 2026 13:06:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "chenglong.ma" <longpareto@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vduse: don't set VM_IO on the domain file mapping
Message-ID: <20261125130547-mutt-send-email-mst@kernel.org>
References: <20261125160128.796-1-longpareto@gmail.com>
 <awcNt5C6jkZQLy0M@gremlin>
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
In-Reply-To: <awcNt5C6jkZQLy0M@gremlin>

On Wed, Nov 25, 2026 at 04:38:51PM +0000, Lorenzo Stoakes (ARM) wrote:
> This isn't how you send patches in the kernel...
> 
> See https://docs.kernel.org/process/submitting-patches.html
> 
> This is a v2 of the original patch. It should say [PATCH v2].
> 
> You shouldn't send a respin so quickly.
> 
> On Thu, Nov 26, 2026 at 12:01:28AM +0800, chenglong.ma wrote:
> > Commit bb2e6f166547 ("vduse: fix VA/PA confusion in the coherent page fault path")
> > set VM_IO on the domain file mapping so that
> > vhost_vdpa_va_map() would skip it. Since 99fd6bf43d5d, mm refuses VM_IO
> > on mm-managed mappings: mmap() of the domain file fails with a
> > WARN_ON_ONCE() and -EINVAL, which breaks VDUSE userspace.
> >
> > VDUSE is currently broken in 7.4 because of this. Please treat this as
> > a hotfix for 7.4.
> 
> You should say that it's broken and the patch fixes it in the commit message,
> and leave commentary about it being a hotfix for below the ---.
> 
> >
> > VM_IO is not needed. vduse_domain_set_map() already rejects vhost-vdpa
> > entries backed by the domain file, and the file check in
> > vduse_domain_get_coherent_page() keeps any other entry from being
> > translated as a physical address. A self-referencing mapping now
> > reaches vduse_domain_set_map() and is refused with -EINVAL.
> >
> > Fixes: bb2e6f166547 ("vduse: fix VA/PA confusion in the coherent page fault path")
> 
> Cc: stable?
> 
> You shouldn't be using VM_IO anywhere.
> 
> > Reported-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Closes: https://lore.kernel.org/r/awWOpS3HR_2FTN3I@gremlin
> > Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> You failed to propagate my Reviewed-by tag...
> 
> > Signed-off-by: chenglong.ma <longpareto@gmail.com>
> 
> This Signed-off-by seems invalid, there shouldn't be a '.' there I don't think?
> 
> (Also gmail isn't really recommended for kernel stuff either, they drop a lot of
> kernel mail).
> 
> Anyway, I assume Michael can pick this up and fix it up a bit?

I'd rather see a fixed up patch on list.

> For the patch itself:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> > ---
> >
> > Notes:
> >     Tested on v7.4-rc2 (commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb).
> >
> >     Control, without this patch: mmap() of the VDUSE domain file fails,
> >     with the WARN_ON_ONCE() from 99fd6bf43d5d.
> >
> >     With this patch applied: mmap() of the domain file succeeds, and
> >     importing that mapping through vhost-vdpa is refused by
> >     vduse_domain_set_map() with -EINVAL.
> >
> >     Dynamic tests also confirmed that vduse_domain_get_coherent_page()
> >     refuses to translate entries backed by any file other than the domain
> >     file, and that legitimate coherent vring mappings are still translated.
> >
> >  drivers/vdpa/vdpa_user/iova_domain.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
> > index 28a977248a0d..3c6fa18703b4 100644
> > --- a/drivers/vdpa/vdpa_user/iova_domain.c
> > +++ b/drivers/vdpa/vdpa_user/iova_domain.c
> > @@ -588,7 +588,7 @@ static int vduse_domain_mmap(struct file *file, struct vm_area_struct *vma)
> >  {
> >  	struct vduse_iova_domain *domain = file->private_data;
> >
> > -	vm_flags_set(vma, VM_IO | VM_DONTDUMP | VM_DONTEXPAND);
> > +	vm_flags_set(vma, VM_DONTDUMP | VM_DONTEXPAND);
> >  	vma->vm_private_data = domain;
> >  	vma->vm_ops = &vduse_domain_mmap_ops;
> >
> >
> > base-commit: 44293796526f4343639f87b2acc53811c78b5d54
> > --
> > 2.45.2.windows.1
> >
> 
> --
> Cheers, Lorenzo

