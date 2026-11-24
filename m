Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506564;
	b=ngcY2nCKUtaxhdW5exJH5bZYf9OECM6bGY8ggMGJ7Q2AwKrqL0FMjGDtI3VnMlR3YxQO
	 5ZaVYAj5xlhaSMe8OSjCeNrTPMdYKHEBQT0Xvr4xlzsVibogRVXn6Wd5L7npDoWLqJ/QF
	 149+hkQmtQr8P9SZj/EeTNcPiz7gNHR0JgJTgBFKmPYkKoZvjiSXWXN2HvrOgIWT/NYv5
	 IOYuMtUGtu1BagMdc3pkwfb5Po0T50hcObuQEqGwqsvkDELOkKL9Azmy88+8icz0W/EBL
	 dCFMWH275HUvGItRh0KyoywiAXedYbvwiRBtBVp6LSqgnBZhQa7GPDd55U1aQLUBS2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=n0TL+yVGklLLhrdLGL0kexane9if3aUzjRd+iXnFC4k=;
	b=qbsD8VQRRlUTOIJr0DHvaiEaU0LmxbRgtAtnjmTy4vLDDvVquuVZuk7JI+NcrSI2lH3S
	 9vSX+ePBO+K4pj0pspovBlKeFlg85nmOUMNjyr+nqD9kyElwjFnkuorgd68BVRFO6x+qn
	 yKdG4nerdQMGIs/Ha6SSOmOj5lIGn9CxMCmGCT++HmPmPf0o96vEj6Gogdn/q6GlJ3ZmG
	 qxOJpS2MnXwqlcT7N4ykBcyS+b3muhBeQtcQ1XFa4RDwaqQpTINvtvXjIsCEhyAirksZP
	 mz2e+nx49ertsuQd/ZU1mulJqtRBQ39qbIEveKD63VoyleTRupPxzRu9TNXLQWsl7Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shopee.com;
	spf=pass smtp.mailfrom=shopee.com;
	dkim=pass header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=W3N2DPRu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB66606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB66606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=W3N2DPRu
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc758830601so3229851a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795506563; cv=none;
        d=google.com; s=arc-20260327;
        b=of4uHDzZ+GIK4RQiQKy5KQFCgnydCFm+c/xRok6zL5R6pnf647/CwvLLGM6kkUEpNM
         9ukZTR5R1MQihtju3vQikNHUb9cTj77FU86jqhCwU5Af6VCtpn9aXbUnQLmIUWnUj+MH
         ukLT7g5vUXoe+8ofF/eWiuwA/PMt7r7g+Ni7B1SkoXxM19ibzOH4laZkBQdpWr4ZQLRG
         GLP77zdCUpUDG0Bj04+I5iJXXLysAN7gUbYNduX+mTaanxihUmIl6hK3QIDxkzcwpqC5
         yw4cbhrOKkt3HK+LAnTLrYtdbheksuL7301xODMflV5Lml1RvPOx++dh3Ge5E1beS2r5
         dzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n0TL+yVGklLLhrdLGL0kexane9if3aUzjRd+iXnFC4k=;
        fh=lZCBSn36jihkkJRfDScRRChROtsvWfYD6aipTFswBb0=;
        b=jXK1iz7sg2KYf0RtUU650OiUnU9TSsuvMzYl8CLENuCVQMuCBnqJzPnimxomYieoy3
         lZzU8aEP60IXDZLbAGg6khDqqfhy69T7rBvO5A07dl4dflI6f3HZW3JS6jI7DzoUdP4c
         ZRbgi1Qjz1eUgEJHe5B4ryha2xf9+j+IvQyo3qcFJAYvVjquJj6T+Y6gE2oeTw3pxZza
         U9sr7bBTRfuM8KE8p6tqUnr9mBqW1OdUDfFDPEsm+JS1lqtRqrftKQb1TQBKN6v+iB4H
         73Xoe69h+BzPv2gLpLWDnD8LG2hY8jLD3T4qvFnrYJUiUhivrJaeWVYjUZbq+swDixmr
         go3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1795506563; x=1796111363; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0TL+yVGklLLhrdLGL0kexane9if3aUzjRd+iXnFC4k=;
        b=W3N2DPRu78zip6w6cR2gB/Gd4UNMZrAzgVamoAKhxOpJOQUxf//vbnDLLla34M0YnU
         /xLFRNrfDGME3JfNZa2mVS8WH8HsZZF1NkblmUveHIT2bJsM8r3f0Zhibsuc3lXyX423
         GKnEE5ySn5JCo9Wa85HaYBlQRm7r0mJACt9fycayTaPkdd79tN3DuaZpCxy4a3Ya3k5J
         2iWxz6Ow3IARcBsU1+vEudxxSuiAu7AkBja794dPTdlTjllgVlLKkeBCzlgGMEOs2IE9
         QepU2hgVtwsR2aW/uRVFBFzfHnCDLgNL1SmHhFUV3NGAq8mzufBGU7aNJsxyG1NDQW8A
         bKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506563; x=1796111363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n0TL+yVGklLLhrdLGL0kexane9if3aUzjRd+iXnFC4k=;
        b=G/x1qI7aweCllXR96iPapy9DbGS4H14ldjwHrDqTIFO7P37PRucMwQuJuzdt1y2Isa
         4UQRZEzU1mpRBbRNSbmv8Hj5cP3V7khVfL2mONickvn84s+i4zGwHBvZm28pR6sWM47Q
         x1g2kWA3+ndqHV7umwGq4BF99L95GScBDjEJ83pRZiKKuZgDrVpfa88wKhUydYZ0aBD3
         TVip3o9QEvj53BovzVcEzgJcrEXC/9PzpxBvIWMrdDfTov2kiKXIH60RqXPBWHe4yJhL
         5h8nT0NM4akKGdGHju0NwzgQslxyivgZt3gxMGpoAeUPmCNOnjCfmiwaZiOWMPHfzrQa
         Z4/g==
X-Forwarded-Encrypted: i=1; AL+hErGTO/5/nNXQD8gdAJ08OEakIgUo6gk9V+oM2RGChkcvWQdq2xKff7eiXwOy/DbDmxH30KZb4a3Pa+uqXGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pqfMjrfmYcgLMIrcIr6QVdKKUmIxEznkK+YTjSCoP19kn6tRr
	ilLJwEa9Ytbpf9FzGmD6rRt6/9Rf/XuOgLQBCNEShsRdU7VIbpkwhnZEGEGEsXEmfjJ5uX4kHkH
	gLlQYHIezf8ORV6LYPDFDCR43gsmXUyZ1nKdftMehtQ==
X-Gm-Gg: AZFdTZcnX+B47p9ovbBdW9eVLZJnFPaBvkaXxhbRjJxEbR0zQq/72bgPVPoaOAQl7wX
	QxjEY27Z2JN9jr9EoCFtr3ja5NzpMDh+SbGz22oLaFNLzdm8L+V1MbbVT7X2Aay+pKvdVCdMFgD
	VY67pvGbbge62+gjmBXXY5aXq+gVEtJeQKIluWXh5rf0zahpRyVUguY2lbhLgdBrgPPf3ikhZYN
	v2fs9MSrAeRITp3b6nNRWQsKeyKGsWTRGBNcxpXUhIbP1/tdPq1n2VU/TCz9zVoS3TVB14a7JK1
	UlqWrAWkLph7Kd7eT5+Kasm3LiiCq/ra6SHvTR51jrcl+ecPEIiHYlVEA9HmdQf5ZdNpfHTBowH
	yekyIj4I2AY02qJSb4DOA3OMfaMpxnujNW+Xk
X-Received: by 2002:a05:6a21:6104:b0:3de:456a:6e07 with SMTP id
 adf61e73a8af0-4014db601a8mr15842288637.46.1795506563336; Mon, 23 Nov 2026
 23:49:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112041348.66915-1-mingyu.he@shopee.com>
In-Reply-To: <20261112041348.66915-1-mingyu.he@shopee.com>
From: Mingyu He <mingyu.he@shopee.com>
Date: Tue, 24 Nov 2026 15:49:11 +0800
X-Gm-Features: Aa3M54ryVpMrYWVp8M6ME5vLlNPZfM6KixdhXQemQYg3UvT2_MftgFTVs9Eosq4
Message-ID: <CAAoBcuSen--oRubdaC3OPjmt4zCL2WDDU7-nbqPPReeMfvmyTg@mail.gmail.com>
Subject: Re: [PATCH v3] mm/bpf: Always flush memcg stats when explicitly requested
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org
Cc: Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Yosry Ahmed <yosry@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	littleswimmingwhale@gmail.com
Content-Type: text/plain; charset="UTF-8"

hi, gently pin this email, thanks!
