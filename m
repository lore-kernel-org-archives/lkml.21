Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559570;
	b=bCF0crU0xnX/zRwjU3KBTosgfu3p/Ou9YqbKOzd3ScR7NASHiZvCy4KgfHPW4qDNUjLj
	 yYBVd+RXlBBq1Vd/1Zj/PT/jiL/YKdK9ljDaf+/e8cqhXeyvPbY+mJyuWjLIkwgnP/eUl
	 RZvFpDY4AeG8yFHl4TqES9LPSmRA+gOGj8pIqZG32qbHfB+EWyfQtFokq8xaDLiRkU2hI
	 xhwFMKYUk8IYVW4XTEVo26dzYsEEexjjBKdk8x5GcT+W0/Q6fMKLFk9XeomiczBe/RQD3
	 qVIwzZZOFTMotxkPTiKp5Fx276qrbUs3g+btwiWaud+BtXVwA8QOJs6bB02qQOTHHNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YztxYMampkDgsp5B8qRmLm7qNVSv46tGRVgcB1aXKs8=;
	b=Zs91tdV4ddl4a82dhCRlTUHa+arB7JobPtF+EIEoCty8wHrSDKsNRu9wn4BOhSdvz65P
	 rOKchHxoB9Il41JzDY03LJMn6PWXj8vtT+PSSE7mAVbkhZWiz8ldZHMfkZvOW8TqD+Bvk
	 15P1Dxrta0j9QQdUB8mLJ15QWyC8d0OxIf77YGzYNfP4P4RNySYUdsT2KhVQuFoBsgo2t
	 R3CSZ+goHpm0VvWynBjChdDfo4ipRuxkulGf0WWfix+2qWjXBYcv5YXO1Yw2LVzjhNtuu
	 0f/uuaWzLxNa0daD7pmQagYfmWpWSTs5Jveb+98wRUJsnOHiVXJBno1/u/UdtXSO+pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W74C66Fa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A45606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A45606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W74C66Fa
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533202fe429so1080071cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:32:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559569; cv=none;
        d=google.com; s=arc-20260327;
        b=LGc9CuTuO9JjP+7uQS7M+UVTkykF6xcbGjTGO+715weOzJx4NvmJiDWgdVyC9Trv+E
         mxvRPs9ccW9HkMBhgJxXaMkr88obBJiKFvlviYv7A3g7NgjlqT4UxsUuFlkvr0+1z/kT
         5HcU29xLSi79/fwGilZ/P5fZK8NGt8yVnQ/SVa7rzzbu2BoPpRQluciwR8d0lFjszVVK
         El46urRhVUym9O48AODtYFqLoK9JY6V4zcx6dNBrpBMvzl/PmDMhM2gROIpLu5iwV7ur
         n/5jX7FwBxu7YRa8GMsQwMY3wmgezmCaldrR3GG9jzKkwvP4mYlrtq8y59vZFe1zof87
         E0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YztxYMampkDgsp5B8qRmLm7qNVSv46tGRVgcB1aXKs8=;
        fh=vV2raqBKOZGdUA5Do07yTj8y61OK00uy5Jf1B6L40U4=;
        b=NQ994JIqA5wabt9SK3aVtbPpiUZgfR2VGo+VA9xs17BKlsIAEGdV/y/rLsn2UMr3lO
         UFFx3ve9r+/wfrOTKrrktw5mRgWR60C/kTtOO/6eoKM6Sgfz84l6dTRjP3+mqgX18fbT
         9aCQNlwK0/3cn8A1XC1L/PZy3nLuG5QkmeGC3DkLAQqEv+Lm4skTfFhM5kT7dq7kju7u
         Pi1LDNLzdNbBPzacxaIcMf0kSu9Vg1gWFV4q6vburU+BiNGpmLH8E9UIDOp6cj+7RCnR
         fjPPmQltpT/uYyhfNhRztUPa3EAX7guy9RHnmOtJq8luy4p1dDohv+lwMGCe49W7pi9L
         Hj7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559569; x=1796164369; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YztxYMampkDgsp5B8qRmLm7qNVSv46tGRVgcB1aXKs8=;
        b=W74C66FawSRrw2Bcns9NHAdWHYdXdeQOb1vpanibp8GQEg/b7PuABno3yHvIneX9ZE
         +nAapSLMlEZnDsrNJ11JH+RPjkoHlH0N3GZr7Jdga5LjOFFAbygZXpuFqAa0UbGZ36Wf
         AEWrULFouzHDfmyZdaZcJVIqZGq1DWMckJgwQNe+vURL3WzhpgUPtQqDeAIGqB4h6+0s
         g/vbusd3iW6o0765uV2FC22n5stJAKZ0gFeYJPg4pG6cwsNvZgQ820BgcQszGVjg30lC
         g3xKPaobLiiUggWyCVqFqzBpOtpFeAcD5xn9WDbEps0ZX5a8D4yoH77RwosYIgHmHKyW
         nVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559569; x=1796164369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YztxYMampkDgsp5B8qRmLm7qNVSv46tGRVgcB1aXKs8=;
        b=EcMcMwk6w9zLG5c5bBML71EGBbnJh56B7NpXHL/5ZxP7fkcQ3poMA6sVJxYzqd6Jrd
         cNau6RRxsolGh2DxlhVWt4LEwMrwgLn2dPiciV5tw9ZgMS2cxjIo/qggyu/4VTXhOwXK
         8YysQua6N6WpNSE8rxt+dt9bn28Q4Ar9unVai5TiiTfhpZVgXuSZXxsC+VSCUvRxIDGD
         reDDl7NEjfalffmi2PljiIZUT6n503Qty0RomS1BNXSPHVmIwUNwXIAZpApx3KMWFcHp
         qAvcO+4rlFmXLmS5xs0SeQWJJ3R+o6/prpbNwyb4yv1T0JjWsEWMh4PS/Cu77BFcUy/p
         4P3Q==
X-Forwarded-Encrypted: i=1; AL+hErGUDZAMB22GD3hn75RTdK2M6kaVNpfZlu7wUr18wp3j+xX2IBbmDDGZ2+yJ5eFcBxKVmGWciUaiOp5K698=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qRNeRiDnGc9MJaoFYTFjoDCcN1SXBGHL6s5ah8VJOMxQRGmKo
	dy6v1GIv1lxQTNIuMIIkN/aJvhy5CkcM0RzWCo+V9JVs4pds/hptcf1suwrJWlZIB7i39GC9F9p
	P4LqhoLBWBc3YN3YlCiDbVUzdI/WfCe/iTMJx8KBi
X-Gm-Gg: AZFdTZe4sZXCGyQzxoLuSmL7IybmrdvRvEG1UcuhyyM4y3y+0d8TNksn4+CNRZuHzGt
	hnqcsoMMMNfrfilOXH0OSOkyxdEV+pSzkMBTg/BRJcXXKRompOa2Ld0KQdgxBUNSopmU+n90KLS
	rx/m8lJ32cMRZ3ZHfkAsFPwsmDWq8WJG1n8Tct2SQPTxGVzJHfesbP3lljaJiEDjTcKq+CSmqmo
	DGZnvLvCfiO5VZrPgbiE1WxDGf9gUqHBywYb2hu/L1bfpSt7pwdk67uVczAUumIU/C5hheOS5U6
	R2iPuOpiEVmy3Z+nwUyzRCJi62lIWFW/vXOn2/I7O41sQK0/7dle3FVvpBuQ6Q2YcVqz4uFlBcC
	NrtRKdTyNOIDxmHjDZffSdtAG3sj3QD18JPGzlS6wuj9ap0G2m3lzWhNKGaG531Nj1RsIDKhXkh
	s9vv7ZOLLE4Yv4wcffLt9ZbEgn5Mqm5MUsP61QMMWYzVZK3GSYDfe2/TakP9L9tzyhovYJk5E5M
	B5yb7QhkVkO5YPtKA==
X-Received: by 2002:a05:622a:114c:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-55d88138bddmr71826311cf.4.1795559568208; Tue, 24 Nov 2026
 14:32:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20240910-trust-tbt-fix-v5-1-7a7a42a5f496@chromium.org> <awXXSfrhLHK7TNbp@google.com>
In-Reply-To: <awXXSfrhLHK7TNbp@google.com>
From: Esther Shimanovich <eshima@google.com>
Date: Tue, 24 Nov 2026 17:32:36 -0500
X-Gm-Features: Aa3M54pF9USwoeiXdEoOFQBIYzN0mq-CawtxtSt4Q5TgH548xzZqipxFMopdNWE
Message-ID: <CAK5fCsAk8kMCn-VPsLEo=34LvH3=Dar9jG+vXX-0e8mF_Zp5pQ@mail.gmail.com>
Subject: Re: [PATCH v5] PCI: Detect and trust built-in Thunderbolt chips
To: Dmytro Maluka <dmaluka@chromium.org>
Cc: Esther Shimanovich <eshimanovich@chromium.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Rajat Jain <rajatja@google.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	iommu@lists.linux.dev, Lukas Wunner <lukas@wunner.de>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Looks like this caused a regression: on non-x86, dev->untrusted is never
> set to true for any device (so we *never* enforce DMA protection from
> externally plugged devices), since set_pcie_untrusted() solely relies on
> arch_pci_dev_is_removable() which is implemented on x86 only (on other
> archs it is a stub returning false), without checking
> parent->external_facing on other archs like it did before this patch.
>
> (I found this by looking at the code, not by testing.)

I agree, this looks like a bug I introduced during one of the rounds
of feedback. Happy to implement a fix, but I no longer have access to
any devices I could validate a fix on, as I have switched teams, and
am no longer on ChromeOS.
