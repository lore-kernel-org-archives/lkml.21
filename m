Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220194;
	b=cxzXJst4fhP6hpE5F4EAVVxA8MeEd7iAtwWOKrej9LO4+sqQKoktvCAggzadDBLzHUVz
	 /E95yfErUzN8w4fSD7trJNdSiXnF0QUWLHhB3Iq7Pq0uZERu8LLV2G+RHnLZNmKbQGPtU
	 htirYv28MQTlxm6hjVtftL4yBG0cYp6j+ypJqHRvn9LuE+IyjkMVNxHwPYc5QretTjzY2
	 MovgT+Vq4fzm1f8aaCvhCeP+xO86VzOSV96T0zKAR9DrFZsfJ36JDOq1MfT9p3Qs/70Pp
	 b6i9yymaAP5Xm6upYy7Izbfl09227OAvEVsdAOXut5YKbYjHEfwmXNQTD7VZuRCJO7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=;
	b=r2D268eFKMLMNRw+pDwHtBsX/thOzjxs9BfPzo2fZiYzOWxDmkh1ndhhkx1FByygWGiK
	 1ZSgrecAJva2UcR0TvsmVkdDfiKVgAhDTbm61mpkhVZNxYnGOokIIiXfIv4OW709751aG
	 ZtKpPzpdYXMxudjcNxCTNq4cACGoir6ceBus30vAe1YU8YVikB3MLnbznR8qVWFECUSH0
	 X+ra+rMftEosRMBCai3ZMi7/Gz2qZWPbvfeoGgrJDvgMNc+G//uF1CgpaQ09KB7JBukJY
	 wuPsRVa69U4LyeFrT7CeLyNnVU7eyFtQIda18uy/e48hunPucqaVlfkmKPnI5AQ9vPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsEY7aZL;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21028606A6AB
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21028606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsEY7aZL
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so255680166b.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220190; x=1795824990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=;
        b=vsEY7aZLbfG4aR+YOrrvDrHTqcmqaMe2zCRckmgtEst56/mRWDnX9GixIyJYZZ81ll
         wZoTufJSdYzFDGoaugULowvXnK6Kuw79k7WM94qssKr7pGgNgl13bcYrC2tK93dBZFr4
         cVCTTmnWeqAJc1sM7zirDtOnNI8x4yrWuiyVS0zyB9g8uHd1EIaK0DFt+w7Ztbb1fOD1
         X4anmSGfTJzXyxUTxIn0dGE6/xG6IcdVcTq4Vzs6aWnVV3C1ll4FKG5BIvREQK7X77SW
         Isdt0xmMU0BeZBshzkWVpeRBlY40dzKEE5qWfzTPmL3eKO96E/mIPwta/RvW83VYCySG
         DVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220190; x=1795824990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=;
        b=RCNxOMYLkitI5wdTM8uhDcUkVtvDQKVke+B6zvU+sciHFwyuOt+9DOXZ1prbNY4UYq
         3l/QgpvuGUoouoctVIk+hZQ3enGBaTURL3jQn/YPohzmL8anuM7b9L8Lz2cXiO0za3HU
         T9FtSdJV54uNR7Jo8fWizzzggFEP28H1zsDLdN4RljeoSTZwRIAr/Uk3CdT/pdr3rgEF
         Fd01Ek8Verj2LleIi4Cqu7hRCQ02rbO+0pANrgDZRfsWrpdHFB+BovO+bR0ZjipekuTY
         BDdR/g7oahjpXlPx5DAoe42Pl2GxFxAQ9HYp+BHOysh1K1dIzurqBdSV29/n39ZSo9wX
         pz3A==
X-Forwarded-Encrypted: i=1; AL+hErEOM4Yh+qMtzkN49VU+uZy0/eNhgGRVOy/musKSjpHEEFxBaQov7+0wXPbuCt0QPON6pIs8bconxWuMzik=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hMgSH4eF/AQMfrhPDgX6Vb7o92GMK56gT0rvzCDWeB3p92pQ0
	Z7uyj4038gueJseucYVjg9ew2VasdYVSw2dUgP4wzjX5QCnpM6VxEqQ=
X-Gm-Gg: AZFdTZfJ2EUxecTCQIeBmywtcn5nc+4ayQXYuULAbj015NBqcg48CuapK1dZm+GQK5t
	0tsB/mcQTJ2FgPVE5IfyRkdiwrpYyggxWykFuEaguTk0MbAPmGTFvj+S++Lcz1HWFJFqies+B6l
	F42wy3fD9hNz22m6MJB9+d6lOIMllIGuDcxrQyf0WD1uQLzm/5Ys7UjZfgT0/9eQoNzsbT2zVz0
	hy4NonOen5I15XLywYNdlbJBW9+EHeTkcHYoCL7+yrF9fv+fJFZ5dzbMZkBm29TEGWhR7+doWCH
	s8IziCYhnRxTbvmNV7AiyKr6I3BWIEKS1+Yy3TA0KThSJ9S2BizALElkPAuMxd+zY6vkDQ2MSrn
	djQwWG42OlnHZFSgriQx6FyzZqK7TzgQZ1y38Js7pbhnt9p8m9wK71s41ORkRIdzs/4TIziYIqn
	UEyPHVhatAmKhSOaAn5oLihocsO529JwHDcaUWvNamXJU123jc/Trsvnk6OIxoWRRa4ylBJ5fJV
	Rx+geIdS87e5t/SP+JKd2BbYl1xZKUfJ5U1pgb9/9GKZy+Hw4Bqo/YmR5qxGu1w2IgdCCguMidZ
	yiCEzQOzR2iwvjUclPT6LJs0f89rVSyRMikyCcOWDM89CfYV2w6+JATxNsN8REgkODtBaNFsSAd
	XqPicFkvZesfgWZzZCZ7zWVUoZgi3IluuQfN9h3TODi2VpA==
X-Received: by 2002:a17:907:ea94:b0:c50:aa10:d888 with SMTP id a640c23a62f3a-c513acab9d6mr426725766b.40.1795220190364;
        Fri, 20 Nov 2026 16:16:30 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6663esm146454466b.21.2026.11.20.16.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:16:29 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Nizat Mikayilli <nacht@dxdmail.cc>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM8550 MDSS compatible
Date: Sat, 21 Nov 2026 01:16:27 +0100
Message-ID: <20261121001627.4091340-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
References: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nizat,

On Sat, 07 Nov 2026 21:00:50 +0100, Nizat Mikayilli wrote:
> Add the SM8550 MDSS compatible to the clients list, as it also needs an
> identity domain at boot. Otherwise the scanout of the bootloader's
> splash screen causes unhandled context faults and the screen goes
> black.

Same on a OnePlus 11 (SM8550), booted from the bootloader's splash on
next-20261120: without this patch there are ten unhandled context faults
from the MDSS stream (SID 0x1c00) at addresses inside the splash buffer
before msm takes over; with it there are none, and the panel comes up
normally.

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # OnePlus 11

Thanks,
Majid
