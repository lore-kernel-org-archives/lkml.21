Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452692;
	b=wnSSNCljlLyhiv3rtnhYEGqsXHC2qqy04GZWPs6WLO3ewdM/EK9Ic6+qMtVseHNnwXCy
	 lgedSrOyfNkBzYKlwxnYlwD/hTGJ7JCyCRRCTNwNiIQIjzqn7vbIprQRZnSt6uenjrxx/
	 Pf2f98obf771UH5xBouzmWem7EHMhnISHNPQbkMtq1gz3Bz0md+0eazXTp2fQAts7m8r3
	 yS0JZftp7sVgCPMH2MhH9zjAJB+FkGqbHI5lW384qkoiU5x5fzk1AVGuHXUGvoYS+/Lad
	 /WIPd0Lu446ghZvvDx0Wngt12kML1qfbcBRxP0LGsNUQ+5ICmyIvbKbZA/HNiz8KSPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i8m3St/33fP2QE3sVDWlAViGW9u6eVfEV+msFg0eCIU=;
	b=gbe+TGwLWX1z0hoGl0pQpwwx1gV3VlMTu3CKxwLouo7Khfeuh8e2Qo+GplsYnq4MsMvy
	 Rj4rqpqVtFxstSlMaEJj246BRd1DW3kh0D0DN+vgAOmAXbFqhbYJzNpqxbZMz5BPkJlnS
	 mu7mRJASyD0/U4ArwdFvy01j4Er4SOPgX11/1R7ASP1jcpf9QMIcRpfT6+C0k/bJko9q/
	 RgXl+9cc1fUdooY/N/tQuUcXe1KS6TZ1wpXQhkPcynnQk34ywRl1D2yMb/KPw2WUYOQCL
	 SEJY4wiTjqsajfJT9QULJZTQgpw2EghPkiIt0OtUgx3w+geFosZyWZaSA7vC4JZWUyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AuBd6OMz;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A7606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9A7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AuBd6OMz
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f3c616c84so288139585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795452690; x=1796057490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i8m3St/33fP2QE3sVDWlAViGW9u6eVfEV+msFg0eCIU=;
        b=AuBd6OMzXlSQGhqGzEU8BKBmVBfAeOXmvQBVAqY4L2BWD09YjoBzzOgJ4ybDaUAd3Z
         bv50ZDj5WX+DG7K0g1CxlJGfhVhfRxsRRWV1uYkqltMcTzDw5nYynaqPmMDGIe9XEmT0
         WEsJ2dpJm3OZbtWHWK0uJ0Uy1Asapxd2k/+ZXQeP6FEIyZk7iuwt3mxruhznElKyskXb
         J+sP6uOLuWZ8bwVmpfKy6JfUdpMUPj4sztd7Zpc9yp+OfklIchnz2VfloxHzX8Mkx5w4
         UpWfnTGFPk/7yqPEz55gFNALVJLhbWr6aABLhlRnc7ZQ4lg7ESq8dEzhOKtsyWHZ5X4Z
         AIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452690; x=1796057490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8m3St/33fP2QE3sVDWlAViGW9u6eVfEV+msFg0eCIU=;
        b=tjmo9zJMhiEcEDdfTQG/Ln+mgvjtiWW1EG/KmDlzZXUZiYoHDTiuY+RsB75suNDHoX
         tv0fqhcy62S8GJWkArHN2JX95vrtfwAkz5zBwWau7gPDk6s8lIMpPDMQumOYaFekUTwS
         yjylbwAktlTqVkmBzVkxBNGezDc3Zl3rvGnW7Kei5mRWuljihXXFyL0txv/5QMs89aXD
         ZIh95T9lQNMHoy23w2ZDUU9UU7xYlvjnSMrCVO2WdB+iJO6cCkkX/7Qtz6F9SMOc3MZf
         IwVF2Ap/c9jgfbv1mi/ePGyDVkCCjRevmTnyUujhbGIw1RRu4etskrDHa7ys5qAWY38U
         XwUQ==
X-Forwarded-Encrypted: i=1; AL+hErHI6PafT2c83WP6rbibABCKvYc3BPUxn7v9XVABnuqhnLpwxNVEM0G9d1FS9K7UesRch+zZrK9imdHtz3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H0TMdvEeftLsjk/s3lfIkWjJ5j2IEfHt4GCMGGHocU3LEVEdf
	Avdj5HG7WOS59zWZ0GNPWsqw8BN08C12LyQLY850qMqMiU76P6OqUpAifoKkRnCZFGwPm5ilOI1
	YUsKr
X-Gm-Gg: AZFdTZckjvQHeQBwT0YUGGZ3dQ6LoQp13hYfb599lwZHX+bdgUo3MU+ArhGva1WmupK
	4hk3iUmVcfWSJoonFewR3V/vaxTaBxS0OKUKjqUVDJEjB7vef76tcdBCSic5JuCW83RXjy1+Gwp
	KHDeiuNfHAyEQwCDQqmPHXYVU9ijJkLNrWNhKRcefZF00Mv1X8GO997e/qi+cvUKMDIH7/71WVt
	Uxix0stHu0HzjEI0FewXcK9wr0m12AvcrSJesyB07y/MdKLLtSN4j1M5WaTTaTLT/SAtKqJys/o
	M3diB2pqrLTN4k//Dekoh958IhbUrPhFzrX/S2EGHpHn4Z6UFrj9w0+4+1WOMqmR8dcndc8gMQ2
	5nuiXysRf2ryxO0+sw3LpGq92xR5CtebKIXP5qh9M0MJWi/wqMYzqRdgZ02JMa+I8ZP/kLUrRbd
	RA0CG73FubpMqagYfyJshjvhFTndetXEeWf0jrdO5+gp3cUJ4St18cuI6LDM8xVp2X6aXqqCkzu
	Xrydj21ahk/AxDq2LVFBeGYg7j9DeKV8RFbis77ICxK76bCuHtI3sFQu1zsE9ZMnUWQM+zHXRxn
	SEnCMpqAyweRt+C5KF4ZGYe4reYkccXyTpJxcompmNZn6wtLFNUl3p5JgY+K8WQ2KExvHSRBs2A
	40n8=
X-Received: by 2002:a05:620a:2949:b0:949:7de2:fe29 with SMTP id af79cd13be357-949bab0fbb9mr1904435185a.62.1795452690006;
        Mon, 23 Nov 2026 08:51:30 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34a38bsm835809185a.13.2026.11.23.08.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:51:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVXGK-00000000wbY-3KaM;
	Mon, 23 Nov 2026 12:51:28 -0400
Date: Mon, 23 Nov 2026 12:51:28 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: linux-rdma@vger.kernel.org, Potnuri Bharat Teja <bharat@chelsio.com>,
	Leon Romanovsky <leon@kernel.org>,
	Roland Dreier <rolanddreier@rivian.com>,
	Steve Wise <larrystevenwise@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/cxgb4: Unmap BAR2 when c4iw_rdev_open() fails
Message-ID: <20261123165128.GL179082@ziepe.ca>
References: <20261122135413.93813-1-serhatkumral1@gmail.com>
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
In-Reply-To: <20261122135413.93813-1-serhatkumral1@gmail.com>

On Sun, Nov 22, 2026 at 04:54:13PM +0300, Serhat Kumral wrote:
> c4iw_alloc() maps BAR2 on T5/T6 devices or its on-chip queue region
> on T4 devices. If c4iw_rdev_open() fails, c4iw_alloc() releases the
> IB device but leaves the mapping in place.
> 
> Unmap the mapped region before releasing the IB device.
> 
> Fixes: c6d7b26791a2 ("RDMA/cxgb4: Support on-chip SQs")
> Fixes: fa658a98a2d0 ("RDMA/cxgb4: Use the BAR2/WC path for kernel QPs and T5 devices")
> Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
> ---
>  drivers/infiniband/hw/cxgb4/device.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/infiniband/hw/cxgb4/device.c b/drivers/infiniband/hw/cxgb4/device.c
> index 24ac9871ce67..35dacf379294 100644
> --- a/drivers/infiniband/hw/cxgb4/device.c
> +++ b/drivers/infiniband/hw/cxgb4/device.c
> @@ -1046,6 +1046,10 @@ static struct c4iw_dev *c4iw_alloc(const struct cxgb4_lld_info *infop)
>  	ret = c4iw_rdev_open(&devp->rdev);
>  	if (ret) {
>  		pr_err("Unable to open CXIO rdev err %d\n", ret);
> +		if (devp->rdev.bar2_kva)
> +			iounmap(devp->rdev.bar2_kva);
> +		if (devp->rdev.oc_mw_kva)
> +			iounmap(devp->rdev.oc_mw_kva);
>  		ib_dealloc_device(&devp->ibdev);
>  		return ERR_PTR(ret);

You should refactor things so c4iw uses the 
		device->ops.dealloc_driver(device);

Call and puts stuff like this in there

Existing c4iw_dealloc() is possibly close to what should be in the op.

Jason
