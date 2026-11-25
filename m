Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629948;
	b=P+QOVN0jJTBx6N9EO/JDwtOohTy7bWJBePK+ZekS+/UugxneyQ1bF/AMm9n/+BPCyJsf
	 NQWp7qgXcN1134bDEQp7GGe48DjLo2ahs7hovErSUeD9ldBhKFeE/QAf/WnT0YZJVcQSu
	 x0pIvI+Oib4TNzP319Chc00P97hczsj+cVBnbC/6xnfGaA7j6qSaKDNqNjOzb1VcNcfh2
	 yKKwDIKe2CqSqOE9sk1ewJO7uxQ7ftlDqWvs4rk5QCyhRxUcmH/+pxgCYk0g2ai8tGzw1
	 YPrOFmUgje+z2ltI3dY0w+h1VSNh/4VVSplU2B42L9vD8bYBnLJ84osF4z1Q6udBWHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629948;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eTgM3sm3JbqXraTcQCNo5DpHIoGBnkhb9HOKRAi87kM=;
	b=PNNkNa7VZzrDmAmI+/XVCIDdZP+fH6kQm23jreYfPnk+LQfcQfHSKXAinaHVNL1fdwxA
	 F+y+/MH416nr+3K4gyNLYum8i08JLNq+LNveE97q1wzBbBxJRqwd2uuwoLe1FhsTkAcEq
	 2ojWT9O9YdabmdnZxrHt7FbAu51D34Vq1bCjgfQ728Ey1n9Q/YnyGD4+KoWYvhXY/s+pF
	 NoPHbxDUwX4Vh5PuQ7EmQppYcO3K2FTJEUAinSyE8zJuKYJqocBlxDotozknohn0VTT4l
	 A887x/8m/zVHkhiBtpDxLjrjjfacGyVoAAtn2WmRqMf1ukZ4RfQTo6cCJony7TUVoyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsTHQXRg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NGv0CS2d;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A80606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A80606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsTHQXRg;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NGv0CS2d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795629946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTgM3sm3JbqXraTcQCNo5DpHIoGBnkhb9HOKRAi87kM=;
	b=NsTHQXRgklyA1gr7BbHiiLnWkoEtAz8yVlP0o7dxFsog7LccidYpJ1cisA1sL1OVnA6V2X
	zC1fbiee5JqEFz7HI/YNEBYmLktwfVkmEnHG+1sSiw8WnaBMkyf+WY3beniu7PQpwJWkn1
	NjbeZOmq12Yrjoj3SrB5ZUV2TXvDVzA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-GF4HExK0OVu6PNnaIj9GMw-1; Wed, 25 Nov 2026 18:05:43 +0000
X-MC-Unique: GF4HExK0OVu6PNnaIj9GMw-1
X-Mimecast-MFC-AGG-ID: GF4HExK0OVu6PNnaIj9GMw_1795629942
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so3731203f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795629942; x=1796234742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eTgM3sm3JbqXraTcQCNo5DpHIoGBnkhb9HOKRAi87kM=;
        b=NGv0CS2dgDOz4wizA5qE+/hjQnXsqwhLfoAZiX0bHMowuTDzE5Kk3VPRTu3auZQMJr
         AVzOtxcVjuI5yVKUxrIytkbyDSbIUtA6Gx3xl36aiPO6TfS247dD3YdCYVpQvpNq23k3
         X9TEYWP7nS5iuWe+fynEdIwVn5quvn13O+pQo87+biLFxen/D7WvjA8QjkfrLw1KlC5B
         iP+Z6GEICkulQB640sjWxntSl5WE02/TdPSW+3EsZGhuW1B2NR2IOequcpLMLoV/C0nk
         xzRl3+QJ6e0PIFkkOcT/Bc0bAK/xH5LXzuXbhAOXOC/gzz/uVuPgJejqQyVzPscfZQl7
         B/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629942; x=1796234742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTgM3sm3JbqXraTcQCNo5DpHIoGBnkhb9HOKRAi87kM=;
        b=FQ2klv7vWcSo5ov7/1OhIo41nkPczmiI+wLWSn1wJNuglOaGoJArBP/H52jjuzlhqr
         E81lT+tIuq1vndiWnc8+vRoMYuxvXYwllyf44r3ME4YL7zooMO4lDi+kQw5ZwB0J9s7s
         XpxubNsA2U1rr5tNbkaJraC8wVumV/JfzoCn1214A7JTQnqM2hPJy//8Rge4AQ/0qsV9
         EBt67NMDv7FHURAMczTKWpR/NjW7oK1KGAYjEgVim4KzSm1yV600I/xGiaZzr/WF9Fza
         BMdzkIdbSt6YaMnSs5kXHqkrCsrTFVvyPV7R70yEGAafHleb/WO+RsBAzGcf5/6NLZfa
         EO9Q==
X-Forwarded-Encrypted: i=1; AL+hErFm5SDPzAbqUsvpwqVOyod0jyXRwsETwAODJiJOfveMg228Zb4wtI+KaqdH0RBLjlGapiADjAhIppqUeaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LfI0XoHzcowg5Tg+eKFKiTI1PtKT4V4Wfcn08EeEBGfetpCZP
	hVKh5vfdP6JgKZ50YBE7wH557iltuOK6jKdW/HPM6fNRLsNeB68APbSJi7RqS2Hc86Fr35ZSD2e
	Eieqm+db2O2Eiw4uGypgQUrXPH+ticZum/uyHWO8PMNwSNkHZDg6qy2WMX+lSSZA6Ig==
X-Gm-Gg: AZFdTZfDRxX7paNLMBS26J+t+ehT+chIjqH2xC2bPdv7GjCJtucio1Hxch/o57uhkd2
	w+K3ioBQ3FXkWDhweZgfwb1CNd0dXIhfyv+DnNNm6JuebaTPFDD1sGtIfeXdv7mZOnbVPtotln/
	53893IYNkO+GAxH9qlqD6k7dPD0//5XFgwHazg/f7c26ZJkzPHeNfqOCYSCU7HRcJpBFgtfE6hp
	fsw/sxCfqMDWeyRlFWAnd5DpIACjquOkv2XV7YmPf2PGTdQbLCy1rXhRpNw27fGObEDoiczOuIA
	YVL2XRNFFq1XLaVf2AF++iEe1y7WxZOaOAlNbs+jjr+icUAhlKgMWrYxW/bcmwrlvRymqo58FuS
	jkGVIGOLy1BpVyHGrUIgJw2fyyeMHYB5eGasbIPLL5l4=
X-Received: by 2002:a05:600c:1546:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb887c2cb0mr419593065e9.2.1795629941946;
        Wed, 25 Nov 2026 10:05:41 -0800 (PST)
X-Received: by 2002:a05:600c:1546:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb887c2cb0mr419592265e9.2.1795629941333;
        Wed, 25 Nov 2026 10:05:41 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1529:2e00:86ec:bef7:c309:ba1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm840055385e9.14.2026.11.25.10.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:05:40 -0800 (PST)
Date: Wed, 25 Nov 2026 13:05:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "chenglong.ma" <longpareto@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vduse: don't set VM_IO on the domain file mapping
Message-ID: <20261125130424-mutt-send-email-mst@kernel.org>
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

why cc stable did stable backport the buggy patch?

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
> 
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

