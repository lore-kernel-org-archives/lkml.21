Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795596706;
	b=24Ms/LcfEMFfzJA1V1H754G5z6XpW9zQhWrHy9Bbahg+tVK00dCej/vP4Ccokm4q+HsX
	 0ghhod/itPF8WwUDe7RpaWG99etb/Ppob0lfRq16+2pdd7HqMyhyND2AsHWfrCblMyPVb
	 QlIsa1ZOtYoefGRdbQVdNaNHFdMnqkydDVwbLvmqjYJSqq4FY0bBZCLiFw/Dr3hSSsnnQ
	 foOCE7sUlXHt1MN6clvRh0Ivvqrmlw01XdWuvlwIantyKcYAdGR6nGvAHdwHzNWbSQtpJ
	 n4lJWP3Y+nIDKmDl7oJEbyenTUB2wecbcg8zRk1XzIoCYmYAnIgq6RuloadSvAXhgOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
	b=YvdCwS5rLV4fnThVO8D7lrk3MXdE0ZxWjF6gFe8GASbWw8ywB4CdPJah4tSgmrAdaZKJ
	 0GBvzFoSqsRtFzxZ8wj17Scl1Fzr50ouLUUBWr6VHkZO90BD6s8pjcDPyCQGxDkILMwDr
	 kU9tiiBA7RQiGENEokTVHfD3Mm745S+4c4+z6l0QlZojv80+l7ElyI3/y3EALicOMmX8d
	 Z5lP8Rqliy4V9O+bujFAy0SO7P/gAjvEOzoU8SvQFFKgQkfmY2HKvv+nHGuOhP77zAbKu
	 okp8TQSsIl1VvsaV3WLQlHeXqs8HwECflM6XXBSWcJA9TpYyH6xIc8VtC5UnLrdZFMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6Tgw5+8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3C6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6Tgw5+8
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92106d5371dso70575506d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795596705; cv=none;
        d=google.com; s=arc-20260327;
        b=ki6H+vig0JGlrFuZdi5Eswtod72mMDDjSH2CuvQX5qiJIvy2YliOaLVnYriEExDEQX
         7iASg7IE6SVRBsDyNc08dE14UfuGkjA6LduASg8HJK+/oWzmWJwmjM+Hm78ludUlE97q
         twlKcxBGWxnLItLaJ2tnYf/v1n4P/C1b5jBlDkqeYy8HEumqyQcbqDkoodMd3k7+kdHP
         EB8ML1HM0FPLq1aAYmW0soUtKDw4pUzyyg6JQkT59m9r+SIjqaTAsQbXRppv0eGX3gTo
         7kPYf30rV5rZXtvAD4vHnadIpIieOzeIkhr2GZV/SO+qp1rhi6CSYHeMB4AZUKfAHM1I
         nGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        fh=1E4EcHHrxwJhynjXWVIobG3O6L6THQ5Z5LBfWQhz8Co=;
        b=d3BA4M3FA3oZ3SnNPQgB11kc5HFgWsufoBtlL+g2ZxLp1a6nl4xbEuvvO9HrbOKb9X
         Mlg27csREPXyS3zmuv0p9HihRRLD4GfiCMc3C+W950oPakIWvkVptr3SyWt/tYWipJ/0
         NYWKgdM//iFFpMOLVvOGRDZ8ffUiuFTgaktcA44LOtHWomn0B5M3h/kDdiQZJTPQDjXB
         d0bhTk1Q0B3Y2qUOXlfs7iKAw/MA7glE9rlx2xIjaTCUEDRY7e9T+GTL7lo9Gm7/1pLm
         P2IYwNYBqFMiQqcttvgAVmsTwpeedE/HBmS1pg20LJVV5sZZiwHnHXVuUcYaYDDaNFPT
         py2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596705; x=1796201505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        b=c6Tgw5+8AuhyvQ0O6xvbT7EaPvrBiCZs++KPav58cWh0q/9O7wSlGgalTS79GBte9w
         UQyCelSL66O3J+8Zbc+xeDLxLWs1F8uNdF5C4gfMD111hq3k+esDXnPx/JwFVlIFanBR
         MjuU8dbZuzYEaRhRBsxOspW+sYtZsLnDql907g19QuOJIvtdfn1amv3CnX2rGJoJCFM+
         icZkeYuXn+xz63AAWz+ceZB1w7pdX1EEJ4ZIpWLoCN6w//6gJ5zCx9+3Hw4Dt9VdNI7k
         y4ZLr8S0Ho+S0P826cpMHmG+IA7JFPo7Vi/ePqtVmq+gOIOAyynNL5qvIoFWQOMG4O7H
         ukCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596705; x=1796201505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        b=KP5p68oFg7un0vHhvh3iDclYUp6b/BtmAPMfcvTMyo8Wr77g30JFRjI0WSVIU6Xw8B
         Nu9Ka0OGYVS94yUhqlkACSX5d1SfPhLcSp1zH/HeIzOp5O+jQ0RzoazoV4ZL7wZtTj7R
         IaGFqBqmM0H54G4+41b2j3caLWGAhljbxJi/xjweYe+FgOvN1wTOHwLCQpDKcUwjoazU
         9TSMN4wXvZc9eN0VxKM3rW+M+9Y0LwgnYW1KKV8WS2k3ZRtlbE2evPDx+wPrzr2SPQ0n
         8bzG/6SQ/L5OkKsnZ6caWnAJl4u9AOcCzIhkUOGZUKnHs1vMLhPnavG8Uze9kv3VLdDO
         xCZQ==
X-Forwarded-Encrypted: i=1; AL+hErEbQdDcDPRgAvpCG4aCsET5FHqtnTImJAk3D3n8kqfMt7WxkBSYxoaleTmtxbDKuvryj9MVhZPXeyhEvwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//JrRl2UVKxB7g3UtQr/GLht0g38yPueo8J+jXYBQUD3iAugLd
	o4k8UhOOmp+Duej3pJKWI8+mzOXdvUkd6RGhUk0g8p03vzduuYaAMjTYDiLYQ1uOjawYhX+n5qi
	zy4uBVill4oP7KnykC5jkob2HDC0bj3c=
X-Gm-Gg: AZFdTZfizYjmPlG2uhQWeQllrJnjHqwyq2FyznBkC87AT8jKesAbpFjwsGz9ZfuiWSK
	iIQbrzr2tY2Ai+b5p7yTXky59lyiLpSsuwsO5MlKLnv4on94/Sa2UXPPYyBj4fqCIEERH0bl0nd
	ulSTTEM6iYwFOjbHZAX9qv8/lMUpMqCwameNcFef/jSbKN8sxbCbRFt5izLJu9XnWAJchUxNEFU
	E3OAjMGYMgfmbL+9JTMAGrb4lehTnFEpkGEtWs5xla5vIrGT7CcMf0rvRZh5V8Ln3QI+2bKxi+k
	U60nHp3gj9QF0Ws+JGj1V79NidqLoKC9Hq85/4YMaifuePHEkNwJKJs2BliVyZK1bYHaYeAqbCf
	UPpj2fa1ynrz0ZpnVX3bTRSf27joNy2YtiK8ylw==
X-Received: by 2002:a05:6214:c2b:b0:921:1e3c:efeb with SMTP id
 6a1803df08f44-9212e0d16a1mr304088126d6.18.1795596705319; Wed, 25 Nov 2026
 00:51:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118025528.2703790-1-zxyan0222@gmail.com> <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com> <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
 <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
In-Reply-To: <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:51:34 +0800
X-Gm-Features: Aa3M54oVZ8QH8baEESvpsl4u2Q4IYlXKuxY1eSxFeiZgwZmn4Zh87ziubRwHQe8
Message-ID: <CAP7veTLioytfJYQ-BDc4+CrRMrMMjprR32f0CzN_uL0TschNbw@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed, Nov 25, 2026 at 4:28=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
>
>
> On 11/25/26 09:22, zhu xin wrote:
> > Hi Maxime,
>
> > Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s =
a
> > PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
> > about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
> > FSM is still timed during a flow-control stall, that would raise a
> > spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
> > link locally to verify it, and the databook only hints at a large-mode
> > (LTMRMD) without being explicit. Would you prefer bumping the default t=
o
> > 4s to be safe, or is 1s acceptable?
> >
>
> Yup, this should do the trick. If I'm not mistaken, you'll add some
> better controls once you start upstreaming the glue for your XGMAC
> device, right ?

Right, I'll use a 4s timeout for now, and add a per-platform timeout
config along with the glue once that goes upstream.

Thanks,
Zxyan

>
> Maxime
>
