Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991945;
	b=Jf0KqHH/d1iOe/APbeJdHQMP9Orm9oYU6lmupZ5PX+P/idztFu+0khNSavwBIZbMoesK
	 K5uGmH6plazztYoBl7vlem//M0TVRV1s3P4RLQ4ZdapWzsAMp0YEvL2b0caoZ46Yoe/KP
	 O5loHfIRuH1Selig7qOK6NWAn5xszgvZV9pyjbpBiNoE9cmUFzxvgd5Cjs8bff7jezc7L
	 ojIZEKTtMrHJK2xtO6VI/sAPXMKat5SHQNWiyVAIlnwLn5gk9Ioyjdr1cKGsfl4xw93A0
	 xx+QllC++RusDFZ6AmFBOIRc0HTXOvEXbXan9+NDejsgiW/1V2XiWBuOkxNlKFlKJbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
	b=UlVdwfJLbHyU8dBSQtgD4gy+za0+KVLFczCXy/+qECD467cV76i/ztOcPGXJiVOdYMGg
	 EY7y5guJbVuUFfxNE1zHFP1PwPr7NxdO2pXqdqwUa3UdGKVPRwKhIYeVWF1nOPaze67Jt
	 FX/0cW++GByv86tfXBM2qpGMS5FcbqWoqf7hxND45keW2w0TNzVuUE+ZarA/jXGgYSt0n
	 aOj8T8O/Swjs9vph1gLQN71KmPp7FCtILMDSdeawGIbu1jOauIHmFRb0ILyX9F8Okq7hE
	 xEuYUbjjUUXE4C7cP3l8g3vUtP4ZSKYQ7Ywoz3s/WMTNzpytJWbCmUQHkVssAmBHsfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabG479g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D307606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D307606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabG479g
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-382c3c9671fso696838eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794991944; cv=none;
        d=google.com; s=arc-20260327;
        b=CM9he2xjW5KcoxHYnBKe0owI4aFHKhh7FYAUcnAWbM0bX9dTTpM2tn9y2MSbOAXuEm
         1Vnv25rlfvAi9Yb4wtqqslVKDHbrrsxnXrSNgeH9QHg+UwukWLGE0CvkmhOVXc8rG7oz
         g938TAA0OX2jnXX28DSSDNmRD24BwKVnjcYRmywW4+NpHxGAr7BuBoCIzFhdMuC4SKhH
         QqO/yV2f3uz5mJBu7xIS6P9Z9Spm6IbuNLHtQ6Tvl+VHV8jjk+Y5VO7eeMbvukovqdlH
         NtPQL9xeTnIbzCnZSYI26RTcTgMqQnAiCNSPdLw+B1UN9KZQNyNiUVw2iGW+qDvInMgl
         Tp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        fh=ZlWJEsoRywBovTNp1NK+8owMd7YVmwGvSFzr7zyhf/M=;
        b=IH5jXPGV3jObhcXO5vvqYhMi4z2fej2Ieh8YI3ztRfuZPxVRYIMeE9GEG+SQ0xV0Nn
         bqZvaZ1DHPXXC8gaKV/jw73xllo/sOTmNXApf1h7qvoxYyWjrEKkJ7k9KZUfNLX9AQor
         6nwI+Zgcm4IhMor1iE7L8ovHOK1W4vh/8vm9pueEkhvyR353y5uMI8JCVXyIDJ7HopK0
         r6yfVPm1a3F2Q6rrd+6vRy+ZkeK2I4Im21uWK+JZ9ILLm7/ttyI98ISbRDWPzBuq/CdY
         8DmwDFDPju0+Gozvob2w6ogqVlXYcJALLOzHTpFAHcFg0JZhQaAQ0/arOYwfe/4epC9B
         Wl0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991944; x=1795596744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        b=GabG479gc7SQtMKk6DUrhHDQXHroIceWLhNoIHp0kZP11T4uJNV4ts4eVR2bGpM5WI
         8Mhz2biSzc/F7bv3izo8A5vZl7wp3vLTa2I2Lqaf+gLsKbgflvS1ReE0JkPH2eXxg/B2
         rBXOpfodZSW3bGHJ2LZPbpNK9baCxzFl9nHtbLFKA838yANCndxu3C3gYthddFNl9nht
         JzVfgWpqrzL15vRDk/jeYU5loe/y9d88sc6QFsJ76e351jUPEoBzazu5kTzlgOsaaxuj
         klgmv9RQuGyOFaPK//yZO6OuIjOMR+Ov2oYOrE8pGUKIUYb5tqnBmPWNbS1qUBzO7VyT
         NUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991944; x=1795596744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        b=AhXQKLWPeD2zvEvK4JQQlAR3cNx7DEWohy+iR+Gkpuc4Hiw8CKUH+wVlQeBAj9nuHU
         WsNLKfgg3/Pbqdoq+a4x3eJUTBm8EoM4ZCki7v/TruTkPAYV61p3BQ41xupfDMC2umEb
         nMUoaqJ4gX/fOwcYwTkcIH4n4hCslzpyeDwR55JfJVNHgKfdif27PUaq+d+yos6CPYKO
         uupaAA3iUoKcMM/tjd0Jy/Cm5owdWzfN1QXJQwouE7+jRu5n/6rOLYpmAPZud8LrL8K5
         us3UZ7fzby7cWmGw7EP+C/7l+Ja1LTkKpfZETW19MoDSiTjrARNVQrV0v02jj4k8zVtT
         WHBg==
X-Forwarded-Encrypted: i=1; AL+hErH+1CGdFAhbBqnunWbjSk3nnFOWUxqeX133cibA5KOc73n+Ib3m7oldnnfNKM9l9E6wlV4E5UpIRrcs7pI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nwQRXDaBmc2cwCjsYLArn3zxcL1lhUXBGi7N0b/GkILzrDqPx
	R8YBPqe+MScKbLijpN0mFK9/5B1UfgY27iXMt7nagDhH4HJUXX/4TXSwOs7jGcWIf/gL7XBRAxO
	Eg3JzgySmpo6jMJvmEBvWs6wpX7XT6R8=
X-Gm-Gg: AZFdTZcqIynpZ2jS0BA4YX0xvhOnJEY7ddhi+vtOKoOdbbXbBPWAnp7JRvQzzCAhIYu
	c9XYsUo2CREtbPEASNH9be0r5TuSaKs3WZKQeuT7dPKsI823sLjpPmp07TIFRowI4hafOE+6KqW
	FhhccGq1WWMHGPTKIXk+NGhoaFI219ELvTA7jNjb/7aq3eBZsn7jJm67Hc2sfwOrjBqfDeeacVC
	q5F0GJv2WD9yFRPqh0Qixj9uvR/EoH+x0V2O0/O2s2WF5nOxSXn8QxNMeCkpk5AdU8RKnjDFmXL
	KyJXyA+eBQTO1/5uhArdjYhaqGPLykq7Iv6XEtKnM5pqW5BkXZ60vF/LpF8hcrCbYH0uLBFzdyz
	El8Qxhklj5D/7TrXBrpF7aNdRbV2/xpmaDsk8k/2HOnDuWUqn5/hIPHMlqy9NbddzavUoTjTTLb
	W5T/V5pXWCvmHmhQg5NGQXmLVjIFwKJQ==
X-Received: by 2002:a05:7300:d210:b0:374:c5cd:42cf with SMTP id
 5a478bee46e88-3828180f712mr2187391eec.35.1794991944368; Wed, 18 Nov 2026
 00:52:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004165204.205660-1-clamor95@gmail.com> <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org> <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
 <avxHzF-uiOAhwXIW@orome>
In-Reply-To: <avxHzF-uiOAhwXIW@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 10:52:13 +0200
X-Gm-Features: AclHuK93RBJ02mfDmLX1EGnWRCzqbB375hZf8dudgwlzH98v_5reAPWSy751p0s
Message-ID: <CAPVz0n2h_uzr1MRZWSxUiPwu0=mXjhOwaP6HTFHDRV9DmF4z3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB
 properties into a dedicated schema
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 17 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:4=
0 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 27, 2026 at 10:51:52AM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
00:29 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > > > Move all Tegra-specific Chipidea devices and their properties into =
a
> > > > dedicated schema file, by analogy with i.MX.
> > >
> > > I don't really see the point given it is only 2 deprecated properties=
.
> > > Maybe those can be removed? Depends if they are deprecated and still
> > > used or deprecated and removed from .dts files years ago.
> > >
> >
> > The ci-hdrc-usb2.yaml schema contains properties that are not
> > applicable to Tegra, and conversely, Tegra-specific properties are not
> > applicable to qcom, nxp, nuvoton, etc.
> >
> > The 'nvidia,needs-double-reset' property is required for Tegra20 and
> > Tegra30, and it is still actively in use, as you can see here [1]. Its
> > marked deprecated state appears to be incorrect, as it should simply
> > be restricted to Tegra20 and Tegra30.
>
> For what it's worth, I looked into this a little bit to find out why
> this is only needed on USB1, whereas USB2 and USB3 don't seem to be
> affected. Turns out that USB1 is a different controller than USB2 and
> USB3 and it has this errata. In retrospect it would've been more correct
> to assign a different compatible string for it and derive the quirks
> from that, but given the ABI stability it's probably not worth
> correcting it at this point.
>
> Thierry

Thank you for the explanation. Having a common schema for many cases
is great, but IMHO mixing different SoCs in a basically SoC specific
schema is not the right approach. Having a dedicated Tegra version
like i.MX has seems beneficial.
