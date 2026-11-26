Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683337;
	b=n4tiYAg3OPTi/5YllHUVl/bJvQvVFtboauBvJ2F8ke6eya6NzeEX5Gowv/bpZwL0UjHk
	 kRInnEEB7UA+AxaDVTclaru+jsRpwbzdlSt4ACCdUHtTg1MhnFLa5YHG3W7lA5GzswA8J
	 Myzr8Qx/IWYxysdAontPgt1TD95kH0EM5eBgHldHtyQ4XDBcoNAxLmFFAmUpfKNdeatLM
	 0ACOO8jGnAUz2hZU5HBep8y6ct6ttjjqdFLMey/sBYoVcSjwNN21jqDmFZ6YFqvrbAslB
	 XryTcPjin5jRz0f8MHdC/6qCX3xcGXgFN+Uf/iDniHM5mGLhOVjHHvlPMdGMzRJUk3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
	b=ljnjSoZue9wOPtdd0pTQZj/rrh1lMTZD4gp8E57MzkwBkMnefcsBnLkZKo4ee6iGJv5U
	 sOG3sTPmJLwsbc5RHskRkeNYHQrbXkiokY7JNBYcV4R4qAsGgRicpqWQ21vDeb6KwggwC
	 zD9ZKLO1ncPsBNh14eoM2ebr77GswChsQCMi6W8uRCUJQixST0Bhvjcr1I7kBh+FZc3jx
	 tea15iKUAt6trYHrc/xstF8mO+ulTmsIO7wZ/Vo1OA0mBcvdMo0jXzoUnn5ONdj5ikKbk
	 N1dTxsZuu7NFJM3Ey37hMuE3tBvDHHmV+KauMCCTMiQFB+1c2yoSrD3bvhboMlVsTRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfMg87DP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709A606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C709A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rfMg87DP
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c00c727a21so563742e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683335; cv=none;
        d=google.com; s=arc-20260327;
        b=eXt2rdOJQVAJOwn7gGDy6JrwzZOohMzXn9DxNjnflEScvroV6wI+H/LkWrwaiZi6bT
         qel91mWxn+ikKYcM7NbRMKC9PaKYB1OhH8qdzIPt73P+aA45tz/5zqsWTIuGSxrVQmhl
         91AVElFOGYDnicFNBCuG136luZGx3OGL2WtoGUMfrSPefdSUtp3lmFv0TyUKl6Ompg78
         rDtQxLPIU1HyhCrSetOWHU+Oz7Susz1mo5XzavqeEK9OYEVb9ouU9UBdsVN8mw96IZx5
         il4yDO3IMvPiR8W2UZwASDh74r/9l7qodcFoQQVk/O9U++bU4lSP+vnkpgfCe4mJv8cP
         wJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        fh=EKWIEsQS0cgldkHJ1/oN3EVFD9NKC1DyuJHvNgq6Z6E=;
        b=EAwH+e1KeXIWLOUJM/GzxdcBXPhnePkOTq7pEjKQ28IwHhy9Itkmn8PJU43/+obGxA
         3FqjLnmH+lpvi/hp8keQ+4fTzFm2n0Z3V7ObYV8Bm8/D5OW0iEKqDsNlJYlVRlrH8oQE
         IeIHDrxjiLBWE0RlM9kM0tswVMgiTmdOsBWvQIEx+okxAOVKFoJg3QaMRBy51NpvkFsd
         9LuSVj+tqKVEH1LvfKR3de4YF6dczpSMZqkf+xsQtTWa5biZD2IxLYEpuCaKBGwicg2j
         dEVfEglq9lXi3oZyH9PK0B7l2kaXZRVsS+RTql7rCYUna6lobppOKdcovD+XzNMwceNC
         POpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683335; x=1796288135; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        b=rfMg87DPvIeaAt7WefjGyrL7uSD0uquLqmcawwAuuF0LDc6gm3phN9FgQ1hfcvNK4P
         vZUlpOYWEPZRvkrmo+Mh5OCC14KnFgEHDnbHYBX4t18bjdh2rj5ugU6P0+GkO8jWovOn
         RMvM770R8L//+znfMXxpcv0SQZZi9vdNe75S8ImFMsKJ3Q1QjbmRT2JJOl8FScurQcSB
         0tqg3bunvtmzuZ2dkoxsxh5Ib9cTPnZ3eF/Om7ll6kPxuzPcCWzJbprFtufbqrH4s7/U
         t9YQ1tkr9xcfscV4PTDAcngJBXvdMP87j158ZHdpSixSopf2JQM3kDHgOT41E84eKBAk
         k6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683335; x=1796288135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QKThXZIRAMEkOiH8X0ve/DDQDh2imYfE9WZ4cHyq7O4=;
        b=K+8R2zPUUYhLssfatjmWqaCNFoYNf8uHq7dzbZbnPvjP2oOFhSx+NAY4265vDL5doO
         Mxes8LXAoA/pV7nATW4YGH07POloRzdAff+D7dADDFEz8r+IEeXRuU7L71qZZ+55jNQF
         JaHbrTui9JTpRbNypjR4yloUQ15DMvb4aopOdwu/PjnTYBP0HlSOAgPVFdUVe+CBpOVF
         df3r5ejT2T7PcmRHc1lL47OQFhtWcJ3UCcrVM6oJFct+4suUGtFob0dq1rQWfEpF//Np
         qS4FZXHwrU759ulKk2mhnzy+YS5bZKOG7T//P+rQo9ZGleWq+umHvAIZS3J/ZCqCjkcv
         7ujA==
X-Forwarded-Encrypted: i=1; AL+hErE4XjkT1ysDrENbCL/XSBySduyW4Fq8wB4/nPzOynDRmKgjh1hMAuhLFkMmQbfwyKYhe+MhVynV1Bd2b7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FFYowpkWIpTc9z/Cx9wYNuI2yr/R58wF9olZGQF+BR6IeheP8
	LhA99g2Ed+XTom5MqapnF2atotq78QQxkxsecwQFBJJmbkkR6N/y2vMAm6oL51FhT2tRGvmUigj
	qgXQYwyzJgrxpN5t08EExLquEGSWO3Yo=
X-Gm-Gg: AZFdTZehLDlrASioQq1muOA7VGHWJgQnuvCXR2a66bnR7OQQLwT1qwHNBKhU9qmmHYy
	ANm6yesLfzbK0COJtkPnteINFDCEt+JLb8ckgCLQsa5f+EzkIaSdmBot0yqxmM41jqpXYTYIJhY
	+iwpLeESnrQR5sniJ+WkwMoR3kG4bZ9OVKBnd7dgEbGRmQ6OgnsR+ctighQqJRqHOoIC5IxwrTx
	KaPh+UBsw4jrY/LiyZXj9bAhX+tzRdoXs3XvaOggSM+IrPF68+p5CU2ZM+vGunjd+cQ6ZWM/Wmz
	bTKX5eY1WRKqraiYw5P6oaeHdaYZsRa0YWo7kerrc2edE8IoN4p0IEsXxtNuhADJjJ4pnsgwFVN
	jMTvpzM0X89dPgkD/S2kgx7TvonxVd769KGdfcOB94l6AGuirQhZOF5SorOkuHsbM7Ev6+8s=
X-Received: by 2002:a05:6512:1151:b0:5c0:62:7fc3 with SMTP id
 2adb3069b0e04-5c1bc7ceb5fmr8223250e87.5.1795683334857; Thu, 26 Nov 2026
 00:55:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-1-231196049a3b@gmail.com> <20261123-quirky-scallop-of-beauty-c662b7@quoll>
In-Reply-To: <20261123-quirky-scallop-of-beauty-c662b7@quoll>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 26 Nov 2026 00:55:22 -0800
X-Gm-Features: Aa3M54pFlibDAmDC24529Pztyl31CflHnU5Me60OGDKTLA2a_3s21NJ2pQ1ALv8
Message-ID: <CAEy9hNX-TiThoXZ9+Q7j=bB7PpNBr7Wjz8_sH7C081HXka4xHA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: net: rockchip-dwmac: Allow iommus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-ide@vger.kernel.org, Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Sorry, I missed the report. v2 allows iommus only on the RK3588
compatibles and drops the nested ifs in 3/9. It follows once the
arm-smmu-v3 clocks/resets binding it needs is settled.
