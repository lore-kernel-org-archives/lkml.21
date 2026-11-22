Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374852;
	b=StnODCu9G9PIUM6f5RWlkCi9iUjXAEVcDsgWedL6g3CyYNtbn6xlysjwgjdl1vjpJGey
	 lK8ScJ2GKNWHcJHHIP5CnDfi/Q4Bw1vNBztyw98PzusNan3ffGV0EWVFyxyn/03neSRDk
	 mMBV9k2c7MtH+jhaCQ7AQe+m2WG3VCP09mxLYxYorzPG5xYHNZkIY1ryCiNT7zZ73kIHq
	 zJE5kZ/9AND6eZBGsvuhIlOXAZYZ9wmHuYuAEYOPhJd0AfI0xh+9kpnzyBftPc4aZUVeD
	 yuL5fc6VaknI4qbXrPMCWXyfOr3oOb2JGNGP+Phr0S8TmoFkoxxjgXki92XZ9GgaPRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374852;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SPoTViWJGHL7QSLz+I0tDgbdnIX9thSbIOpbmEgxuw8=;
	b=UM+dnxHJ0jm+00NEUWAaN6ONSfZOlMl2AXO7Us+bMRZ7grktN+jVqj0aI3m9uNSOpv1g
	 QNty1LovvhEk3i+Qb/5tqwfaF6E+5Bu/wK9KQ3pnJYEbozz19bbBFllaJ3o9Ts+/p3oxK
	 /EkXAgR4wZNvyws6tBgSRLyki6AZKLoKTjUPky18Adr9+3H18oD4CpdmyHWKLVFIj7CUA
	 APPktTokC4l/U0a8g53yB8Mop0ftaQGlWDVHzHkOD1uV06YwpyajfDhky7wT9zph6Cr0+
	 pTiih7I71Z3WQnBozfVKYZq7D8uzgWGO95tI6LPlweiZTg7nJkaMpavte1x1YVx4ViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZpAwrYuL;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I+9gw4J3;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886E8606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886E8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZpAwrYuL;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I+9gw4J3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795374850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SPoTViWJGHL7QSLz+I0tDgbdnIX9thSbIOpbmEgxuw8=;
	b=ZpAwrYuLf5EdLloLxtncynvxdkf3IrcU3uWbIR/1vn8nDClXS68XwwZqoZEaHb4EEWypM7
	if1l767wKwZ72NATFFD+S78SrI6tfnWhXMGf6KGmtG31XeFcBx1KlJPtHHT/yLha4LI1b3
	bO8IaXfLRF2/9MoTLpg/x08hhJSGBzw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-zcwIRgzvOgqlmUZo5V2FyQ-1; Sun, 22 Nov 2026 19:14:08 +0000
X-MC-Unique: zcwIRgzvOgqlmUZo5V2FyQ-1
X-Mimecast-MFC-AGG-ID: zcwIRgzvOgqlmUZo5V2FyQ_1795374847
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso19502315e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795374847; x=1795979647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPoTViWJGHL7QSLz+I0tDgbdnIX9thSbIOpbmEgxuw8=;
        b=I+9gw4J3CXiFaFKNO8WIQqKcUIlUxmMmLmeqeDzziAmXvCXmDmgPzFJrv1qGn61o9i
         Lr3kEFiyPxYYT8ELEJS2aIroU6GwFekZNB7ohrLW5gm97gAwuRUbv0cNOZtkdNjHtO9+
         P2MyFgopF4CcvZij8UHwjiiicla7IY2Pr6o2anJI+75rTB6OJPfQlIFQCKA0PWmHPN04
         3qQy0rnJRuECatkNhiUkUEWO48rl5O8aNwbGNRr5NpqaMTlizV0rZipvIs8odH/R1le/
         ZWNM0BdgolBZ5KBFI2ImmGtSGSCALIH9dX+t2tmX8p33ZpQngxHj6NZlnuDEQT2drhLO
         2EkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374847; x=1795979647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPoTViWJGHL7QSLz+I0tDgbdnIX9thSbIOpbmEgxuw8=;
        b=L7hqwQE5MiSZPN3VOhoq8ezq+dYsh/eCgzYGZmPNUvg8BI8+RkRp07AKX/I5+fFAMm
         0aJ/adNHHu3moHFn2QRCyDemj1C0NLZDS7PbqC74PQto9pOhmMyjNe6YHvdr1wLLtYVz
         X/b59aoprJRDcXYJp7a9gehUAdNZKhmWYJLqK1C3xNDQrXf2UoprHGJALe9HlhDNUmbl
         Vtfs4Fnshqv+pLonnV6gsRCq6ce9Ktc71arFs2oBoUCJewHWmCN6SI2O/VUZjYhowF39
         wvEip7jJ4KPekhwkyvqMNb5sEru4jQZyALv+Yp8F3r6habLLtrQDep0V26AKhJWOX9X/
         LkjQ==
X-Forwarded-Encrypted: i=1; AL+hErFwKDLXIjk+3nW89IcIjRO5WDR814chX4Yocp2SOShuy6KHJ8SF6cF65RG5vSsVzlgaUPtVonqrxEicCeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aIDnI2haIsk0JWws4HJoZKxd5fGXA4tgoxh9InQNCuwEGbNKz
	5ykwE6x1xATmvjubAwU5J0RrAfudB9T8KT2MQa9IIqHOXrx3khqe1Nbm5hInQJXF0QBDt8/F49h
	vCRROk4haab5aWOSv/j7GySGKbdApMJYFGBTNfuFQUqMrqnAayibApz3FlXqGqkAlGSHJ+V+WaA
	==
X-Gm-Gg: AZFdTZd11sjyJSwY7m9aOdMkME5z96gIqN1b9JpEbhm8K+wikEwBxXvrd0pAadN09P4
	eb0KnYLLl/wOOPVbXbSvHTGoRFv4N/3MC70dy2mXy6DR0UvT47czDvXRS6f5fgJcASb35PjjayI
	BEHcgrqjZr1vFnNCnjxpUEVArWMD+NlDnFi/r+qEI3neocODRUMSkA3D9qhA7tH5dV0o26Ct82B
	sY+apVwLPFhr9BMKLSIxwdtrEOc2vuzk2kOzMUNxRKh3sMeu/E+dsVEVkjKosChRY8O2kyu5KVD
	8Y3kdwFlXukZSDUxrfbO5Ww+AJPEsWl5P+vbaLqQin8SSFHW9efC+t9WIUogxMcQfqeUxYOF5I1
	MUL70LijqOlCRNUv/Cq+4JRoVc4jtam/kGnWF++Dc
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr195708895e9.10.1795374847347;
        Sun, 22 Nov 2026 11:14:07 -0800 (PST)
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr195708385e9.10.1795374846810;
        Sun, 22 Nov 2026 11:14:06 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1524:9e00:c39b:a740:e7:3fcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm198874085e9.2.2026.11.22.11.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:14:06 -0800 (PST)
Date: Sun, 22 Nov 2026 14:14:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] vhost/net: bound the count of VHOST_SET_FEATURES_ARRAY
Message-ID: <20261122134901-mutt-send-email-mst@kernel.org>
References: <20261122092235-mutt-send-email-mst@kernel.org>
 <20261122143829.2674252-1-hengyul@cs.unc.edu>
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
In-Reply-To: <20261122143829.2674252-1-hengyul@cs.unc.edu>

On Sun, Nov 22, 2026 at 09:38:29AM -0500, Hengyu Liang wrote:
> On Sun, Nov 22, 2026 at 09:25:37AM -0500, Michael S. Tsirkin wrote:
> > this is followed by:
> >
> >                 virtio_features_zero(all_features);
> >                 argp += sizeof(u64);
> >                 copied = min(count, (u64)VIRTIO_FEATURES_U64S);
> >                 if (copy_from_user(all_features, argp, copied * sizeof(u64)))
> >                         return -EFAULT;
> >
> > copies at most 8 bytes.
> >
> >
> > did you test that this patch actually helps anything?
> 
> That first copy is bounded, yes. The unbounded part is the loop right
> after it, which is outside the diff context:
> 
> 		for (i = copied; i < count; ++i) {
> 			if (copy_from_user(&features, featurep + 1 + i,
> 					   sizeof(features)))
> 				return -EFAULT;
> 			if (features)
> 				return -EOPNOTSUPP;
> 		}

I see. So all it is doing is checking that these features
are > 0 and erroring out.
Let's just not do it - we don't have to.


> It reads one u64 per iteration up to the count from user space. With
> count = U64_MAX and a large zero-filled mapping, it only stops at the
> first unreadable address.
> 
> Yes, I tested it, on the vhost tree at 44293796526f (KASAN + lockdep),
> count = U64_MAX:
> 
>   1 GiB zero-filled mapping:
>     without the patch: EFAULT after 27.4 s
>     with the patch:    E2BIG at once
> 
>   2 GiB mapping, SIGKILL sent 1 s into the ioctl:
>     without the patch: the process is reaped 46.7 s after the kill
>     with the patch:    the ioctl has already returned
> 
> I have a small reproducer (a few lines of C). Since I found this with
> the help of an LLM, Documentation/process/security-bugs.rst asks me to
> treat it as public and not post the reproducer to a public list, so I
> have not included it here. I am happy to send it to you off-list if it
> would help.
> 
> Thanks,
> Hengyu

