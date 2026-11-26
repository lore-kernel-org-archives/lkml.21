Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707422;
	b=rx4WVobvtGlNRmcw12uVY8Ny4cEiEr49gVEp6YlIB64VhUKuGw4tVXEoDKSC5oq0R3Hd
	 dWGHwhe/Fw8gvSw92hrfn5uc33GYEQ/jTX6Ss/6e2shfvD5GRYOtzMid9MZ9rQSEUfVgS
	 4EpQAj14fXciCqxdYBMAxCgLtMLNNTgmiUbbCELgeaA+beUbPKW8/OizZnF4bHgs0EEXN
	 kbWSrqztWctUUwi9WD0doPsaIfRCErst2v88MmQE5SPFsPoy37S8KeZlIToU++fqofzCR
	 ejhGylf3+LI8VbtT6ZqQc/gTU6zGa/cmQMAg9K2yLa1p5Pz1kNdEkUY0vJ4syd2LLOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1F5gBEq1j8Z+ImGUtQMdnM0+OeY4rp2MspAzOkrN2IA=;
	b=08e7KkI9zZEC3oJANHy5px2CXnkMN4YvQLORvJ3pM+T92UsHI0a2BegrGYgcmViHOS7i
	 q/JNtb4IvoL3RRnaAneivOFLyhAmpVZyLVKJzQBzVVj1jVpzzRhXvh1sttnc88VzQgff+
	 XPVGOUsi0zIcS2HY7t50DlR9PA8h835xnT5nNg+ecA99HDw3mH/d8inKEAKdPTs6nfUKM
	 GIZCKmIAHXSv+xqMi8g4IWiadFa09iAQ7Okcq7znRrQDcO3FopizmZd/zD8F7rvqiZP0/
	 4tVA2YVzX5qiWZEHd4vWuvt2SLzashAcFZbs+ZST8YbPvNcIkX28nwCVw53ddQVLGCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ubgkt+Al;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837EA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ubgkt+Al
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so5872664f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:37:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795707421; cv=none;
        d=google.com; s=arc-20260327;
        b=I5XoTce8YAyk4RSmxPobcQbiGrsAgBR16tS/NdazjttRoTRfJqRKpsK5JcJ8JXTUpF
         XagBQbN+nZEm2RgK7mPgIGqRTyv+NRzpk44eBEZNEilKrcPvowko4iiheXzbY/m7ZMHX
         5/InqaWBvBlJAeqZBxQL3D5BM2yLhd7WvhAH3dkSkY3kSwS8D8WXCO5PHK5eOLkLYW51
         An3Fp2qDjrh3vbmKThpQ7SaL4dXA6SbukgtjTddOptvgHUHoqarB7n97AtA/qpEzIOAP
         X26qMKYPd1BSPePt9/Dby1kN/iZBImSt5n99zge5hAf2wOtGwSVSwpVC7IW5CvZEv6NF
         vtlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1F5gBEq1j8Z+ImGUtQMdnM0+OeY4rp2MspAzOkrN2IA=;
        fh=tCFojzTNwOWbtko0H07IvqiaMttb7oaYsH1WavxYeJQ=;
        b=nbI8Ex5/rAUvFZpVRx++B3O8bAMTeDxF1Z35/tYQkqKQPuOe1geFJZutEFVTjOSI0P
         s+ASHj6XLZeJZ+fBGWTAuI698Lg+VbdkuNNuree69tIgl8IFLSrlNEFFbchG6XMelQnp
         61ksvZ0y3ZO5/CSz3ExO5TmT43Vt9j+Qm3z8xOAnLL2vELGlocDFGWLfZN9wmlxVXhLU
         ZvYil/RBFFukN9bzyK8I1SpKkzJan4O8I3ovyZ3zhFmBWijrx38M0oKKCKXdW6Q6Q7me
         ONP7eKAs8fQhis4P3QCbWi53XrA6zVjVUMrebn2I67e7/iiFjfSacFOKF4DBCI7FDP0T
         J1Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795707421; x=1796312221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1F5gBEq1j8Z+ImGUtQMdnM0+OeY4rp2MspAzOkrN2IA=;
        b=Ubgkt+AlDmmUGSGz7Mhrr9yYeiNfQH/Toe5RHPp1SlvZ3axazlugfi3JMHHPxIcCWQ
         eNpTUNNbA5M2jGAYXlTmQc8yb9zLRcYPlC4NV9SfBfLqSJvARiiam7ehWhydpkNNFJAC
         iMe4MoQ65gNjjPh9ZDjDA+vHxOZlv246QqSOrRROLnYpwtCpohMb6HQYi22inFTq2Zw3
         njil2DOBB0EIZRL5LSC3f0AX5fKn/dGIWwi9hbZ6I3DmytUXT/N2ALmvz23zSbRtYgS7
         vyMopYP/XtMVPZSIvCTfJcfHEBrQA+BBYOMVlqkdCOVF9/fBr4FUV33KCDb0rxSah0mb
         nOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707421; x=1796312221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1F5gBEq1j8Z+ImGUtQMdnM0+OeY4rp2MspAzOkrN2IA=;
        b=MBCF9qZ5hGh37dIU5jYR0OtR5apcuR2S1tVBQEmIhJg6IhmkU+s6Ajzl06pq+uRySr
         9ECYh0mMLDefFkVTMSfx+XeyJ5SqPR20njPbDJzDL2NqHHIN6VHVcVKHINCR5XFiPI2g
         44U8nVLkMSUW+lXjr2+OGdUiFVQ9Cdt3mTwQnDN8IsnVPG7+v4/KGcz1d0kHnf4L1j7I
         j9z1d8s6hGzgCmokIjYSfJsAxdf1ULifbj8jIlCocN/2pXh61lUWqGVZHhEJ/ZbvXPAh
         HqOIwfXg1iwkVLdZGbWnK+4O27Zf16Lvs6kF6oNbHfVrXRW+YnQPpZ1KMLvn1KF/5gDd
         xUzQ==
X-Forwarded-Encrypted: i=1; AL+hErHcj/iAm5Pc7O6m92KJlTGrfJm+TAEw+2xdfrBTMxZQ8pSlc3APMQIt7FDLN1oawddpIZOoMhD+BlPvRM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z90cOiCYBz3tzU4AuEg6vo+6AmskiFFnvFopcDSl2XRUuJFHSEt
	45/YREWxI4/z4OSDpsoj7rN0rPME0amZqteU/8OeF7eTdGPJW4ZdOxdxyH2kgCe+4GezNzPJvuQ
	WZFXSIBCVlD93Rn0JCG0t+XO8PSHkcnY=
X-Gm-Gg: AZFdTZdxvy1QeJR02cjWrYWKxPQgkIhtsqKl6ODel9l403yzq00i/6LC2yzPLYABp4R
	WvUFUe+SvYV3kLpY2eiNACd2nchns66JQzLvuDBXdM94ErC48KoQhz2ShFHnir0bdhYINe/94yr
	VuD/nKeFSbKVxL2G2DalnnE3gyQu2rDLj73WVvpb8WbJ/Hr8L0AVLndKlAwtnN+lXsc9FEzg1cc
	1wsZwy2dkJe9Bgr1pJqLZzGoEcWxacOwUw+Mxpuac8+e0spKVbSNsafts0ACfoevhIYVBqxWON/
	Fc97ezv/v1S2GOMcfdq/6e2OBsE/t6i4egpXGIIXTiK3u8UqlTT11ppIc2Yi/qVcYMeAXyZ2Gm1
	xA/HYS595D99p8eLb/ZViKK6SyO3qejUzxw5O0JHR
X-Received: by 2002:a05:6000:2507:b0:4b7:66fb:b092 with SMTP id
 ffacd0b85a97d-4b766fbb479mr18549308f8f.48.1795707420665; Thu, 26 Nov 2026
 07:37:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-upboard-pinctrl-add-intc1057-intc105e-support-v3-0-81d35c9ba246@gmail.com>
 <awhPAzKefJVW2meb@ashevche-desk.local>
In-Reply-To: <awhPAzKefJVW2meb@ashevche-desk.local>
From: GaryWang <is0124@gmail.com>
Date: Thu, 26 Nov 2026 23:36:48 +0800
X-Gm-Features: Aa3M54pk4xmmfA0tYss79tXijqcYIwfVpGXaRa6BXvaRt_qpUfc6C8WO5pnowO4
Message-ID: <CANYHO6o-eNMV1YkRfP=W7XxmefBW=U_CALRMyWSixkXzk1uBtw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] upboard pinctrl support for device id INTC1055 &
 INTC1057 & INTC105E
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Richard <thomas.richard@bootlin.com>, Daniele Cleri <danielecleri@aaeon.eu>, 
	JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
	BillyChou <BillyChou@aaeon.com.tw>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 26, 2026 at 11:09:43PM +0800, Gary Wang wrote:
> > Add support for "UP Xtreme ARL","UP Xtreme i14","UP Squared Pro 7000",
> > "UP Squared i12","UP 7000" and missing groups and functions data for
> > INTC1055 & INTC1057 & INTC105E.
> >
> > Fix pinmux-select set CPLD GPIO OUT not function mode for I2C pins
> > on the AANT0F04.
> >
> > There are no compile-time dependencies for each file, all pin groups
> > functions data will forward to set default when pinctrl upboard probe.
> > It shows an error when run-time dependencies are not mapping to right
> > groups and functions.
> >
> > The pinctrl-upboard is provide additional driving power and pin mux
> > function through native SOC pins->FPGA/CPLD->hat pins for flexible boar=
d
> > level applications. it's probe from ACPI device id AANT0F01 & AANT0F04.
>
> Thanks for update! Looks much better now. I'm about to apply, but I want =
to
> make one thing clear before that, id est is it indeed ISH has only a sing=
le
> UART? Or do we need to add an index there?
ISH has 2 UART ports, we can add an index to identify.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
