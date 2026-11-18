Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795030266;
	b=SkyZInDX1/R8lfujxGktEwB87T7F8I8b8UVsDZc5Zy4sXTPa6vB8o60f5U94zB6NHTE/
	 dX7VDc8UDRu4GhXEyk724uRgVnmKO1UMuNrYWDk6oFEQVlj65S3cWiqpmT6TLAcd2q7YW
	 sqybJQD7n8Xcek2qj5IcVs+Mc8szdCRY1ydhnQvIWufDP4kKBjqzl2i+WiyZ5I9kf4ya6
	 K1uy8ZH0fz9tK/P0WciYsc5vwCXg3gdfurzNFRh35DXap0n7VtflynsfHX72+cp93fCJs
	 jMJFsVopgPGNOq/PRs/sBNKhOltr+YRgMMpJ7MNcwPhTMEK0leT8OKz5CCGp+Ce8zLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
	b=Ig3/QHKQgYqseFZiE1z9goOk8/xLK6lOcelj2mz44OwxwsiPiquJ9SPC6sG/ZETPdxVL
	 /unkeRmSXdWeAVv4TW2cZQ0mwvmLYgu4Rl9Wt6m3XSiKZRXDRHpqIYyu6hsUn++WVv+Xp
	 xE2YHrdB+oi+5XzsIYCVGVJDhzcLJ2R1MsW+ER52UAY7oOOhBthA6sZn6wAqBeMo8eeGr
	 eoHRGaAyhWmCIvgJMkKEE0aSHy2bGjMjnm2sLZawo/9cEisqY6M1QHcfRSdzpIivuR0vN
	 SKU3jKYOQiQixb0UdbJarub8Gjltwj50IFt6waR39WNfSzLt8qh3OmCJQ9ZTLUsZBmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYTxxlax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD552606F53A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD552606F53A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYTxxlax
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d28f75d62so238666766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795030264; cv=none;
        d=google.com; s=arc-20260327;
        b=KiFNOHeb7O//IFw/5U9svdzkakFFys4r8RjsOQ9N8n3HhklMBSrr3tpndZG24Vom1J
         kC7W7FH+eS4KIeHaaF3Tbs5mPl4upTlkGXkE6GgIQPDul0d6zxFYIdoz/DjVaPeODqTM
         mb0wHOkxGe6PzYvGWXQSfjgr+tOzHy2hf91+VINrk3hn610Vu1E+0AOz5ZdKdOBj5T6I
         YpbcLEOFp8Bt6/E8uNr4ibOUK+mXgFsYBOL2SBJYyFADxsciFkU4eUX6kFYyd1v4kqog
         wV4Dr28R6G3gVPtxjeID1qmDSXKnJZM6RGXaOMVzG4EsP0nc2gEtn5ab0P1EBhW26zr2
         Pr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        fh=yDJtJDUBMp98jWGf3Zjozw/7wZEKODPhhcfmAyYAVpA=;
        b=GCMpeveJrnci1nS6oDkA1RJ6s8X6jf1iE8HgfkSgxD9DRI4wWT5OSN4iS8vvldp1Dz
         6koK7PSinJyFD7/FWKgwIz8zFEXp6fyIwOnh0HxVOvYGrA4KDPwnNFVNOStfxPFMXfNT
         yD35fp3ak/kCrAVmlNPDCpnskUUTKsDvNF3ncTGXad+QS0C7r/O63MhK4FSVGNXNR6Gu
         DcwhUMkqlD0Ca3EX+nv9EAQ+LU6HoRHx8ELcRwjQOw18nNeup7HssvjVDR9KgcdG+lRO
         9mUUEKYIUbVHZzt3HDo4UOFOmq2nYk/21DYE2sBqy+6EulRMZzkuoliVCjoMAwa9Q08F
         BZ0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030264; x=1795635064; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=YYTxxlaxQ2WfhHso/oEI2r56Wf/FngEvX4IGgjBf48e9sct9kQaN5+W9clSYP5LlZW
         9lGoVnhGTEg9+TUbmq/jjF0sC+rmU+Buy7VOy6sH/tPxGdqjjnXGgl2MbLOCk/+k9Rho
         IZJxpHNo6bOT5jZstLoYdAJHZylRxqvtOwCldTOD8whfdnvEhqKJXAdU83+/L7lRIx9v
         fzcCiYcUTwNu01GC9OfJiH6YaqiVEysh0kMaSWmSU8YUIYlmG2BvarbXEefoJFvoMsw5
         PH5l2eEIFL9NtYcZ9lHXeSizazga9SFSOqqZtZ+ipAiyUSM6RiF73meQ1GDoIrwk7+Wd
         OScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030264; x=1795635064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=PkyDLQ1fqRvKagjpitWrFeo6HZz0uEwo+iNfzZIdFGogSvuJxKWkUiZBTHimeimbWp
         7G8opk1U4m4FvciK9uMC3srwg1GoS57DbIlDUGeFUEgvHGjs7mFAQ5Qxl/Jy3Bj1jx1X
         C1sZnrCqU/VOYfAl/UpHQ/gu+PTbRun5+YVN/CJ4V3IH82K8/L97itTt1MSdSFJHjpiu
         381OSZKLB4c9UZEsrgoNviKjy/x7ZAnIAgww9FFYZLW6pQSy654OJHfxKasX5w1XZTWt
         2oiWeFeBSK1Mi74DemdyVmVFcpqkMT0tSCJvKFqtfjAHNLW5AUR02ky6ajUPkbCkd2q6
         T6dQ==
X-Forwarded-Encrypted: i=1; AL+hErGV/XJ/4lmJ6NMy9VC8aZ7F5muH9f1zRnvg9Qg8dWoJlua5W3/m0+pgRwDto2bJbieulBQVpJzK/TuhpRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZCAs6B8SLlaItAtkc8cI9v1/uv95U7T/4qjNqNj8ZZ5WyYwoX
	RMjDpfYMyuHyfQURk6AkVbzfA4yXvQ1uD2g6AJZT1fyHqiDioNDFbu1XuJGKDdDJR6zCWTGkI7i
	6p2okURVKhMzquefMv46bSXLwXOG24eg=
X-Gm-Gg: AYBFou1WGgvvE0hgA3rRPd6yjp+E4rcOOJUhCJwtwvw66y9uTGun9NHH/g73r5NBOLA
	8yiLQGoKnEhhiYR56yVei+OOPohD2cnQ5gx1LS+qwW1LS+laPESTJa7ztMugbIMxmNIrGbQjSQd
	w/G6ZQRW3K+mJKEA+CMADtqmrjhvTnC40GT0Ii02ABZKrF7mVmRqyUIm7B4bjvT2MpYmbvboz1i
	ulIG8AZ7b/um9e65qjMKyQPi/TQHwdqaIVVhw+m8Es1NFu0Z6+27rWSkSXqNkxTUcgNiYblTANn
	NF3k8dI0UiihmTMLKhC6jNncJIH1bhBwtockhI232eOhQAQDz9KanvPwMwzjUfJHMWrBozGJlBl
	PGVnpO4u6Yr6ZbEADzwH3O747mgN0njWZIrk=
X-Received: by 2002:a17:907:f816:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c510e398889mr303013866b.27.1795030263845; Wed, 18 Nov 2026
 11:31:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105194426.1113050-1-l.scorcia@gmail.com> <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Nov 2026 20:30:52 +0100
X-Gm-Features: AclHuK-Q_ZR_eSDZWgs8r4i-RTkFZUMV5FI3ZV4LgWAQGQjLtUrjcLbEIObtllI
Message-ID: <CAORyz2+7q3BTeW3NsaiwN9riAbHV0Q_tCm6bBV7RoiDeAbcLrg@mail.gmail.com>
Subject: Re: [PATCH v12 0/8] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> MFD looks okay now.  How many more Acks do you need?
Still need the regulator Ack. Mark Brown provided an Ack for the first
version (almost a year ago) of the regulator patch [1], but it was
substantially modified in later revisions so I dropped that Ack.
I'll move Mark Brown from Cc to To tag in this email for a gentle
ping, I hope that's not against the ML etiquette.

> NB: This patch-set looks split in two in my inbox?
Now that you mention it, I see the split too. Weird, I sent it using
git send-email as always. I can resend it if it's an issue.

Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105195206.3440-5-l.scorcia@gmail.com/

--
Luca Leonardo Scorcia
l.scorcia@gmail.com
