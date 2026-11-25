Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795615147;
	b=je2m09iTVQItdrCpzmr7JNwAq9JnMRXU+dF+KVV6SSEveRgAUtTKmzjWjvuNkEsfay51
	 8Zdj1Od4qWDdLr3pl6MjQcW2DObx5iyOCOwSgAAX0C3FmRn0eg5Ma7xpegBgsEo1q4yqq
	 NEgpYpVqCggSFgsFrYcCFvrhL+qNJ675LFuGYg/KQIiF08BR0vDQyjpSuxbRuEqSdmiOx
	 edf5YCe/RlpUod1fvBZS+rpZ6ujlcoBz3zu+/RLDOBvQJIH3VQfoxusm48w6OwcCfb64p
	 MbSS7QtIaDmWwCGaTNO2x1isD3h365n8kDkw49O77FJDlFs3Ph6uMT2B4W33XWCfntg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=09UPLto6axokpNWgG+6ModtbjIWY6madfxL1sFeVDTE=;
	b=2DaTp+YHiG2LDn7U3TE/urFOcdnN0nM8AQlrNfgM7PWcHCgHhSNicSVOWOzKTHgZNbSi
	 jSE7PVXfHfzBqSUum6UeNzHaJMHQc1oW03screLTa1HQt8Zy1rEKTtR+9G4vVGSP1K5Zl
	 iRVcVoSIfAp31s+Ai1HGYn4Bd9fPQZiONwGcq70nJN0ldXP+I65ivJVFJhcznp6i2e/az
	 NLDV/6wLhE8QZpQA29WZy3G4rxcmgnixckstamYlK03RN+vFIno2TxlQshRO0F1qFiYNX
	 7+mo9om50gU1PPuxO32FOQtqAg9Fv/XcgjpHvN6NUCgzQdpUjqNssg+akTBMCF9iKSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Wmyd/y0D";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9493606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9493606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wmyd/y0D
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so4034720f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:59:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795615145; cv=none;
        d=google.com; s=arc-20260327;
        b=LrbIhy7sNsasGNCw/RVOR/KcwNXLRFingT2yRIsyTqnFqizlAEWP20UnvId0QD9g2U
         LkfLSmap2l7bwc5IlVmM8D0OJZFYGAcmQlQOvwPVeCPxBP9K4i157H8D+m3Nto6UYEte
         d2/rtmAZScXm5hQ4ZfklgEQU4FEXE3R4EiMwNoA3IanFJF5qmlCaFGY0yxxQ+6TToLAe
         gVgWni0hlAnPY9VvoWhz7fPCAQ/uKxnQXTj2e+G6x9VUbltz5xIeIN9ae4vZ2XSXVfKD
         NX+jVuDafzvfj3OjFZ49/4PwONOtGSlkP466uAq9y+W6S+AP/nNcft0spBaqa0P5QTTz
         1NOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=09UPLto6axokpNWgG+6ModtbjIWY6madfxL1sFeVDTE=;
        fh=0k+GRRY3MZ+9m8KoaCX2lWuqf2QHxtFuJcaa6MIoqUU=;
        b=e9196NN05i+XsgyTjXVpXokMp27bbLWZo+VQExKpjsXkhcqOD08iT0FvGY6+8dYwkO
         kq7hZrIw2qPtQfKb5c40TTKulZgTcbCwuDUnzoOjmQpyPMxtgAPXwfrFTFPx8qKPpT4/
         zGG0HcgUyGZk7zbMc20CZF4q33ao2EERghkbZf8qLPf7fX0+drRgUunGAHiOopT9/wdy
         rp7+kJSgvkHl1n47qQ2djyoh5ve+sFLdVsCcbxGMTMkNqcXT9tf09ifp1ArlIERgL9+v
         ahHLEHXcLjoeBFryzKcYCGGTrQ/jB2oH5NrRkZPy/g5Cir5rsJ28zSO8PjabunE+dY8R
         xZKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615145; x=1796219945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=09UPLto6axokpNWgG+6ModtbjIWY6madfxL1sFeVDTE=;
        b=Wmyd/y0DLovIGl2bT8rvYbNpCaVeCRx2typ8roczSOcFM20V1I4zDlREol3Er0tywQ
         H1F/1d2u3M7q6LeZKpuKD93ZpSkLRFYCFYM3WP7GirEDjZg4gVCmXxsrmfM+AW3VB31y
         CHk5nBMwo07qh5XaomSLQ0R6Jb3+cpIjHHzIrTi7iN13sAxAeaITwl4sLDRec6fUKSbJ
         KjD40arUGqjhjl6OKB0Febh/m92Imc+nFIWXonuqenHf0ZpimJLflZrUJamOiBTza2vf
         Lrk1ow39lYiN08Jvhzckmvyt2dI1LVvJiwE5cBk29X0d8yRoPUtMltMynSkuDG+miYIk
         lMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615145; x=1796219945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09UPLto6axokpNWgG+6ModtbjIWY6madfxL1sFeVDTE=;
        b=wZuNQzmoXq58SOtdryNoxYV4zM1yu2kruRIL2uN8dhLMs+eha0JApO2HybeCHEpy+9
         YxL+muRaDqLN82d9rn69NtJOoX5CyHKQ09cuWYeKT8r1IG9u7oH4VfLjZIZEgFbO0Pap
         BMtKymOVwRspVG5ysjTyFxSQMUkBdLMIEouBTmDpCItG0AJV89AIbRnIrt2iOdaGTMz5
         licMBIdmftpuDuGrmGNVz56UVGoh79iil4jH5g7tbSzPnCjtpJCaCDXQP0wKw5LjzBkl
         Dm3sX6zcAYckYcRT9M3XZ7oQWbPm83VU3p39Xtq3iI3dXQRk2M9J3IBRyeqmFFkyC740
         l7pA==
X-Forwarded-Encrypted: i=1; AL+hErFSQdsTso2Cj9S8lmUFZmJKs732XPd6538Tz8+p2yueEWhc4bbITF/DaJ2SepFy1xNRL2uBT0B0dwSCz1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c4vYB1kwLcRLxRFZJ9RXvG5mM+rrUjyPkgT3ug0Wc/fnTNn46
	C0KqKZWBqAST9w+1zkxJnXh8+74Cmi0othEudx3SlDAapHwQ4K2GURHmaiA6Eao1TYzIZ4JTLxi
	aYmTkZSXDftoN+H+PF7+K6YtKUF5rWeg=
X-Gm-Gg: AZFdTZdVDq+We3t3A7OpJaoj9VlNFuAoXGzjmWFX2WtliK2hiUs+h0TVZop1SwSuG03
	4HrmOvjeFdXVGrdIjdx0FDfg1T3Dv898sXKXEQBK2AwNtV/8mY3sSlrfZZ4oT1n6BDZVhtlRcxS
	+iev4gC2+yjVXTxwjTFD2ZbRpoJqCww/oAgRq0ow3vE1Ayvis/oPFdqrPfAXcVpvw5Xs6U0J4dt
	NOL4AFxQtL1RD9Bt1PhzP+PxMI3J4dC0Slhy8Fc8G2OGGocfLI1PsqUvbxRjVRRavAxRVwh9J+E
	wUEyL2Oh6+yt+GYL84LHrF5j/I67FJDtfF07OhXATYTNfDmcHtoXtkt92Z1ehUQOZv2+8LSCuP7
	J4p/Bvj20JOILYyqxqHT36tEKqKXvua1mANLOdiU=
X-Received: by 2002:a05:6000:4014:b0:4b7:ae36:5493 with SMTP id
 ffacd0b85a97d-4b7ae36567emr11689293f8f.12.1795615145005; Wed, 25 Nov 2026
 05:59:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-upboard-pinctrl-add-intc1057-intc105e-support-v2-0-c8079f8f569f@gmail.com>
 <awXJd59jTHM2bIlD@ashevche-desk.local> <awXKVXS0kIGnA0lD@ashevche-desk.local>
In-Reply-To: <awXKVXS0kIGnA0lD@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Wed, 25 Nov 2026 21:58:53 +0800
X-Gm-Features: Aa3M54psDnYYcIAEdsGV8up86M6nPP0lMFvOZv_SlI_4KubbZ_Jtr3McMresRDQ
Message-ID: <CANYHO6q7Cx1ah7cJMfyeu83v80VAFcx-2TQNNWM6kNSv0zB7pg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Richard <thomas.richard@bootlin.com>, 
	Daniele Cleri <danielecleri@aaeon.eu>, JunYingLai <junyinglai@aaeon.com.tw>, 
	Louis Chen <louischen@aaeon.com.tw>, BillyChou <BillyChou@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 24, 2026 at 07:29:32PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 25, 2026 at 01:10:34AM +0800, Gary Wang wrote:
> > > Add missing groups and functions in Tigerlake & Alderlake & Meteorlak=
e
> > > for INTC1055 & INTC1057 & INTC105E.
> > > Add support "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
> > > "UP Squared i12","UP 7000".
> > > Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
> > > on the AANT0F04.
> >
> > Make the above bullet points to be a regular English text which explain=
s
> > all this. It sounds like the second sentence should be first to start
> > with what is this and why. Also don't blindly copy what AI provides you=
,
> > edit the text that it's correctly split on the paragraphs and in each
> > paragraph use full line length (~72 characters). Each paragraph should
> > be separated with a blank line.
> >
> > This comment is related to all commit messages in this series.
Ok.
> >
> > > The pinctrl-upboard is provide additional driving power & pin mux fun=
ction
> > > through native SOC pins->FPGA/CPLD->hat pins for flexable board level
> > > applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
>
> Also you ignored my comment about how this series is supposed to be appli=
ed.
> Intel pin control drivers are maintained by me. The rest by Linus. People
> won't go through the code to understand if there any compile-time and/or
> run-rime dependencies between parts.
>
There are no compile-time dependencies for each file.
All pin groups/functions data will forward to set default when pinctrl
upboard probe.
It shows an error when run time dependencies are not mapping to right
groups/functions.

> > > To: Mika Westerberg <mika.westerberg@linux.intel.com>
> >
> > No need to bother Mika, he is not maintaining this code anymore. :-(
Ok.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
