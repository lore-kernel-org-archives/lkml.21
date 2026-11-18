Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.193
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999454;
	b=k16gb/ljAYI0b7zUk1GZ7PbS9j1UJDbQ4agyn+6BzOVqproUHC1NGNZ//oB1RFGm2rSN
	 a64DPXek6RHrTss4SAczRwJLbaW/yAagWkUfLFkBOccgFeqyHQRR9mFBC5dB5QFDQ7nSY
	 pUwvHX9j5ccQzGXIGjZCthQcTI2TYsvbdVu2v9wmX0h0E71fElIc8AqDlb5OEVQpaGa3B
	 JucES4KdXia2KgbYbY+qQmRai4lt73fajx1ntFAA9vz4EBDZJPQgCnxSHYsvw38L3fYOi
	 DoVdPtg132qCTkrKODfvcY+kmNVKSPP7gjXb5MW5feObCHY9nudLw5x0G6s4IY4PzNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zEcloWoQSOSl7rz692vEiAQjXGZ++rtckC5eyqv8kLk=;
	b=3z8xvqW4rUUeyZutUeFGluLgtcaInMCtFGx+CwnFH+7P244hvrcwmCvp13YyFv0WqhVE
	 LCCGYboAylB1v25fXTtgbF6eM0LvEmZXH0OcHAJhQcilhpyoXJhSvnLfoY3+hzsWzwfwJ
	 SKxVeP2nZeMZXZlNx9KkiA/vOKTSY+xv9Ekgmkqpfb//uLUB/le/G0289VI7LPLWOE8Vs
	 Ic6Gf2K8Qji/kAi5uOPeGrOsJOECfFuDU7r7yAIEu4RKvQv5EAWBoYF26IiQhcJ3bRL9p
	 c0QY7KC06cwUO8aw0O3SF/LKTWSIO56ATkokHt08puR4Wf8R8SeXKQk0ScRf2cCMoRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCiX+gda;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.193
Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A824606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A824606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCiX+gda
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-539d2baa897so191738b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794999453; cv=none;
        d=google.com; s=arc-20260327;
        b=TJtce3/JjZ+CdWpN2IoZ5iesibvXKS8bC/yfKUm3G1KK+6zX4SYD3wiJdefLNUB+D1
         oOAPKCfXkMLtnZNK3YbKSU6uCmjm3agtrU5OwAoHPD3Fb19bVg5I96ZfntmeckBXuzFV
         p0Rgbes7J3+6RN6oNlJTURmDvPAs5og25BH8CErOZ36ZCVZeRWRoF6MYVP5ikNT6wcRj
         q4xh4wlDF8xgdhCLRar26fKoIz6txLhY96dhOY4hvts4kJkZsw1VM4yGSSdI3CO6yM/G
         Da58jsD/ibviem/xBc63fpX+UzETPw05lqv9CZk0dmzRjGEjuTAr/pRXARSI5u5OTja+
         cofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=zEcloWoQSOSl7rz692vEiAQjXGZ++rtckC5eyqv8kLk=;
        fh=l8QNBItfxWpz7SGSy+ip76JZ5ZFyQ69MTXR7DKSnXx4=;
        b=oDHRICRtnyj9os35ux+H2ADOO6NltOA3dxITB8jKTC3sml5PAVZUFp38VlfqHEbZWI
         4kUgfgRmOm1zEisFrE7Hidee4sz7pmUUOx2ELlb4ScBzwr2R1T5quOPLMKD7IzjPaWC1
         Fr4hb+mfDeRaalvvl0FV9w5b0/VokWLC8qtGo9QPwSmjBjFG5l86/XH60wIAt0gChkRn
         6aDFR0SI/74hR0eCzzYnw+OEm1YZY/rI6jEF8FeHz2lv6GztmEZydxPM+d7RFS1VGoIj
         lEmw3lMil8UnxkZTVYvbXDxn4BiGA69FBpji/Dxd9aDlAEl9jfZo+P/MI0fqO86VSo8M
         Q1yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999453; x=1795604253; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEcloWoQSOSl7rz692vEiAQjXGZ++rtckC5eyqv8kLk=;
        b=SCiX+gdagQMSb6XvZ8933xAebg6muvz2hl4ihZ1YmtXJlKP2Pjy75qs9nO1o8P49OY
         GsKDyZmZAc0MA+10LRyLfBgP1P4LIFNboEbFmxGF0+wCArYLoyE81LzGZJ7LbrhnaKKC
         hXCH9hiaqkl9mxkSTrP9504lLu4Yx2VNZ6b276/xQjPEAEdEhvh8Y7ndMn3sb48uFGEU
         47euiz1wkzO1kfAm8PPjHbUjk+GmsY9Z+Y2r0GTqmdKxjtoKlLgcyVYcyTdFNIDbLipZ
         TxkaYrS05NUaSCMgACItdzYnDrEq2XccfhHQ+bKG/s695Df6wOGGquvh1KS8fGu/Be7x
         rnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999453; x=1795604253;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEcloWoQSOSl7rz692vEiAQjXGZ++rtckC5eyqv8kLk=;
        b=23BngIYeMfYt4k2IUv6IaED0LkHbkwH6oztOWSpUQSi0//SxA73E+J5qP4hPNWqspb
         6Us1aTgZeHELZzm4VpasZTg+v66PDBzvPl542TUUgYqhPLwd8zNtAwa5mypgGIcSKsvv
         m136zTaT9eqNo+fG9vi+YCga6kjh9DvdtZJzIRGDdcIILraRKimPh0N9wDaAtEs3uiVq
         SYxQtoDfOWdCr2AyEW8No9lVk6CM3reW2+ZkvThW/ivIWkMsOPy7sUV/6ybvDvcjlET4
         7AevfzZJ2Pp/0fsG8kR1jimPQSXJxlH5v92USp7h74fQa4NiuzD8KVdBH6mYlFNmw46K
         ZLYw==
X-Forwarded-Encrypted: i=1; AL+hErHrexGF9f3KHtSJ5yDuZi2R/OmOYCzh37npxHbhg0pYx/q1h9Klj0g7fUe+H5X3QDGFDlWEUacvDl+XdSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PaSB4Ssfo8XGgnwwIPQJdQ3uNQzfiyaZ9ciDAGHTCHY2njJR/
	WjGo39ROCCwf5yPBESZHHyxueL1uY/ypMoUATd5MhHORhbvbaUmvAPJ29PmX16OV/d/XvnXUSjS
	ypO/AXOKtYOS6SvQm89kBg6xQ0hLcNPU=
X-Gm-Gg: AYBFou3j5Fq7jk2wk9eDJdTwdeN+MQv3mHiaa9nemGDMcIQwsG+tLc0+DbijVWvJ1Lm
	SbxCTMo9a0MvBSln+jl9P6pdywPthvxwaiw2vJSghhlYoNahl3TbdUfunt2YlOoo9Mx35RBF5am
	3InKPPxy4XPnZK5sXnKwv5w14wXlxAXFB2yVGaZdT3OQ9SksgFshrjww4HSp9e1WvCAojbRmGne
	m1DB4VvOv5Wa9V/qGDLFbRgdpjpr4o/vQ4ao2UOF6aNgAQYxpJUUv056/czTtfaCl+nAjssst19
	X10eZx0umAb4yclBXKac6xgW6Cr1ZWN3bTtj1XxtGhQuZ8MZ553QLNhMz5yT8AxSwacPtiI0lk1
	c+JfX0Xtq/0TY8eMfm8g0Gccv01oxTOG26d8/rQ==
X-Received: by 2002:a05:6808:1385:b0:4f4:f5b9:8c74 with SMTP id
 5614622812f47-57736f96840mr2811966b6e.0.1794999452991; Wed, 18 Nov 2026
 02:57:32 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:57:32 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kimberly Morris <gy770616@gmail.com>
In-Reply-To: <179499832232.3291.8192759477709019638@kernel.org>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
 <179499832232.3291.8192759477709019638@kernel.org>
Date: Wed, 18 Nov 2026 05:57:32 -0500
X-Gm-Features: AclHuK8muBKj1nIv2D6vArXPRtf9o__0MzrQcXww4sWxtk4rC_y30JUhZOF10Ao
Message-ID: <CAD-64Dee2PZpdOshS-TdjXRsGKxV-nw7ppvBzDtpePLJZnyHiA@mail.gmail.com>
Subject: Re: [PATCH net 0/2] net: phy: fix timestamping lifetime after probe failure
To: netdev-bot+sinfo@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	richardcochran@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.

The issue was found during a targeted source audit of PHY hardware
timestamping lifetime and probe-error paths. The source audit was assisted
by an LLM; it was not a production report or a syzbot finding.

The resulting hypothesis was then validated against the current Linux
source with a focused KUnit/KASAN reproducer. The test registers a real
mii_bus, phy_device and phy_driver, follows phylib's probe failure and the
driver core's devres cleanup, attaches the generic PHY driver, and calls
skb_defer_rx_timestamp() with a non-PTP skb. KASAN reported the
use-after-free before the fix, and the same test passed after the fix.

The concrete BCM54210E/BCM54213PE publication-before-failure ordering and
the missing PHC cleanup were also checked directly in the driver source.
No physical hardware reproduction has been completed.

On Wed, 18 Nov 2026 10:38:42 +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
