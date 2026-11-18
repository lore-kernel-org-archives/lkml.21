Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991237;
	b=kbhpqD2E0nmrCQ32FGNrSAcQxq/2EDaslwIT5BE46a0q7r14QOENNesdQqkOvvFZZv7P
	 1nIv6l38gOznQXCThc4Dy2jv3kb61267N37QVbtU+Gcic+ozeOC2koK8MFp+XCVzI29LL
	 NsfrSKUBYkpGy4iPgUlbaKudgPIAYgVZKd+MiRLqEg5qIE/pepVxkJ4BP1nEcmfnvvqu3
	 XjEsvGvmcD04RAqSN6g4Mo4WERo2mBmAgDowXi+Mfjgmp0JqvFF11kpxRQtEdjC0CjVC2
	 WyNDAxxjZsve2dxbh/+XAlxdV1mVjSV4NrcEVAGWL6rv3109Sd68yZLWPEJkSjcv6Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nxBFBJcPsYEHnoML0v/R3WCL5lSz1O0owQoKLBfb8eE=;
	b=GuJAiYkvJXX70JS5DZ4fui3Yqz0hIlWRWVUx+8Df23DVTzLp1FZHIKwSW1PFkfQMHoAm
	 brXkfZ0HyuodM1E8s4uddSW8lk+avs0NghYCPeVoQmfRPtdey31g4NR6Xp2ME2tdwlI3Q
	 ScLrumKIdGH/8IGILbk0XuB6Wvof6+P0l5kQiGiJEVnaFRNhSyZFO1qjsCQjfwjl4nJFO
	 FQ20IjYThDvifzDcmYkQhfOAKAGQPEkNlAKC6MaCvNXlB/+mbHdGWG0ilqJZlpVTYaHEj
	 nw/vacuR8iV4cwyDvO9VjED3yqWPhHJDFlr4AKEa19wrzRgoPygoOgBI+iA3U0d6A9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6LULoa0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E57606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E57606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6LULoa0
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso354038eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794991236; cv=none;
        d=google.com; s=arc-20260327;
        b=H8O0L2wUnl2h7vvnAeEGV+LBiq/zb8zvL9Kh/815LHkBYp/hj7rFlY4Q7nRqzK3rYf
         H0ocZp7PSraE2jS4LW5yeQlW5aN6TG0TDskXpOTIN6B7ulFhYOzfCOmb/Ltlug0udUNS
         t3Gd07JYPsUTt8Jh7PWlBDdvGp8gRHH8CCogeg0W47ombAP+VjUUYwrGHYgMOY+3UBsU
         U1wRfJElUbPRNow9TIMgfFQRM7TOazBZvXraOQV+X53tkgS7sU83zI6UeGNM6HrnHAB2
         SnnRBTW7UwLolpDkoIheWFFaFJm2i5A75cjEcdyI/uKmeypFSt8O6K8nB1K4a2CIl8sB
         6agQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxBFBJcPsYEHnoML0v/R3WCL5lSz1O0owQoKLBfb8eE=;
        fh=jCfMcWuhD2Hjq4RZyWFCYPjW76sPXLtZqyY3XheVYCg=;
        b=PVcAUM3xQGrj0c5nu/9Ir+O3ZJFzCrM5ETVGx0FowGjhQggx6+Lr8ElSNqrcIQCWnM
         nIytUjB5kQwchD+3E+B5Zm5F040yxw3n8jwnV00/0EDAuK0MuixJjRUg8gVDd0H7JMol
         OpzlOJwf1u9rcgHCPiePj7NJiXG43QDyFP1zUnwfXS+YxZzKhjhoxeRI3ID9zJysc9oa
         GCDlrgfVfcd5yAJmWOq/v+cwwHzVv5aAI9tpb9/P7QSYtTGDBuig7P2+vpfEbpQiSdxR
         NpKVs68G0+0Xvmpk7XtHqsues4E+xOuwM6ua7LWekeT+e2YKux/lQyjD1MGx9kA41VXd
         RMPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991236; x=1795596036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nxBFBJcPsYEHnoML0v/R3WCL5lSz1O0owQoKLBfb8eE=;
        b=R6LULoa0nUEKQ7noASBC+IOahmdb412tvQrJrTLxZM/BlBucf7gLQwhmI9N39Tx0iK
         hP6VkKt+3wD1Bat7iBJvcIstAmngruwpy7MjvJOmOWOH9wP4TB2IGFUe1D1AxXXBuStT
         eZvxl6yH4iFUQnzT9Qcmh66wJDaXMZudBDxekJq5eh878uUySEtZBoxDFGrmceknVxoz
         CfUfvEjg3e1HELAnDnDpbdWtjFk7ofJeyXC6FaEendOgus5q7z7Qm5oDQ2u/XBQQC4qd
         xlxaErKSNW4zmLqlVTXP73+bwMw6AbUacTTbxXlmkfH0jYvyB8ZfE9j6vcLQhlR4lH1V
         EJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991236; x=1795596036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxBFBJcPsYEHnoML0v/R3WCL5lSz1O0owQoKLBfb8eE=;
        b=HWYnNRrjME4Nv/7GSEr8SnOFpgyoPXGY976EjH07cJI6N3YpNmXwMasW01+GIBn5Mh
         aBPJrLI4ykzKV2Lh/GyfvoEz1Etq2MPXFqiUyRGCvrh8XDeVfaLRMlCH67rRG+KTIPhg
         IAClRCg8jjBfjitZStW6kye4UJgl9W1mr9KiG+yVk5FZlCx3Tza7lXYGiWf1GLG4LK69
         sjY/Qwuh2+aKc2Zw93tnurwpMgHI6MrFiD0GNjKAeFyqm7S3j6bYpmj7ACBL87J4PzKp
         bzzVDoPTlG8mVoxQyxbVXOllvtEcJkRN4mpE8evzgUuih2oqa9Alu1TPnqu1qLtAK6aY
         QbRg==
X-Forwarded-Encrypted: i=1; AL+hErEDhciSW4MfqoKd6kA6Yc+OKBvm+GK/1ZuAJYFWFj4tIysJ0aNfxguIPFGj0pL1cUXl6MiI+Wa2+ouUCWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XqEvzdtDvq2o8oG0iXENP8qXBnl9rCHWmlP85i9b1lMVIhi47
	wtRuEZkRLCUFADhmiNE/6q9PzSWmohUY+5mFINcT7gduaZ/yud3l3kkUipASkPCSCq6EhXmqm5U
	UsfZEp+tVC9xhlOukC0HNIqj4vz/du0U=
X-Gm-Gg: AZFdTZeTNhQll7lFbPFYmzXbfJQmKCzjNR5/tbWoDZWIEAWwL+N1YstCaq0JBdPVG9g
	jUslq0Rzad1vvD1I1i7tjuJZ6v2gQGH0cRS8nAsmCaiifECIBz2kDZGexh/YgEvY9IKtU0J+2H4
	Q4sJO1+kznlNZ/ebhQ6nuwswZUMICetr9BNyxwXeI+o3N0/PSostxlUpnIpEN8DMVUEXy0u4EQu
	okEdiZbY13G8ygigkLwVO/RgJS9nTIEsD+0yWbwi3Gj11b51j56exE0O8FVPRXgPinSboXhnSWR
	Sg/EsAVjDX8qco4o4b7M7HIzCxd2GoGth+5Dz6fNmVg4xNLj2wwuISA+VrxOddCuCiH8F8bE2CC
	rFpZAfA5FyyPzVqfpX7A5oUIw129R8TxAigBalMgx+bMmA1ZWh8FvbyCLQB2/E+WgXKxmRVjsI2
	XXe+LDecIIjZ3iBGkqSUGAmrfPJgd5wQ==
X-Received: by 2002:a05:7300:3395:b0:377:3984:5cb with SMTP id
 5a478bee46e88-3810f02aadbmr5027302eec.17.1794991236131; Wed, 18 Nov 2026
 00:40:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251013060018.43851-1-clamor95@gmail.com> <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
 <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
 <aPCfiJxyKOXsgNJe@shikoro> <20251021132529.GA4133357-robh@kernel.org>
 <CAPVz0n3jt04xEwGr1aiDTJ7OonYYgOy3QneteLXgdGruXGMP_A@mail.gmail.com> <20261118091334.3d51a5f0@bootlin.com>
In-Reply-To: <20261118091334.3d51a5f0@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 10:40:24 +0200
X-Gm-Features: Aa3M54rharDKJbRF2DF-qewrb726K8b5XrfXN5sVsjDYYHGVF7G-51OovVUxmLI
Message-ID: <CAPVz0n3=rL9jVc7DtG9FmcH0zs11+LXg1+HRRf9aagUqZf=+_g@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
To: Herve Codina <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 18 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:1=
3 Herve Codina <herve.codina@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Sat, 17 Oct 2026 20:17:39 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D0=B2=D1=82, 21 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE =
16:25 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Oct 16, 2025 at 09:32:24AM +0200, Wolfram Sang wrote:
> > > > Hi Svyatoslav,
> > > >
> > > > > Herve and Luca did not come up with anything meaningful, they pro=
vided
> > > > > just a few rough ideas. It will take an inconsiderate amount of t=
ime
> > > >
> > > > Well, IIRC they said that your use case can be mapped onto their
> > > > approach. Which is meaningful in my book.
> > > >
> > > > > before there will be any consensus between them and schema
> > > > > maintainers, and even more time would be requited to settle this =
into
> > > > > schemas and implement into drivers. Why should I suffer from this=
? Why
> > > > > should changes I need be halted due to some incomplete 'ideas'? T=
his
> > > > > driver uses existing i2c mux framework and fits into it just fine=
.
> > > >
> > > > I am sorry to bring you bad news, but you need to suffer because th=
is is
> > > > how development goes. If I get presented a generic solution (see He=
rve's
> > > > mail) and a specific solution (your driver), for this case I as a
> > > > maintainer will prefer the generic solution. Generic solutions need=
 more
> > > > time because there are more things to handle, of course. This is ty=
pical
> > > > for development, I would say, it is not Linux or Free Software spec=
ific.
> > > >
> > > > I appreciate that you tackled your issue and were open to share it =
with
> > > > the community. I see the work being done there. However, there are =
so
> > > > many things going on independently that I can't really prevent doub=
le
> > > > development from happening despite it having a high priority for me=
. As
> > > > soon as I get aware of people working on similar issues, I connect =
them.
> > > > That's what I did here as well.
> > > >
> > > > So, if you want upstream supported I2C hot-plugging, you need to wa=
it
> > > > for Luca's and Herve's work being accepted. Or provide a superior
> > > > solution. Or, if you want, join the ride. You already have experien=
ce in
> > > > this field (and hardware plus use case), you would be a very welcom=
e
> > > > contributor, I would say.
> > >
> > > Agreed.
> > >
> > > What really slows things down is when there is only 1 user of a new
> > > binding. Too many times have I accepted one only for the 2nd user to
> > > show up right after accepting it and wanting something different. So
> > > now I just require more than 1 user and it is on the submitter(s) to =
do
> > > that. After all, it is their itch, not mine.
> > >
> > > Rob
> >
> > Hello there!
> >
> > Were there any advancements with i2c-bus-extension so that I could
> > finally configure and make my tablet work? Could anyone point me in
> > the right direction? Thanks.
>
> No new advancements. I moved on a prerequisite: Having support for addon
> format in dtb in order to have support for a list of exported symbols
> resolution when an dtb is applied on a live devicetree.
>
> Anyway, the v3 series [1] need to be updated and a new iteration need to =
be
> sent. Also, same operations need to be done on the SPI version [2].
>
> [1] https://lore.kernel.org/all/20250618082313.549140-1-herve.codina@boot=
lin.com/
> [2] https://lore.kernel.org/all/20250729-spi-bus-extension-v1-0-b20c73f21=
61a@beagleboard.org/
>
> Best regards,
> Herv=C3=A9

Thank you, Herv=C3=A9!

Rob, Wolfram, since the DT Addon framework is not mature yet, may
i2c-hotplug-gpio be accepted in some form? Maybe a staging driver or
with notes that ABI may be changed and are unstable or maybe as a
device specific driver only for transformers like
"asus-transformer-dock" etc?

Best regards,
Svyatoslav R.
