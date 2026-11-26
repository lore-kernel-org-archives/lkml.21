Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709137;
	b=ukAUjYWy6X39968AUHWxXhF/weuf1iuE52UErCOzveIAZKi9k8DdULYUwcGf4C6lSp12
	 9gkDbHPiaB5T5+ViCzz62Cm3CDkny9Y55ixKgUb/3hSmJVW6jFM0QbeABxNjUlFqxe2LS
	 06Vv4FG0XBVXatnoJhCq7vwo9EJbrNMZfrErZ8wO6fKqJrYxwu6ntFZNUKvuQr4B+BOUC
	 sMDe/C7pqGnUOebzsPCqgG4GV77pLi73qAVcvMy8Nr9IS+NixjC0PC2Hp+d2NRvBR8iyV
	 qNvRw7FV63qKD6Ub71betCQ08omGKfFPuxVtFnnx9Q9/elOcPstN+AE0WkZ/54TJsRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
	b=St32d6gkIh2JFAizGcdi9GYxVLp3B4uvAuzRh4jCIuztwmDW/zkApYhNTIaaBf+DTTux
	 9N7+9+SuKgQGbEfJ1FVZw5420HYZB0bn3MPTI8+plIznpPj/gcV7ObIPnaI41/Y+9b3GT
	 0PkZHBLqOVj58HWh91de4ggeUF5+l/etWfhFV3ijsMjpFy/VkD3WSbnmW/PPLKch/Q9fI
	 KhYQiiIZ2v3wIu8zScW/ibROvcdAPrzplTznAW14BqNLEetx/tqGlyXWDfyMh0H/K/Xaa
	 fhmz+dCVeIv40UA0HvxEhg5114KZtULldhfr9jGnnKfj5XvF88+Z7sEWkmSTbLJI8OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHSFx1QJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2C9606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2C9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHSFx1QJ
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3869f03af6aso6300793eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795709136; cv=none;
        d=google.com; s=arc-20260327;
        b=etEFcKBwO2B66BLwG5i1Vi9WuFiV3gqa+F3F9cz09gkmp/STxWl9wwIY31VywN0gQt
         v6X4BJc0VhZc+igWu+sbpn3in+glWJLQHxH8+V30tEa81QNo4+4FBdRSbzcP2zi1ZMBj
         y68xAVj6a6+ULS1CNbPDQz7ZZIL/2SZcwzl0T+Ookx2VZQbqF2aIgibU8aiCkur0laCO
         62lO2RmPy2IWho6A9GhiE+mOd4tBHMvmowgqTfIdpbxvMbm/r1+ZnPqa9aoRflmJ+xhX
         v+ZOG354/vUM3wIqQ42qdewQVcB6n+yIOUp6HSV9mnw8/ak0QB2yRWp4iPvQvEjZjb/4
         Py4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        fh=ryJu1bAE4l4luRn3G/ruYpwxOmZwYIWJOq//4II+0eg=;
        b=T2UV5TuKfZeixwGiAcY7RAUyhHDltTFfrzc1caMCYd7nQOlcF+mfFfjy4lkT197wIG
         YnQGNWXEAxmdA/UPTHiyHeGI9vvNsbR2E6iV5teQ9Oq3Q9cylpyxM5IN6H76EMQUOMIo
         s8kqMdpM+Qjp6e8VQG7Km3hRA5tF/buQR+3AMOueBxRyLrd/CEjww+YHoljPuGq3tY8H
         iAq8pzAFi5EH/7DahfwKi98ZNCsAcuH3zYP7MBDIM7FDHUHyawiXWsAp1jWzVd7LiY8E
         /bFcdIigDdpDzcQ/SM+HprAPI4gqE9EUvU7mMixe/JiQ5UiYopmLpbjhbQNhELKwUZKk
         Qijg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795709136; x=1796313936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        b=LHSFx1QJD64NxrJTjVySmgdy1+QyIpvCZsYsHetuKrtGZ73f+yuvN6vVAQpjFgMJUi
         VMebqlntGR9XwTnjXCDaI+DIdtf3eb2aF7NzhdKB+TAA1SpPsymVwDdhRZSoDISFZBhy
         gT3iGb69VLDLPi9SbtnLFXY/8PaeK0RPmcJMc/viANOYEle757NWA7VFKq9hCFqzP2lG
         PHdadIr7rt0xyZDOTl/9sp4H2DE1XwTnuwY+DK2k8n1YF40bHvHKVFg9lhRaEeysJymQ
         egJfvS/KrIqmEnVEjlJQrOyfCZ07jPJk5/NRhra/84mmDWdhjgDezO0k8WppPYOSFRyl
         cHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709136; x=1796313936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUnFJ20ylsoLsoRM/3+fupg/CFOT8c8i8zd/epg5cmI=;
        b=X0sgjoekncVU8z2Ur4znvsKCvzeGxnTXdwO95hbKeBCyJcNzc8kEIo/E6kB3oNSj8Z
         kj1PC+WCg6EVwXEtOC8x7s3eqRxcrB3CcgbFa1CCVVKkEkDV9T/DHXt4jZ4bzNJN6ALp
         N2tomEk+vaxhycVFl852MyIUvYGY2ipNWZ+stlL2SW9lpPsTeOgiPPbFTqf+GJp5i/od
         E5IbbnxdQpJn92UiH+aaE71fjMd8P39XityeLruZmABtv1AYZ3I9EuuL7axcAL9fDnHI
         BahoQK1/frnFVTapLODLUROUYi+XOT1YAz8KeBmqqVKKpRLgMeAU+7fLQpOMHjxtSXwV
         FzZQ==
X-Forwarded-Encrypted: i=1; AL+hErEAEM/1aGJ16eL+lpGX3tZpFkJtQfOHIQIxBuxsZfK5c3XTdwtOxU1LfyxWFgo2mpxo5UtGHLFWeOlkOv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ad3s3OUw36YH5cMYN6AJIDKD0Q9jL+aa4ed3f4B2vOuLiybEp
	fmIts6kCa0dedtk174qd74iDojR515HDY7rvJCvcpFxb1+L7l53oH55AYHWH67RIomRHqXk6yJh
	lQttlIUSFVFPXNrUew64qCiv4w4c+oQY=
X-Gm-Gg: AZFdTZcX4iG4dNuBSkkRNrPdEEaDRWMvATVKQGzo6l1H1dVfWgnyzTju1+M0Rg/TQu5
	2K5rmD9EJpJ7elVlFZcmRJb5zItBUiKW0L96EFWXKKVY+T+gp72cr6RsgXb7WEVFyrYQFpWdSZF
	SHnTkhdve3nk31IBJSb517+JRxgmFKK6XIvZKtWHRUe2AE+0Sq5NdqyEk9k5tNz66jdHmTO4Jey
	v5IaYCfImmlRMYamBMIsfKbUXcQpo/VvBpKCdZzZmPEfyBP3HPH+ifCG22RefZG0c+2qRRO4kjn
	8zF2Jvqaqq0Gpb8rPzNB9HwEalbI9VX1ISmgOTd4Hq0N73RUW1ECTjpNtDEOGZ+hHvxfjewhW5U
	dNsHZHjYwmiYxj5aqdxKPykqyuvGUFD6U9PE3LUxfIrFjIhU1PdZ9HM7+Q4m95l6B553Q4cX9B0
	QCacIkgpnlzI98h1yjQALfdD4p1JQuJg==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id
 5a478bee46e88-384b3986ef2mr24979842eec.6.1795709136002; Thu, 26 Nov 2026
 08:05:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123150224.199601-1-clamor95@gmail.com> <20261123150224.199601-2-clamor95@gmail.com>
 <CAPVz0n1GzY5BJLUZrdCgJHrkZ+45Kix7VP05EJeiY5FVycwKBA@mail.gmail.com> <9a9cac1b-edaa-429e-a5b5-46adba2841ab@sirena.org.uk>
In-Reply-To: <9a9cac1b-edaa-429e-a5b5-46adba2841ab@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 18:05:24 +0200
X-Gm-Features: Aa3M54q_Z-vb7dO5r0L6AcMqg8jjKTFPI9XHDJLIFJzWvQsLcNuaX0nGCAYJczI
Message-ID: <CAPVz0n2-0e6L57FZBwz_azNOq-1Bn6023vke-=KB3a+GmyPjCA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:0=
3 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 26, 2026 at 05:52:22PM +0200, Svyatoslav Ryhel wrote:
>
> > This patch is prerequisite for MAX8907 LED patch. Since Lee is quite
> > strict to what he picks maybe you can pick this, LED and ADC[1] device
> > tree patches?
>
> Please send a coherent series that can actually be applied, it's too
> much work to pick random patches out of independent serieses.  In
> general you should try to avoid dependencies on in flight serieses, it
> makes everything much harder to manage.

Ok. This is how work with Lee and mfd usually looks like :(
