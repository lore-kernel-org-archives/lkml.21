Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795181755;
	b=tK5FpW22RYh93sFEVOvNc83DMYo5xV+opDSYChm974/ZJyIw5EqT+zZao//k9ZxONsMD
	 /9sQ00hyOigxcMZ33mL7HXo/qDxfKzbKekgRGpYS9MndbnvCVzoViFA+8jna8lrYqh5+E
	 KaYmBvWcb6riX3Ba9v5q28MHyEKaihRZ72Ct0wgeg47yBS8ZnNIoBURCNbQx90pTZ7Op6
	 Ixo6M9H9Sd28ToBa9L1JqhxkOWPonlSa5zLc88vJWl5WWDACwK6tTdklu9xK+M6ubKmTx
	 BX7wy+756jb6Zeh96eWX2hX3QWVEKh3YB1CU0N2+WtDgHwbg2vayC2ZE0cPKFx1fWGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J2Q6kSYqAb2M7xnO/BmL/Zj8uMeaLz2NE83csOGtkY8=;
	b=wHEQYUhRduG0zwgP1gX/FnsHo70veg6U+FL0avHQgvTq64zzr/+apPZgEu2hdixOIhRi
	 rbxvf4uP6MUSQEpn09VNroJx59HSe7w3cWDYX2L79rGt5c+n+JTWaL6c6FHhs5OKkxU2F
	 IT+g+ogsWyz9Xt/3M0QMmW1k7VGiC1WlRCXnESsJHTMtULHrkAhB0XaRgoyKmeAMxOzvI
	 KrZeGr2L+TDHo46dt6DtfoUWY78xTESfXx+sMxp1rtIsAyGJx9uZeg1ElPInetwwAC+yi
	 zigIqV+q54QYKGJcB0BL/wfLQSTUubXpYHqPhxcAOw4gkhQ+vuwVKH1ipKTJQNm8joA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Km3OInOo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65B0606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65B0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Km3OInOo
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae25c846edso6234891fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795181753; cv=none;
        d=google.com; s=arc-20260327;
        b=sk16FRzm6BxEIaqBcOjjM3q+SmK6ElBRNgmSsQu2/E/IIeKwX9NVIst0dpPeLT4JSJ
         rFVaef+fqM/5oiLN2uZ076IWCEGAWq/xfjlSJV+YnvoFmp65cA3tN1ptoZMks6Sph6f1
         OqW36/IIlYJj4c9krX7466xVm984IdfwaycSSRUmeUy4pQSfSu+7TZy4305bb0/m1Mfn
         FwhZ3gHmAJfUFrLiX93JQbDu6bzd0ptWc2cuthQ+xVMp91aT4BntbHn4J+QVb0DHQvsl
         GMabCPohOb8VLOPwpa+A+smtUFO9rvbbTxZREOaw0h7mDzTpy9SvprfmsAvc43Ljk/oI
         KlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2Q6kSYqAb2M7xnO/BmL/Zj8uMeaLz2NE83csOGtkY8=;
        fh=VFSZh2vwvqsHTwViDP8rYh/9yuhHrBDkD7j3P0RR+Wg=;
        b=UO1uTedm3sJszv4iNzj+m0kXIt3KqropEMMGINBMBqQdVsLxgI8S1AvU0tOeJFvYkT
         28bJb9P1F+TzubkDD9iKJ7F/+q6Dh2PvTmkPzoxE+J1SFddSwjp07lKBSvX5qWqAZkdF
         GNgx77x4t5VzniAmaH0FQ1r46e337AUSEj456ROeTJiIeFyhaDGnLWvYqbx165JqwM0R
         a4RXxJv2uRyAbhBCsUFHXDPTdlR4SXr9k6uWjIxm5rp/C/bmkO4XyuGtAAw0TwWGAOqI
         yXVQr5wKXRpqIFE4JdsRMLS35WX1ybKEaYPCXvy/6cUbFr950+/upww1oWkysXMaHPKb
         TDXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181753; x=1795786553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2Q6kSYqAb2M7xnO/BmL/Zj8uMeaLz2NE83csOGtkY8=;
        b=Km3OInOoEXU95EIwU8Z2nFHurcV3O5QBkOWNWBTScYyJBUI1fCbyXa/RZaQPPD/+0B
         K8CnnuUNf9qdnIt6uZKR0UXjTAy7PKYyJicYK1mXjLPt8a0eiQJvoVUEt6G7kRPeQTcN
         KlLjRRRTOQv8RSJb8L2yjRLR5atw5K+VGdGUSAUBul2A1EhhePjqyS/OapY0aZCR3VIH
         3sxnKeG6xPzbALpJUFkMftYvzO4zsp2+yXWOSUoVYoDbMAEOSfM1Z5Fzow/u8fJAvPnt
         V/hgPNqR1B8hqRxQtM6XFDR6WEsYJEvV6etHZ63YEy6TJUra1qJ5maZovQP0SjgtDT1T
         /Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181753; x=1795786553;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2Q6kSYqAb2M7xnO/BmL/Zj8uMeaLz2NE83csOGtkY8=;
        b=maFX6b2B9GVCjazvuhbp5XfatD1g6gpaIu2FMm9H57gXX56VPaRm7UllQ7ZtD0mzYV
         rL7/ajmNFhlWmu5NrwMiWFiFzAKITASpwH55DuswO2j2wqgZWu1Dc8OgDBzupSwKRfBJ
         ecP+OM0ut+FXJVp/onPIfn5FfBErqiXz2KsWih0FQdbI1DzxI3uRkZvUn+qmDPXQl8xe
         K9HGhfwOPB16ufjTbTDjgrxa7RBXMvfm+vwZly39jQRpRCP9s2r1xXxBQtocI79PZlM0
         Wn+1m9PloDG6kAHoNGPNA/8fQAArI6xZEQvZbv8P1/WhXeSc6e9S97GwvDtLTqQwf7J4
         bx0A==
X-Forwarded-Encrypted: i=1; AL+hErECENlz86AsoAcbys1hE/jzr0F2D2ryYoRKMPVKqpOOzEdbCstgw1g5uQ1Z2Ao+oXziMUBh2re+WnY4LAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9osH4sgxy7l+J9bdKs5j0Of3wzmKeaYmaV0UgLHRZ20PhJgQUm
	0yCntOJo/M/kN4tb5WRF0xE2r8wdwmZhE+TTDeUCeuShxOhvTBcIdVGfbdbJvTtdSxdGoqOwtMy
	Mg9G/loiy58lCS6Z08hiqn4ClYgW53Go=
X-Gm-Gg: AZFdTZd1Za5QJ8i9LAEMBXmGPZILpvGeVIbr080Ed4WicOm4D6RzoWCjC8sRCw2IU7W
	NG27Ol4k3nuePTf2xXEqRcax6WohmobvtJOYOMInL5OoXdIqLmojNZq86AxPYY0S7DNJrkrsbVt
	nr8KfsvGH8s4BM/joV97DCUdA7IK5HdQrfgCBvgewJ2ZwgnyOgTjk2oe95TPawOxu/sXMybZeFG
	z+42rWUYjEZaQQjRQsB7nSMp6j4KNmqmP7mNVtLnELnvJAti46w6HufsZNEbBWCH4bv0qcDlraP
	/AlyP0UawL/sTlrd7ny+SEYgLDBpkviAZTj7IDysY5qqv4r8Y+Z7O2hc57S0iqUprGmxYJPfi4S
	dbipdSRbSKaZ+nQLK0UTqRnUipu4uWB7sFuxu7HxXYGHy/5Z7MtKoYjD8m7v2FuuW/mTs3eue3k
	za8bE2zMGdNBsKWZAOaA==
X-Received: by 2002:a05:651c:1474:b0:3ab:f9b:974 with SMTP id
 38308e7fff4ca-3ae7fac2697mr9367171fa.29.1795181752650; Fri, 20 Nov 2026
 05:35:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115135413.13482-1-tarun.k.lywait@gmail.com> <2026112040-unshipped-muscular-6354@gregkh>
In-Reply-To: <2026112040-unshipped-muscular-6354@gregkh>
From: Tarun Kumar Lywait <tarun.k.lywait@gmail.com>
Date: Fri, 20 Nov 2026 19:05:39 +0530
X-Gm-Features: Aa3M54prlbb2_-Jv2VL2KNpvwTnZJxZ-C_4bCgn6KViclSm-c0KY9eYGCWh1yr8
Message-ID: <CAPmeTTDDU3vQ7rzW9qVtruu5_RA3WNm3OQYsUB=+U3HMaQJfTg@mail.gmail.com>
Subject: Re: [PATCH] staging: octeon: Align function parameters
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 12:49=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sun, Nov 15, 2026 at 07:24:13PM +0530, S Tarun Kumar Lywait wrote:
> > Align the function parameters to the open parantheis and change the par=
ameter "pko_command" to "pko_cmd", so that it doesn't exceed Col 100.
>
> But this line does :(
>

Hi,

I am sending a v2 patch with the correction you mentioned.
Thanks
