Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087089;
	b=UVpYcuU7sW5IdLIgC6vw8OYDhjkZ0IIhtlDPpyel1DGp8rRfBG4ps9iRqqbQmECT/V73
	 HQk3JQI0vJldqgoor/DMHv/ww/bqLoNDlW1CDZCH8OyuXaCn1U/30ZAONmRcJd/4wogaa
	 dRKY4KrvNkpyeL6fss/hmVeiK2GFAsLCH21ExiDlMbxYkTAzQV1tmgiz7TbYtUa0R2xsw
	 p2xwmH0Bj0J6gt7f0oQ8j0/Oo9tsAp7FVOc9ouXZOPqILqvQPdnGs5uv4krdzZURnYUCo
	 EKkyISNp6c9EWpP8s9jUYmdv7BuWSutLM8SKUUZVhr0n3EMMpRN0WcpMHlQoDByMouQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fY+Pd4NWLtkS0HB6qP6ih+nJNWbdv9Us893L8bxy/2g=;
	b=uJWMaoLJsP5y49YhLAU+yX2X0WxsbKCFgBaBxdWoF2pReh+S6QlUZMMmXfuHgHdizL+n
	 OrMyCxa+QiC7lymD0js6pcVdbNFfcZAqKqgtKuwaf1oUScr+71to/xKxBcg5453ryB97F
	 jYBqzKG47O3iD345x7A4FM7zsWae3cQvH4wWDsQSuKLR/kgxUfTcfREAgLhmMATQtUIZ7
	 16bEqIe0fY43FfOIS2Z9124Ik8bGXEmBsYg5+mOEaQdFLVUDOn98sPymWVbiyKy6SV+Sb
	 ArB2AqtD865PbhZTxZl3vRm88Z6THrW5Fq5wk5jVZWAlXZXxMYw2oSiqQ4TCVAeleDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b8WPc3Fd;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F62B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b8WPc3Fd
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so38185e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795087088; x=1795691888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fY+Pd4NWLtkS0HB6qP6ih+nJNWbdv9Us893L8bxy/2g=;
        b=b8WPc3FdHRjwcsQnEGbHk9ARKrO6/NxpqXsO5ZVX0+Lll+oTtn7tekSoUBJ01Jbie3
         9GVfzjduGCDZfvNOyM4DaObJ+YK+6/DWdnOY9r6nPR/aFa3FDvVjQPagEq3EOKDGw1a6
         TCzFvfHL+PbhnoXaQoIwoKwWUE6O6wdVJg0Zc9ips21Pw1HH1+RGgMUkhq76jk/oNyB0
         tCtzLkg7c+JhUmsbu49zEGz4uLWrcYUqH2U42+8WwUZu4cqtxMdHN9n0zYDF8Waizsi5
         6aEU9wWOptmvQL+ZTfIrtD0SW9PfrLjMhr25eoIy7h/lWyM7skJCxW58e8I38MKkcyNM
         su9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087088; x=1795691888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fY+Pd4NWLtkS0HB6qP6ih+nJNWbdv9Us893L8bxy/2g=;
        b=aLWHuU3ZQmxZMb55tQwSnjq/Xv/L6IRI+kcQDAPODhQ8qZ4Ft69RB1qO8oo9jYfjDC
         TdiQdiHG/XXgfDutw5zKoT+zcEIeVcR6dMUGRX57Pa24Rvq1q+bATlvsRDwYh5J44A1s
         ZgVr26JxHDYtLyNiqYD7WU7Pk/kCR7jV0j1TupXWwaK3Tw0P6dT446Gt9WCjWr5c0ZHE
         GsmnEqENRSObJ85UTz+CKoVo4c8u8WYWC2dn4YSN7TnIUN1zIOPnRREV4nVJB87wanmC
         qjpavJBaSOgiKh/9ROFmpy/cB9DrUc3oyvbWZuooJqoZ5Qpn/fwbqJFBsBkrGsf6lB28
         Bq4Q==
X-Forwarded-Encrypted: i=1; AL+hErHPWrd8KGlZ3EKmaPm4WR4Fzeum3FS7mYfhTufA/fyQiv+CfwDb2URcGuf+6PYqDxbGJkfiz8z5vm/dX44=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d95h9QgFL+JBVLSYYcRgrF9OSNf+67QjcOZZbHJBZZjDZpzGh
	Y9EtKsrbSMoAsZfmQoKLWA7bxgwEf0V9FLsg+Z44E+13ADSbO2oKdtXsQmEUIfgIXg==
X-Gm-Gg: AYBFou1Y9+Wz/s1aaGdEfjYtJMSAqGj1OtGp5YflG0NOu0hNz3Mg1awJ7hWF2AmvMdF
	ZTXpnyGWWCe8j/jv3Mvavd8HRjjANIpZvsuBFdnmbW5sBnIsEZLg79gENKcNH+CHDa7BfHNQOML
	FTrEL71tQue8ZW7qc/bq2ixfCmWXhICgU4DTR/l+boq4A22EKJGBGmbbYMbwDdrTwx0gT8sfDhd
	RhJX5nbGpFgaxEd85QqFAcNFSlzcQv6lDYXN2wWiYBeNEGQQertnMUiHXrRs6889xy/JyDCM2sy
	dJi5FQ/6BXXSx+ZpDFuRMxemWsuXwPAOLLihGP8zKWRXuhwkHMVHO8xRuIXunk8x8chYg7qAmQz
	7BBxdlPcppvEvMJ/Td8+4OKdgkjGpHWOKG9rtY+KX4bE4QzbZv44KIrRAqguU0Fkco4pZf6Xjpc
	HvqKOMXixJDHaFBWDKut0wfjQamLjNZicVW48b41X7dlI2TjRTYgz7OHVPGLzg+CA0+fTcVUXlL
	Unp3uGmRP2NBy867igFZnvZVED0zSPObIl/P4RJVOp+hunLlQ/FZDwd46+AtUfAr+UMtdXGhD/q
	z2/GugZ3q8cQc4OprJ+G62+NN7b7Hx1h/w3urhe9MmUwfYIQG+4ss+IsHfVwGTW8GhfdaT0=
X-Received: by 2002:a05:600c:a10e:b0:4bb:5e6b:2dfc with SMTP id 5b1f17b1804b1-4bb851b6663mr297035e9.13.1795087087341;
        Thu, 19 Nov 2026 03:18:07 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655db6d45sm9766011f8f.33.2026.11.19.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:18:05 -0800 (PST)
Date: Thu, 19 Nov 2026 11:18:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <av7a6RNSDSFH8t6m@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
 <avGk0ilyJh3obmKx@google.com>
 <avJidXM9yQOX4VBJ@nvidia.com>
 <avL016l_xASN5paR@google.com>
 <avNhekBYqiiZ9IM2@nvidia.com>
 <avW_9A48mtnK383x@google.com>
 <avdI5olRpBdKeE9C@nvidia.com>
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
In-Reply-To: <avdI5olRpBdKeE9C@nvidia.com>

On Fri, Nov 13, 2026 at 09:29:10AM -0800, Nicolin Chen wrote:
> On Thu, Nov 12, 2026 at 01:32:36PM +0000, Mostafa Saleh wrote:
> > On Tue, Nov 10, 2026 at 10:24:58AM -0800, Nicolin Chen wrote:
> > > On Tue, Nov 10, 2026 at 10:41:27AM +0000, Mostafa Saleh wrote:
> > > > In Android, in that case, pKVM clears the FW (called pvmfw) that loads
> > > > the protected VM and authenticate it so any protected VM knows the
> > > > system is not trusted. This part is not upstream yet. [1]
> > > 
> > > You might want to double check a dual-SMMU case, where one gets
> > > accepted by pkvm driver and the other fails and so bound to the
> > > main driver.
> > > 
> > > It seems the pkvm driver would still pkvm_iommu_register_driver
> > > and carry on with an untrusted SMMU. Would it also clear the FW
> > > and mark the system as not trusted?
> > > 
> > 
> > That shouldn't be possible, if one SMMU fail the whole thing will
> > and the driver should clean up after as the probe is done through:
> > 	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);
> 
> Hmm, if I read __platform_driver_probe correctly:
>  * __driver_attach() doesn't propagate ret from driver_probe_device()
>    via bus_for_each_dev to the caller
>  * bus_for_each_dev(..., is_bound_to_driver) at the end also returns
>    true, as one SMMU is bound to the driver while the other failed
> ?

I double checked, you are right. In android we have the following:
	ret = platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
	if (ret)
		goto err_free;
	if (kvm_arm_smmu_cur != kvm_arm_smmu_count) {
		/* A device exists but failed to probe */
		ret = -EUNATCH;
		goto err_free;
	}

We need that also here, I will add it in the next version.

Thanks,
Mostafa

> 
> Nicolin
