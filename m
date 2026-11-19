Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795073160;
	b=BQw5WxyU0udmurBqq/UfljR7JEis+T5j6z9bQ5IYTnmlK/tgzp3Sta6w8ND7wnH4GrNk
	 bZkEeA8hDcu3UUkHY1ro+oG8EMKGydQD2xKduMUdHaVDwSesZ2Ns3RgYdWHbGdytt8Qtg
	 seCGkJBaPvOkz9ySPfoxcAd6/actUqeaNWQ2kSMSURKV7amAxeuR9oXD8fvKem56GJ5Zz
	 EkpGI30FG9Qm5/HgtR1DKt9Eh7XMlLEPg+Zc09VFG5+EiPj/Q8dMZRYUA1kg7VP1unkDy
	 z1SlRB9NRmofZ0nGuwAl7ZEsWgWY4yrrk2STECifvZZSKobLGJXGkUtwp6inbag0Ufg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
	b=2B2jem8k3nn1csv5pz5OQHLnkwbDPOooFqWywAsjniVFEpkgaWONHg2KTxkOyUKBxzYO
	 bLbtzhQmL+R18XRxdMz503tt6dEzS4xruK3MRlnNP1+EIp2b2TkyDvASpLzaUuBh/l0SF
	 eg5P8bNN9PF/Z6pNa9EZR7rJWO+fz8aRvm5ZblsxaVcVT00W9EvF1SD9oq5is0M1LYKlR
	 lv0LDeuGHsSH0WK7l8v7dNBZ+QDjicHXUV7nS3cJZPOOGBRBj7CKQFCCBR+Jk201hLBYJ
	 s32Cg5CRx8NC8sihKkc4aGgOOfOnRcxlXCJvAFYhzILXyZ+B4LXyJMuDOKMpRe7afMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC8Id32C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786F2606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HC8Id32C
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so2818882a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795073159; cv=none;
        d=google.com; s=arc-20260327;
        b=hjgAPiywG1ltd9TPNDzdXmIZt9qyRVSCKF7pZpipiJ0qvlRF62oPt4odhtIUWmi2ZA
         u/Dz5iplqvCpJUdxys75EhtAvs8ma/6i8N/4ty9pW5dLXtM5p4WKTqu194BWDceN/2Gw
         Dh+MYN3q4jnjht+t0VZ2RAqtrrFcE0Io/icltp9j9tA0nHhxGzBn2T3+n5IfIOTe+74Z
         zY7dMmh7lzKPi/897gV50mN45xbL5kuOgkE6SvI+QNEzPgin83phz4+OeXyMUEUouuHn
         wSLpMUq98U8Tkc86LqKEpvMvOdk+//ND0NiWnzuHbN2ibTPHPY8qAqRuC+8cIMNrf4RB
         aL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        fh=nFAN+UYEllXQOV6ji+tnKYC4Gyi9JwpxnnsG7oW+YFc=;
        b=bVjQCtz5W7PtelYQerKoKlpMW0B8lqg99qVXDvzspA4kJ7uvrHzEr4XJHsKCm3h2tL
         UJS6BRj6Wzo59ShfyFYi1z3KqgoioFkkfrKZZT1pBRb9KfDP91CfycdypUn2/VxVI+wc
         1vcBakvoWHhX3u5peMY4sG+ZiFGodvidp+QpmpKZVVqU+kWQmO8Zu0cWepzbTyCySIGT
         1rmRvyYIYMLeI43iiQcNkYd+dyAXgk7JQ8tEIq+rEEx8Y3iD3h+/00XtGTtcMKvgSwFm
         SGYOnil/zZ6Pv5wQC4SECFaD2H+dQOV+g6Yo+81J0jaPxorVV0xEckw1CnZOGILt9X6b
         KyJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795073159; x=1795677959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        b=HC8Id32C7RWMZBoXz82YJl81D1EqvihefSHlq5h8EUvLSFNV9QpAdr3ptsjLkhST3j
         zfeLncnprzaUqqgGCoJpffiGs1ll7ni4xogqY0TsPwmm0Iup0b0FIc/aDmk8ow4x7R8X
         NkEozZ084pCEcLtx8z3iF/CHKNhBmGYUkZTvTGRge93vS+FXkrk3854Fl+zvjjuBe84q
         pP2RWLoRXjx82FqmnOZ51tgibYjy1PqAQU3Fpw1C0PQ+zmOZ6TLMRnoy1iZL25Jq0hxI
         6RgD/BUnuFcHkkck/TOxfpseKYnGcK6NEFHAQ45r6dKn8UZwicceVJgsfhzDZZyn1jHP
         YPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073159; x=1795677959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qtvNyz6XUexBqsbLRSTVvrIS5GBWPv/KdEeKLuhwT7Y=;
        b=fn3rKn4J88p3o94XByo4vWS7BY1FSlPm5ZYzGVdghovPOhh5C6J+KnIrj5fZGR21H5
         H5g+l+ssVD59MfFE+DGTCFcJiOAthU5v1f0X2NZV82KL0KlZJmhA1g4gPMG1ZF04uilI
         YZBoKjBXfKPV6vmfeP2m+habSL+c4RTfVMpITbBNUoxFc4CdT2of/qjfCPMzTnHtQnsk
         ib53EbvoVFNt7FEBr4OKzATdIE9FcJ4QaAhEr98iPxIf3tQm0XgZiECykiEhgO++0qXu
         6fh6ZK+RdE4BD3R3VQjXUmgxAW8JpUN/2P02LIDp6Xo+Xpgd6NbAgOWXpcnBnGTY//H/
         WDAA==
X-Forwarded-Encrypted: i=1; AL+hErHsi3K7g0BaIM+8bZ0ukb8+8Tz4icMZUBDbI8eDC4TOi4D3z65ALZqizKZfdMagdgZuE0zVdY5ETtqlu/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lysLCl3l2bE1dBQyU+i/t8LUX/ntIS8cQpQGIHgYk7u8XHHYC
	rn8WqYaoitYeGwUcVH1rDXuetCrMprCLobOdvEHZmqVDj7kQfDmp00n7SNJaF7KceboP7gF3092
	DgHfOtcqnONJp+di35XNakSIuDwQ5OX4=
X-Gm-Gg: AYBFou05cQ5uDN6tSPMoPon5vmp0AVZyqtS4v7TMC0CjDImffTrpki+ZvgUq+pYzHI1
	xgwkE3Ht4G6FNl/JSNtHm5OgS8VtYfreeYXSg5iJ08dxkgEjodwF72x8P1+aWCJfGD6CyRcGwZh
	CWS7NizKE1IRSuAmfMH01zbBDDYsKU+Nz6OHS4yByZvFfzh6BIaw/Y63GWPNzh7nsHvJ4/kcra7
	YNNV8x3470EHKJTa2Oxw9UdErBXh7V9Sw15u7lOc9U00t6Gz7UOjgZmNm1s/9dmPw/nmDCAQ33E
	8w48XEJLKeZA/TTRREl8TBehToRZSkmuIsgrcXp151cnJ36BeCR79s1b5EkHKtrLU2HiuyWwWtP
	gjpnlgq4KE500eLeYJYX7vaH+sGDXkKDnxKAcoGciGjDTtlja26G4sE6fItDzHMQw48XNmAiOmy
	eoa/3klmf2l0NvOJOZk+oNjDWuAUEW4MWmyfmxoswkqyu5
X-Received: by 2002:a05:6402:2350:b0:6ba:137c:70f9 with SMTP id
 4fb4d7f45d1cf-6ba137c7371mr579765a12.13.1795073158722; Wed, 18 Nov 2026
 23:25:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
 <20261118-marvel-env-v4-6-200317e496c2@gmail.com> <c212df8a-6ff7-4a4f-a90e-7bb6c073f617@roeck-us.net>
In-Reply-To: <c212df8a-6ff7-4a4f-a90e-7bb6c073f617@roeck-us.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 19 Nov 2026 08:25:47 +0100
X-Gm-Features: AclHuK8PPneiYACCRObBpglxAjEW3linYDQRjYYK3WkE2RlBOYGn_Zv-GNu7UxI
Message-ID: <CA+=Fv5TteAQNLesw83Z+p8GFYiM+Bs_JYdVJyp9bGPEP8s+w7Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Thu, Nov 19, 2026 at 5:17=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/18/26 16:09, Matt Turner wrote:
> > The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> > ES80 and ES47, monitors temperatures, fans, voltages and power supplies=
.
> > The SRM console describes each sensor as a packet in a power and
> > environment node of its config tree (GCT), and fills in the readings
> > when asked to refresh the node. The packet layout was taken from Tru64
> > UNIX.
> >
> > The firmware gives each temperature, fan and voltage sensor a warning
> > limit and a failure limit, and reports the sensor in the warning or
> > failure state once its reading reaches one. Neither state means that th=
e
> > sensor is broken: a temperature past its failure limit is too high, not
> > faulty. Power supplies are either working or failed, with the cause
> > (AC, POK, overtemperature, fan) logged by the firmware.
> >
> > Export the sensors through hwmon. A temperature's warning and failure
> > limits become max and crit, with max_alarm set in either state and
> > crit_alarm in the failure state. A fan's warning limit becomes min, wit=
h
> > min_alarm set in either state and fault in the failure state, which is
> > when the firmware counts the fan as failed. A voltage exports its
> > reading, with min_alarm or max_alarm set in either state and lcrit_alar=
m
> > or crit_alarm in the failure state, depending on which side of its
> > nominal voltage it reads. The console gives the nominal voltage and onl=
y
> > one other limit, so the voltage limits are not exported. A power supply
> > is a voltage channel with only a fault attribute.
> >
> > A refresh keeps the boot CPU in the console with interrupts disabled fo=
r
> > up to 300 ms per node, so refresh a node at most once every 10 seconds.
> > The hwmon core serializes the callbacks, which also
> > serializes the refreshes.
> >
> > The console callback lives in core_marvel.o, which generic kernels
> > built with ALPHA_LEGACY_START_ADDRESS leave out.
> >
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> I assume thqat the series will be applied through an Alpha tree.
> Please let me know if I should apply this and the next patch
> through the hwmon-next tree.
>
> Thanks,
> Guenter
>

Yes, I plan to take the whole series through the Alpha tree.

Thanks a lot for your review and feedback, and for the ack.

Magnus
