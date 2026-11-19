Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795058753;
	b=RWshVZxJlXkP7IlBztsjBojtbPLrZPSlWlmkKx2uBt+BwbsF8fpdkj4MtjyU4xZb97QE
	 ShCs+zHC87Ioc8Tg27gEmVC8YkhZ9mjQ3w62QguAgUaAlJBGGfNm5SwSCAmsB+yYou6BI
	 ZuO0eZaOXHIVSUvW44tSWA3zYp6vgZirCgH9H4qWR0D7fkK2vJLPd0ND1tRELkicO7FYV
	 d0a4REJCiL7lej1+0X7Mf6JYfW8YhL8IZBxYkzo1mhdhD2dWR6QDkxx5YSVGy+XPF3/iC
	 vQ34bBeeLmplvdVExtGfXAcNdsYzhyy5CCTh4pqdvP3JMBpMlqIGe2wJkToT5fu3T/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VYFehJNjVBKZDZJbFVr1UAFxWBTOgQ9HruW0YhVUrYQ=;
	b=Q79avvQMod2hYeoPAcTZg3Qx6F5aFL+k5awtvicpsbuPmHuyKNhEPCWQTyIaj+kjUWKq
	 M7N28KHQ9ajdIqhrQVX8NNBDuoh0+PkQ9NkGM6fA42Tdx90SyOq4x9vOVcUvtvGEiA+MH
	 BcGFZ6TOkd/AO3WD7HbBK+mu5n6+U8Si9JxUayCXFJAKfhQvi16rAFcx/y1MxvdaNfyIt
	 I2qDqL+M38uqjO3zYjxd84xrd0BjGi4hr5PujZpL5yIEwsrBxvPgI6OXpV4A1vcl/iOF/
	 5nT+IzV1/DMX8EG5c5LdkUe9Dkq/59MWOpu7AINtwkJuiaa/j+cKeW6crtVCDblwNaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAQIFdMj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB9F606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB9F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAQIFdMj
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55d360ca878so13766611cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795058752; cv=none;
        d=google.com; s=arc-20260327;
        b=Fhv8J6iMSC+u5UGJczhNbRUnTnYGPhCC1dqGQMPrUUquQLW3mC2Wlh7In0Aeg45Lr4
         VsuiISOPMsk3gjsOghXoSnMrA9iGK0VAcJBsRKXk9zo56pzJ8sb/UKbW0pi/41KFx+Xp
         83Q3VeBZ919J6Fqxhw7IW/oiO8Y3fq9mv0Usbp4BDiFDXCuGNLY+WJBABxOz+ygrbE1F
         SvV0gUz3UXTDbNSmEfC168svxlQjjsbFdy14/3FYa4SD143QOrvIGPzhExV7de9DT2NS
         VpB7Cis1Uwp8q40isI1GHVZLRPa9pvtiv17jZHjLW2f65kADpOKisXOp7QO25EOdz+0m
         +ASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VYFehJNjVBKZDZJbFVr1UAFxWBTOgQ9HruW0YhVUrYQ=;
        fh=Z+3DKu8LAnnQo+MrqoYKZzeKkk1B3DruH3CTL4V5+JU=;
        b=h3KpyoOixyHkDF6sPfYj836aSLvNum8MxryS8RJE8goQXWZCXeJbmxu3i6h+p2Qv55
         3MgnAdFaJjYwV8m9/5A8wS1Qpoq7BBoJCeO/3kYFJqm7dDmAtcBfPbNTcLY8I3/7EOfa
         ZkT/oviQGmesy/IMVw6XlOwqOHtW5jFIbBP5Tx8XHju1Zv6FhJAMsCwNtlyWX8G6QH7R
         /zPnnasdpbpY0OgfQZ/NPHsYVpk/kwQhNy55la8DXmyhxKqjkf0NBR+56q4omyW4dwqS
         xehE2Hgxv6xEIddMcq9p5Df5l7y1Usl+iRzsVLGrv6KI0rIbcKb3e5E7KSLNoWWqlvn4
         i4cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795058752; x=1795663552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYFehJNjVBKZDZJbFVr1UAFxWBTOgQ9HruW0YhVUrYQ=;
        b=yAQIFdMjzIAVbCGnIcrJ307cyttMywjCpxY6iuB9DHCfyyoc9x7EK2BAN3H+WU9JjC
         +j5h2QJE1mITRwFVcQNP0iiOJTN0CJNygLBp9PmTV8IZeKT5Rv1uZ6uvrbU9iBC4lVbX
         bwxkI1vjee6gr6dNtJii/0J/kt5L5/KM2Arhd45mhkruBZaz7ET0QVrseoiAbAA7XDpE
         IGJO2L+Zpg/fCJzRfO8iNmGWUk16SJvm/4jh7SFOr3dsog3fkzzcbITrEfhHwdR/Hds1
         UH4WfmEnxOtRXcoSywA0itqcOrwZTZetvLDXb2SERn0j9Mtlez9kWQr801I8mF7+VW+o
         b2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058752; x=1795663552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYFehJNjVBKZDZJbFVr1UAFxWBTOgQ9HruW0YhVUrYQ=;
        b=lAS3cD3vdNin6j4h94uNJv1VTzlCPCgN5rBKxLFL2YTb9z5FWrQDwfRKAvS54w5m9t
         QGFYCfLLuAB+gO0QjwG7iBP6kZ7EiefxBLitQfknEODJ1junWFS0/495ZxL5UmjZMsWX
         xCNa+fAL/flAp75TFqVJilDua8mOcKzSrlS7hODb0XAxXuhaEj8SgXGx3OtQ3WaZH8zI
         SNbM5eB1yTFlEGh+GJ2oJ2l3R21N3ojw9N2PlJOyDRwcHI6vXlJ6lCOnaAMeRbV1XVR9
         O5A502Q6utb4tqdZlrTc/b2bRkzULsRj+APZ/1PR++hpFix20sPxx6L15zmu04QEXcWq
         ckpA==
X-Forwarded-Encrypted: i=1; AL+hErFrdy3Z6ioW2tQ98ImX41xXBrDXiqG9OrPm7+NyNdy+SnLNFiAPya7SUZ9qs6QJdPoqm6DZ7ROu/uxe/Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BOOMbadWaaA/HNC67lx5sjjxg7gOaZZK4NyftZJdeh4ahd7BF
	uINNn9s/bwdEKEc/au0Id9ZWirpbq2WbHE6ew0h35SCgF5kxb1clTQUtScCZ2HtpRK9rIv8NnP4
	IaprjUwRaelyONPdKI5jpx+Tdl8IULIo=
X-Gm-Gg: AYBFou1GKUxCvKG0JiT/WO+1VgQvQvMDtgT5w70/ZIAUbqtk5YnYMZ9lxuF7zFca2N8
	GYxx2j40VLSFhpso7xOirZuc7cBmbhjhj4qg0LJNQO/aXadVnQhSbupCmY9OScHKLHsTY7x8mQq
	9JxYblPpZCoHle7iknmN3zus4tF8CCa1HMn8lbhP5Vx37O/2RT/yRXghIUuy+Do7DiRG/NSmpqi
	mnKNzalVUi/WxABGIofpDtO/2Oi/ZO9shDM6q6JxOnKYCg4UtrTWArrIHgwqJY0gxZ0MDBN36ut
	ZQ1AwvGg5WzlrpORwBOQ9b+rI6CLXXKVy8H6kcEqqhkEjFNCtKFgLWSr89WCYA0hJ+SoEEHpC+b
	v6v3ru5sSA2C+vyHO6Tsam8UQwPk3N0XYLy/DBp45yacTOJoiqyUDzQy0mQDfgqhi5cv4JwNFcy
	4766cDLdkAa+8E9oGGYhaWIwppHw2tqiEGEO1DK7xXN8Y1cbwscbe593rlmsxbidPYN+tcdjesG
	gxz2FCGByw5yRS30J9wnPnq
X-Received: by 2002:ac8:5a4d:0:b0:55d:3350:d262 with SMTP id
 d75a77b69052e-55d5a63e3b0mr69700321cf.52.1795058752488; Wed, 18 Nov 2026
 19:25:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260923025148.35637-1-vinicius.m1821@gmail.com>
 <20261001013833.29002-1-vinicius.m1821@gmail.com> <CAMAsx6f5hMH8FF4ykRp42AJ7AxbuOJw=g-VL9PCFYYOAW1-SvA@mail.gmail.com>
In-Reply-To: <CAMAsx6f5hMH8FF4ykRp42AJ7AxbuOJw=g-VL9PCFYYOAW1-SvA@mail.gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 19 Nov 2026 00:25:41 -0300
X-Gm-Features: Aa3M54qqRPi2vYj3K4TQgQmNkd_5ndEw0-ORb-otvUVGtjOUYPaZSO9eoqnK1bo
Message-ID: <CAMAsx6cJvNhzxcVfrprHVpvRfi2=ncjWP6pfsNgCevpyutdTiA@mail.gmail.com>
Subject: Re: [PATCH v5] docs: translations: pt_BR: translate threat-model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 30 de set. de 2026 =C3=A0s 23:13, Daniel Pereira
<danielmaraboo@gmail.com> escreveu:
> Hi Vini,
>
> Thanks for v5, the translation looks good to me.
>
> The link to admin-guide/reporting-issues still points to the English
> page, but that is fine since there is no pt_BR translation of it yet.
>
> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
>
> Thanks,
> Daniel

Hi Jon,

Just a ping on this patch.
