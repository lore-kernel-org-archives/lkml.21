Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100940;
	b=ekqPpUu5ViUX8kCYGiN4Nt8LJBI6+8X5a/gPH4MBG0zrrA+jrmQGuZdsC3RxPHCxtwNH
	 +wcfQXn89zLwtYx6Q7j+XGqzigDlH0MQ8U1uTM5jWRD5WRdrWW4FwAKKAV1mDcDfd3SnX
	 CgaMaXfY6QILjA2tzcudAfiO1Oj4dA+D5UhxdGYm4PmU5HmuZpaR8yE0UAN94F92a4iDo
	 8isbjb9cGX9cLrV6/GXwqhzKJIBkeuZPAKc98YTxEdorWwhJ8WG9xCgf7nWsd/iCnZs4G
	 krQuYCPBaR7D7OK0+9TkcjoODV4BX4U0fANBcHgCFF9YZBlON/p2RLcxWCJNZmII25w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
	b=iL7mN4n21SZ3uMH0hRnlaXFFnIWb+clUVx3IUgJyYh5HT7Ya5g/pIyVz8+cZwOVer2A8
	 e2KY4N9/pDK9fPgW6eYq7FtLlmQ9Vz6B9sKiTiN6nSZkgkvJkjFNMddlbDwh2hCceuTye
	 PwVYLZygZ2GTyzBav2mNFNLQ6KV26eE2XEXomfwyzCLd9+Jc3ohnt1yw3D4MZSdBPa9R3
	 XD3FhO91dtO8jzVFarW9rbp2fpvm+e1VaPXs5dMVVymXwVuYpwKuhwRvN+meyxvGeoi8d
	 1B02MK8XZkDTcMboMwsPKdU6m+VqCRFpgwBDrpg91i7mgmiUciRwDVgJJFj5NxQVeYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="bzk/3z4j";
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0216C606A7C2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0216C606A7C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bzk/3z4j
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55d360ca878so19008121cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795100939; x=1795705739; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
        b=bzk/3z4jzswcQyFV+twu+krdUJXE+GVIyeisxwf+iIsE3I5oibCCy36M5TTKnv8mXH
         Vq3XoQA+j8udATE8gOjcNbGtJbY4SgtNCKxorOP0T8XXG0UtcjR1vX98MS/wYAyqKIlt
         MxSSRZ5vdtLOFODZZeKz+xNYSiQ0oWyC7j11GpjtCAQlktQl/jAQgcbjb1zxOfk5bAqj
         Od6exRdKuflBW/dTejRCXKLToFiIqfWV2pCTbY3IB+41f8G9V9TbfDOohPlhhfoZPIli
         HGZE/2ME/+/bZInaV+zML+POCcIkUw92ymvgl2tJzJDs9gmBwXIBDIXJO1qW9ipl2fk0
         JJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100939; x=1795705739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
        b=GYqS/3QIgNcqCS92fQRG1A59wV+JtnBygDSrG7XDHwx5sa44vOjsCOfq2GBqgNarfU
         O6YQOl3uJiCpDO0YnLNzmVb7VYELQdkt5cwoQxvmObTyHPev4zhEzq5NS/a3r46F76LU
         6Cq/x/oMX3YZ3UikXcJ3JICHghVs/TPXueC1U9vmLJ1k1ae9sDWiJw/EkGGSY2NikCGh
         x7myNCbVa1WnboYIGtwrlGuuKE8cviZmR4jgJk0LYvFgAATcK3/hiJdqJkZczYMYi3Co
         bD00SoJBtcqWkXOyLsFcWRH6v4XnEUCfcPkrZ8hrk6S5o+q25sk0yvFyPWGnzobx4qDK
         wOzw==
X-Forwarded-Encrypted: i=1; AL+hErEmp2tGB+ivBoInlV1WYvNiBdPgsAMO21hCY5Ez635tQqIhjLqoMwEvw1OfoCzQTMrAAFsXYFXih0deZ0w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TSHc0LDfiG4PuAfLw5mZd2/0ADWAUQ7dCP6imQwYAp8lbCxUz
	/QPAk5XpQh3UhoLwjeH/aqefo/0ak8z5qRF9XhJf0kSRZf8NxuQqgpXefwsMoVajpVs=
X-Gm-Gg: AYBFou0XdGpljLpskV60TgG+qigaouFZYSQvl9jGu1elpKA1hlXGJFhHwYn/TxLkSEG
	D9WFqAg6hlk4Hp67JW3LvSCNT5UJ0gHcPNn4dADQ4x/BkW+Z7HyRLZOByZfVrrxhK3gz7yaqdhN
	nIP0HPERpkdNByyHDeUnfzDHyC2j6Q4vytqJCjDO1wVwF3a1fahqvhOLvevFdFEigJ4dmrJHck+
	fcZ52+gBOpunlAmS/d5ZZdxzQFPUzCh7cYwBm10W7Lwpk9Di2DvM7gjQXwfk5axa4Qia5rxQ24l
	6/0ix1jXwfEFK877XmyeQxcwhX/a1z6G/E8Y7wFHuKhDkcN1rUjet3HpvliCZbSq28ghs6+606n
	VfLjwdqKgw2Bpt8DI2CWGfXwjXDr3A/YMoZg285f9XQyVhPkqZbTNxVjgacuq5PX+oBjbrlPeQn
	FGPH9MQxj+uNTcSxA8Z0ozWp+OLWMSP2xpR0u0CNRB9afH2qwPeVSHjMRC6oQlosEKthbSYMdIY
	j88xZQfCby1cdiH7Ut46nKaI50ayafdT53BG1pQTjs2XwwutIux2FVBxdj7pkHR9g1pk6lQTPme
	QE5dGA==
X-Received: by 2002:a05:622a:4e06:b0:535:2e9:e474 with SMTP id d75a77b69052e-55d76993c6amr3007681cf.4.1795100938908;
        Thu, 19 Nov 2026 07:08:58 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d669bb8d4sm25325301cf.3.2026.11.19.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3kv-00000000xbi-0Yi3;
	Thu, 19 Nov 2026 11:08:57 -0400
Date: Thu, 19 Nov 2026 11:08:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261119150857.GK3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
 <20261119143151.GH3115493@ziepe.ca>
 <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>

On Thu, Nov 19, 2026 at 09:52:59AM -0500, Nicolas Dufresne wrote:
> Le jeudi 19 novembre 2026 à 10:31 -0400, Jason Gunthorpe a écrit :
> > With the additional twist that alot of embedded HW has apparently
> > choosen to not implement SSID but instead has a pool of SIDs that one
> > device can use, functionally similar to SSID.
> > 
> > We'd need also API support for unbundling the DT iommus=[] SID list
> > into something that the SIDs can be attached more like a PASID.  That
> > need, I think, has become clear with all the DT tricks and fake busses
> > to try to work around this issue. :|
> 
> The word "fake" never flies with the DT maintainers. On that subject, I still
> don't know what you mean with iommus=[].

When you write your DT you can list all the iommu streams in one
iommus property. Like this randomly picked out of the DT files:

        iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;

If you do that then Linux sets the struct device containing it to
put the same paging domain on all of those iommus.

It doesn't make any sense to open code this in drivers when you can
just have the core code do it by writing your DT to match how the
driver wants to work...

Jason
