Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795185940;
	b=VOP8shlvKOvw5vWrOjl6GDb67wP2j2U8BhrssKCtWdCeuYqe1kNzCohJFF054Oulbyhn
	 LHG0GC9aUJnqhWE8rGF7F0vWP6mVbkzOM6upEZcnCZX3pwI2sjAlPFZBvMqHGvK60/H6+
	 Gb6hn1OA2oj71PhbQkWYx5J2dZUR99JzhcMJRX7b0J+haOBUlckoVh5xcS8gzFEn+SNim
	 p4OHslJU5/zzLdl6tweMYsVbVboUmSO806qzrSNJbVl1B6OTAcZ8g/+2oNdOJs2sKpPzk
	 5qoS2Un4TPuo3nSjoO+WJj4Hz7XNFXY/GuFmmezupl/xh+IlaLfXdCTjHPaWd4YA23A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ywjMM2WSUvMwVklBf0BM9q3a3U6GByEzCtPnH/AryCs=;
	b=wq5XdCfr0PB+c7bbx5E/+AsFtgytX+3JI0xvOvAVPhf0709FCHIwehDjLJJ60HRif4nj
	 PUAUc36798XIRd9AndwC1yqVf9w1EpMTgotdAp9bPBHk3R09NrfXNHR4qP0mUXqhzUZm6
	 YPXV7NnAL/BBTGhIibvd4fqxUiN26pc6Y9lsPFM6hS2UDWm8WmM908LGJVHE+yxMsNMnB
	 hc3EYp3/zqb65kMhwvESMq5Ay8exbxqLMhmFiJeSKqZYeUJHBl2c8tA7cep/ty4MOCVBe
	 PAqbUyZzIwhGoOGsfj9etDBzQTy5l4RR6tweNsJuyy0/d15k2UfD6ZD5EECJhlOF03g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fbtnhUAn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A4606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460A4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fbtnhUAn
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c506a231b88so148420066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795185938; cv=none;
        d=google.com; s=arc-20260327;
        b=iApU9V0GzLg+EsmuxyXeJUeE/2UeUAnKaD4GCMrPYvRuOTBPDwlB5u1SpbtCgB0nzD
         d8zZMGkXCe43nkshFuDRiXsaGJ4ufnqebq585lmkmO8jLudN1h9KeZzYV6/E925otPuq
         iGPJEpQTNwtGE/m4TAB1DBGcEh051nPcGUMzj9WPKBZR2tYuhgDskMya4SoM9ENqUTKq
         nXwxiqceh7NMZlc7vjJ80qhw1xiQUQu63aLnV+a4S/g3PHRcOuTmR9K9WupObvfMaQnc
         0/GM6juDxOXscZ1hFUm91FzWaHUxckic3ItLt1b6RSIKoeaQ7LwoGVRol3gja5/2ZbHj
         whrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ywjMM2WSUvMwVklBf0BM9q3a3U6GByEzCtPnH/AryCs=;
        fh=mOXKDErfBBG/QDcZmTvTaOMMa28GexXM3r3EpUlX500=;
        b=fnKfm0X94oBLxfU33nbyXRgMLuwmpontHTUEqXUuRuOQ29VU+yg7XTIWSpF7sMdlMm
         A5uL/gsnAjtrJl38MeCnZc2q7yxp5AuNovqArKe7vnmH1L1d6hEUXSgTOIvQo+90J/g8
         JdG0BnTYZCvp29MMAespYmWvyFXF7R73XDSUvFFvj9kWa8cRnAOHcS5HzT2ZSABOHcfV
         mDa9cRTT+3pgO2eqEw3LUVyTsbJJiEA5Z/ZkexEAce57IcoZ/LXpiumkHf6bn135dbzD
         nRPFzeSpByLfoi3B8rvUTC79WhIyx+A5rZUS5YUIiKOEdiFa3H16Iv7T2UvrvCroTedq
         soaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795185938; x=1795790738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ywjMM2WSUvMwVklBf0BM9q3a3U6GByEzCtPnH/AryCs=;
        b=fbtnhUAn2Q7RF7sEM4muGNFO7OUAkj4H6OFozkzGoVlzaGZXM89P9TENj18A1YOlpm
         CSZieuRNqUzyjUuLWf9ZjalElDfbAETPcYKBrlaVXcnvSXQ3s4ypJy0XreQ3INSIzLNK
         N4MHIZhc541vfZfHFtU/LF/b4PaAdPICSGesslw0npo5nqRgwDOCrirh/5+/znv+iZhD
         d3LBN15+xtBCE4MJjx/xYtpC9HHHjzOlNlmcRcLJa5lYnZoyQljYJSPYwceEA5JI9nHF
         Hc0rKNNgCxgPr8O6Zc5x+/yy2TRYs0+0Axd+og/Ws6EBzubQQlkstOchd9GYJ5d8rpXH
         URvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185938; x=1795790738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywjMM2WSUvMwVklBf0BM9q3a3U6GByEzCtPnH/AryCs=;
        b=Iv3SLereWPZA9PDIdAOFaFeLWs4ijVVIJNWe9Bw9bsCoqe8tHUhTdZh7ow+MEY1XgO
         ZtDaol2u2URvWCRE56gW7RIddUfouGDUZ5nKDa6bXw9DMlxdMQXjq2Eo2fNIojBargbX
         lfGI43mW1ggtUNEBVJ/UVzXW3sgC9r281XK7NVs8SZtJsfZ99zLi4gO2x+XC+hw6nF7T
         AqdtCUWxCALW7txjBktZCfvNNVdUS0474ignKaKKm9yZr+GKNQKMhLvHQtS/ifaN0pOj
         4knjwS6r7OUsi6YXpWmdumHxpD7DYF6t3Swcdv3F9RlQfTh4jL0TLBSSZ3j6YElMljui
         kC9A==
X-Forwarded-Encrypted: i=1; AL+hErHtWUYp0u+gh39UERdnp86ONMP37jVQ3KqGHt4JHxXS9FSv/OGqgjB3GIzsQ6ViFi2wR0I2mq7nIW7L0Oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/v0eNs+rU6YLG8cxkjw6xPzo6KSwnPgJTLFMBsHhewrtuJ9jb
	5Ro34k77CoRxFlGwF9Pd6IvXiTFHojLckW3hquQbfgAKd15yJwdba/rXY6kzOU27+T/OxNKVjdd
	HBu2oFjnjXhnmlnACtXuqihrNSnlUTUF4C6INDlHTkA==
X-Gm-Gg: AZFdTZc0F6A7e5kBl2EJxE63NX50sziVq3cxo10LxTS+129p8cu0EfaokDLkEcnfHk5
	wnl5soyyVxgR1bXhoyIlqBcrf7uj2Aq7eC0/oAVIIMyPBCSJqmxVvKRsGBRKg4lUzDgNg5FNRRT
	dHrXKz+0aC6O6I+REhQfqLlvYNN2B0NV19Z0sezkLOV3mTZRCJcICLLlcl0tiglYwk17qk1hyEH
	IQgZYymDbrrmomdbCXmytC56WmsM1pZ/I1Gp+tfS+7WjVucxZhZoqf0ocwuW33fJGQHcpsgibOT
	n0sKKfkSIxWvms/BJA+D8N/QLxYlL9XqjyVatZidt93v20Wv1gMjr9YgiIvFZT7qDic4DU8p7uX
	SO5BSoXZy3P+7OrOFHziws9pYZl/Gh8nhH8YajrrkeS5h9i7yZXQid/u9iUDb587nGrMy9Aq4Cy
	k6PI4fwfQXMctg4h67
X-Received: by 2002:a17:906:4fc4:b0:c51:24a3:208 with SMTP id
 a640c23a62f3a-c513a5da66bmr340053366b.9.1795185938297; Fri, 20 Nov 2026
 06:45:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-battery-charge-temp-range-v1-0-a967abd8b80c@flipper.net>
 <20261109-battery-charge-temp-range-v1-1-a967abd8b80c@flipper.net> <20261119225808.GA1121782-robh@kernel.org>
In-Reply-To: <20261119225808.GA1121782-robh@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 18:45:26 +0400
X-Gm-Features: AclHuK-7Jyc8TBiMh3SZmeiKuU6wfTaME9iZFCNa2ski4ByTPxfFe688HXmvWSE
Message-ID: <CAKTNdwFc5yam2HjkR4ShsMHJbTs7SesyvNoYQWwaeL5mAN9XMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: supply: battery: Add a charging
 temperature range
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:58=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Nov 09, 2026 at 01:41:48PM +0400, Alexey Charkov wrote:
> > Describe batteries rated for separate charging and discharging
> > temperature ranges, such as 0-45C for charging and -20-60C for
> > discharging, often with a reduced charge current near the ends of the
> > charging range: operating-range-celsius holds a single range, and
> > existing users read it both as the limit for any use of the battery and
> > as the limit for charging.
> >
> > Add charge-temp-range-celsius for the charging range, falling back to
> > operating-range-celsius when absent, and state that
> > operating-range-celsius covers discharging. Add the charge current and
> > voltage to use between alert-celsius and the charging range limits, to
> > describe a reduced charge rate near those limits and none beyond them.
> >
> > A missing half of an alert charge current and voltage pair falls back t=
o
> > the matching constant-charge-* setting. alert-celsius is expected to fu=
lly
> > fall inside charge-temp-range-celsius, but when it does not,
> > charge-temp-range-celsius takes precedence to ensure no charge occurs
> > outside the allowed range.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  .../devicetree/bindings/power/supply/battery.yaml  | 45 ++++++++++++++=
+++++++-
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/power/supply/battery.yam=
l b/Documentation/devicetree/bindings/power/supply/battery.yaml
> > index 9575ee1491bb..d2f2ed9a01fe 100644
> > --- a/Documentation/devicetree/bindings/power/supply/battery.yaml
> > +++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
> > @@ -111,11 +111,21 @@ properties:
> >        for each of the battery capacity lookup table.
> >
> >    operating-range-celsius:
> > -    description: operating temperature range of a battery
> > +    description: operating temperature range of a battery, in which it=
 can be
> > +      discharged. Charging may be further restricted by
> > +      charge-temp-range-celsius.
> >      items:
> >        - description: minimum temperature at which battery can operate
> >        - description: maximum temperature at which battery can operate
> >
> > +  charge-temp-range-celsius:
>
> 'temp' is kind of redundant with 'celsius' and a departure from all the
> other temperature properties here.

Ack, will adjust in v2.

Best regards,
Alexey
