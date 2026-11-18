Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795000395;
	b=sEp8f+D1d4HWTMJHXCAp6Vbx58LLVtbmny5bFo8DIXXgjSCO1PG5MR+7bIpvNA2/FH7x
	 OfGgDJ9/awUkiayWvj7v7DBBhuvQT8117F++jMg0UGD1iboy5jUtvRtj3QHjE4vZoplQ/
	 fvFiN/tSLMIfTJ1gxMdlej5bNLHqSIXdzzUG/t6k3tfCuqLhA+12VcdOVQsVHUS5wzH52
	 1SAWuHZC2D6Fvmk0VSmlXMgBGYGuvPNaXZ8j6Q6/oAAOEN6yxjLf+UJtddhywDzc5x0qM
	 Megc7FhQUoe6VHTxTzoiqorcmgq0NGPS0Q7VRVXSj4KmJUPwOxC0hAGZ+F3I7+YdEyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
	b=JxAsImwDeTBS3J+8L+mO+3HiltWAR5LDNFVslNmj1184KNHXBIHLbooykGtansq8ekfE
	 SYha6LkbIytzQlZfu5wZVT+EUt+rhmgNEbK70FumIgDVRfHkQu2TmMJrSG8IuyZxJE1NM
	 KK4JhAxQZd6mA1OLLd5MVofORlgmPWqhoGZM+nogf0LrSGo7UajnuMIaxPstqSAOExnzq
	 VngBXCzNM5Lhu0pwBnSQfE37CMIimRKdm8j9g4eiOebM8oG5wYd3lH8tNJ1aI0WsrOqrU
	 tL7wh9lkXnkpXmryADOOUDUIk9DxE6xp9OHuv33WIa1dgKl8bS+RTOFkfDKc3srbmpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4sUYzMd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879A3606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879A3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4sUYzMd
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so814490d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795000394; cv=none;
        d=google.com; s=arc-20260327;
        b=gI6IISYpc/Nx+q5LlV+CHHZMwL3mto5xEm94cF+EN/WZmFrMGv2fRufJmZV4w8AYw8
         AD1zhPlEJ+44NxXPKlrFGmqjtYxliej53OaaGDgTtZ9xD4lUyaEcGvVw3ws17wle2Eiy
         eAfwDxpguBd4Hy4qRUUlNopt8knlKkcVOb7B7jw5jaiwZpNkBYUQJPmLtq0YFmbMelzo
         +s0avoGBrTz62zYuLXf3HoL8EKYsZeKdJNxhJmpXaRhAxYZVwN1h1CzrFxV4JlZQKpKa
         gWDh4R/w5yeT3Ha5hUjqSjNRgrqR6WBz4soLHdFeIU6rgHD00Vb1Thw/WW8haOPsrtB0
         N91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        fh=o8JAKWiTCtpNPwgKcHugm9dWyVYhExI9QSIeBOq1xqQ=;
        b=bTKgMsKtAnb9m2pTA9b1Imxpp3ZzJYW/mQTqZiShygtYa7CwmTtVXyI7ozeFGuSS14
         iTurGT7f9m+UbMFZilMRwiKkUxFVcfX2571j09EWO5TdDp5xZOJHO+xTqTKyzgCHGgMp
         6WNRFCggY9M9AJ/wd+6u0kgj1AJ50EbImHjOJbPepCg5v2n6CGzASI4gqxUgAfTCS2jH
         lfLkgGTQr1VRMKyWiFRX7kXZZHkUTdmEvFx7X47ZWF1QTFh1VAt7yf8y2WP6ZfAVIBwK
         DeGlrIn6vjpcjFeLCZ/LEyInek3CKU5NKDbOPeELyxBIZ/dGakJeBQHG5f0xIhZZCgyb
         kAvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000394; x=1795605194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        b=I4sUYzMdyqYeoqb6N1VjIj6+YP0hTl0H9tESRF6uNLuZ7JSKq2om1pPhbmysXqoOvL
         PMf/gvN3IUx+c7vvROpkw7+pTwbxyoUNm3b9weYYVfhwKUUY5Kw8tpqEulrc7HicLiAe
         DdXk2LjKRAFqlkHuoTRqf+a4AbSzasEfC3K6tMDtD8ro1tMBYOnv5FlPkj1I3ErPNmRu
         KXXI4vTOZbrXdXF9n9PnisY0pqnZ4GfDFdFzBtFWMqDAh2OS1v8U4PK9UwaFY+f/q+Go
         n/5TqKfP52/P0AyHb8zHhyiFTsnTnCltnPgSYGqdcrV3flHCpZ5zNmV28CT5y/Xp/Wme
         s6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000394; x=1795605194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHi5V+1hpRfrxl1HVLwRyrTDDCQxfUTOQX4vPNFhHb8=;
        b=fMLc0WXXLhpvZLGThcuBkPFMl/HgT0hdHDuRXJyvarv+9P7lJpLz8AEH5qBskR0zPU
         DbjdfCaN9lOSLX8+Tmah94yVeZQv2ccibJdzKY0kG/tpuzYXfii0+jUkJJKXUdRsQvkL
         baXqj6QytkfGSO/kqIY1u3RjH2eJk6h/IpWerypcX/7t1cWcyR9uOVQyux0lJzKzw36N
         H+DwupG1H1trV1ZDRHRMXMVyySV1j1o7nY0nHP+Zfqxssn7XG3iNr1ueQdpj2zDb7/RW
         OUO96XpnONw6cjIDvqyAusZaGjQRGYJcjjwjeTDat0vggVNIFTpBbf7BO7wadlgtmLWE
         Yx9A==
X-Forwarded-Encrypted: i=1; AL+hErHIo0tdoYWJKloC4q+JI+ZXusvIs3H8KXau+BOFZzq3OsHnGHCcpOpGHaYfseOOXlxXXa8FIcihGk7/UMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EAdsSB1WMae1+kD8HYoZUd6o0PE5En5zaN+02NaKeqCD/ejkC
	x63waaFPuYSycM5nIFXas6izy9ZbRQd0I6Saffben2/ySb/d4nXZpoOGo5orF3+RkiZfzcxvhCb
	27kvTyIegXndVzrHzVN6yd9rp7eaejw==
X-Gm-Gg: AZFdTZcAOBHuWtj49rPqxXehGRqH3vd6hwbuDvcC3Me0BX5vs81cMseGci5dXq5DO83
	ebav0+Fl/Jis7SE4yekaNXSG+RZgkSc8hxyVIlb6M8JHBOba0S8QFexBbltXtuM8s+1b+pDM1lc
	ZGw2FPbfdsWpn1U+F20VJ4iT/GdiZYXH0SlOBbLcNJjFlaqQkv5nJBjKYQvcIA/nVGuPWHU3Oen
	PKxfCMp92YPyP7n8VEmTiFXAn8V6OfTEf2BAJNzyhPIvqhVxowzFUl78XwkJ4/mxPt9Oqqrsviv
	DX+gRiOdN3MdD49AKuSE7UwhrYMNMrP53HDx3EuFUZPuJZjjuB6zX15YWjKWIm24UiOO0Y9BeER
	27VaG4zYNocBm6eXJT33exKJeKZZaoRKbYishmH2W6VZ4e0Wv4d/gEVoiwXqxANkU7EaiKhIMsb
	STW2msYBrDqY7d4hg=
X-Received: by 2002:a05:690c:720a:b0:8b4:fc2d:2fbc with SMTP id
 00721157ae682-8b4fecfa8fdmr6432697b3.17.1795000394419; Wed, 18 Nov 2026
 03:13:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
 <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com>
 <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com> <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
In-Reply-To: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Wed, 18 Nov 2026 05:13:03 -0600
X-Gm-Features: AclHuK9n1arnwuviwRTqKqG6GX0B1k9jEh54QwQkpt5LgjUFE7LwWPEIi0qBPfo
Message-ID: <CANxy8yT4E474NpEZPE_6QHh1UJvj7xQEVR4mOxW759y75SBd2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

A gentle ping on this patch. It has Andre's Reviewed-by and still
applies cleanly to sunxi/for-next.
As agreed, the OPP fix comes first: v2 of the A133 speed grade and OPP
series is now on the list [1]. Its thermal tests rely on the 90 C trip
from this patch, so it would be good if this one could go in first.
[1] https://lore.kernel.org/all/20261118-a133-series-v2-0-8bcec9c9aadf@gmai=
l.com/
Thanks,
Rajan

On Tue, Nov 3, 2026 at 9:33=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Tue, Nov 3, 2026 at 10:47=E2=80=AFPM Rajan Yadav <rajanyadav0307@gmail=
.com> wrote:
> >
> > On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > > Does the downstream BSP have this? It would be nice if we could port
> > > it over. Then you can properly use the power allocator and/or the
> > > schedutil governor.
> >
> > Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient =3D <190>
> > on cpu0, and sustainable-power =3D <1200> on the CPU thermal zone.
> >
> > The energy model uses the OPP voltages, and Andre points out that the
> > current OPPs are A100-only and don't fit the A133. So I'd like to fix
> > the OPPs first, and then add the coefficient as a follow-up, tested wit=
h
> > the power allocator on the K5C. Is that okay with you?
>
> That works.
