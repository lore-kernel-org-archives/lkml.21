Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560337;
	b=spRG8sO5O+IdLUBHpgRxt/K75WJiT+cP0LJp2GVzncm4bjVxyCS3DHAI/2G8HkNC0iHG
	 ji/3SVqcPPYyqJcJ88f15wrr4bJ71gNtWBbtvucaqSSQts+tGSE71zN/Az1aBQKAymeym
	 qA9NR80dRtG2NEUBKZ/fyqOeVn/lXuUHXyVWCAx817iFyITXr0OwBQgwuoNX6j3Dh+zIc
	 KRSWRRknfJgxXd3xnEXBQQzzZtrpncsUXHo6WMm5OFbcpyMd+CYdTB4bvSAqSbX+UkGtz
	 4FSsg46KdAtUrBWuOqOYrjMq+lfuIqdunhXFcx/kksSYasgzAzZSBP+O4jLrt0Bv0+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=V5sYfwDMH/K5iSEu23/0IBbtSjF5KPb2WUam7m4LP+k=;
	b=384JZPjkkQ9rfln53IcpyPonEvnF58Dg9v/smSSqo5U+xpd5k0ailOYbvuDo5HaPtvyX
	 qYetIJ4YY52Jrr29AIkNPQAo+FEY0Ixs2V34UqF49DVvjzP5hkkUcnPC55qoOqjByqnti
	 7BIjwJETrna5+mDqw8tA1HAieOZPr4NUIGjAH7xce2Q3hAdau9tw50TCbg6T7/zV87+7e
	 QWD5IljKtbJCD4ebZKNfTajil+hN5+UMDvoKz2rRlqiomSitnvB0LH+1ty14EwUHaUQyP
	 89WDeqSU3mXDUqAn1u1X3q5OfWhBr9m7WDVoi/mv5eGuJwafHalG2NJHUAjFEnbOwTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="IbPW/3nb";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F7B606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IbPW/3nb
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5133831027so729044866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795560335; x=1796165135; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5sYfwDMH/K5iSEu23/0IBbtSjF5KPb2WUam7m4LP+k=;
        b=IbPW/3nbi7ZvK2Cr6RWP39Ces0R00/NjmV6EEjpjtit+MG8J21HmhPjo92clz92nBb
         47p7y94ilg5HwlMdqOyL3QCZ6O1MePR/DwWf5/yCB3DRqlamX92BXoOnoRsLWEp/TdrX
         iGJkI2SaV6Gl22xmjifdBg4VYWTQ//Ff4IVMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560335; x=1796165135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V5sYfwDMH/K5iSEu23/0IBbtSjF5KPb2WUam7m4LP+k=;
        b=zMZ5TpAY8U4MkHOrkao66fuHzSrQ2dladWhyX+ZSkfgIBuXdgt+gPx2TRkzlD2Z7eI
         4pg6gDhC0Km5mgjFZmQhukejRg9qcn3bDBWsuwIudhgNJtgRIW7Jslf6EJiTpOiotYkU
         lgydtxiw+40w5fW1Mij1+9uINe8UVaCNt0ckknGMYfujZXU/w+5zwBBFcb9dAFOqOOqK
         UnKpGbgTZWxehdZbfPUpf3MHZJE00eG91ISNFBL/8ORiuM8Xfl9C476U4fkWPnJIEhck
         kooOFZPj/agXnuDSp9C0LyryCzrojjPARXfajU8a1RwAI1nSxUykacg8jQc4mNwgnWx+
         nwmw==
X-Forwarded-Encrypted: i=1; AL+hErEbpAxzJCaku+MKoXHIEymn7/U4+Qp3rHNyojThhF3IwysW57u+mpTXOIDUKzUmg+l95j05JLlT129a4Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r6fliluqk927lQ55XgvcHdwKXQV5LX0cyaBsdtg3gcRBb38TG
	jiemsektGxXYgh/EJCj6JyFIkOQszMjlt6Hs9/76zRjKAMP6FYj8+HCAeZRnrNYRo6xeadMHr3U
	omfKVG/+OJw==
X-Gm-Gg: AZFdTZdHkoe8B7KSY8MiLZ8Uvt9UhvgmhAjlTbfuNEtOuasNYgoqNf/b/V4dR1lJ12F
	W9WWKdsnUTcHEoRlaM4dYGlwzUkMb5//4WxpQxzzvwNfyPkU9XifvP2iEmE0xlvrlv71FroSgRz
	eqgMQXnYjcwdxsPgFl4FKmZWkFg4/HHIKVPXyjFR/o/mIWgcMiQuF/N1KLzomYW9kt03rg0pGOg
	StpVnigtgu0AnP9EPhyluAPIItpMbiJA2H4VgNLU0Owy87fasfkQLEKfoWXij+4v8kf+QVUv9f8
	QKQyeyzFxiTeT3VyPBfLwUpSzExTG2UbB6DWpcZISBkPcxfYY5LoyBJRVMWPf2t+BF3WeUgL0Wu
	NnyRu8PsKBk1Yjv0hWTuHM1TnN0E1v7hEmmk9veX4XfXdE4r9yTjnKHO5hHxgLiAvk7BhU8Up2K
	2mFTjnRV5LWWBIDvM7OzaKzN5Yf+gxFIrUdG1Rr+nyGlo2XLH4ZZXx0CMLSt8P5HEhZ7XbRDyUH
	yOTqLDDDfTKf5r2jksn8BUuRUL4Hdg40lwtS8jGTCJ76voMa8kJDe9mHRhxde6fgpGPKcpzvCkO
	QN7zPo2D/TDCI5TpNuTunrQgQf1JNJwhn7/1jzSxqh5Og/4hPJZTHpzJ5bhpC03VRw2VHBYuHoy
	7xEM=
X-Received: by 2002:a17:906:418a:20b0:c50:9149:48e4 with SMTP id a640c23a62f3a-c513a5da8dbmr1112855566b.11.1795560334761;
        Tue, 24 Nov 2026 14:45:34 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea1fd8sm558818066b.38.2026.11.24.14.45.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:45:34 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5133831027so729042466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHdKK1Bhl1sNsF7MqcPBwTUK0PMOSFv2/7qnOxJpl/E4aBpZGO50LA4j44VY6X1eWINEo8k9TL37qm1Sss=@vger.kernel.org
X-Received: by 2002:a17:907:3c8d:b0:c4d:8e7:29b9 with SMTP id
 a640c23a62f3a-c513a43532cmr1247732366b.5.1795560334053; Tue, 24 Nov 2026
 14:45:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <fb224bad9baf5f44cf17e1d664776a4e@kernel.org> <CAHk-=wg4jAWZvxWo0OZ+fFTU=SBtQ7dnsUCV7hx+UAifkwPUwQ@mail.gmail.com>
 <avs4uWg9ch-Bqobj@slm.duckdns.org> <CAHk-=wg+MO19H7KVgA+SaZvvt5O+3Tp8AxHVhpN23JtaSq=G4g@mail.gmail.com>
 <CAHk-=wjm3vbiNYsR+aHxmM3KCEgsSWb379ZQbCuZEsN1dhvbKg@mail.gmail.com>
 <20261123120125.375076-1-tj@kernel.org> <8f4845c5a8f9f8927ab3903d6938b3f9@kernel.org>
In-Reply-To: <8f4845c5a8f9f8927ab3903d6938b3f9@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Nov 2026 14:45:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjrKQDEtPjHv4COh3Y+PHVntX2V6gZeLqWV8uHUz_ePFg@mail.gmail.com>
X-Gm-Features: Aa3M54r4Obmz65qTRKcahDOrnNP6nsZ9FLK3p7kXHoVLqWiGH_ZNRDKlgOkrm1U
Message-ID: <CAHk-=wjrKQDEtPjHv4COh3Y+PHVntX2V6gZeLqWV8uHUz_ePFg@mail.gmail.com>
Subject: Re: [PATCH wq/for-7.4-fixes] workqueue: Fix drain_workqueue() missing
 work items chained across pwqs
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Breno Leitao <leitao@debian.org>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 13:59, Tejun Heo <tj@kernel.org> wrote:
>
> Mark Brown wasn't happy about the missing author SoB, so I made myself the
> author and switched it to Originally-by.

Honestly, that's typically my preferred form anyway: when I send out
my untested patches to maintainers, they may work, they may even look
real, but they are quite often meant as a "maybe something like this"
kind of thing rather than necessarily the final end result.

It's just easier and less error-prone to send out a patch than it
would be to try to describe what I mean some other way.

And I _really_ don't need the credit.

So "Originally-by" or "Suggested-by" is obviously fine, but I will not
be in the least slighted if you don't even mention me in the commit
message at all.

              Linus
