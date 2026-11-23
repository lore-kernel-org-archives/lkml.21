Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410847;
	b=hnqvvH2Y2pKO/TDUkAcLieZY5TkfdIOB6tKg1ytob3H4jWSAl0+hTMONw8hvkZRITAdK
	 +3prDQrc6AVki9Thu+9e5GhRcUJGg91YvQAuwJl2AAnbSHaZl4F6fWl7Lmk8z3i7I3yWZ
	 wMZHZrToTEQa/OizuM4BwDIKUN6adMjvU3kd5IY5fTc+mdUrSwYTYLjn+iThdShAeyfXq
	 GZ3UszDAhWHg1fZiA3U7Bgj5NoEO4n7K2VQwGPDhl889Y10oCN4dbQFZPsHQtoojgwbV3
	 N60Um5b6TOZdRv3r00KSSwrts2qoKXfG/SwRxkSGNNsk/Ids1vY961BYxjSCCc9Ws2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=k7+r1wcmBXlzcUNyEBTS2c1P+mYURGBhM2xcEBNrIAo=;
	b=tV+kRHIBjRY0A/YfJdPSN+zhWyoSs6mj4fBDyojF4r7LFxrJqaasHslcc06SS4ZNNNlt
	 d2Xc1zXDpME+s7DCfCqKdcGXxvqvoKLmEFjtbYapoS9pNtzIrrbu3xmV9gLrz1jYx7/id
	 Pu+dQ4G9gur+NE/WT7N0H0hM2hTQmRyNQa2/5qwGNxM4OR0Sb8sMbH8sx2CK9CLeLvSWG
	 WlU9JpW9LU6yh065xtZDIhuqr8bhTgrDP6YquMBPguLuaR3fMdDL5sUHmBJaQxOuTSrB9
	 M4HxXQd0Zo6460a0Y2qXyR0MvSPME8uoUofYn9BYeaatq2Y/8ImyRGmCkpUgLLEJr+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="GsL2OZ/4";
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC4E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=GsL2OZ/4
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b360828905so23720937b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795410846; x=1796015646; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7+r1wcmBXlzcUNyEBTS2c1P+mYURGBhM2xcEBNrIAo=;
        b=GsL2OZ/4Mo6bTLXTKfrUK0FbIXP/1qWkbs+Suznb/L3HShQQ4vSmJDxfkxx+3OWXn1
         sw4f1SFlFBshgqTApz2A87JLxgbHhd6oEYtVX1kf/VDb2cbXaDRC8kbECVBl2beMDl+8
         mozblqlQACTMV2Qkuvf0hzvK+yJnTpl6xzZtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410846; x=1796015646;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7+r1wcmBXlzcUNyEBTS2c1P+mYURGBhM2xcEBNrIAo=;
        b=h7BKM2Hznnz60i10mC6i6w58HZdEILeQwjkdzJHwfrCNGMPyIXFUVbPt2QHE3zNYtd
         tgmqlpayWf6JkhiNf5O1kt3oLJTv0iKH7xy7dL6H3A5GuQZtMt962dshibQGatojMasg
         ZMMku5WcW9k4iL9FqL+5nQucGGUre7bqTT9RJx74uZHYEPs6z2bBlOIkvbvSKq3dZPOC
         Q7Fux0lDp0s0UqXO1AaKe23k4H0x4p+aPvL+wsbZk09BQmu94Thw3reJJKP99dmmdWbx
         xylfotsWX5xFOjrr3+LGe0mosRxA3WT7vvS0Z+UNduKEVJ54W8OZX4gl04htEuiAfBwg
         DqEA==
X-Forwarded-Encrypted: i=1; AL+hErH+AGfPYRiSBygbwyW6V+0ok+T8RuUGijdvGrZzn/SCuPyt5go3Q4JTGId0Dz6BcTYRDsBGJBzvfMqyaWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z92HRcpzoMMey7jKhjvI0okuEp8xuF5nGDoBY9scr2grvo5pi4q
	ID+xEXoaIafiAaM9/Drg+8wi/ulCqeZnUyAOwWwLP7/wnhy4PUjutD6qaQcOd+szCSM=
X-Gm-Gg: AZFdTZfmcPzGJ6MkRMiEixOyZMDKoazwnWHDCgU0CZVPrahNsgtLDvdf+IhbS/FhZ37
	bzP9ACk0E9VnbepwPoCH1U666sagIbSHzXGLC+iFxfpapWSb4AFTLeg0+j5VKgQaSLnNq0RXWDK
	nYrohjT9Tg+JwaO3oIJcy2wI0N8hzQI6fHuuXW72/QTeIkSkOPdWJxSkUl1blv8za8rpalQvyvk
	ppu+C7sJxEwXO2TFbIQjgT8FZHV4zlTexmgAXBuHNSRSBv2tHlUCI29RfIPIgpKtgMUr95P4cy8
	Mj9XwchQrIF6zYc/pcoW+cLP/0JwJD9YK2AvfIUBdKEnDTEA4rcjQ5ix7c2m6gGC/JBqszrnSHo
	wisLl8c1JURVy6q+m/dZwHcQ10hYChY3SgLYbplYe6D6mdl9f8zESCr1sxkn2So1y3hmP13JlPR
	LECTwP0FP6ZCac1DpFcoT4XIXh0gIRofJsYeaoMkfjLUYaAfK2UH+s3M4XOQKGDqKz4j9mdo4FJ
	CdPJtGXf52tdrj7tlfzst88b4Icyc4TeizOiMeARIhpK9PNfjLvX7IWT4uqKNz5T49b53NA2BoL
	vgVoH4+Xe42En3Hd41AT63YZJqYyGDnEAT8g+R2WY4Mw6+gS1i1tDLY05xfJX871FEOEitJBxpl
	eC+Ggy4SfvxQy0uR6q2Fl/pGfaNBxMUIoSocuArYVKcbPIm01OdE8nUlOgVjYBwe3bGFN/m3RWi
	9a+3y4JmWeeESEjJ6GMV2VAmBbhhLwQSYzhUtK2rGlPebTnCxugoFV/0Yd2eTQXaDoGrCMpd3cU
	NxUlK0D8N+UpwnXyyRJ5m1Ro8aH4Ce7p9zxzK7U8yTe
X-Received: by 2002:a05:690c:15:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b520435b72mr34672047b3.20.1795410845935;
        Sun, 22 Nov 2026 21:14:05 -0800 (PST)
Received: from [172.20.0.3] (static-host-74-205-137-217.epbinternet.com. [74.205.137.217])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52035bd70sm41821627b3.44.2026.11.22.21.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:14:05 -0800 (PST)
Date: Sun, 22 Nov 2026 21:14:02 -0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
	mm-nonmm-unstable tree
In-Reply-To: <20261117091535.39481792f30792e6067a26a2@linux-foundation.org>
References: <avx98jYYXsZAmkDN@sirena.org.uk>
	<20261117091535.39481792f30792e6067a26a2@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <awPLmjLsDIPg_dD8@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Andrew,

Andrew Morton writes:
>Chris, could you please redo?  Against fs-next, I guess.  With the
>ro_after_init thing that Kees suggested?

Sorry, I only just saw this. v3 [1] already has the __ro_after_init change,
and Christian has applied it to vfs-7.5.procfs, so I think there's nothing
left to redo, but let me know if not.

Thanks!

Chris

[1] https://lore.kernel.org/r/7c10f2e01b6f19229c83e81d887a87f5d1151841.1794904698.git.chris@chrisdown.name
