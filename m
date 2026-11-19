Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130190;
	b=a8M1R7k8CP4OOW3g/GmMeD3mbXYW8tGetC6Rf2zpVLNiEkVnKq/04fZA4i8LtfYeKOQt
	 beqK8kdSjLfS8JWYpFuwdgebainDSEYsiicVTsvmABhLJWq43iLkR3gLAkt4M19Hec4z1
	 Ge3l2xehfo8oZF7hmhAN9zXGeDDoblBEZQJ05ns/lTBTK/bQm2zyI08bc/E4bcQqIQ5A4
	 BUL7g68ufeiSVG4zIomDFedGdL2Qsq/WaxjAOzrB3k8/OvVygH6oARNLEvSNea5uLenfo
	 GyPdYCtjqaMAB7+K53yQ/xYfmW8qpohAMcJcz//DFE0r9QsUGOVilOIlw1Dj+6ah9PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130190;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oVWM2kH+4GlaP5AbRPjeostHeKcF0t7gkregb35fNl8=;
	b=Xj4/vMqHLS+fEg/y8izyPeU6uIO0K/mEepc7/Ua6wX9ejcPkkUTIJVNoaC1ZOJYcmEky
	 U07TeZBzQt4yL/AhcUL8bKjt13+/Kl589C3lfj8IaZ380ITFmIVWMO8cebN/c5FZcXi1k
	 NKh3N4FweK5FR4VOBNyIK8wVwnEXlB3KjrdB2JfjnLMwLaUlLCTGrRMPjpVvRalyfenu2
	 aMsRSET+qSb3OKX1o6Bd0DgbO1Ivu38cCnr0rI28eC2MALr4de8myQOB7RZ8+sJv6cnIz
	 2ZIDW8SbN4dlBeUS45qI0yX3zu7Ho9kSYKd3UDMB+xONiH3oF04g8Du2gBV0WcEQfGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h3gJ5aeP;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F7K1RANV;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FED606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39FED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h3gJ5aeP;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=F7K1RANV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795130189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oVWM2kH+4GlaP5AbRPjeostHeKcF0t7gkregb35fNl8=;
	b=h3gJ5aeP/aeI4iuqjF6XHtz9no2cBYrAIOVCt612oKFGwOXaVwdU1Ueo6poaCgR4ONPnIU
	W8ElkSsmyOzc5YbVjlk/oHzBlq1y4zizEdaLjN47Sv1VpdMi6x349Oj387yEXffr2ztVTC
	KRlmsxYJRcIN8bF+UosnQfZLbKlAL2U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-jEDWkGS-PeSQ7zCFer2_HA-1; Thu, 19 Nov 2026 23:16:27 +0000
X-MC-Unique: jEDWkGS-PeSQ7zCFer2_HA-1
X-Mimecast-MFC-AGG-ID: jEDWkGS-PeSQ7zCFer2_HA_1795130186
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so1036405e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795130186; x=1795734986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oVWM2kH+4GlaP5AbRPjeostHeKcF0t7gkregb35fNl8=;
        b=F7K1RANVsjzIIhfg5KEoO1aksHnDBKn3U4fKgwVq4N5jWtTtXk1zlGLTCOlJfgL2t0
         wVojxQvRidLOZT8LltjawbWi3JTchdz1QE0HpUl+Y4EY/mLOB8zdbokACrkcD8QhA5P+
         yQKJk5HT5MnoATCfGodEfPPC2P5ZqaqMoN94hPEvHDyuolksQakBjtn+1cnJS/rzs9ff
         cYYSNc1GBj8KQbmn4Kt66GD8mag29jVwJ/dTh91HVIj2bsv1/CH9qdE/7dtHcpNdvQaf
         mU+WuTEL5pZDBqU80gsdcP+VW+brzSACvv4prTv0ceq3gv58ID9rcYPhoa3JJUPHlK3J
         sGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795130186; x=1795734986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVWM2kH+4GlaP5AbRPjeostHeKcF0t7gkregb35fNl8=;
        b=y3ZI+U4eG/9TIXFpzWsYzaWytPAyI69yEeosr9rbGdDfMPhEuUv7vND1OC8lJyUhVQ
         ZeykH9bXfSRw8yRqcaesjL+FJsFQgDB3HYNm1f1wOs8yjdQPx3h56ER3qDuMLzeVPjb6
         jObIDvV/U/pX84NBlnC28P+tfKhe10wmdTgcw3wuug3oHbceyyB/S76EsmpOB31bnEHr
         /Om4+poTRI/EzRo8abC7JRjXJ88yoazKJwRAv+tSCd2xjOUcb/8wrxKkQbYtuBguABp/
         4QETrc26YMbkOzRN1LM58dB0vYT5kg2BF1YM8vrXuyWTJzng7KYI48mvhUnPf4ZDVql5
         JZ9w==
X-Forwarded-Encrypted: i=1; AL+hErGFwmh/VjxtzBsVdNH3EkV6Xg0fkAMYU3ioDrXVGO65vXynAAxlF8TYl1XbNY2LVGZ/XhTzvOpf1MiURJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vWYV6+g2ceNCNWRgmdG36PAq/9sd+LIKpm1+mlCWFj8hlAjxd
	1jUr7wDhLyBlYadgPo+Kuq2JINvYUpihKqU7TOTEHhv91vpFCcbIKH9GegijVOaeTuvZPiaC8ZH
	U80iHYH+YNchvh4ow6ojQewfB2qhicDekdqABO+TAIQIzC9cYQSmCgX/2SsD8Gx6fqA==
X-Gm-Gg: AYBFou1m6mLHipy4meHgxtHunCkryiQcKMvTW45myXRdaUSxBA2FXMkdL7doX/NmU1G
	YqB+SgjDoo9RKDGJkUGRtELWgPwGpa0RWG7CHHzHaOzJMawDKlfCazBJJhfbJuQRWRuFhhZwAQm
	GU6U/lltIQ0UBOkvMn8l95MOrogDj0GnzOcm9nWUA1bhJ9ChzHkjuDCxXUhbQzw20EB5JcRD37Y
	F6nnfEx/zbfCxjnoGhWfY0DQaG9grVmrE91tgyHsxFwfpHYS37Jz8qgcj7EwiImZL2I0JTCMfqi
	d348lTCGO/RacbFGj9BbtQbIzOHMA2QAL/oJfp9yxOafLA8TxUktKhC5G2CirWx8AoA1UO/1P8o
	zwgY+nKKSUqRnhbhsCUBPHkW+0g48cSYx++hGJI/RHg==
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr26235895e9.12.1795130185914;
        Thu, 19 Nov 2026 15:16:25 -0800 (PST)
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr26235155e9.12.1795130185256;
        Thu, 19 Nov 2026 15:16:25 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm44769145e9.14.2026.11.19.15.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:16:24 -0800 (PST)
Date: Thu, 19 Nov 2026 18:16:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Kyle McMartin <jkkm@meta.com>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] virtio_pci: limit Oracle DSC2-200 virtio-net to 48-bit
 DMA
Message-ID: <20261119181557-mutt-send-email-mst@kernel.org>
References: <20261109184253.531677-1-vlad.wing@gmail.com>
 <20261119200654.1048266-1-vlad.wing@gmail.com>
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
In-Reply-To: <20261119200654.1048266-1-vlad.wing@gmail.com>

On Thu, Nov 19, 2026 at 12:06:54PM -0800, Vlad Poenaru wrote:
> Hi Michael, Jason,
> 
> Gentle ping on this one. Without it, the virtio-net function of the
> DSC2-200 in OCI bare-metal hosts stops completing TX once the IOMMU
> hands it IOVAs above 2^48. With iommu.forcedac=1, virtio_net hangs
> in probe instead.
> 
> The patch still applies cleanly to current mainline (v7.4-rc3). If you
> would rather have the quirk cover every virtio function under
> subsystem 108e:1200 instead of only virtio-net, I can respin it that
> way.
> 
> Thanks,
> Vlad

it's in my tree.

