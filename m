Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795610814;
	b=HdU6+3tEU/22w5EEANgNmk29/mMZBN/XWPLwaTzwo1mxt8K36e41+izplUSDLMo2Yuf/
	 BAmOTSVtZQ46lOHPxd+prX80F2rIbMA/1X7nRcaGHR7rXlbtOCeOA0ezS5tJIDTz2aK81
	 63bSiUfANUOCXGXokfvUqg7VNbqQDEJUPLf4yLiG3Xvpj/sesjZhE5c7bJzmjMTDztS/A
	 WyUJ6mKiNna50ECNuURTAEjEBFyBLxKThXX0eKcLcUDLNsXpuMiwBKtO7LcZl4osweNAa
	 Us+gDjdEQDFvYlhXkfQDLbbRK84P6pLaDDcvvlkA88js75OCNU+qmKMJ+JEGp+1dnnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IuRRg7o5Crk5KRLDhtoQ7ekunhWpm8sN3gL4hQuQRLw=;
	b=bmz7oZhM2zuZEDUxsESbkBuOxy4DRaU5D0ro3jLenuIbqZqmOfYNYr6UnuJrtsA47vX5
	 0n43CE+nKAr6yYCG8AtfqOX5rZKECNuBF/hif27xQcJ4H0eHywD5sxsVwQo4X8XiQVgSI
	 P9CGjYf3EOrABahxctiYRn4qSG1fPbnx+9H8f6d//DjYAy83KfJh3551h7Pf6cWAC+/98
	 yaTJkLUk6tZPdTRGkVY0qj6UJNKMEPDU7t1gLvklr4mCZFwW/svbX8Pa8/mT7ZG4osoBl
	 WO62yVNXEeFqe4v/9YKAGFv/rZ6qj9dee8V9DmWMb3FYaUQCakgIfmSZZQGX/n7GOGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUD45U1Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41121606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41121606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUD45U1Y
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1097001066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:46:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795610812; cv=none;
        d=google.com; s=arc-20260327;
        b=EdulFqGURJ2FoaKxbVhnx2DpIKMwJeii3Lbq5QNuvFDbG1cynqu0qack0GvvDfuFB1
         KqnasrhJRPo+YFBC7zqHsCTwIUIUQ+k/7qSejqeg4gib4/Nv0FQ2tTqU2XRDuyAj7xGs
         K5PyfBJ44/0KYzgb0ugO3hG09wtI8413Yoh2mcpgVNed+Sj/qofCMjp2fm5y0fg7v+Je
         sdmzT0Pdo7sGxqMxhsF9CTe81myD5M65qcFq7hjktVqt9/Bu8VGtTVIn6AxknBG3dC5+
         CIyJ1s1bihLKYe+r4J2WZfjXYREb+B+5Zka/QJvx/yrP/fqSiurDsmNJYehSE4SO3IVf
         tjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IuRRg7o5Crk5KRLDhtoQ7ekunhWpm8sN3gL4hQuQRLw=;
        fh=98jJs/r4PEcbW+Ou7ofXmGOAO3nt9vi1rTdC0RELjCc=;
        b=bFqCY0xGjYWqCsDTehJOOPTPPnu2vRbjXtz2qeEoKLFcj84ugVpsMObT0aEzlRG/NK
         Os+xzpaiOf0ELFa5Mmv/9SmLskXOshoJr6ZFt0A1ovThANR+W4C9xXVDmzxocw2y4uCU
         CVuei2OAiwpycad8YIFotw7kmDTWJxzFxs82LlFY9G7ARIVmJKHXkv0SH52bqRoyC0VD
         ggWOIwctBBJ91zCG71cVq1F2N49AP9buMtvLowduWyC8HgfcIINnV9ct4FNurZHGwnQZ
         nNejVOeHCCvs3SL//xjaTx6/BE/SPnz9rowsSAd1VXZLY0ni8dYO3cjjMXnJjjJkWO1q
         vQrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610812; x=1796215612; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IuRRg7o5Crk5KRLDhtoQ7ekunhWpm8sN3gL4hQuQRLw=;
        b=zUD45U1Y0niUTNGvEmVhYstgEHH7eppOuqSCadY4ScIqgRYoS1yZkrGqctAGH1G8o4
         AXsNgp6BaR6xQv/OUt6BDUe2a/VdVjgd6EaFPfM5kOd6mLsrunx9JCcqMbFz2/YF6PuE
         VXaKlhP0eMEA4HfwuVypbNbjEptavv8E9rypjSeB/6dJukgVd41t5Sz/goPlBxWE9fI+
         FR4dJmajJnImrWtNdlMVx+5rXHmshZu2tRwKhtLbyYQMQHI5bDDJTxyI/P1cRavYOLPj
         FKfgedcFIAu69Fl8oNWRx98e3akLQG+xVrgptuVkCqf0ViChAvOmDt7aTfc3dqoq4rwc
         6CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610812; x=1796215612;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IuRRg7o5Crk5KRLDhtoQ7ekunhWpm8sN3gL4hQuQRLw=;
        b=rNVohItubDF01inuZ4cVfY/uBTRJC7+Z+qRMEcx6U3tmsFn+/wVajKZNG1V4RJBROV
         isQ+bmYdpXUCVe9BN2ch17yoX5sAsSrN8Uc51qaFhonBw+OADiUxRmHNtCl4m5NdVy0T
         jIOv4QoIseHqw9No3EBRi1w8rMHGBLS6EfzIJ0AlCu5/pof3fb/bly6ImYf3jtDDG3RL
         7GMOpHlw/bL2Oi85eqdlzOZRmDQNQcU9ps6WGihduYMdPavyAgZrJedU+78CWrR5I1XT
         xAe7bUN5lc2XKQCZ6OpWo64cuAr7nt0FEvL9JW5uShPTtBShNU/uyMLSgfYemYA9BnHB
         uX3Q==
X-Forwarded-Encrypted: i=1; AL+hErHeuOygCWxZd7LBhQrI7pnMVPtQdVxdXsTdtYfWbqwJ9YVwBQNGKrFQRb07pDex9163yiv1PQFK5X/oEmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WbUFB6SiP1vh414wdi3HZSxNYXy6ZLIdjtNvfWhm65puQ13Tz
	b53a7TrvSX85mXCqDOY4xj63q/OqSojWkGxNv+lB+opyHnHLIcyVswm+0byw80gPMr3krU0f+bU
	4lOKlupsPjVchTOqxwQUo4cGkQMntXYA=
X-Gm-Gg: AZFdTZfXH1PKfAEexdQxaMp8wV6CEAxrWkzvnt3mwRyBtdzBMxHDkSXd3PegZW2H0q9
	5xqTXdbqlKDks6pX2naFG/O4ovtLpGaW6FvaK3A/pfHWB35DGy7FB/Xs61wj9ghN8L93838YuY3
	oNAxLf3BXE5cM6PxIejd8Fbq9RD60udwVWpDRchWEQeac9qMln/Lgw8O7+oxWKuWZGc5KzaqGGT
	iVzka5zpg/LcOLV1+HW0Z+MRBhu5X6N7HJ/RBMicwnErVaMMnHtXxpcLpvqHQv0OLb050emVZYr
	I4COXPDzsERuLjXJI20tVWx2PDvSL6YVZ2FwihPyYzci8gQKab2+Q6WhsvNkOFmv8L0AmQ0Typl
	9MgWDnkVjdpzI1eEipQJRk4t5eG6cP6wpywq9SOwjcmr1nrN+IaKoOLFCInVNmpx/a2A=
X-Received: by 2002:a17:907:82a4:b0:c51:37e6:e036 with SMTP id
 a640c23a62f3a-c513a86d2d9mr981007666b.16.1795610812360; Wed, 25 Nov 2026
 04:46:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260514174008.4515-1-ms.bulatov7@gmail.com>
In-Reply-To: <20260514174008.4515-1-ms.bulatov7@gmail.com>
From: =?UTF-8?B?0JzQsNGA0Log0JHRg9C70LDRgtC+0LI=?= <ms.bulatov7@gmail.com>
Date: Wed, 25 Nov 2026 15:46:40 +0300
X-Gm-Features: Aa3M54raFHFC1wO72gQwKLcaw9Cis1_IurPLDhyy4bIilG0T4ZS0DTaSVjpcl5w
Message-ID: <CAEyM3Y1QBGHedKixcW7o+9F=p7wQfDow6p2vzaK3fS4ZWP5Fxg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: handle nouveau_hw_get_clock() return value
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, 
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
Gentle ping on this patch. Please let me know if any changes or further
information are needed.
Thanks,
Mark.


On Thu, 14 May 2026 at 20:41, Bulatov Mark <ms.bulatov7@gmail.com> wrote:
>
> From: Mark Bulatov <ms.bulatov7@gmail.com>
>
> In the nv04_update_arb() function, MClk and NVClk are passed to
> nv04_calc_arb() or nv10_calc_arb(), where they are used as divisors.
> MClk and NVClk are calculated using nouveau_hw_get_clock(), which, via
> nouveau_hw_pllvals_to_clk(), can return 0, resulting in division by 0.
>
> The result of nouveau_hw_get_pllvals() in the nouveau_hw_get_clock()
> function can also return -ENOENT, which is not checked anywhere.
>
> Fix all this by adding a check.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
> Signed-off-by: Mark Bulatov <ms.bulatov7@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> index 1d3542d6006b..2f59b8739fc1 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
> @@ -202,6 +202,9 @@ nv04_update_arb(struct drm_device *dev, int VClk, int bpp,
>         uint32_t cfg1 = nvif_rd32(device, NV04_PFB_CFG1);
>         struct pci_dev *pdev = to_pci_dev(dev->dev);
>
> +       if (MClk <= 0 || NVClk <= 0)
> +               return;
> +
>         sim_data.pclk_khz = VClk;
>         sim_data.mclk_khz = MClk;
>         sim_data.nvclk_khz = NVClk;
> --
> 2.39.5
>
