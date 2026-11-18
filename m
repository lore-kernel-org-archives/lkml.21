Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043633;
	b=CzhpsvIqD5IxFrAcEURQYdqNtBuN7y9HS6y4+uQRKOgfPmFxGzSYOV0PKgGdF3BvtWWA
	 RISQonZt9pJaNA5bsuPDFOkKp6SKES03BA/fbzVQpNtUe8OWDeL6Uq6K6A1Dx3Ps/Bmcp
	 zOEQMix0ZHKfat1nWVUCVF7eT5S0XgXlMoICbV40oVb2xoPPkRPo1ZtNzPYhdvMDhHnf3
	 26XF6nbSPEwhXGWnHBpRFv/7YZTShrZD/2wq1hIZxoIjveGxHZrm++BXezcSlX5ANIKxf
	 diPJrEP2XAiCWLTDKUnMztRNELyjjyCINs4btYWwr6vXDL4ZaCyscv/ZJbrJk15uToQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043633;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U2sLAuN9XmB+8Qa4Z+TqAPFS0kw+btbeuIVWSXx3mKQ=;
	b=0yIJ1fK+7bg3iMY/GHXiM6wGCZwRgcALyo95J3343OGR6MG2t9JlLa9rhmJ6+fhuTUNB
	 KY1xBUdFnKA5/mKxTtyWjlphVDzOfnEiIfKnUQTcawVE32lwx+DM4Wg9Yu1XGlHxJgx6D
	 +00Qi0/wo1tuJVmhnZEz+BSoqNdxZ3i1kJ1qRJFg1BwnthVtp4HGsD0CADzr3iTIWDItD
	 e70AyJ3OF87QppqYIBPSIpDMv2hvqChJlI7ORYXZQ3vUneLPdX7vAuzVHPz0Od9kdV7Oq
	 wO4tuEo66Yk1GmITPGcvMbPTYHiE5WeYBaXjy14UD6Je7FuR6sPz8ywkFUse6t3SyhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DwDYl0pG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343C606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DwDYl0pG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210FA1F000D0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795043633;
	bh=U2sLAuN9XmB+8Qa4Z+TqAPFS0kw+btbeuIVWSXx3mKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DwDYl0pGRRpXYPDwHzGQjjdAr7A2aq1eVNTLUE6zag/Wxb5mdFX42wWPpWbJL+8Au
	 9/ckG9LPhSyFvkpyLvS9i3W7GvVzfutN6oJDA66nF8/RVHrcr+JIVX/2BjHe6CYLBG
	 IF+5ujaMUVhqIop0RueXKEfw/1T5p+rASlTsIzLT8t+QFeawX23gbkSE6XcwMhh8Np
	 T4D5OcwaJyjXBsZ2Cpw8MzmJ7tBeN22mKDP75Pd0GumEzK1T0gl0mbyFl8Q3bFg23C
	 FLCEHOzSU/ABrKbn7IYiBS/HS73HOY3lAOW0uGOoI/5U/gxIu2cvFYKdro9NglulGk
	 268rabgU0JgPQ==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-716c0217635so406329eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:13:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGGfiEwlF3d+wYzBIuhwUj2cnKQVXcLaKDMH+JvHYA+PymEiD+Yo+0uc/4d7ep5hDlwm3EKplb5i2lHtf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fqEY8IKogL+t/r+uR7NKOVLrk2Q64afZbN6oxC8eNwpozK9JU
	42mMDfCQLNp1um6Dpa0OwUtYvL9hLF6BOEwyOb2dv7R5FIVOPAQ3cYz3LFAi4Do7XLoc4+HWMGg
	+Euob78Y2NPHQS3er4imLFivUzJbtXFI=
X-Received: by 2002:a05:6820:3505:20b0:71a:fb85:d056 with SMTP id
 006d021491bc7-71b2e1830d0mr153233eaf.6.1795043632256; Wed, 18 Nov 2026
 15:13:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
 <377f9f22-4ef6-4b55-9276-ffa4893eda1e@broadcom.com>
In-Reply-To: <377f9f22-4ef6-4b55-9276-ffa4893eda1e@broadcom.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 00:13:40 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqM4uAi-YZyWKc8nJv3TL67tU1VnKrAEXTpLV6Pgn0BrA@mail.gmail.com>
X-Gm-Features: AclHuK8eBwJrfhyin3SZg4bGLsa4kZahp_0pSqnbPmibibSVGeBRbc-WcUQOYsk
Message-ID: <CAL4WiiqM4uAi-YZyWKc8nJv3TL67tU1VnKrAEXTpLV6Pgn0BrA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: bcmgenet: write the Tx producer index when
 a frame is dropped
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Justin Chen <justin.chen@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 22:01, Florian Fainelli
<florian.fainelli@broadcom.com> a =C3=A9crit :
>
> On 11/18/26 12:40, Nicolai Buchwitz wrote:
> > With xmit_more, queued frames reach the hardware only when a later fram=
e
> > writes TDMA_PROD_INDEX. If that frame is dropped, the write is skipped
> > and the queued frames wait for the next transmit on that ring, which ma=
y
> > never come.
> >
> > Write the producer index on the drop paths too.
> >
> > Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

I think this is a net candidate, even if you could not reproduce the bug.

Fixes: ddd0ca5d60b3 ("net: bcmgenet: add support for xmit_more")

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
