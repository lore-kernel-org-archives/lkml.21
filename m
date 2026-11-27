Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774052;
	b=XTJD++tvKCBtCyAlyOy/4wN5v5X1eXb5KKil03C9iAsa/io+RKCpieqp2lQ61yfvIRTt
	 88KcAKYVHgALVm884vnHIU49ZrTdWt/5sDPGW/skWL2K45cWSKqW6UC8lHgZIBsbBQltw
	 6+r8S+e5m2BTlcvJsQayvNweEUnw97ocL5kHEK/6yn5+yz4PPZYQ2eS/I6mZ4H5xJjpx6
	 anNU3PUL7r9lTycG3Bk92Dj2yiLOycABLt/liUpdPJuezyZLwsbbvRRPB//1+ZTbBp7OM
	 I/3NVxaArOWCL9wWHWajf1k2rxbw4PNMdA3dytqU+PF/qd1Us9xRcjHFhlV780KNr2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
	b=V9kF6YksYRX8hMO+mWNaDq0E/6J5oJvvmIco5cYeHGFxuaUXbiXPvygLgOmtTD+ruZ/f
	 lPGwxid8z4a5BqnVY95mZlnYFzOBMNFqSy1lNJsZGTrI2Op4OfmqOphjahZEBbIBNxYpd
	 T3yCRybMC25Hk8zixAiannB5vgaqHtpVgckK63DObnyWgzI9ueN3TD6Yl5nC9Q82YAsyN
	 kL0yETWpAbnQ5zA//5mZh7Eui7sUQDUM+PkHwT0ci+nU7Tud+vqb7gwuLtRGrShYdPCKi
	 HfIRVeSxUI9EsNXtQuKi5ayyweySStuiFFmaAyGkhLdue4QZ6UL4ziCJEfu5ECRNpjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8ZERY7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C115606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C115606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8ZERY7z
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso7130201e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774050; cv=none;
        d=google.com; s=arc-20260327;
        b=oUsIKtFV54LjFTXq3vwgrrBxzEEbRu2tFthimNmwJVn+lh+/VoL//nL6PdjveI4ELL
         yWmt1TdUgOVfBjFC7nMEGbOXba0kV8n1qhQhfH+i7HCuwhJrGJiL13sp1zs8a9t/Hovj
         6QMcfulWlDclVGqWdjuGAinEB3uwBABCkO59gZd/ohoNkz91cHFj8cqGezcO6g9rxHty
         p1dmY9v3lDEW01S1bnQiClZxLTSuge1GtG6T9YzY45ZDAkTAkj0dqsPtEUQuSfn3jmEc
         fJBSzj3zuWf9omO7+S8KtNC2bEA+fKJc8uWxgytJBef4fdNY+zhAAA8Ci787rP88tpAV
         RwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        fh=s/bKc8MWkFgxlBFIc29niBPbwK82Nd5sseN4u92bT34=;
        b=nhI1hE60iCQRKjELN3QBJaqfW+shpyQugKvHJLKIWQS3lJxVmUKj08b+8k4C56nalm
         /jadbMl6H4BxCaMmgMA3XLQMB51L9Lk7BDTYQ2OD+lKHgNsP+IBWZTm6zHRudL5p87BN
         wyoxMCj09FFAcd0aGW1nWNqs12JzS3DodNU9Zr4NFfpR4HIurHv6DPwDKZ1Aoa3ZaeKU
         3l6V/hjvlDnDoGe+8NwNdSJmxvSrL0q7YTOOvAVXekTrYZn+9RF9HiKk9fPA4rbqEc+h
         kG9MzRd1KMvkHzjXH4VA5q3E9fFt9xBKuW2WyiVivoUUQMMVzHFYJYumHPZiumVoReCh
         XCOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774050; x=1796378850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=T8ZERY7zD/vy0H1Rb2du90/b67CWcF96NyZsqFxOi/RYxzLhB+qwyRH8qcWPBraa8v
         mW2zbzSP49Foraqc+NQDAmXZ1wubTXXFWND6ZtkJhZsKeALOmqaWo2ukNLoEvE2+62ZK
         6cLWHCumugFsUXIOtnP1I6tOsdCFTb7E+KqpznZQ9CJe95VPa1CX5Q3G6qZlNTsxFj7I
         +oKRx6WVXOXR0C9HVFtpTdRHu+eXoKolZFYEVFXpOd1/gQmHnPvjxoxPAEZfwuB0CqQj
         ZwCKClrm4FF4FjWeUhiqnMc9RPcBVLJs6R10KN7KtdHAmOMrEx1LzrMDpPSd3zjZIM7o
         EtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774050; x=1796378850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=ahc4P4GQe6bAABntHVwGdjqMvI1TZquhkGlGwMuSV3ktOrFdPbCZTVC8WBaY966GTB
         lBcBzbjH19sD9MX4smaFFm7vjr6BD8VViCvB5sWIAdufSPyNcA4QBesBW3gRVRyYtiLW
         /7hcUgpl0NR1aW6lP3eQllQqpwpd893o5PiIG4izD4xevFJRKBh8ZmswOwcvTc9Hi5/D
         Y01qVU0z33ycf9qYiCBCLAsdF+Yf5c0gXU5HrvbAhp4ixy4OBmyTqbfB5txeKgTk3tts
         xhGrnMVtqKR40ns49ePNr1FjIj4rOC+SpyQbHsBSXxi6cNUGh6QcUluLAA2BESvyzgm2
         D5Cg==
X-Forwarded-Encrypted: i=1; AL+hErEV9Mt5GrAuF6Tsr/BoOaFCFX4HbyKNrRuxdJ2jXLl9sKZH1Ggk+UgbzGCxKCNc0zfLDo2E8YTnpg6VFYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+ppFldAn7cSQS7Z95EYG1dkQpnICrSMHK6hr5cG+5xzuxBvI8
	N59iL+vhrocObGqHsIJquspbsehCELXUnu9tGS6gTDEXuKU+bSDUOkHFTopamcQ66lkoi2wqsmD
	Onc7SYHfh2ZRVdjsy9mkZHxFDizLFpM4=
X-Gm-Gg: AZFdTZeTXqWNSe3LhCQAhef+UJwvU3FyHsKoGIBvyVpZ5IzYXc7gkHKl7EmmzARhSh8
	iJLc4+akMK2CBmjQIkZLAY1LwlUrcEGqxhruayR9UB8VLzc92UWzyW62NkPpD+jCN5iewPz3ER5
	KbEpEOJspWciGR9gwmD5yvA8gO4o8nzdt3BYeTNHbjnedNoDWRnrLwEYSeEWoNJiAmPXcTtfn0y
	leo5jEnnlN6R89YSD5LI9yMSHRUEw4pa8KxBLBymAwjJebrUKibQELAYJi40RBF8+qOgnaNnz7x
	HIuz8f80KNvj/R5rYcC4RwQoMjeY+WPHU3J++xTi+LW3y5WtrzhcmtbV/mZEYH4DI7qUMoIsV9f
	b3Asa1240nZrmrkhvnQeGaJrZ2qK0tBWWP15vWHW06lsSf6Vld0d4/Nzhq4dLb+xEl1yIooggx6
	WD7DiFM3LFm+u6NBUFMD2kbW7zeeRc91g=
X-Received: by 2002:a05:6512:10cd:b0:5bf:f8fc:7b5e with SMTP id
 2adb3069b0e04-5c1bc89c61fmr6700305e87.55.1795774050347; Fri, 27 Nov 2026
 02:07:30 -0800 (PST)
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
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com> <awQEP9bHA0RPfRUA@monoceros>
In-Reply-To: <awQEP9bHA0RPfRUA@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:18 +0900
X-Gm-Features: Aa3M54o3XA2vGbw-lT3h-QsKcDE27T0mWx-80FMotXTw-keuMBkBtHCZ9WsWU5c
Message-ID: <CAJGK9zaVJ-42c-AnZuXBW1uskvmRQv1ePHQsx=BMz55RfznomA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
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

On Mon, Nov 23, 2026 at 10:16:56AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touch=
screen/at550-ts.c
> > new file mode 100644
> > index 000000000..89c2d2701
> > --- /dev/null
> > +++ b/drivers/input/touchscreen/at550-ts.c
> > @@ -0,0 +1,124 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 =
draft. */
> > +#include <linux/bits.h>
> > +#include <linux/input.h>
> > +#include <linux/input/touchscreen.h>
> > +#include <linux/io.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks for pointing this out. I verified both built-in and modular
builds without <linux/mod_devicetable.h>, and I'll drop it in v3.

Best regards,
Yuugo
