Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618576;
	b=PqfExK2XOft39HOPWIjwXEGcVIojyA/PhelmKkaxOMOmqT2MOq0/J8rxOe84ySM8Egbl
	 +sfTufWjD8k2aUHVE+V2Em01mv4m7c+d3E5lU5Azg+f+wcQwKh33iyO50znbOJXoMd846
	 Txw1+7YFkcPH8wfqNRuS4iTIVB1t1ffEYZerPoyyfJGQIv488xy6dNMCSzmqzAgoqvlAi
	 uZ8dXpDB/+aZUsyq7spz3CDRgYGuaKrH09g4CTLoorIfvQDGjZBySUgfXvZkmOMIVf1Ge
	 aY9nZhToF1Pa3fFOWpwlEDtLqmTotguZtI3doSbvMlLy2yZVcf66801+1tx4jeGBrMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=H2v9m8o2ZyN6mJNXof8J2YJUJ0qz0MjiMku6/OumPR8=;
	b=EUDhT5oT10GjD2emZ2kqxsIpaBeCLv3xtrqvPSf7tNgaSc+KxP4Q2gtXYEUhxUQYtI1j
	 /hvIhJt+UoBjijPZUl3h0cf012Hg1X7vbLec6/fNKOE5xzJVF/gcK1OcOLl/qKI2kZ/JL
	 DV3J5rOZeJ3Fq79pTxwe+7oIYcQUISxLOCnSSnyu/jdqFN4w6uJkMnJ0c2pmWUGiD4lTP
	 98A1XgkKYVPyd4KUIgfPhgt3O09joi4Sco4jbXWKe+RwEDLfCYEOioF6Nhleh9rcpowqv
	 Cb7hDyOaNQlG8z0hV2VfxKIQwVlgYXqZAx7FDXGus1SKQekGcSEnIqa3mHlnXjxD+GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=OYNxKfNH;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68B4606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68B4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=OYNxKfNH
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94958650b09so571056485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795618575; x=1796223375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2v9m8o2ZyN6mJNXof8J2YJUJ0qz0MjiMku6/OumPR8=;
        b=OYNxKfNHfP6AwkYsERu63zDzJAQPUGhYsCT43HZkjStcluGygKe12LuAexit9a5c6I
         2xHd+rFeUUWgQz3UD4v6ixaaQHjS+rxO6ULdO3fhPiUPK01Xq8/mBmvNXb1FFx0+5h+y
         txmt8Qu7dTrHwsvfmdLvBZVh1tYGu5ws2UTAxhQ4QQZ6wJ9BJZ0AHoMR77wCIUE8irGw
         yOJVXSOfdvyNe/kwEsFYcbGWMENmzqdQGwGisbGOpmrz0P+cscixGw43F3nRwhBp4hXK
         oAi1vBIDqzDf2RFEYLAzJgTZsaAnHnNnhRfu705bDSb63uQLNQ3FjPvM/ZEIm9FBbf+L
         49WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618575; x=1796223375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2v9m8o2ZyN6mJNXof8J2YJUJ0qz0MjiMku6/OumPR8=;
        b=IORicNglLXxd6BBCtInXpvQqmv6AZXLPZG/RnEUL91mudHO99J5RJJfzaCboIi1Dtf
         QygJLPUS5UmVrv51Nk4NWX974pFk8S6z4hsMpqDcy8tRNeQ7PPt2oFIkZ3w1dVMUj2Ts
         mvat81BWwVjv1GmjfCTvq/7KLM5+MAwXeKu3uwXCdwdLzoUWWrGuvXBHeJddlCjUAmjF
         /jFuDsLCDAl63we3Soct3+sVWuIdnvEYRQEdjFiJcHroUI62IUiKWu09Ya7AD1EV/pmH
         fQmNvIiEr1KKV02N/Ia7u05PA4lU+ES4shcsW29QHaMBVHgaRCu/srxTOfb/UmloxeNZ
         c6gg==
X-Forwarded-Encrypted: i=1; AL+hErFfJw34bb9+9plmoA1ZpRkQ576YQgBmYxb/OYX5qLU99CBcjMMnpx7wKmmoV9VTQ2MMZGvYnwxzPFIsZrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6yEhyBFTqnZuepf66ExtbyOznBWYiLK7MRUAvtIB8/WA8pX4I
	J52WRCMY4HUoWWfg0JdpXNCpIzTB/OPafeLmrCaHI+HshUWa8kstMGbTFhM9UBALeDrpwpKAK7K
	8yCXj
X-Gm-Gg: AZFdTZcbsCCBaP+TY+o98hxpr8q1ADrSxQvABFQmZQlrjxFrX9akiEWShCFiYLGvgCU
	wOP/VODZW75CvaE9U0FECDtHAEh1Ce9MFMzUiUYZjyop79IOnqlKJc7HGPOQ8OUIhaHF03gaBrU
	uo1TYdAniVQ3WydUvR0RxGe1xmYOBMXOeHHJ9zfY7TUJkqfxYaWm1BulCO5xr51iPHRaK/suD9r
	hHRQ0+tWMyOgeZNNwafjpF17LTqSrJ5pnBhN+DTSdDjLd/iKlG4lqhON95jYW7d6Wyi8k+N5ldl
	tzGMN/RmqUjLkcH+xY+fMsbZg0cfCxxtR4EbzV2X6kWZxyv7kMbxeTDmrIqgaMo5ll/Ar1K1WbX
	UQl+Iw+MnTom0pHPgOcLGrdeiHRXg2tjmluDH9AW7sETWYQ3RftiZS83Pvf5iaBRtStYEwIEnlT
	Xz7ftV2KJv5KXYkKK8AZTfi4BautJsySNVkKWn2lcdmtZbYGAqNHwgMRGNXmF3DUkypeXaSHXs0
	AhuQQJBTxe5+7fx2ksYv6UZIlXSYA4rImk3isDgdxmJ4fhbUNxqFRLKYIwaNjeQlWVfD6mHTsa0
	EDryXw==
X-Received: by 2002:a05:620a:2956:b0:949:9cf0:badd with SMTP id af79cd13be357-949bab2f511mr3135941485a.73.1795618574856;
        Wed, 25 Nov 2026 06:56:14 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38c903sm1327013585a.19.2026.11.25.06.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEPt-00000001o1M-2tKn;
	Wed, 25 Nov 2026 10:56:13 -0400
Date: Wed, 25 Nov 2026 10:56:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jaeyeong Lee <lee@jaeyeong.cc>, Artemy Kovalyov <artemyko@mellanox.com>,
	Yishai Hadas <yishaih@mellanox.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] RDMA/mlx5: Preserve DEVX objects after failed output
 copy
Message-ID: <20261125145613.GJ246011@ziepe.ca>
References: <20261111105346.3220427-1-lee@jaeyeong.cc>
 <20261115135123.GD42525@unreal>
 <20261122103715.51731-1-lee@jaeyeong.cc>
 <20261122103855.51859-1-lee@jaeyeong.cc>
 <20261125131244.GB14811@unreal>
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
In-Reply-To: <20261125131244.GB14811@unreal>

On Wed, Nov 25, 2026 at 03:12:44PM +0200, Leon Romanovsky wrote:
> On Sun, Nov 22, 2026 at 10:39:01AM +0000, Jaeyeong Lee wrote:
> > As requested, below is the full dmesg from the reproducer run.
> 
> <...>
> 
> > [   13.847526] mlx5_dct_repro: loading out-of-tree module taints kernel.
>
> What value does this change provide if it is based on an AI-generated sequence?

More importantly you are not allowed to call
uobj_finalize_uobj_create() from new style methods, it is only for the
old write interface. I guess it is in the wrong header.

It should be uverbs_finalize_uobj_create() if you want to use this
sequence.

And it should probably cover devx_handle_mkey_indirect() as well.

The idea itself seems reasonable, once we have done the actual create
command to FW it should use the normal destroy sequence. That is
exactly why we have the finalize helper in the first place.

But to do that right the entire obj_destroy should be removed.

IDK about the claim that DRAIN_DCT can fail, but I suppose it is
possible for a hostile userspace to immediately refcount any kind of
object and cause its destruction to fail and that does seem like a
legitimate problem to me, so this is worth adjusting.

Please send a v3.

Jason
