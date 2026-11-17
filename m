Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937825;
	b=4IdCWArLoNtBgIKJOIU2CLJs4SvGO6R27PVi5V1IE3doT7cv4bvBOzf6P6eMmRrPjBDP
	 xFym30sIcXFwWK4QKJ29iQAHRgL0McHw5umqeSMLej0f2gqURA6kCc77LZi6np9DaJFJT
	 2u6OVRJ6MGie/YG/Se7bRmpAzP4WDnHMirgWE4gPh1mciXL8LwkEvv/jbeb/2U+tM4miB
	 YWwUGadH841HMeBS0/sXm2/s3icRC/HdGcpEFF6hH6XzC2N9ftGjknxuSzKr+kY4LmvCD
	 32vHX1QCh+amqFlS4Gdo7Z12QkZZDarlfkkWW0MYWibf5nDDKzAQYgI9BO9IGoS+xfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
	b=tfS+EUXA4Kz1uSKCwXT7gcPIliT6AMdCA00BEklpGOPuCFeJ755za/oGt+qF7M9JDQem
	 u6HKBjxXOpvmcp6vsIQw7Ln2miCM7+9cz91Lr9QGh1ENfk1NUmJSFPe37/SSF4oPDhcb2
	 Qzpmh69AmCgNmTm9H1xlRt5F1L3X4xKn42auc5KWcV9iGll5gQzVGsUZgb4E/fxnU+j2P
	 IaSxYmOUa6egdgTbhPwaJrNA4QMa6PGm8RKTanDQ6yuuH7aJhljaClOHV9ZzQtupQPyS+
	 ZiDBAAVmrUmZZqeYMJic5SytcI5815YXCaUM6+1SwV9vkkpCLyA3UMzIhI9g6CJFegg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyvFBtYw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A96606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyvFBtYw
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4cc793704so24769067b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937824; cv=none;
        d=google.com; s=arc-20260327;
        b=sNrsNIbeojWN1tChqt9CQk1FHD3UfzLik2qsD0SOCoLzEejOYbl7G84idseH4xvGUF
         OqpzCZDkWjdeZfsZsumhmI1Xa0upfGCHHS3VVCflxsczVBj02lqNINl+Vs05+PxxLWw/
         +9a9jIt/sEdJpIlma+fTSWXnbyUSNYz5Pbpjmss7fmcKnAIAg0s3/N+UutV30DSBiV0+
         L701+dw033UOL8jb4hTbb4PrcYLkqq3cOFNsWPnd3dtzVX6EUJTpOj47AA346l/rBFdf
         wMn4/MPGzjOInkgVX3X6SxkJavwODPY3mdh0cqdGoYA0t5RAvJPXg5LFz/B5AF1VBH5G
         eElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        fh=EWMZXYEyD96hVJJrZTUDk0yrpb0AUCI+yxHlRIlr0cg=;
        b=It6DzL8Xs6KjR+XhjIpQL9b2fRx9/BV8SZbwKWGfQKVhADoUVTHg/ImkaR/lRwV+F2
         nPfQdluoXIl7Rqb790a0pZFcqPcnZX+/HOwzSJFPjPUv6x1b4bFHc3fayRiRe9UoaMQf
         XqQHhcDUeezcCbSMYMRAJzbeSQuy5PIP5jpA6EMpZJvrnXJiSxh+GXDwBWHabtKHGRpI
         9agEhamLgDVHQRMnVLtROVtnuBqEyhGHIU2jASUMUYBKFGF4XIuHSiDMwL5hLCxUbU0o
         p67ZbQmskE/KPIEPPB4rCVsOt1+I+u+UPxhYOXBQi4Mf9ZKxD8K3hFI7Z1bjhj0/4o+P
         6iWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937824; x=1795542624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        b=XyvFBtYwfwl70PFylqvsEnpy5PTrdD+sPB6f1H6T2mnCXjT4L6Zy654U/PNxg3T0Jb
         2aIfIjtp/nfS3DrA7hDB6I4Kw02Iu4EzLhiT/JkWHq8T6XrLaJPOtUN9hIWFsRgOlr5n
         WlOQKBYBl8JYttiMmvYRpTj3NwYv2Oh23gPD5W0iAKV9hdSlofdGuFVJIDQ6cM88Mxqc
         oWfytNvze7QJkyoJ7mSwoli5wu8xKlBm0YbSD2kM2n8kiGzOIZXNtdqCwNFRv/5aqQTU
         bseO0k3gWygiYwZt0KWKosh/tqXj401ZlJnAjPCUQUdVg6zRiiQMNqnK8tmoHEfiswTd
         9Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937824; x=1795542624;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0z/Im30AFHM2eAi9Tnr3FY66+g/q3NA8hwNcbiYP2mc=;
        b=NA4pm7MruRIM0+T+HT6iC4bKx86YW6EVZdV7VN7ziyXT1VIK1QtVLrkFJpFxVeQ6nT
         2bSDE/HdqCMGs7QHCImBysw/Xwslyyb7Zbz+V5VD5veXjqURodBeY/JygJneM4S9SvL2
         muz4n4s1dp4S2Rar32ZF56Lp3CvGhEUmmCXOwJenyCide4tt1+yvVGnFz/kJ1HSX/J32
         Sw/cU62fghjq9UWpXtGpqY1hkpYQBKqD4rlqawciafEapJuPpIsvkjqDOCsFwTtFWmXY
         f8IbNvR2pVIPBCsujAqstaDzZI0GO3FmmNJGPC2yUxiMqQ+bDaFpNB19oKm9zK1/F2Qt
         BjhA==
X-Forwarded-Encrypted: i=1; AL+hErFIC9rhxyW2Cmx/LR5NQB74zkYhkgIstIiexTL+8kVIMh04VQs45YU14elaSL4ejoOz6W6CmG2CisZUl5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FHezeElIMgeSUPK2JJz5mqTNhgvv4FF09Ryg9O+Od+KwU7UmM
	h/MHUwp1P8de/HgWC58tL5MUkZ0pJiccs1T9/Vl/+AKY9jANa/f/0O14rLXAIJAFZLikHLH36x6
	NKatCMbQG8/EWyNJ18tHC3I8ttCywzag=
X-Gm-Gg: AZFdTZcjUBjvIei42rbbi0gOw0bHhg9oGl2bodrjXE6NhuoWb4sqpeD119dBaOaZdmm
	bhO95AZMpAKHsnNwfxQEpWTBOm14+gIdTTMCZbt9zWHFEDrqq1jNtTB0n4JwQgR0iya/uAOLJhI
	p7oe10U09NVvxGQWZO7Pzv86C4Vj+Plo8qO1rH/wVRFZ1Q4oIHlhBoZAlPminHk4KcrDHJgM/rC
	TIkXW3i7WwDgQZlZmbn7RK6sFmCOw0cvPVj14OERIZDD5TrWnY2MCJmTqMZyFZn79SQNKS7G/sE
	y60/9zRt0kupGgWFCirEDfGNUQlVV/K/lUw8a7YMH+1EFXcrOQuurdqcPODEpoeHMPyRsC4H0hz
	VA6tDvj7goEpnLc0EFSGhzrOGQyHVVzOlTSe1Inv0w0hZSQ22IQKzpC4WJADooKNj0vAxdHw=
X-Received: by 2002:a05:690e:4196:b0:67d:ae02:4603 with SMTP id
 956f58d0204a3-67dd3fc2a51mr113492d50.90.1794937823656; Tue, 17 Nov 2026
 09:50:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-3-volodymyrchapman@gmail.com> <avwk93N8D7AYGzDX@ashevche-desk.local>
In-Reply-To: <avwk93N8D7AYGzDX@ashevche-desk.local>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Tue, 17 Nov 2026 17:50:12 +0000
X-Gm-Features: Aa3M54rRQ1-bLYzTuwIPPkNUo0RYfScU4jd-nC1VUspHbX57A9OiM6Umcza7INE
Message-ID: <CAN1s30pEE5vN7Yuz9Y5_+4M6-TeTNTmHA_hYLR9KLnXj05RWfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the review.

> Enough to mention this in the cover letter message.

> This paragraph needs to be once in a cover letter, no need to have it in the
> individual commit messages.

OK, in V2 the testing details and the AI assistance note will be in the
cover letter only.

> Since the ACPI HID here is broken (it's actually a PNP ID), can you also
> provide (as a comment) the excerpt from DSDT to show that device description?

Of course. From the ThinkPad 10 (20C3, BIOS GWET50WW 1.50) DSDT:

Device (CAM1)
{
Name (_ADR, Zero)
Name (_HID, "INTCF1A")
Name (_CID, "INTCF1A")
Name (_SUB, "221B17AA")
Name (_DDN, "Sony IMX175")
Name (_UID, One)
...

I will add that as a comment above the INTCF1A entry. Should the same
comment go to the INTCF1A entry in atomisp_csi2_bridge.c (patch 3/3)?

Thanks,
Volodymyr
