Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795220489;
	b=5UqOJe6Bsz0OwZhLYlak1kDgGFAEC6WLhFS1W48yL/5OIV0djvYiRQZHwAD835rO01la
	 A0693qlEGAA2U7XRzxgbzE29eGRuKB9N6vJLVs7GmJENbSChoz1Y1myEslsQsuAxNUK6s
	 S4Y6BcfEfsNZLWl1xqAiBvjUBIG20ICQUWLOBLV/qgfPS8xSOSb6lgmTdX0e4aXeAGP/L
	 DonhnNGMWBuM7eiWiUNH1cFfJxNs3b9Jrd6d0ZSgWaMmI/9f2RBykre267qyxZyXGVS72
	 LMmCp40FZ17NM6jgsKvJlyirzVKgXa6tRXFRjJtKkt/LINBYusUGFheWdL47d7BK4hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LYqdc75BT1lTbF77dS8F5BOtPhAT/8YInZ5Fdxp9xiA=;
	b=efz64Mp+78vBJMtzjEd11FzXmD3Rm5WqiNDNNN+pvz3UTiZcVUK7BDhwzFU1kShupQ45
	 Fjothc760J6Nuer/IsOsLBNwiz3ioIE7Suggpi2t1blWf+4Lv3GkrTYiD4XkJzqS2SKYE
	 CKgjeXGAc18NNFqlE5awv+bRscuCGmTag0RkNPUn5nxD8rvAOcohfV/zROoe4FIXKjHh0
	 7uFmsN2LM/J4yybYx08yAgGrTJtIjn5HyoEoxPjXVBigmHyT0ObNc3N2M7S395k4uJaEy
	 uQnFac8RZcbAgH+5IMJyRsR2tFKL3WiSLTLuC9z969VdO4skDSU9dNegPfClTCM0vPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYO2HNiW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F963606A697
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F963606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TYO2HNiW
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2300715a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795220487; cv=none;
        d=google.com; s=arc-20260327;
        b=KGQy+tIOfZ3AiW6vA4O/JwBT91neix+L/qysUrUjyr1noeaKkgW/DY9D2Qyn02bcRT
         lO/hHORop3h2riaNk6hxP1N3KwneqrrnWeORFjyCd8bp4r7NyidfvP7DN/J4PQGQJIBj
         8HpmiVNTEq1T4NubnLpb4L7HFcLwQtXMfJHj75GqYl6cyavQmjIPUEi115NC2Cu9Sh7d
         md51z05b9m9OVZ+sWK2BjIuTIoWV/PT+tU83Fvv/KTL8abQcWYnOHOm56iOOTxxWWrU2
         EjgzBz18zwzRUSS5fqn1zq1aXv5byK4IL9J3+xWgL79Zl3B8Vik3o25SQ35szB4O3+30
         Sq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LYqdc75BT1lTbF77dS8F5BOtPhAT/8YInZ5Fdxp9xiA=;
        fh=KJ2xgzwvlPsSfUJI6Mm/k0aJgQnNYIkG6/dWYyvBz3k=;
        b=QF3pf7hc7jiT1ZpKnt9OqKh28DXUNMPVltZRefHopVw4td/YmkyDNWvDZhk3T1bvAO
         F5APCrdHOYQScgoDXiRuZw2fpwpWkdhYigMv/JzAOkYf6dBAkTzptpmloEPGLxd3tV+B
         V9mbiKa0cOmcB0BIEY+HkjppA8XLv7UX97n5x2+HjBRu03UiWJ3x9mCpSXpazw2weM1i
         Bns367bsZOPK4oyPUtIzo2wSyOuzmvKo1co6T9L/ZgfFUd6E0cnFVgM2qzx2dhvZS7a+
         B2aAhdbIP+JxaWiht4dxciwc4BIQPSlLrROxmfMorzaWHjTtdDpwaZT7VDF/RCbvg2/S
         YYwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220487; x=1795825287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYqdc75BT1lTbF77dS8F5BOtPhAT/8YInZ5Fdxp9xiA=;
        b=TYO2HNiWuepoW06nbobCJniMr/SVwOjbrEILFva6FDPxxhWfo2p0OmFN9HppetgWbi
         Bj1zkKw7O9INM/eATtfbluu0xl7N9u09LRV/PSA6dCUwoiWn7PS/B4UTcZeup9RpZc5h
         j6ACF1yON49//HU4v8fJgKTI7t7IhUITfoZR4VcvG6Oe+LJN5R0e4F1xouCks9eZk+3Y
         60q+kRIgUQl/TRxACjaDSBGwJGpQYtrCIB3l+a23mbf/UuP0deRMQSj/errX4BXv/cM+
         KhD6iJFtv7+780BgQ5a5p6GuSuJJG7gEDMdIikmmPxQieFKLQ/rQzu8TUzSkCIwjMqo6
         1Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220487; x=1795825287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYqdc75BT1lTbF77dS8F5BOtPhAT/8YInZ5Fdxp9xiA=;
        b=q6Gz6w04rRHoA6+7VxKpR0Fgbi/08zxY5gdALMvolXBVYEjsv+/xx4vE1rPnpubVa2
         phHttYghI+xK5n+cJ1FCg6OhjuHDQBysJfQsQqWaXZoU4mKoMG1/hTTp+wmiM+44jn72
         m+83yYhJVpRBpsYzycMg4v4SFJ+QrweUJhwVlN+ItXLuhgEFUTLSY2Budw8rXSnvel3q
         ZiHGsYWbx37uGgaDgV4mHd86nr/UzSnEsqR0hiJXzS9MjGc1l5iEd5KgaYDY4XRkpNYC
         2y8s5NXfCfnitJsfekY2fD6jZC+1xPH3xUSPDpfXSKU3SL33qd4qGDSr6T03LpOonsqw
         E2mA==
X-Forwarded-Encrypted: i=1; AL+hErF8PZJQ8iawlhQ0xmRV5XtGJh6O6VQV5WxIiwkGjc8oefz35t7fV55tx5EnJsx2AqubLgoc78brCRbDs6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hbmkfjA4ujcKX0Zk0x2sF9GBeGNNN+fUBDPUatjV5vcoWhedp
	P6yEpEGYCgMMj3QB8P9t6oOKA8rkDHKbHHogLrAO6YZymiZnwFD3pjenIL0hPY2jwg6L/F3jay4
	iLm9clbiolUWScYrPwAwKjejnk6aMgM91ng==
X-Gm-Gg: AZFdTZehoeDR9aOu2vy2v8cqabFYqDr0j0hHXV4zb5tQqN9pVtDSnc8apFUvaWF6mIi
	/HDG8YDz/hFz0Eu8DSBsyGHLy8ZL8nUdejITMaA6GqhlH9eA0hfzyNYn2IaAFuFkzXFq8h9arj5
	zSLbfPgjDH78fXKI8TmZwGi5x67PBGmkk77T+R0FGft67XhHjBps+Ru3UbCfe/3vStA/yf42IW2
	NhXFYwCVmhMZC1odd12lnn+QfkInYbBS5ErcUysEu4p11SVWx2VrL9xQ6WjfG43SM9BAEbK1nWg
	ZcMEDqSQddrOXmKLFHFh3O0du1wsX8U9xMdrd/XToJsZRuKjWSFwb47cT7MdtD5xn68cojgDst/
	LCfyDmoNItq+S1LaYHo9s2ONDMMrLzFWTAyrAbXZ12em//ojRU4dj25VX1jMcvvpffxc8Gg2tn/
	v/J2jJ4Rsk1IQlDD9hcR3a270UEWqptTuFWYiQxANJ6obbKmsA9bcPkbY5wzNcQuRRc8b7NMkPK
	49coTA2e14wi5iSM18K9REd2GJ0NT2aoInpa6kcKW3MhT4sNw==
X-Received: by 2002:a05:6402:280e:b0:6b5:875a:c2a0 with SMTP id
 4fb4d7f45d1cf-6ba37d4d344mr3340540a12.24.1795220486608; Fri, 20 Nov 2026
 16:21:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260917232930.128927-1-rosenp@gmail.com> <awAQMEu_OULFyBpl@parshuram>
In-Reply-To: <awAQMEu_OULFyBpl@parshuram>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Nov 2026 16:21:14 -0800
X-Gm-Features: Aa3M54oEXJbT4boYUjqj_4oeLXlapmGV48mqldJNJIbz8dYcbx4pMjtMHhUbgoA
Message-ID: <CAKxU2N_5+V7QsnDoAHTt_F5_MhXTTKn2t07zpGAuuy5U64SFPA@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: ste_dma40: allow COMPILE_TEST
To: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:17=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 17-09-26, 16:29, Rosen Penev wrote:
> > The driver only uses portable kernel APIs and AMBA bit-field macros fro=
m
> > <linux/amba/bus.h>. Allow building on other architectures via
> > COMPILE_TEST for wider compile coverage.
> >
> > Also add missing HAS_IOMEM as COMPILE_TEST also enables configs that
> > don't necessarily have it.
>
> Have you tested and verified that it builds on diff archs?
yes
>
> --
> ~Vinod
