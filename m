Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088813;
	b=HnsDTMdl95/3+2M+YxiNRnnmJ35kFzvA2B9sskQMJUNBAJdEwGC3NdMdg8idTTGdSqTO
	 ZduCjZL4h7XFOGDrf84inR3HTRbiqQ7sxuAciWHvkuPkBOuMY/nH+M/QgEFz06AtrusRa
	 0ruznWHlef9r9f6wAmfx8V+ZevT0BhgrMW6DLYI3LR5+K3JFhuwdB8k4s0RN7iYb/xiNI
	 G5bxnS9MmlF5iAD/nXOCLvGsriJGeuKy+ZPXNNaesldp2kwlrvb57iyN/Bqdx+4B9lkBL
	 FUamlVO+La+dAF/AVhtdXLNlViSRjg3oItb652NMpSVT3IXcWiJ6LBvaea5yC2XLQlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088813;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=ZUeOtPUhzsFOvoBcrosqMoro/gLON8QkIKZ4rXwHJ4k=;
	b=03o6g4NMDTUzubANN7cp8xmMLqYBZT+t0ZPgSTqKwUJgwjMbUBvdDCrQmqgJbFNjGNVw
	 RbsxCIoNc12vZpn/jSoPUJhdFIWOYQFFnZ3ZT2GwhQXpvjbdGIsnAMTV4pL0Nigaidfzr
	 mym2hZOxnH+pgQvvTvVcZWFzJ5NnuF5uK2BrqTeuO7jVAmMEkwvsC7O+J4seaYbzISulG
	 kXlNO6pe2v66yuPzr9cS2F+SJPK56FKxA32thXBKoavQt0LfMQmzHJsZ1MoXK0E2kTLcR
	 VojSQC8NYOibNXRvf6uK9zfV79H4PzpbCdKpFHW0svlYkC5eDc2a9OJ0xLkvOeiQlxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=CjZ1w9sr;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B5606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6B5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=CjZ1w9sr
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261119114649euoutp01c92f5014a38c5b89b7015f38d3a8c883~pb8LrfVVB2023520235euoutp01y
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261119114649euoutp01c92f5014a38c5b89b7015f38d3a8c883~pb8LrfVVB2023520235euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795088809;
	bh=ZUeOtPUhzsFOvoBcrosqMoro/gLON8QkIKZ4rXwHJ4k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=CjZ1w9srMis1i7O0yvxATKUdNR6/YVcwGJSVyiMhu7jHVklIgHXuCOETO6iHUzdn/
	 RkLZGfPeft3UMveA9p6jMWY3sjs1TPqWt4+Et6Q6HM4w4nazkCKi6Z8ux4GBcXz0pJ
	 mmMKFFASc3/ABA7PBg6dUsH4CCefiujVLgKLoKNI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261119114648eucas1p23640acef9a3ff97019eadb2717fb9c04~pb8LQLSDB2266122661eucas1p2b;
	Thu, 19 Nov 2026 11:46:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261119114648eusmtip2d3b4328b3acc26f4240535e705ec717c~pb8KX-W8I2983029830eusmtip2V;
	Thu, 19 Nov 2026 11:46:47 +0000 (GMT)
Message-ID: <84e33f9f-6af3-4416-baeb-118874858edb@samsung.com>
Date: Thu, 19 Nov 2026 12:46:47 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 1/5] media: videobuf2-core: Move type check out of
 vb2_core_expbuf()
To: Jai Luthra <jai.luthra@ideasonboard.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
	Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261118-b4-vchiq-isp-v7-1-b8c81d193abf@ideasonboard.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261119114648eucas1p23640acef9a3ff97019eadb2717fb9c04
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261118180849eucas1p2f97410b51c58f5ef02db72971dcd588f
X-EPHeader: CA
X-CMS-RootMailID: 20261118180849eucas1p2f97410b51c58f5ef02db72971dcd588f
References: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
	<CGME20261118180849eucas1p2f97410b51c58f5ef02db72971dcd588f@eucas1p2.samsung.com>
	<20261118-b4-vchiq-isp-v7-1-b8c81d193abf@ideasonboard.com>

On 18.11.2026 19:08, Jai Luthra wrote:
> vb2_core_expbuf() takes the type of the exportbuffer as an argument and
> checks if it matches the type of the vb2 queue. Move that check to the
> caller (vb2_expbuf).
>
> There is only one other user of this, which is dvb-core, where the check
> was anyway redundant as it passed the vb2 queue type instead. So update
> it too.
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/all/20260910150454.GP1892234%40killaraus.ideasonboard.com
> Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 9 ++-------
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 ++++++--
>  drivers/media/dvb-core/dvb_vb2.c                | 3 +--
>  include/media/videobuf2-core.h                  | 5 ++---
>  4 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index b0a6084f1757..5e318165659f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2419,8 +2419,8 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
>  	return 0;
>  }
>  
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> +		    unsigned int plane, unsigned int flags)
>  {
>  	struct vb2_plane *vb_plane;
>  	int ret;
> @@ -2441,11 +2441,6 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
>  		return -EINVAL;
>  	}
>  
> -	if (type != q->type) {
> -		dprintk(q, 1, "invalid buffer type\n");
> -		return -EINVAL;
> -	}
> -
>  	if (plane >= vb->num_planes) {
>  		dprintk(q, 1, "buffer plane out of range\n");
>  		return -EINVAL;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 5a1ee5eb9c0f..aee1a9244a7b 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -877,14 +877,18 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
>  {
>  	struct vb2_buffer *vb;
>  
> +	if (eb->type != q->type) {
> +		dprintk(q, 1, "invalid buffer type\n");
> +		return -EINVAL;
> +	}
> +
>  	vb = vb2_get_buffer(q, eb->index);
>  	if (!vb) {
>  		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);
>  		return -EINVAL;
>  	}
>  
> -	return vb2_core_expbuf(q, &eb->fd, eb->type, vb,
> -				eb->plane, eb->flags);
> +	return vb2_core_expbuf(q, &eb->fd, vb, eb->plane, eb->flags);
>  }
>  EXPORT_SYMBOL_GPL(vb2_expbuf);
>  
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 672b0efdca21..fe7a6554b30e 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -357,8 +357,7 @@ int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
>  		return -EINVAL;
>  	}
>  
> -	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, vb2,
> -			      0, exp->flags);
> +	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, vb2, 0, exp->flags);
>  	if (ret) {
>  		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
>  			exp->index, ret);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4b4f4c15c53a..feda638d0064 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -959,7 +959,6 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>   * @fd:		pointer to the file descriptor associated with DMABUF
>   *		(set by driver).
> - * @type:	buffer type.
>   * @vb:		pointer to struct &vb2_buffer.
>   * @plane:	index of the plane to be exported, 0 for single plane queues
>   * @flags:	file flags for newly created file, as defined at
> @@ -973,8 +972,8 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
>   *
>   * Return: returns zero on success; an error code otherwise.
>   */
> -int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> -		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags);
> +int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
> +		    unsigned int plane, unsigned int flags);
>  
>  /**
>   * vb2_core_queue_init() - initialize a videobuf2 queue
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

