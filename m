Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795087318;
	b=4+owVDzwC9Gj+rrI9FTQifYT2X+1kBD4XvlQD8M47LCIAuwYfCM4SbP3i+yuSRJeGb5Z
	 2jgWO8GQYpNAMgq9ooZbQCETcTdqlH72EbYNbmMHuCMUcpECZh+0FmWa9GsnDBnvvw2Oy
	 yN7iN13h7CSk1OxwE09mwutvTupjrEBqZ8efKOUOaYnDaIZ/W9kzxMN1O2vyq+gZdZxR2
	 Z2vH/RdBUhmx4REpKQ92Wfom4XY7D8/3ce9d+D7ewwEjH2f2vtkBUDuaaW2e3UC3TQQjF
	 usE9aBo8ic72fMruwBZV8d0zkhX0U48TFaXPF9ENUoztYm2BhW3XgME3I7XCvWpdqBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
	b=JoMuhjNHETW2T+PuuzIh36H3788ymubiytJjJKoKwqUwdVpTe0niBu3y1tYgP/lP5vB1
	 Rl6uqYd2Q84RKoedIyf03iNEMI7pthqgO9WpOo0M8ktFc5oIvRu1HDhy5500nIl42Rq48
	 cO9uiiX66wIIVGeAXseW4JoG/xy809PXadplaLaKQUyPUe58ksQYN0rLIgOuZoBaC533i
	 KrqbDuhxICtHEMvLXqxp/ztOfzV184Wf35eq80sxhsTa3TzrRa6SKjj2HPEKOmrKEx2zp
	 AJpOWukCKwprOoJE+Jdalw4M+IS1d8RokBcBgabdkdv2CClfuKXmnj4Jo5q1OgZPiyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=s2W6W56E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B12606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B12606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=s2W6W56E
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1364795e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:21:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795087315; cv=none;
        d=google.com; s=arc-20260327;
        b=O5uCl+wjr88nYOlGxlpDTcY8B2x/X62JHSD4Q59MTvyBz/YQw47e1XRbXvQFa4D7Ff
         IbssJjNexmaYp5etLRSNh0ke118IblV6CGfG+uODTbuPOeU8dea9mx+9nlZP5uvB2Wc+
         Xfd2uHtMVbDarB2cWSFYsDUmfHXvCfcZ+6Q3P+t7NNJvEI7yXPc3851jiAzMqklHJUQH
         su1H2W/uSm7vRyar0NNEnhT+dFvE9IaeamNpF9cXwB3UxXp5z2Xdug/JOA4aVvyGIRTm
         4o6M71KGvrnm3g36TiPjOnf5Xj/yxtrZDpSy4yYmw+U1cBoig4ksYxlkNcXAzOhIum30
         x/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        fh=S0Vu8vyZrF66iRD5SSLjdGoFoFYE7vHVGdnx185fKTc=;
        b=Aa4zARDYqvYN2K9Dmu0zwT9xfw9wxCcjJHVfl/EKpNH/prF559YPKR25ZRnLg4dRqQ
         9y54ew569MfLxlXtK3/cnF6OKj0PpXaFQ+KfdC9ifk+CsX1pGOPKzSxBXOebfGL9mm2s
         86FKa1baavCytPLYkyV/FcQsO0096mUVPKf+11PqPw1nUzz9C4k24aJdMztjJGMIB38d
         BuPU5rbpMfAsOtOb6SMl1hTIfOY+0A9C+DL4MFijGpU6FBzrEk7CtNMdfVNVysZyP/FZ
         lG4UD0IV6K08E/NBaw6T3Sb/ODY+fqxDo4iDAlE08SmvhR+HweRRtgbhuUNp2I1HoJap
         zi9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1795087315; x=1795692115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        b=s2W6W56EkHAjq2MsWE53R3kC43Jytv0YAFROxiMYVw+0ENZ66z+c74rgH6ZdiH1fU4
         KGBB4jcylCJeiYOupJ4bz6+GX4wcyzD08fWZXB3GyS01owsEs1om7aINrxujxzW2uEy2
         jatPWqS0Rub6R70OYu0/F7sMNRhJNZsOZKXs1eJzktcVfRkQ5MuQCCtn0FxrawwtIzO4
         obTOdBMLdac6PGjAiV3ceUXpCUFyRDBQV3o/OuLstxlvkBt5gRcEOOC91qO6ZQY/KO0o
         33Q11PwdwErAdf4tmAtoi3jjasYd4/XvPbAICpQhCCwjmEGzrzX2s+3xQqVI/t/Q7590
         Ozzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087315; x=1795692115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        b=tR901r191DbaYaZECgonoib86fB5P8KTsl0FQ0WBj4ZcsIzVoPVBJmcf1QPEud9e4z
         SLnUVTJ7HTuiDrbSRPxB7+z/IaBQ+HXEq5k/HRaJ6kxjCcNSvlZzbTIQrJdmsXHc1o1d
         D0/Ps8pWaRKh9Y4LSHyHQoL3gPBGfSdtsTGA4i1goGmH2yeTdaUQNktcwpdkq4zzJtUv
         fwiM7bUD9wBnRoUT6HSfHlLOogI4MpQ2A5vVqEVLWpg8xTmEakJ/lYTQBLRgz9H83+31
         R0KFbYP/11stGd6orQHxc384i3gmz41J/SuLQ+/atY8zafjLu2fTUJARJ1NbREJhhR7Z
         LZoQ==
X-Forwarded-Encrypted: i=1; AL+hErEqCnsDNNlKt9exUmILg2M7ezPs34bV2/S8nORmJrN2V/Ve44ehKyAG612l/j418bY+oJ2/a3lEMkNFpzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n6zYSrZort0ymaIne65qmr9DfEM2oKJhlehVHRomDc0nAfNK3
	6hoRbQp6+W5dqwl8VSbig4adC0QBUwPNTt6CuJz++S8o8GRgUK6aKXaz+LSFkQ8Olr85RkjLc17
	VUWu16Brs0bbfv+HGdlfIyxEptMdtwZgzKpMWomfXVw==
X-Gm-Gg: AYBFou3ZMX/XBQGXpyx+j4XaVXYZg1CVvQiUxK25+M/AsU1S2te9ScLBqPXKwcaebsa
	sRy7MH+2/dv1LNvL/O+qWZOAi03sPz/TQvMpEsG2r+L16yGOuJMHS+pW3AP+7SVEzGNH9CHt9SO
	wwGw7OPPWANHw+JLdi24ZFa3vl00kKxrsKoXViFsnfkQSfD3jxpNZpMWMg+Gt8VDQTM8dXUwCnx
	wCwdKMAkm3oH0NgkztFub2xmqTk5t5MfhyDL0lypaQhjdf8EDhLVb3w6LGM4e7abHjt72V6qezp
	0vQLowiOdZx0PCA+dT7ETKForIyxZQG2ceKKBo7s0gID+YpzMlfUYZlga68BN+PO0DT5ooywCdS
	AixpoTex8hnojqh4IXGQAKwxxKxZaAIlkq+R+/DqOl5sN8PjNjsq4/v1ulkZsSCGbm5iG
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1aa2b7f68mr1862082e87.54.1795087315464; Thu, 19 Nov 2026
 03:21:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com> <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
In-Reply-To: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Thu, 19 Nov 2026 12:21:43 +0100
X-Gm-Features: AclHuK_QkZ_OGawTlhhrvP9kkbP7VHlaRBS7KCVvE8WdQdIzwGrIlALNsg0Zi28
Message-ID: <CAFERDQ15_=_8a+0nYqE9ef_W8NWVnhys+mSRbkXtKtymDixvMg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Gaston Gonzalez <gascoar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:25=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> Sorry for the lag Martin, I will be taking those patches from now on.
> --
> Florian
>

Thanks Florian!
Thank you Jai and Gaston for the review and the tests.

Regards,
Martin
