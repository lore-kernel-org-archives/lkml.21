Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396676;
	b=t0Hes+EHwqL3MbQIu6J2W94YtwGFhqzE+wA6aLjkt6VhPf2PUKsS8unmOtnQhGQUHRbs
	 VR2Opjf5fE+zlTxAVdecZ2El02OP6dCL2DPZXF8mGNGV5KlCdHdRt/GCqVmS5j6nFM4tu
	 trmVZZ76PQFoVPLL/ouJfexJUzIYTdakMaXBUWWkeCD/OxhzmlUengxzzY2dot81/74Yz
	 A7A0d9YjP3RrAtSIaIrsRL5osoW9m1x/tQ+fOiYVa3VfUNjQA50w8R+MhylZQv2cxMdoL
	 F2mNatfiY5imQvjQ5ayorfQWwMVxbM2djvFm+v615K4mxCeuSnk87Y5jbRZOUUDOjmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
	b=cO6AMbeO3jcGKyrgIyapg7xeGRd9TrRWYvpJwsvN36TCLdnLJModziLWlBL2bSFHEWJ/
	 hyFWt6jHO9/zS6mFC8KwB71o3yrImxDOywR7echBv1Ah4mBY+N1C2b/cUmQAPTgAJOSJp
	 xoD6rTYzQslKh8gSYui89hgv1IuYy+abmFobLEXPNL1QsObVgWnx9kmXHplNmZJxVn0PR
	 9eR08qdSkgSfhtbEEKHmW+n39i9qDsi7eriaesjxMFO2rUGPNvHzw60BjY8wAC6rEW+tx
	 Ff8QgQMuXjk7DbxfMLHTgMpAWA2gVRViAEHl2z1C6EwS/de5DWnhqxfjfpDJSTnjTRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hi7vStgI;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EC5606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EC5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hi7vStgI
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f05b465cd1so9534975ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396675; x=1796001475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
        b=hi7vStgIIe4B+gfGYSP8SoSNKdEE4d4Np25Nrok5C2RfOboJ1WaLpY8IbrcIwIqLtt
         qb+JqEz5yxJbJZr7Ie/G2PWO0DxigjDBInpcPwt28Ktz1HApEwYPEbaxxIEl0SW6lM3C
         P2bxTepK8oJlptjbCcGa7x7M7tqQiivhhHsUq+6pR3wi8bBEeB9Z5S0Yf1Rny+ny8Cb8
         +pbHDjrFtd4aWoPYLDnYmdO2r4GvnTqnWu8nCO7tY+5lkhU+PyAd6IPfNYpPLNHfMNZZ
         /qdFt/EOktxgGfAiLwefW8aiAhPKoNDM2Vb7wR3eeRwH3HHTCvblB1orXvPn0pduJxY0
         DamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396675; x=1796001475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
        b=c9GVNm4McWfRgKngasHuKkqppAH4SvHIDOLI8kTx7YO6Tbs3r73ORdcA6++GruO3ld
         UuXed8AHiIBOEoAFgYULn8l7NL6rlIwSHuGNAam6G4gGwbQoOahnMbMezj9RAtKcr2R/
         mSWMCUQ7d/q/ApPLmy3XOWd5jmWynme4kMDU6rEai+T6shdK2SdBSD2NLcQVmmabH98A
         h/Xhux1HQwpFL/EHQYxEeI/gUX/14Gm/w8wejAWKlUO0tfdPcMKRIxDugqRbuwRy0ZN9
         hXKqq5DXJu+8PwdDiZLksXbdtTGJZDRxQyMTIcnjaZlX3g72UX5SjKS7RmhyFR4vlJPP
         QblA==
X-Forwarded-Encrypted: i=1; AL+hErEofGOLmy3YCPmgzk4IGEZHXfX1N7Y1dGtqBI1SlQpRotivKHk/+KnYpt0rEw9TD8alOEuCYY/nhAeTZCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lLdJwm4iMqoP0yPrRhbFaSYdhTpMmUmUqizBvK2lKlcnWzKBH
	USGtGimojoyCS45q/c3hZ14RCvc42v3sBQhjoN+JYhyJPXcunNhrDiQ//LZzUt9ULyg=
X-Gm-Gg: AZFdTZcgqkPKtIkAQc1EiTEqS0zvYb0uAW/wblpZiICQ461q5uwrc0P+dwj6Fqnmz5f
	iNoNbKS4KXUmwRvG6n/miuJM0Ga3FN7XIiLqX9jxXNCsYsDq985GS+hqS36naYcTTzpjm90K0lV
	8PuVwgJjnOVewoCLU0jBrtP/0MctD3p0xY8qPu1sNg3e0A3U3J+EnLaWfJ32iW88jtPewFG3Nk/
	XldUdT2kSR25MMSBkm/NquNVT4GWMt9E3Tw4KDwLFGDpjEOuSnVB2NMJj9OWnHXbhL6WyATFO+5
	s+fZPmQkHKI9tmAhaTb4ccCIMDGsPBzH1NVWVQ5NYVx1sN9GdYr3xAgPSFSBAaPi19d/7DTlIzH
	qw4IGOeMkt8lDOj3Iz8Huiu+q/acZVu8/vb+6oDcRxTF4e81jwmrGTtoH2EE41z9J/H6jlziReK
	HYVnSzW0RZBl1w9PAz87wqu7+PxJ2NxzlbHrOnn59uq0vcXe93j6/h4FF+9IcF3COA8DdNSPOKf
	Tfrb+EdCoTVzBOV6gJFY32Luy+xJCS7vwA4CZ/jTP7ZEENJdbzBlCZKTz5npztif0E9E7BuuRrz
	DB7dboBv2PA7aRSRjovm+P1GD41qjvgyfPgJ
X-Received: by 2002:a17:902:f546:b0:2f0:3123:8990 with SMTP id d9443c01a7336-2f03f17dfe3mr86458225ad.50.1795396674893;
        Sun, 22 Nov 2026 17:17:54 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f102fc4sm43393895ad.43.2026.11.22.17.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:17:54 -0800 (PST)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andreyknvl@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Mon, 23 Nov 2026 09:17:50 +0800
Message-ID: <20261123011750.1032874-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1729447050-0-patch-2-2-raw-gadget@kvack.org>
References: <1729447050-0-patch-2-2-raw-gadget@kvack.org>
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

On Fri, Nov 20, 2026 at 09:17:32PM +0800, Greg Kroah-Hartman wrote:
> On Sat, Aug 22, 2026 at 10:48:50AM +0800, hanzhijian wrote:
> > gadget_bind() allocates an ep0 request and stores it in dev->req. If
> > raw_queue_event() fails to queue the connect event, the function
> > returns without releasing the request, leaking it.
> >
> > Release the request before returning in that case.
> >
> > Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
> > Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
>
> Full name please.

Apologies. Please use:

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Best regards,
Zhijian Han
