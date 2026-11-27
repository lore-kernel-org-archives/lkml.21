Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774043;
	b=xjcdU9e2CcWWmXNYzFK3OB4p8cDtL/Yw5dF8QKNIhH2mYQOL0Ez7oYgZJyTP3YuQ8Nqr
	 Ibf691QKYO/xoXXiFQ5YXFwXxvqwr6zDdUvA1K80JhBioOSnBe75CCow3Qfo9EtSaRoMx
	 u2AANN15MkfsX33qyoyYBmS0WeAhi1ZBBIPCcEVOBpSHYnrdHxfFJp6LuIB97eOkLFVfO
	 aqoHbF5bb64gvDjCcX4FK7ONRLG8T0QmclGrPPKUb/yESya96y4lwH72Q7WVgEPP1HSeC
	 kvyPMQRQD1zXN+sntNjmMuOk5TvO18cwTB0zzXaJpjrHkihuX+5q4+jee3wGgElzYhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
	b=fpHhGFQOQeBBOnWM/ESOV2uYfYPAiNZkqsPTv+vtyxoNeckQgyxmTaH4nTPttGk5IzpZ
	 Tg1ZLKzLOdSyVi+lpphs0+oezznXLbn33i5S0X+mGDAT4tnW+ElxrC1Eo/tevq+/mtONr
	 f7R7xj6iT3thC1KJ5zTfmpOH9vqDtxkDM5EbOkBwVPOSkehZCnzfgNWs56I3WtKJ3hNIH
	 wslapS5mvD0bQAF3itP/JwKcX3NDWti40PCARg3wbXWRlN90oxkgUlfPjrc/FAouB2gUf
	 xDixOLKNyyy7Si43rSDmB1YFrL95cQwVSSb2ZjFwrMOVcKa0RARTLHRzV4XIJg+i/rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viISSJNK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B871606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B871606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viISSJNK
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab4354db11so78634791fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:07:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774042; cv=none;
        d=google.com; s=arc-20260327;
        b=DmE+JgHTPm6goxlJ875g+MKbrG6asSTOqT2Jw+Uvy0Pxvi/MEDVWsljDyHd+JekrxQ
         kyF2VDDf+mMLpM9NkPWq5Qo17rnstIi0uyOrwlOfIPw9pBNvhz7IV5zW2Pb/k6azJNHt
         y2VAz3BRzwvU8AvhfhFqiHt5JhbEg3ZbkN+QpHnLX2LS183+CDf2SemQGD5Brvb9X2VC
         J1mp4eOc6cE4ykEHJa4xNMe71QYsxldYuMsdK3uW9PJXXYi3/HBGNGrQ4/GTDvQEOdR+
         p6kYUHptzouFvlCz6Wd7e30j1xWipyEsMALfZsOo3ZvqU8fuaXNtpQA7eH7x79wPLVQd
         rdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        fh=2myFdOPh2EG9naieDbd9aF8QYvV00xIQ9OFsxLoyWvQ=;
        b=suYGKxKkvIUrKi6BH4xFrSc23O8D5StbUbnFXx7IUoNcFXCxiHhjcia5fYwsf0/IjR
         LlU/d0iFJDk9H5A+g4Ei8nSA313tHLrGfg9ascZu8XCcaJwKUw4h5UmL+iJrT4Io0YIs
         Zb1yKM8C0FEuFHc8xn8qzt7Ta4ZTaDT2fl4RqBe1iJWkMDpmLwtltg1j3yyjiEbEv191
         YGAbfP0efAvRwGFfNVetf0K+PCIYVwGn2l9LPiOt2JPnKaD2yyod3pZg2RH6cVGgYa1U
         azE/jzs7FnZO0tkjQAcA4e0JBZNmuLpS/NTrx+Brdc0wRpoeY/k7mLvuWPb08GMx3nIA
         TDAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774042; x=1796378842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        b=viISSJNKKrCfVwgnqpcx21D5A8sjYsUe1xgoHbLgF/1WiqVhFBhinvCjHO3hb5SdGi
         DDjy+sCxNpLd0qJPAvrpD9ieDpS+Zx+l+bbrKVtgq7b5uQR+8+qlgOW5rUzfc7VgHQAf
         yLq5uRXkAQSsAlnVGHeJKNh709/p4DwEsY5RriTwk9+pp3Wi7aKM+kjKmllDH9Bi3++6
         gvOMnjwO+ztJzqSX/DeIQYicCdCzEJkSamEPekUsvUnBKo4eis3Ft4hIi7kmnpAf4A75
         TsKnET2Kw/eOBh2scDOAHP0Bxy5IE6g6sCGxzVXj7guCtWF4Zq3liE4xCqczhwqiR4bT
         dJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774042; x=1796378842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        b=tXsr7oPFFrpqM/+ECFkuQ+963vOxUnqng6oxU/XIkjKagPlUpR43cZFVYany00WCla
         6/1+v8IIWiLTf7GJVbwcQfEaMM+y8b8ysfl9pSAHqvrXerKvrqzTvBCEs4AhaaOxbxIu
         3l3n1heoy/ZOExmjmg50DQggiOx4UWWVhe+eHt6nVeReiKIdF2MeAz/Q7xnkMEOnl/xA
         9XQuXserfLjLkBXEj6sewam5/ZxQE7R32gtw/MdIw6MwRQRi2u9OeKBI53C2GHdNREus
         RSwNmwwLhSfrJVQDlOnKDz3GybXYwu/KEwAAWqP40v+2kwUdopHhZx/tO3HKwXAQyE0E
         nGvw==
X-Forwarded-Encrypted: i=1; AL+hErEtj9mlvistZSUrjj6txqGyJ4dwRhdkgXeKqKZmZQWH+HVhtRA7NiCoLHaxboSSDwGJIERjwNX3nexmL+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NDyCAF2px00XuNe8i3U5+FKkWGW2HepAjy571DrFUkrMldJPI
	xDcsgTG7ix7EdxkF0OSJOl3vnzZwK+2cDBXYi/FItHLmNYPUpR07DF7Z0mmnaaH48ygWO+txGA1
	PTqWPgzzqqqSJtOm7b94AAB+5g4niLi8=
X-Gm-Gg: AZFdTZcf5E0r+0Jrb7G37QDrTbffHTpd0raTXZb1vPcfXCC8eIluo+l7LwX91GF2xXx
	fKCiJL8g4etiFMudRQZc6SaVPamCphKPfRWtuFgVkiJS/iRo6kYNDr3N9K3NBkQTmK/MiLeV/Hd
	RCP0Vk7ktKKxeOY0RGdueI+1dZN8DRgHBuarSBoas0vKlqrnRo7BmfF8rWQqhUszNZCbDGjPPnK
	o5Wag3n51/9vHamqYG6mHSkWJDzZlA7HScpNwCaUhqIgU5KaWywhNlpZtwYDOp6uPUBci13gS7A
	eTQtzNTzgdCLZgVSTFz0ecNMnhXOjCb9x06a/Be3zUcc0YzUvN48j+9nhM4B9S9pi5VQNQGUo98
	vcHQprTK1Z9l0s9TK9Wl3+exPf6DqKW0QA0iP3vRhAhk+LKZotSHJVhFipGzvGC8m3qHj3Wpbzf
	DJxQLorNbkNBrs34pDKq9W+Gdib3byn30=
X-Received: by 2002:a05:651c:a344:b0:3ac:436e:4084 with SMTP id
 38308e7fff4ca-3ae7f9b2126mr75337521fa.4.1795774041405; Fri, 27 Nov 2026
 02:07:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com> <awQEjpz2572Y9wsB@monoceros>
In-Reply-To: <awQEjpz2572Y9wsB@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:09 +0900
X-Gm-Features: Aa3M54qQEDKdWrHJxIfU9kb7QVNH017aRUBBckb6jwRibhb7ERXk9zIWhsR6uho
Message-ID: <CAJGK9zbBc94aMeXLuUZXrPOT+TbcD6HAejS1PgaCU-wO=ysY0Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:17:35AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at=
550.c
> > new file mode 100644
> > index 000000000..11c9de0c9
> > --- /dev/null
> > +++ b/drivers/mmc/host/sdhci-at550.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivale=
nce. */
> > +#include <linux/mmc/host.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks, I'll drop <linux/mod_devicetable.h> here as well in v3.

Best regards,
Yuugo
