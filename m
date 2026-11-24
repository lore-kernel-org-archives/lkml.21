Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480688;
	b=ZKrUNm90SbRYbyeR8ARk6Yx6puqbWpullSL3O5knZym8ItVOvOW0/xWXN1D34Ewnbzb/
	 qn2In8dP/lbtoxKfJ6iXbk+eUPO1gQDJ/A1HmOQKveQrODyFfzd9TpN+tRNVvZrdxBc+H
	 t8mMZwd3Y43eMxdKv/W2JX/qH+fTR5oyKdI6Zi2HxBHV+lKP4qeICEy7q16GWz6VDfXQC
	 1mIsa+CZ03o3YFMcSfFwHG/Tb7pw/75jAGiIO68F36QfH3Nfk5gXZr//5KachCmm3owhl
	 WBwN7G7PtP4rJ9pG/m5GuUuu+3x+iszXmrFz5QtYr98Cbr4QxvR0l8+KDFI4vfa2Nzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
	b=pHGPJmJDAiZazzk4glNc0r2rOV11crqIzHgpqfK12McE7eihvyBZvBJAhXhhCM6/GOLH
	 NZ4VG3/5ByMsiObQS+TvtJz1885rCUDmTC56c+Z9RaC3z5cdOsTEDuNU88qFBnuabfOTz
	 sv5b2Fb8/RFGhwebbcwi3Sl3DVgduiC1Um1r03BMxQAqlDoTr4mUQ+oqNoTxMznUadQt6
	 8i9WkwU9pUxiv3GiBkCbQMkAsMdcbddCMVvmmYaJ4q4vsHv68r7I8f8ZOdIcoTIDeTpeI
	 lQoXA3Q7S/JnbchoWJUchI/ZkKtkAD9jFm2dTJJMy5o/FApOwD3Y6Ur9UNz0VrVpDVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y9dkko4s;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35A606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE35A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y9dkko4s
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso37708545e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795480686; x=1796085486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
        b=Y9dkko4s9o4UwhwIlkojWLa10glXl2Zu9oT61abwt6s/fEKwiMoUCMILJurwqgOek5
         73jyCWA6bI2eMmSGnVVAnaemqD5Uj3n5Sz+YobddsPXTam2b6ZGswPblVFaJDNzUmzc+
         UoRithvF5NJILNEYRCEfKxzNFDkfVv/w4jRXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480686; x=1796085486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr1csZ7oaM/i1Y8jv4N4Uoe336yHoqWQoxkbuSqpTlk=;
        b=a235m1KvxNh03q0cKTDpkWwm/VRPWMz49USOZyxirmfBuxONvYwdxFoyOzhQU4NmkV
         K2UZ6UjuLZSZi4v7vI7+IRpv/6Sv3j03kwZgVjdex1/jWg7B3jsUAbLqmVkUo3NGzmg2
         h9f9zddGjADNCxumdXHkBTYwXUTv0XXNdHexkeEHedvsqVNjbeiQVHHaqSrMel+TEyWX
         fhmMc1jsxV6X8MwcIdFjAgOHCew7w4nfeTgl5OnqAw7odQXahDDEJ//KTj8jkKeCHf0z
         RcleCQj9SQG/H5jYI8brK4pS+FM+tF/oQricOnjF+Q1tmvdp8WIdCHw/EykReJnKD3Yy
         Qk3Q==
X-Forwarded-Encrypted: i=1; AL+hErEqj2nnS+tThaeWzpQssdLelTredBFed4UoGxdNeBb7IFIhYp9bOJqxBRr5/9zyEg+ShJeitPPIoKgU6SA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DAxhB3UaItzgfJFdo6OmNGgoM/7+9TpI9qGTd92Cb9AuU2/gT
	883e3p7tacJMb8StcQDisqv/hop1j6esrZpjl2uTSGuZA6SshDfOUaUrqXjSuU7KBBUcZrhCsXV
	KjxAQXOUz
X-Gm-Gg: AZFdTZcPs+uyU4ffqM5uy/aChUhOf5hdBSCNlcVBKdeV2xP14oeQXNMZgEj5E2a5aVa
	ZL+3yDfk9eo2yswbfCho08OrRElihEeyXeGoALNIkX9J8ISurpdXnpcXox6z+OPSqMZOYGACIsD
	mu3zOLCafqgAe3AHcsgrUHy7219JNAq+G18Gt02JB9dXnxmVEjgtDsbGLpcrrEO3wYLy6DKZqzt
	ZwIih14pSixhcdtveCEfvwRh1ftgPoP85NAu5Na2uq5XS9X6/O7HjeK7jDfBMj5xrmeukukesGu
	6RgaKe5AYejVYUDBvlKa8ihGAIw2elkjXeEYpQsr1hzhNkTc5ccsx6pgJxLA6Fqf2anintuh7ls
	soKWa5CFV0+dHFP/jlnllyfV2ckHwov5UJY7Gfii7A1tZPZmsHpVinaHbG0DebRCE92KwD8MdX4
	yxYzd4bcHChHMI/nYrOVrQ9iY87vDvt8ItoY1udEdGqWZD/l4frSrMON5f7DMGur9jneT6DRUt7
	n0cfjnuUOxPddPaeRSHjwjTi95rM+7T8pLjvCbOoN5DBwCnUAjQgBR0Zlwmla/FROEygsL/DHtk
	ALDrByAgnI1n1jEhaigzvfh8LvGzUz+fA0AWn3GEIjxeiT/lcYlpabER6iYw/ge4w/wR4Q==
X-Received: by 2002:a05:600c:4f16:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4bb8882a66emr301228815e9.32.1795480685910;
        Mon, 23 Nov 2026 16:38:05 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm28257633f8f.24.2026.11.23.16.38.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 16:38:04 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2041022f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:38:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGFny0MBRTP3CrnMbE8bFZOuKH1cRTUFrVXlxlweOGx9fB1/XJ5lLnnMFPUGWOCdQy5obwxssANQO/u82o=@vger.kernel.org
X-Received: by 2002:a5d:5887:0:b0:4ac:84c:70df with SMTP id
 ffacd0b85a97d-4ac085bb48dmr24443427f8f.45.1795480683352; Mon, 23 Nov 2026
 16:38:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org>
 <20261116205320.1621386-9-dianders@chromium.org> <20261118095418.51d30ee8@pumpkin>
 <CAD=FV=XZP5ZD8J8k5wD5XgQP-sF1SEoZNkRkXyYL1ZeuU187_A@mail.gmail.com>
 <av6J47fOAYxejSgr@gractus.seuss> <CAD=FV=UQ-LSqJ0m4h3nvatYOV6Jc_gezOb+SHTzUcx2twytEaA@mail.gmail.com>
 <awTZn8m02pE-wz29@gractus.seuss>
In-Reply-To: <awTZn8m02pE-wz29@gractus.seuss>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Nov 2026 16:37:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=URVKrCKFte_2ratzViiEshYMO-9ZxiuMFbyqW9=apYLQ@mail.gmail.com>
X-Gm-Features: Aa3M54o-Sw7CoGQi9w7uLhHvV-4sdG4fKsa0NEwuzeGRk65fdVb-36i953nWGi0
Message-ID: <CAD=FV=URVKrCKFte_2ratzViiEshYMO-9ZxiuMFbyqW9=apYLQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: David Laight <david.laight.linux@gmail.com>, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

David,

On Mon, Nov 23, 2026 at 4:27=E2=80=AFPM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> > > Fwiw, since this further optimization is essentially free in terms of
> > > code complexity, I'm certainly happy to apply it.  I am absolutely no=
t
> > > keen on further micro-optimization of this.
> >
> > OK, fair. Do you want me to drop the 1-line patch from my v5 draft
> > then? It's basically this:
> >
> > -               if (memcmp(p, s, slen) =3D=3D 0 && p[slen] =3D=3D '\0')
> > +               if (p[slen] =3D=3D '\0' && memcmp(p, s, slen) =3D=3D 0)
> >
> > While it is a micro-optimization, the code is no harder to read so it
> > feels like a nice free speedup. ...but fine to drop it, too. ;-)
>
> Sorry, I was a bit unclear.  Keep that change (though fold rather than
> a separate patch, I'd suggest). As you say it doesn't hurt readability
> at all.

I don't think I can "fold" because you (the correct "you" this time!)
already applied the patch I'd fold it into. I think it has to be a
separate patch at this point, doesn't it?

-Doug
