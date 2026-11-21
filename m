Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296431;
	b=0nVg+gg77vC0BeUrjq9cGYUHGBrRS3IKkYhQKMckBAQcSS8hEJvHTuP7wAU3nE2oYE6Z
	 6yKgC7oHffZDn4CXWkCYfpgr+5m/pCp2fZAGqDii56Dj5Zr5M2rHvHx/AVs8uxXblfXzb
	 1XznA0n80pmmBPSHZVL6BpmsdafIYdYs70NLkyFKDKdNhEFoDkwKnp329VwVkZ71RIn+H
	 vGZqZshHcFCuklouQ2+Y+89XMUubKZAAThR+uwhjjXhcYP61mMzdIaOCdX50Kaxo0kpQd
	 ahz4KXrbFZDMT5CnW5wsNevkDebqBIbFzi644aJlDbL2e/GOHU2Yjb5+Qlh+vlQI6PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296431;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=;
	b=jeb+DH7WGriS+au/01EsXqzZzHkM/E9vfpEfNbOUfS4dCYPHadB1uc8f2mi48Fpjd1GO
	 YnN9TUiNVfBOfbsGUzx3y0n7Ra5twF4nfCstcA3gti2TUxb4gS4b1SP8o7YjDFq+lp7Zh
	 9JyCG+1a+7bjBREerc0JeiozVbe03OfxS6vq+HfHspXzCz+phXfpYu6RmyMbtMfrnUrhJ
	 Umr5CqJdyH+axVmNVmjjO+4OpFWdKzaeQWNIu434xKz6CB1bPfhtRrwcXr41w5Z16lJXM
	 ed2oVhbkQVerh4Q3UB7BwSERmFH1Ed4mXh2qKQ3JNjAb+JpVx/0B8dsUquJYszvKoyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C1606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82C1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677d35fd1d2so2062559d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:27:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296430; x=1795901230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=;
        b=yoAgVFGWzSf6iMaUDz13qB4el8TpMSjp0D9a9FNFAiG4/JH98Bhcm1HK7TTniWNbHI
         Rmtgl58bnHVID8o4D504wXjlAX5c7aDeMxQj97P6HI+2QwV28YOVd34/j//IhEmhILpm
         lotQ5/k5sfEVly9LTMAiwC0iVvbicdRt7QZZEjy4y+Ghh6fQvyrXwxYH6uptUbetzm80
         Ialf9f+2vMzY9jDmf2VOPQ/zVjn5RAnH2kjRG8mfHb8ph90pqgJ+5++pxs4Ot1XgE6Bm
         oAQ9UhAXpvad8vLSPZBmNf3c+N1pAtlaFOHlFP2eoii7hx7lHlTar+M0VOoPuuLJfNUE
         vWHQ==
X-Forwarded-Encrypted: i=1; AL+hErFnKMJAoVR7kTjboM8RbJ6fnDDzHFW3whIZJ7hO7SNmJTVsgA1dM3YVb2KTZi2K5cvI57kVCRd/YnNV7F0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bQGUFDdEm6DuJ6HHvvP6AA3peI3PoktsExj2V//YcBAr7WCSh
	ZgZ25syGjMG1w6T8d1XxYZNwmUCoNoPdGimEmJEwH46XlfPMuMxi5AxGC2H5b63l
X-Gm-Gg: AZFdTZe+oMQODHH56eR01LOngCAGYlv9Q9XDzVtKL0GE0TMoLMM3qIWldRi/2lqiaj/
	QAlAi5PtS6MJk50i8QRgsGu4S7Qyuwo7vKQi+4QWE899ufTk1ehEIPjx/0otcwBPs204kMbRJrq
	7vYFV9l2KxNfmrx9fff1l2YVtui4jLrOEKiA45gYgxaotaAmm9V2KP8U63PO5ej0n1GNa5SvDsP
	8FhUUVEGEydXF1n3RU7GhHzV40V5thQsQEKYqy6xvUtLq/cciMc4Ntad7059r0Jppm8/68NJVK1
	iHlBmU9k28wz4DYlB/PO0QFyMi3uWaMq2BRFK5fZDP4FtdPiAU+O8De92n93tpQNeDfF8xP+mok
	rwLoCs3Xy1ct0sAy8NZlKmM2lHncHTzfGRtn/gkX0zONNh+0+1yWSlHCrM6K/rmBWcSDfOyXYka
	u4xchW999xQqJ3U72NT+Xi0ARJbIYTxirQrfEC74sWnXq+cUD5PpWKjCBfIEyBJo5Tols4k4pF8
	Ro1xlagibB/SgqhvshfqdTYpeSeMKRD11Ki3qBRpWDMmbNDJn9izU2i0rN9x2P7K0ZVQba2btYw
	a/UVkasAP9D2MMbxnZOIB2m/VLj8BaBrv0hIJ0Aa9XypWCUrl03pb3zRi1IQRioKNiPRYZAbD/V
	Ny4if8kZQt0fg7riwl21jfoEs9Te+nGwl0/w8/H0hNIX9vcduQLKo90jIaQ==
X-Received: by 2002:a05:690e:bc7:b0:67d:bdf4:f432 with SMTP id 956f58d0204a3-67df42ccf49mr2112881d50.11.1795296429901;
        Sat, 21 Nov 2026 13:27:09 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3378f59sm3283206d50.14.2026.11.21.13.27.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:27:09 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b360828905so17462307b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:27:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE6MOgyR7YuqeOy/1akYL3ZqWy8rfzGgRnZyWSIOLePKvKCoMSe1SfGJ3nrKdT2A5ZqEPeINHLX9/BsLEw=@vger.kernel.org
X-Received: by 2002:a05:690c:6c92:b0:8b3:7782:675f with SMTP id
 00721157ae682-8b5204bb6b2mr23239647b3.66.1795296429324; Sat, 21 Nov 2026
 13:27:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
 <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
In-Reply-To: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:57 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
X-Gm-Features: Aa3M54q0-4I4quSKRWB1j7w8Nv6x5L8DyHdNe8I0CVnAIjNuxS8ecYBkoD_MhLQ
Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:02=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> w=
rote:
> [...]
> > +                       eth_phy: mdio-multiplexer@28000 {
> > +                               compatible =3D "amlogic,g12a-mdio-mux";
> I think this has to get a T7 specific compatible string (dt-bindings
> only, no driver change needed):
>   compatible =3D "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
>
> If we find differences in T7's mdio-mux compared to G12A then we'll be
> able to manage them.

Done in v8: a new first patch adds "amlogic,t7-mdio-mux" to
amlogic,g12a-mdio-mux.yaml with the G12A string as fallback, and the
node uses both. No driver change.

Thanks,
Lucas
