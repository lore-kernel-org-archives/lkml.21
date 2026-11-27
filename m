Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799178;
	b=vCxgXUK3ys3+s2nNdjCwlhbJ5vaag1ziWPi72+GvZiZrkVcFEOdWpo8pycokCoOXea7r
	 tp3OFdCpOd98JfuZkunhUbjUKBrhsNgn4WE8iO3NCxzzitehxHqABvf+ILfUNfUAH8SzW
	 u4NFGJBuVLx4lnXG8/u5YsSwxlx6gNpWArgeDF8VOxUyqp8d0a6bzSHGG0Bu03cvNrSlm
	 PDDKd8iEFmglb2pCx+MThbhvYzXueXK+lIhFNqTmNtwuetFeFO368S1ddUzZ48rrzuvXw
	 xilXA5MqbYzPRoyfM6kpAMeHFxE+eLeQPh2l4KkvPdhe2BeqBWu4nIl/NC1hav+FYCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iTVKPxE+XmFmd6MvSzXzYtECoOBwSxdbWmdWP2l2rT0=;
	b=AYXanwtmMYp+fj6IyS3xmyuganrIc8F1oKmzUSItRzicanpCb1epZ9cJ8EXcvLVys8J3
	 mCycWTniTIS1nsMw55iNfnFSTUbujqMtYArw9U1oSGuZtS71a5T4uDbUUjsMF7MyuEzHJ
	 snas17pGjEs7iGBEGp5f6AKfyfCg6SaVaUYjZIdCwlTmOFmXwiMfczeYnh1j3c5b5ziuj
	 b5bVrqMcv7CByxUCGzK2LpVD+syVTUBToljyoeASuG2/SyWWmZsGZ3I6XKUzLV2LSta40
	 quRtzS4pbUgnd6aDN9jGhXFOh6qLMILjpu3c6NEfL0GEbjWqnVketxOnohEJQuSRHNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnt3xMzn;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF71606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF71606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnt3xMzn
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so5226121f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799176; x=1796403976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTVKPxE+XmFmd6MvSzXzYtECoOBwSxdbWmdWP2l2rT0=;
        b=rnt3xMznG2a3QsOgARoIB9TCV2/u3es2n7i6uHV18P10Ne85/1fS3zW8WKOOADwEwv
         YjS6/bAxKDxdfaiyLO8F2FfpYVeH92e+pNfOXZlbO5TnmBSapElLShPoz3JDCK3el0CQ
         Hs2JW4Inv+uZCL0zhanH0pj5hxYVZ9KOwniXJjEY90MEEDVr+CDinQWBmdwp9B9htn0J
         R0jLoUGohn4rql+68sWkT1QMlvjVUaJvS/oQ+zy+hP9+fsGsMcXxyQG5fpN56QY7XEav
         Ym9E1ZVE4he3PHKNuP5wkkWDIN9Llpog73f+G0A9R72QQ/Vg/Hm5GLiVV8iApjg67QKr
         30Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799176; x=1796403976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTVKPxE+XmFmd6MvSzXzYtECoOBwSxdbWmdWP2l2rT0=;
        b=Ti1assBcnMMStv/T4nsawYdYH5DPIPcQ6V6VCXaGZxGQgjmpNDxdkFWeffAxZlYFhZ
         KFQrXtRb2WW76mOtsNzZShtWkHq3eUZDvx4KGkwbhqOSFxWiRy37IKmr6uk3liDcXyLi
         V8L8qrmbNT1RekmbAtSiFUUq3PXoLvdb5wS1Mk/O4sWHlV3KdlfxDHVfko5Us1+ut2V8
         Mc7ACjCOaia5CW/OX/xYpqPykqylofJqv6CBgBYNyJvWUitDhnHx6iYSM6L4VgT3Gy7x
         Bg/YoYxdMeJ51AoTbgRVup88g0vXtNh4O7p1rxYG94x/zan21tUYJK+/xcygmes8HUVm
         FLyA==
X-Forwarded-Encrypted: i=1; AL+hErHYKDdEoVD3ktYKs2AgshMXSVu0ERGAS4U7KXAkLKn96vdInyyGFhL32+5Yfh2olge5igDZ6oEFMlLEu9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EB9oO8pXSmCw4oyRXhxXnF5RkKgHaLNwugFFPwyAKShixqzmY
	v5KbfKEUuuV2bYJOSt2OfRzFYnXif7uZJZLAqhr7iTIK3D1QybHx7Skx
X-Gm-Gg: AZFdTZfG0ryYWIxXMooHsNYNACRe93zvOhl247LQSAzAOYQGlesF5G2vis5SlJqbk2F
	J2USOCpayxHua3w+Kd9vkoYfh7eyy6YyXfFfj4a5glOUhHc2Ze6SJAwonynfWcVm79nuvuK4zO7
	L8E/4Ica9+pbuXH377RTS9Bp8CmCAwsT8fOOrunVV9wQnM2wbDLxXUVNAQJLMQFH0QBJSRu3MSU
	Ss3EIvFbWjix5+hnp9cKTbb4KQtJy8vMLse7ugijf1K38ocsBJiU0yRrSNk4xQ06lyTGJkWWDug
	6xC/vVgTzTu5eTxyFtndAdYgyhv0dNgJHISmr5Oz2/O/kAwbQmFLb4D1Qjbzh6dPGD/7mu9dxgn
	WiMdtPcxXPF9eF08X+N4poXNj+lVOFZWFO0bT/IIcanEOvmYGPFIhlVRCebCB1DQX2wQFkWK78z
	XFp7nPHSvQtALuqDKqHTDjkVbVZO9bxvnKirE64gTYvj9Ft2iMolKo5TiTVo0cR5BkDw0SWv+HJ
	hUQTl4UV2OyQUV7sAdJ2pL36Jn0CuBQMXSbZ5n3kz5Qn44UhtfF/nQlHjH8rjTFXdXd2DjTXHZV
	Opw5LI9yV4D4C70RR5rMZFT+cRC89b18QBYaxSFo+EheZ3hnY3cgt0r5trvzRYUYy+FwxqRbE5X
	dsDM=
X-Received: by 2002:a05:6000:481c:b0:4a5:ebcc:2260 with SMTP id ffacd0b85a97d-4abb2dda518mr48798226f8f.29.1795799175866;
        Fri, 27 Nov 2026 09:06:15 -0800 (PST)
Received: from SMW032656.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm49324759f8f.3.2026.11.27.09.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:06:15 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC: wm8962: make GPIO-based HP detection work
Date: Fri, 27 Nov 2026 19:00:36 +0200
Message-ID: <20261127170039.663-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hello everyone,

This series contains a little bit of a mix of patches (2 features and 1
bug fix) that are needed to (partially) make the headphone detection
using the GPIO2 and GPIO5 pins work on NXP's MR-NAVQ95 board.

A little bit about the setup:

I'm using a MR-NAVQ95 board. This uses the codec's GPIO5 pin to detect
if the headphones are plugged into the jack and the GPIO2 pin to signal
if a codec interrupt has occurred.

Also, the WM8962 codec has an external XTAL tied to the XTI/MCLK pins and
is configured to use the FLL as the MCLK source.

For this to work, I've confiured GPIO5 as a GPIO input and GPIO2 to
operate in IRQ mode (i.e. IRQ function) using the "gpio-cfg" DT property.

About the patches:

1) ASoC: wm8962: implement GPIO .get callback

- needed because the soc-jack core needs to be able to read the value of
the headphone detection pin (i.e. GPIO5).

2) ASoC: wm8962: add GPIO interrupt controller support

- needed because the soc-jack core needs to be notified whenever an IRQ
was raised by the codec (which would happen if GPIO5 changes its state).

3) ASoC: wm8962: fix interrupt mis-firing during runtime_resume()

- fixes an annoying issue that would cause some unwanted transitions on
the codec's IRQ line. This would sometimes make the downstream IRQ
controller think an interrupt was raised by the codec.

Apart from this, there's still an issue with the FLL lock interrupt, which
I haven't managed to get working right yet. What I've tried is enabling
SYSCLK after configuring and enabling the FLL but this doesn't seem to do
the trick all the time since there's still some cases in which the IRQ
doesn't fire. The datasheet doesn't seem to specify the conditions under
which said interrupt should fire?

Laurentiu Mihalcea (3):
  ASoC: wm8962: implement GPIO .get callback
  ASoC: wm8962: add GPIO interrupt controller support
  ASoC: wm8962: fix interrupt mis-firing during runtime_resume()

 sound/soc/codecs/wm8962.c | 201 ++++++++++++++++++++++++++++++++++----
 1 file changed, 183 insertions(+), 18 deletions(-)

-- 
2.53.0

