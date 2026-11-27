Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805941;
	b=wsvU91qGsr1TjtLu+d1b1dGEPfexvv/wEkH2LNECg6Gir2ApRiPq0ZV99E5qqU133ckk
	 cSrDBE5N2BqROInuZ2vSje2aaqyXi8lF/plfXh7puY3O7YdnnhrdWA78Fq8790UOWIUWO
	 6RiM9Ks+Djf6iFdh/X1W+7EGBuYIRJXmDb26pv3AB0CQBn4MoIIayeZX2SWrk2ETwUCgd
	 PpKwvY4OMpJwEccHlInNrcoYrmQGVkiAHb56Gzo7vrNqGiydEIKDi5e/6XBgcgaUFtiEV
	 /3/U6iTK9n/YHtDbjjC92nsoD0KESguwVaj1+p7ssqdNz00yaY4efDr6LPK7PRRgS0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805941;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KbQUbOAxpb4rVHmZzp9pO+Se32gC8akOyQIXtIttG8I=;
	b=QHKhATD4zzqkAVtmaof4wfBreEZa1WMk7/QoTV8K+QBXpZH7tkaOaM+73YIXOI2c7TCc
	 2dpgFTeJXifr0q7oC0gU8D/chJfPqhYSE9S1J+TvwgL5sTgdKrkUO93xVdgvy2/Sd4W/k
	 eWYiMCxe6hKR+BbDend6VDVXL3xhcGsoi6NRSwppanK0rScuuOZe7ggru/GLP5muj6kT+
	 dpN+80pF/NqfnMvA7C2TccCaVu+f3oBirOOEBvSG/7qm9WvrxSwzqbCwln5cAkeinAAk/
	 8FPAhcomO1kR7j4XD413NUmJaff74+s29I25SvhhGSW3ox5atUj54BZEutlOGYc0hGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="U/nc33kP";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SVkxJOwc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877C606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1877C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/nc33kP;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SVkxJOwc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795805940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KbQUbOAxpb4rVHmZzp9pO+Se32gC8akOyQIXtIttG8I=;
	b=U/nc33kPStfwgw4DrQghSTWbOjG2JZou+y+fvPagcroIgeZGUT2ECEbhAX9QC5XOeZsQJG
	G9RJt7zosFP4BqfukpZTSQEDVUfSK3JXj2hoBCyRADIr1uEABRIgQ4om4MFQvvshuw1tbJ
	AzILBoreWm/iF2Jn2Fo8EaGiqD49kAs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-bdX_6zwMNe-oDcXCGFyvRA-1; Fri, 27 Nov 2026 18:58:58 +0000
X-MC-Unique: bdX_6zwMNe-oDcXCGFyvRA-1
X-Mimecast-MFC-AGG-ID: bdX_6zwMNe-oDcXCGFyvRA_1795805936
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a7c864000eso4968673f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795805936; x=1796410736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KbQUbOAxpb4rVHmZzp9pO+Se32gC8akOyQIXtIttG8I=;
        b=SVkxJOwcMjK9s+rPQpn+sQVX3Lbi75QxwYQZqf1pva5cEkZvAt1lMndrOVX5jhnX9z
         cD/4ntDol/dIExvxi8+/BHLE0+arVu2SXXO6rCKr/K2ElLXvgbNYO/CYxyLV206lee31
         6m94MGQHGnEUMh5ZOtkP1f82936GBJ6L9Hl0IN3A3umpVDIKd4JwFDq9gyFgS0GsqqDX
         z2+fTQ/Dj7Xz3ClXBIUVC6Rz+SIWksJl4fsZPlxe6wa8U4u42CzoKDJfvj4SEW9dbg2o
         rnDayg2IyFr1fRrYZlrMinZxm+xYOn5DRCqGNstLoklqFbrrJjh8fBbEtIO8X2iEUerN
         zZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805936; x=1796410736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KbQUbOAxpb4rVHmZzp9pO+Se32gC8akOyQIXtIttG8I=;
        b=RttEtUM7yUdKyt8if37YGmqdyNGl3CL/KWcQ+0Sg6TQZoW0mokMWpJk+Yn8HI93Ynj
         cexyn2OmXysa37Pxy+PWT1DwoYo87KLBb5aLbW0cr2dc2wvGPKDvWEUFU7H87rSuukuJ
         Vg9WK3QqaXiNXsIz4O9BRgbFeDDko9W+nGL6BUsGxL3CDQCzFF2lOe5TOp96VC5oCJCe
         6dCzV9TpAqd95UGV6GI1PICb+dQaSDUXS9IbhDph6jKxuZm4w8zonMyaZY0VaqJwJvLr
         H1BRtdkyKMAWChz8uLGk7EVmPn5QTg6PV3VlNIESoaCC1pREOK87y1acB6M8wHu/+7bZ
         R8AA==
X-Forwarded-Encrypted: i=1; AL+hErG6+/kVlyATbwLAEsCI8CbHCtaFI3vG7EuvPLoTfN5bgDQ9e08tnmW4RKMoTFIgj/YeNg5m5keXyDfaEnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qi6I42IdWWq3kPSnFd9NWjnPOE9MDn8pjyZUvEdLBKeCkNxCd
	z52NcFPktctXvN4f7ejbWwG/wxnMjfJ24c7n4/D29p3j+cjMuucmcAoLs376seHa/R4O0aYO44e
	L5U/3EpeJKiTldaklwtjlE5+3sJcLW2zJzKBJXoWtj+aDGvXtYc0yU+R5vj3rAKTeQg==
X-Gm-Gg: AZFdTZfv0yy01DhYuF5etyigk80E8xc1IKfNcP3y0N9N2auK0xNbSQ+1OKVL/y/7NpT
	3UU1xnZyboT76NsM3INE4o+8MoSOGLGyc71QWQZWGWS7OEFWVmJ3zX4NRCfGgLtr76SAk4F1NGN
	WFtmnkpoO8uVneX/tLfoy8kkJMYKOYXO6i42xgbPTMhFug6CASqz61XAy29pW0mJbab/aHYRhTf
	XATgrN7pflmGqJktoU140dmOGcU59/cyiPTNCSBAkLV6yDn1cHj2sVs7q4L6flhmXckf2OA3775
	MWsSIuuo58VUzmoO922NRS/2zE3WECfdfqZ0f39m2rrZ+bu9zBAHDdWX7109c4qT6rQrqRlCjN/
	Jf54iIU2tUfi4lMbVoh7BGoQYznaeLwjRrm796C6wjRkq
X-Received: by 2002:a05:6000:310b:b0:4b7:6dcb:e92f with SMTP id ffacd0b85a97d-4b76dcbea9emr28203598f8f.21.1795805935789;
        Fri, 27 Nov 2026 10:58:55 -0800 (PST)
X-Received: by 2002:a05:6000:310b:b0:4b7:6dcb:e92f with SMTP id ffacd0b85a97d-4b76dcbea9emr28203553f8f.21.1795805935295;
        Fri, 27 Nov 2026 10:58:55 -0800 (PST)
Received: from redhat.com ([2a06:c701:73fa:9a00:793e:eac1:d749:dcc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm48971276f8f.42.2026.11.27.10.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:58:54 -0800 (PST)
Date: Fri, 27 Nov 2026 13:58:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Jonas =?iso-8859-1?Q?K=F6ppeler?= <j.koeppeler@tu-berlin.de>,
	Jason Wang <jasowangio@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] ptr_ring: add PTR_RING_BATCH
Message-ID: <20261127135832-mutt-send-email-mst@kernel.org>
References: <20261125152311.805325-1-simon.schippers@tu-dortmund.de>
 <20261125152311.805325-2-simon.schippers@tu-dortmund.de>
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
In-Reply-To: <20261125152311.805325-2-simon.schippers@tu-dortmund.de>

On Wed, Nov 25, 2026 at 04:23:09PM +0100, Simon Schippers wrote:
> Name the batch size in which the consumer frees entries, so that users
> of a ring can size their own work to it. The next patch uses it in veth.
> 
> No functional change.
> 
> Signed-off-by: Simon Schippers <simon.schippers@tu-dortmund.de>
> ---
>  include/linux/ptr_ring.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/ptr_ring.h b/include/linux/ptr_ring.h
> index 631c43fde4407..b851a9c170bf6 100644
> --- a/include/linux/ptr_ring.h
> +++ b/include/linux/ptr_ring.h
> @@ -27,6 +27,11 @@
>  #include <asm/errno.h>
>  #endif
>  
> +/* Consumed entries are freed in batches of this size, unless the ring is
> + * smaller than two batches
> + */
> +#define PTR_RING_BATCH	(SMP_CACHE_BYTES * 2 / (int)sizeof(void *))
> +
>  struct ptr_ring {
>  	int producer ____cacheline_aligned_in_smp;
>  	spinlock_t producer_lock;
> @@ -506,7 +511,7 @@ static inline void **__ptr_ring_init_queue_alloc_noprof(unsigned int size, gfp_t
>  static inline void __ptr_ring_set_size(struct ptr_ring *r, int size)
>  {
>  	r->size = size;
> -	r->batch = SMP_CACHE_BYTES * 2 / sizeof(*(r->queue));
> +	r->batch = PTR_RING_BATCH;
>  	/* We need to set batch at least to 1 to make logic
>  	 * in __ptr_ring_discard_one work correctly.
>  	 * Batching too much (because ring is small) would cause a lot of



If this helps, sure:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> -- 
> 2.43.0
