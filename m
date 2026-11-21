Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261146;
	b=VudfEtH+pztSVV+xHkBb4E9CaqnKN7Mo6gVQKI13CFvkDSzosCfP3kjR2kVAGdH6D28m
	 mQ8R37cgK+Df3TTj8jjmweF/U7IpVf98sMqeTHyO4P3sP5El0eYlMu6pd9gFybZ5KlSv6
	 b9bePoVjqR2s5OxMKcVPoUQKPNLMID35k33cIeYvMSD21/j3nmbgbEHiSfPKQC4UrNUO0
	 JadBx1eF5E1r3cjoIP/gx9pgkMmQlOj6YL0wh8+r/B1VqedS7wjNUQwavu6NLXyGh4jSd
	 EZ1YtOfr8jHK6CFrRW8TrCOPoCz+CdCxJaq7fkaGqtRhJ+MuLlEuVhqWzKKbQS74AdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261146;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=teMH6S7EaqFQYM4oDuVXXitgWf9SxZUq56tJupIshRg=;
	b=cFVzaxk6c6hcTvOGyfcTSlOp4archWIkflVYIE2IQlmxp1LZkoVysyd/HEn+QplCuikp
	 kBFdQyeBJE+/cogCHaSVYkfi/hidZ6M0L18DtC2IOR3InyzTpmjQ3DShGCAXmmquaokv+
	 5lpGxmOOon+lHRUzwscp3wWHqhw5No+SwRv/TxUJpNB+JyaNr88q+dRFXFq8wrE1zX0OI
	 yNec59cWGwptm8c+ETx3qFWqj95VgMFkhqgYhrTOX1wCtf2PDJN9bIL3syc+wI+zM54Zg
	 299qg77Ddc+T3BSbTCu80t27aCBdGr2qQvV+d33MgpP7sj3UqQGupgmSIWJunKcE1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h1SREw11;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FlmChIwb;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF33606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF33606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h1SREw11;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FlmChIwb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795261145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=teMH6S7EaqFQYM4oDuVXXitgWf9SxZUq56tJupIshRg=;
	b=h1SREw11lMWWZ0CBLh95248ovAN5don5/8zO25x1wDQoJosldf4HgUyh8OBdlmQTpZFPiw
	vW518q8rC8UY1dCa4o4OaaAaQaP922izij/Q7o5141sauJFMbmOh01+G2dBXAj6TlexcLd
	8LfHA8uxRsQgJUTLcGvQYVV+/lxG/Ec=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-_idFFwqcMGmSMouvIQVpQQ-1; Sat, 21 Nov 2026 11:39:02 +0000
X-MC-Unique: _idFFwqcMGmSMouvIQVpQQ-1
X-Mimecast-MFC-AGG-ID: _idFFwqcMGmSMouvIQVpQQ_1795261142
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so921694f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795261141; x=1795865941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=teMH6S7EaqFQYM4oDuVXXitgWf9SxZUq56tJupIshRg=;
        b=FlmChIwbtLmxKCy6b/Y7IL/DPkHT9FnVi3cXi8Rju3Jcl/tCjWVje8NABsbSND3awo
         L3MM0ar7reOi2SxYbAB8WP9/MJp0N/BB+HGV8mlDT8zDD8GWZ2vIkkzH9/7bKtvrxp3Z
         wZaXVmUn6AAQnejEV9ftfpR8RQaXJbEbjNPLaAy8HivQ/XMFyJobfPrUN64LPLSFAp8z
         uqXcUnWIiC8g8CyYIF61tfmce6qcgXFQMfWXJc8bbUGkOLRdBZwzJltxeeWtJvqIH2BH
         Qn0p3+02UZHN1zI1BtkK8nIbRqhDHX8vB+6nFdLrAzcPA6Qq0JMYhnP9hB3NwozcWEdB
         dtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261141; x=1795865941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teMH6S7EaqFQYM4oDuVXXitgWf9SxZUq56tJupIshRg=;
        b=PPjGKcj0XVdOItve0g4LjKI+YJOVdCI5ivWJqf0Tf/XBHPDipX62YBL00YNZC7BQzP
         daSrHUZpHMLlgv2vLr96ugkV+HS6PcFgVFkMr3H5JrdIjeLyh+iRqJbl03+bSE1u0UqU
         jiOO1cVxZDpwZ/zkMqYHavmGxy27n3NV27dm9C1wfBQNxzmTOvgG4gxlDRFFmSXeJT/y
         ei5o2V69iov4ZTn6p+zTa/1N9swirXlAKPpwOtmhVvehZQMpxqNeRc20eDk7H8CyrEMs
         6yxNWzImuwrd7mJv3x/PnjfFwt7jHRstDCWgqGki2GCpcJxo5+uLl6FFcWwSLoQZe4K4
         E8/A==
X-Forwarded-Encrypted: i=1; AL+hErG/YWEH7Unpd3IZ+IXuClAo4leiZXeOjP9Te4PkOH3stgC2FRJSByDLNmyLRPxnLptaTpUlqOEHc/OTD78=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sEA3fQcgRfMemGYYlm4Es4chzsLAeaSWvsAlA1gAv7SFqDAcZ
	jBWEbMjJKQfdTmA2xww/uvOPsW46Q/93FrjXS/Skc/ykJ7wNJD/DR9w9uWk9xOTmxk6VYoaD8qQ
	4/+n7b3Q3ykwrsjE5l1OBWMtlycUS4kNNN0l7DeGKuZ2bOHXZiUn5zXOtjXjRDPyfhg==
X-Gm-Gg: AZFdTZfL+ozVqooIvnKh9gB0+Sor63MCX5Hxh7mB7RsF0hBbzQMgHdHQ3C3o3FZVn3/
	PoZY0FkxgGlYJG+kkyndEsgPd/xBP85kJoVIg69jslmCcBNl4m0q6VFDsYf1R8tSPMjPSCtRrC2
	5AcU2js1eg72HJIh3LaT5uEmqFYCsn28P6Pa0NMcycWvtT2Y/vTDOfflblyLL88cTB/DO41I2BK
	vbyUQYimvbw83zCEyTs8UIsioa32NXHHwZ3i0+aXfxzr3rZLckv99YwG3+BnuuLwl1dvNJqSBME
	LeZ0U8GR1yPSUA5NwVuSxY7rb2cq+vaPSeY9K3/UYqKVyZo989jRHCpXkIySrWn1BFLAyWXpH33
	BF/6PLRDLoi5g67j2TdY5YjmhpBaDSdXXmqsAekTjrJbq
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr126399725e9.11.1795261141502;
        Sat, 21 Nov 2026 03:39:01 -0800 (PST)
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr126399535e9.11.1795261140981;
        Sat, 21 Nov 2026 03:39:00 -0800 (PST)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm334176335e9.4.2026.11.21.03.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:39:00 -0800 (PST)
Date: Sat, 21 Nov 2026 06:38:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jonah Palmer <jonah.palmer@oracle.com>, vlad.wing@gmail.com,
	brett.creeley@amd.com, eperezma@redhat.com, jasowangio@gmail.com,
	jkkm@meta.com, kernel-team@meta.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com,
	joao.m.martins@oracle.com
Subject: Re: [PATCH] virtio_pci: limit Oracle DSC2-200 virtio-net to 48-bit
 DMA
Message-ID: <20261121063742-mutt-send-email-mst@kernel.org>
References: <20261109184253.531677-1-vlad.wing@gmail.com>
 <20261119200654.1048266-1-vlad.wing@gmail.com>
 <20261119181557-mutt-send-email-mst@kernel.org>
 <20261120171435.83458-1-jonah.palmer@oracle.com>
 <20261120123500-mutt-send-email-mst@kernel.org>
 <b8ff5bab-d08f-42b8-9c88-e4665ea3078c@oracle.com>
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
In-Reply-To: <b8ff5bab-d08f-42b8-9c88-e4665ea3078c@oracle.com>

On Fri, Nov 20, 2026 at 08:35:12PM -0800, Si-Wei Liu wrote:
> 
> 
> On 11/20/2026 9:35 AM, Michael S. Tsirkin wrote:
> > ZjQcmQRYFpfptBannerEnd
> > On Fri, Nov 20, 2026 at 12:14:35PM -0500, Jonah Palmer wrote:
> > > On November 19, 2026 at 6:16 PM EST, Michael S. Tsirkin wrote:
> > > > it's in my tree.
> > > > Hi Vlad, Michael.
> > > > I've been looking into this issue extensively. The proposed 48-bit
> > limit
> > > is a suitable conservative workaround. My virtio-net testing for this
> > > issue shows that a 51-bit DMA mask also avoids the mentioned issue.
> > 
> > Do u want 51 bit then maybe? x8 memory with no BB?
> 
> 51 should be fine for now, but it's not the final expected limit. We just
> wanted to inform you that this is subject to change, once we have firmware
> issue fixed. Maybe you could wait until the FW fix is cooked? It'll be a
> short while but we will let you know asap.
> 
> -Siwei

Makes sense. If we can get by without kernel patches, that's best.

> > 
> > > Full 52-bit DMA mask support is planned. We will revisit the driver's
> > > DMA mask once the firmware has been updated.
> > > > Thanks,
> > > Jonah
> > 

