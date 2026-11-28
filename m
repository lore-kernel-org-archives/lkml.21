Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834144;
	b=LzzdvNDhYwTybM+JlKBe09IhzeO5K5r04Aw8Y6doEccES4PP3N6hSQqnsv09mTk/pfrv
	 5ywNhycqMaed7G0u5ve5OX4ZfLKsWMwqCLihkHFXWgWundjBBG8uTIBWhGmdWpZtekQcM
	 tsr5YWDFyywImAXVooHbHHmxWIuxxwkSJVsdc33z6gXWvtyDqviMRqnGZTpdflaC6mXhG
	 TM0w4b4Sn84jpJeBu5a2kBBBL9wY/QpEY3f1E3GTphLjVU00N+kjIOPVzsfX8UEPKOzEf
	 9x/RSI++powl3xU7mjRje9RrANhAiILWyXWnER1s21ZCbb4wLnxLjv2JbQiGLsE7fnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=epHX4+IRmuNiGKc20qQXYTxzY88O7Spqzl8rwSurgAM=;
	b=WsVTQFbZsJi5osMdoIPJHPM/BimgLeGh+fY8p1TmErwJzTdxgiA9b7iwA+mG/mv0r2l3
	 uIbpzm8zF/ZUNiOWX2SawBMhDEJndlnnXp8r09Xi7U4w12cxv9Zy76R1Lh7eqchSrWJdh
	 GDLqJD8ENQhpFX84SO8cwK6woMHRWvco26+6W+sgJ6qh8ym3OcdyhijZOxR2tEGyKN64x
	 hYubSPW+GsRzxNpwKhrs1ro65un+GBfVUVxtugGUGVPFfrXD8v1e6ESo5ueDlSTZrGQO9
	 ui2A2xtGN2KDSUpLU7kHtDAH6rRmZJwVabF6VfN21ngYSYPWsccCVraUhN234vHLHLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b="LV/h0dgw";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A016606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A016606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=LV/h0dgw
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38699cf08dfso11183843eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795834143; x=1796438943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epHX4+IRmuNiGKc20qQXYTxzY88O7Spqzl8rwSurgAM=;
        b=LV/h0dgwgnVLBXCfc3PU4g/VVkNz6uYCMB8wCp/Cvospu89xjwxpoDvuklb+t5KBQo
         OFoGjPTP1IdC+2gxK/4sVmxArHSoQgbSn68seK+Vq3x+JHBPnHxYRtG/WAuf8uRdUFdz
         krnh6ZRBsbDoBtx4jg64PpYYQWeBGiiQGPq1RA+6wS1bgd2ZDAvWfzllC+QLRdx21/jc
         w8MPeIUuK8TKvZ1joWojIURXG2xoXRRDZcKPrjvNLTunlEhVkrqTQwhDGelXSr9c0Wg1
         b+9EFRK0YjL/o0LpQPQgbGPUm9Idw0qbX0tfOR4nM2M/MP93oJoGMuzoR7rX6nem+6ff
         215Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834143; x=1796438943;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epHX4+IRmuNiGKc20qQXYTxzY88O7Spqzl8rwSurgAM=;
        b=IaZNBxT5Z3cS3P9G2FQomtAjRZL2cB3crdugBd4AFI/ojTk/kVqulkQDyy0jGcBAsp
         9lPb47ENACT7D16vhwBSfmMO6cOiFhIx73qiKNjhG9/7TVSNiC/sHXUC4BQCTWapQifF
         RZpAXniLe7tuIGxNmoDVdM98nFvYFxzuv7JsUFPoRLAOKN+EpnlmTwrh5KUFlQg7L4S0
         nOXnt/JiHmB91GON7LhzKNuTf2XLJ6/VS6O+5TT+aue+HyetJvpi+i3R+1wHUxPbWnUr
         MMxL15unXQqQgIeOmVGvVIUmCPcwoZvybWHgsrIVlfid1y9lIr+R1LGuw2EC1Mh3q4eF
         ptLw==
X-Gm-Message-State: APuU4Z/Kj2PBEIh+6n1Uq5NBsCM+2FmsKHwD9gfZRCCVevKJWNQkkq1l
	ghwIchukMFI7Y/jFGWXXmCs4LllW8H8kZYrLnilxchuNLw5BV4ecr27TyL5h3WkKjqM=
X-Gm-Gg: AZFdTZeTxnvrmrprtEZvTSHjquJvyXXgqzhCLuRX9yLFc4PrJ7LrzFG+/sR6gEcC/kl
	KmHkaHaphKIe9JWzT+iLQ7Nr9XzfAlgva2H06hwAdQv9yjE8puQKFaOydLDNX8udsNFR7QuVcb3
	EsYRwdWYIjmrmHJohetUNamzuPdstQ+XlWTWCDuyLZ6tWG9UZTAdOTVG5eDJjTDXG9IE/gsNx2o
	KLzhReZtb3WCnxaIr2oURS+FKxFNwxOEursEiR8pwFdiQDAzUaYM54fHTQE3jOUybdlQYU2SkAg
	CfwhkWFPhK/BfKJTsIB/VBVvZ4F14clOux8nOGRxwTElYMGwRjZ/8yeu1WVyLD+QxT5iDAW3VU3
	BVLrfLb7HeOmdXQ5xwgddWG3dhljPoII1RcL1E4PUs01WO3mkrDHlKX+FY/tOJFcUAD2OvyC3ce
	JVxfYlEC9TIijFs+CqzgyEwtmYRN5+Msa1okZy1xsUZ3fLtfiUTlyDgECFkI3s+gw5h9tOB/gwG
	7Awg9kOo2fYVA3TRHFER3RTgpbkUJflvGfWIA92XaUtDocYU8MjAmbVXQjEU13ppdQKiKC4XKyb
	FEDmghKeUacfqAFJext8kpLt/BgXbKKGMoy16fVHLgS7XWV4rlftPIWl7B8shkyDEM2VuJuOa56
	0V6wP4wFf9z3rKekkOuwkuOKv6bQgvFJQ0vZTy1Re/GZ2IDSc
X-Received: by 2002:a05:7300:d083:b0:380:f112:3cc9 with SMTP id 5a478bee46e88-3857093f06cmr25201689eec.38.1795834143147;
        Fri, 27 Nov 2026 18:49:03 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm72691991eec.16.2026.11.27.18.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:49:02 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: bvanassche@acm.org, hch@lst.de, yukuai@fygo.io, 
 linux-block@vger.kernel.org, Zizhi Wo <wozizhi@huaweicloud.com>
Cc: linux-kernel@vger.kernel.org, yangerkun@huawei.com, 
 chengzhihao1@huawei.com, wozizhi@huawei.com
In-Reply-To: <20261102080420.3774409-1-wozizhi@huaweicloud.com>
References: <20261102080420.3774409-1-wozizhi@huaweicloud.com>
Subject: Re: [PATCH RESEND V2] block: fix BLKSECDISCARD zero-length range
 causing page cache invalidation
Message-Id: <179583414229.87894.14203257367547275323.b4-ty@b4>
Date: Fri, 27 Nov 2026 19:49:02 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 02 Nov 2026 16:04:20 +0800, Zizhi Wo wrote:
> Commit 697ba0b6ec4a ("block: fix integer overflow in BLKSECDISCARD") fixed
> the start+len overflow via check_add_overflow() but did not handle the
> start=0, len=0 case. There, start + len = 0, so end = 0 passes all checks,
> and truncate_bdev_range()->truncate_inode_pages_range() is then called with
> lend=UINT64_MAX, whitch is the "truncate to the end of file" sentinel, so
> the entire page cache is invalidated.
> 
> [...]

Applied, thanks!

[1/1] block: fix BLKSECDISCARD zero-length range causing page cache invalidation
      commit: aea1c2ec03b399434ff1bafbb2f0d5076f74ce03

Best regards,
-- 
Jens Axboe



