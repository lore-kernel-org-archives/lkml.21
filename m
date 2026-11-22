Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347147;
	b=veNHBNS1EFSaaYt2AiYP4dZn8Eg/9SfbdbsQM2rHjACJ/P7TjTJ8ySBqKLEgYxixJM2y
	 o5Ep+vvfDv0Wo5aVyJep0iGIzE5ramO7nLrxIUp+bQGf/Tqb+Ly7u1uWhIv+GmXpbD/tE
	 Wugkin4T0jWVpf1GgA5pVBjZaa/vAH17DkvLnOjTDWZLEj9GwtApgLB51m1s2n/wiU/sC
	 DDCtZ0jAP1Irb6hRWYXMzj89am4dDthOVFwFfxpgJjnKYloCkBMC20N4VqrkXNqooezUh
	 +jSdtqX0KkcvPWAKDk5SQxRR+VK/wZW9VewYokbGwu7Xaoi3yQrIP7eO2SfwZ3/Uybw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ygdNzCikxbBPRfnJcNlIHIAAf4lsCl8erAq0aPg3a8c=;
	b=B5ssnvXHcgffvSVDNImw/V4ww9R1v5qgCKmQ0FIbp0vUb9KxJc89/Yd57T5+6yUO4GbP
	 2BTFsFM8WpAUkJdbgTwiupQhmBGwSqIBdIiuAKgJDv2ILQh3hSqF7QTxfprSED+aRl63x
	 ZqHEZa7zIJRVk3lW45bHsgnbgfHEBbe7tIDV5pyu9zqQvWUzNk1IkBkvfXptZO4f/6vse
	 /sDoPkkAAVO43RqHiub5wIQP7Ihsnr2nvqs571ww0in2B/3vg3THqjiRlrmSpZ3KvcBhM
	 1+IElUxI/ZlXaCCFO4ssGLebARHmPwNy28xCGu9+vzau+TI08wip6GzcFX70/DylNDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=graSWDrp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332E8606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332E8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=graSWDrp
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94961bfe1a0so161485585a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795347146; cv=none;
        d=google.com; s=arc-20260327;
        b=VY5rJqsnTsoTpvKt34ebrEpTX50cULx00mJWgCleBy2Spyq8yrJtzAM/w0ZFiTD8ci
         oElXLrJvZpLHsqSh9/p8GkbvUe7i650rvcLHh8US7iwEAXoeKrSA3LBOuF5T9oJ0kvqR
         XUB7uf8EZMnWvbZ87AOzum27CWkevZtsvRJ7gB3fdsHxqle1UrocTIYG/fty7o+tSaBG
         1D5zWR/ywEkOSn4NJrduD7y2HhGDm1YLjOkDTktQuNUqtc3W7cp/jxELjBqtKQEScc/D
         JvcnGJaZkD3dCnBYKTMW47dVsEZwIMp+nbfGE+1H9sXHmszkZHZdfKWk6KZ7UxUlesRY
         8ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ygdNzCikxbBPRfnJcNlIHIAAf4lsCl8erAq0aPg3a8c=;
        fh=rokKWfgyRAsvpBFCayYiRmS9liNb29wiIQp2TGRQJsI=;
        b=G9qzzkPZWs9le3/P5Iq1IQSmzXXhEWRMVqXlp70YfG4u/aGNhPzEYN3yRP2jyvq+q0
         VmZ3vqCYslZdH5BB33lEx5zwSLhyFnxFgnTjDQCO2mzj8RjxpzJ0WFTyzr7tiNTKqKOT
         WgsN6IUYwRw3Zq35U5hxxZnd9x3PrfjWvxdvoVbSHDD1yYnIj0ZcFMJ2Kj3Sy8OMWTpJ
         Wojt3AleY+hwEYHdsGQxmlpz3abOyKuKZIpyNkmjL8bR4e6qQbpP5wS/LfhJUEvJrUp0
         WD8ci72lObVNllKsJtd7OABJ/NNhOxjWfg7Fgng/dksEeAYx8NatzzHa4kcZ2FZlW9Bd
         QGvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347146; x=1795951946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ygdNzCikxbBPRfnJcNlIHIAAf4lsCl8erAq0aPg3a8c=;
        b=graSWDrpOT75wJo9NGE1hmvJnVyHFnNlY3UnBClK3yaqF2zNBJ+zeK7RFwMHg3KldH
         uZ8NTnVjpK1ubeCvGddDgDYa8EW08iaHqykGlzppr9mgovm3xLOyv8t7EVlEU19rM3t7
         jBKxjwvNYZ1ljXUClYMsZk2m9ssTACdvlbj4g+GwwAFkpvDKEPjKvBBvzDeQN+XeTpLL
         owGUK3NSAuvWWFwo/MWGoUydDMjKojA8I7S7inRdZROepIoT3Uhkb/uDtmJvTKk0OEq6
         qYAeu2RDOahoHCez8PAjTrf7Q+r2X5hJAdAIkeqie2CM7KNGUpb6h/Z1rnzyxlobMa+B
         9+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347146; x=1795951946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygdNzCikxbBPRfnJcNlIHIAAf4lsCl8erAq0aPg3a8c=;
        b=xlLPglw1ZvVy7KjumDKVna5dlgCJEgYujxJp43vWdw/IVNaEQVPMXTUnDk6wN0e8BI
         vmxcsYNfWgS2M617o+wOil2inhSB72G2dB4higWeAg3txM4ajpIQ2J9Cq4vLOqDf6yS7
         wRnaKbN4l9sBdn6NfmGKFTLqovAlNPaKtKz/r/xJhYy/wJy1Fi37PyBfMi/EmRkHqDvz
         G82YKCf/Ys3eV95Dr0ahffv/Fd49z/s+56TZer6ywRJL+u9Hlkr1ucAU7irO4iI4VZda
         TF915FH4SVEA365MpeeQdn7Z3QqdHTB2TM8onT2RyfHQ1YfG8bEM5XCHoXaXH/qY1ErL
         REEA==
X-Gm-Message-State: APuU4Z/aRZOfgGaQE8jMBO3zDpR3YQpejcoNCD1T87/+vYA2v2hSky/H
	Hk7UztFWJmFNawDoKelFl3ScU4aJDpCimEKUkx+qbivFXhhFmopmylYOlFnR7awROq5wXOAbYXU
	k24p2hsikFaP5xWGnBoE7IDsZgRsecFGF01uJ
X-Gm-Gg: AZFdTZcPupJHzAacHkZcvHSZBvjbYd8kON64D+jluPRBq9tpvCTy8b2r0kiEYGWK+Lj
	cvQlprj9ZLmByz6thzojtEMdlf60NIQkLUWq0nVm+SPdhiOtpkUELzp88fOI0tOtW8pML4Hec8J
	jRPuAuQhs12JLxsOttLuUYPd+wZgn+LWxb+2BNKsO6kylT+s33sL2JJdzFMjonJZYmspivZMmz/
	ktoImwfCq4o7xbbqQMAIFBHvqD/xJAZ0jHINZoWO5KKQN72mExjyac2BwIDpVUy8U/VxuBeyyeT
	kZsW/NRmpG2hWZqqo8pOGJ4U/qhjPYtPY3DqffvOzoQiuSHOi96wzPq+UbUjZS07QI5jHBb9hhm
	cB3+dAUW0S1gArSmf8qjBWyJ9BP8foMKdYCFx98UbQhgTNbLjyZgUYOY0ULRFeF1AeswIbEFI06
	QpXfy8Whc5ssh5+gD1EVND
X-Received: by 2002:a05:620a:460e:b0:93b:eb9a:ca47 with SMTP id
 af79cd13be357-949ba9e51e4mr1329085685a.31.1795347146007; Sun, 22 Nov 2026
 03:32:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121033705.2936978-1-rdunlap@infradead.org>
In-Reply-To: <20261121033705.2936978-1-rdunlap@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 22 Nov 2026 03:32:13 -0800
X-Gm-Features: Aa3M54rCbo-GEc-UeHjc3BfXWcR3mCCyPspFOrixtNCqZBzaMKnqbXkMKWSFGx0
Message-ID: <CAMo8BfJ1n5T9Y5w=V_-ViQcbtis8=EthJoYVesDVwtDQ2+dX6A@mail.gmail.com>
Subject: Re: [PATCH] xtensa: simdisk: add missing MODULE_DESCRIPTION()
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Chris Zankel <chris@zankel.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:37=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Add missing MODULE_DESCRIPTION() that is now required.
>
> WARNING: modpost: arch/xtensa/platforms/iss/simdisk.ko: missing MODULE_DE=
SCRIPTION()
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
>
>  arch/xtensa/platforms/iss/simdisk.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to my xtensa tree.

--=20
Thanks.
-- Max
