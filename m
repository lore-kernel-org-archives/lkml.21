Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369099;
	b=IUAbojrnRHGP0kQJwwWjZyPw1XyFAsil9YMnk7/AlUCHDF08TW8jKzuFT5/yUIe2U4av
	 xekCP6iKMpR+cqUrVajMyMr4FXov3P6gPt9iW/qjtWAeOnZdhr6iBn8EjpdIfuCRW6/p6
	 ux+kS6ypBt7A9KQHq/c3bMhio9NSvs72KFKvcA6p332GeDxx0nFEYne71Blj4FBSWPNO7
	 HHQc8iaFPVe8hA8kTgKzt3IyV4X6nCz/ht2wncQ3zS2rnOY6kcbb5zQDxxoyOl+jw0Py2
	 ZQD3pxkRW4lbaDC7LkfY5YiliyZoQ95TIFaQkyIZTUKvXDqzI6u6Hik0rnSSydxSACw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:Sender:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:From:To;
	bh=mR0fTVLdZEKFf91Dji+/qWQ7IYZOv/q8IsE2009BXgY=;
	b=y6CzqpwEXmZjo40dTkEDRRSKvoj/rQL/ORCE3B/XMHd5h8CdIzx1kIc9snelFqQkEaTK
	 j25RU+De9tLqDR6U/2z2zWX7etNtiYhoQB7jNOgXUChWq0qhgkFHYgVfq5g74zcYBgE+U
	 u5E0puTuv5VdA+94a46S7lRf4uEbtaR9KEjzzrzXkCc5WVna9EC7fbW9y9Zrly42Qymfv
	 pa6YNUfCS7LDXsd8iuZbtomQ73QjC3dGIlZLyyalIZZns9snMW+OMhKhQIZ7+Ukeehb4l
	 RkT6CmrTyDZZmslPGZWAEoNc1VtJKgZlmJf0Yi0RCis8d38F2nHlZt34EuZjALKRSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o75mlVba;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6149E606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6149E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o75mlVba
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5126505cb3so325479266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369098; x=1795973898; darn=vger.kernel.org;
        h=to:from:subject:content-transfer-encoding:mime-version:content-type
         :sender:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mR0fTVLdZEKFf91Dji+/qWQ7IYZOv/q8IsE2009BXgY=;
        b=o75mlVbaLQOAa0dpw+yxOzixvjbIqh6Om8W9uKRcF0cAbkIGBLS85rQMI132Ldb7FW
         BQMOrE4lyve6uupls+grsKpoHAClxFPWPQNI7V6DzSCu+9vZE49SYvRFW5srMQtn3mPQ
         +r7NiMFqSe41rTtbUdHccNiFLjOpada9Ssm7o6veBe1n5H6OiaJmW/3W9S6A0UFikfoA
         Sr5lJUEjzucpYuzkh1GEsQeapFTvjf7kJcAPo4tE9Sxh6G/TpIZHoaftQ9kU6+1fXsbx
         yXplGevgNOwo4rWECye0YDSfPcq5kVZ3+H7gYl7Q+FYsyCZpeXPPMw3HukPT3imu1K4C
         ib5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369098; x=1795973898;
        h=to:from:subject:content-transfer-encoding:mime-version:content-type
         :sender:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mR0fTVLdZEKFf91Dji+/qWQ7IYZOv/q8IsE2009BXgY=;
        b=WZHJIKxgPnjPMqUlMBOZTp+5+IwAeWXgDgzZhyHfu7vaNo3m6ClmtYQ5S9JMfcGzni
         +7O7sOQSh6mYPOmIm+wCh/2M2fqt+jIQWSy99Ii1nrR1a6ewGB26yNOXhoIO1uGNyVwN
         +3P1udQSHdvGBc1xJtbETpVBSoFcXowMRPqNp0DC6VsvaaGNmzdtuhXNqKFHeufkeLTK
         EO5keBj/NWM5Dw4jkG4YbhooEvb+8tEAj6iYWncuhwkyDdmPQSuYmJCrlVEoC9hh3eGY
         EPfKDFq7Sz4gaVrpDURTxzuxu1w+h9Zjt8JCs/MWx/4PaSmAZUhKHAzYt4xMRRTKfYu6
         qm+A==
X-Gm-Message-State: APuU4Z8mvkX1b7dGf/eRUznqRAHEFMk3sSIvl+jqjR41Fln3SS+yTZGq
	8Pj1HSAK9ylND3k4lVEUaw3s99kzFQtlR+MPpRG0dRIZuRqQ70V3wC9zlVvHkIHO
X-Gm-Gg: AZFdTZe2seocJa7KtlvKMeroSo4uwV9vITMNDsel5e79G12xp/fOOlOSkIaeGm4i0aV
	4uqZMD81kD1kXqiYB92/7NZVtIpCiNQjSG6zdUGPUly+P/5GzAH7LDneGdLjlfwhtRAnpMQDB9C
	5S63J5JJzGC+gZhHqW7HoL/x4c2d54vB20Wny1V+gPdE4Sw5AAxoPZr8dWwmCcW6BTcBDupYWAD
	jsVBTK6LHjyEDe6ekZGlCh226IEAlV9Ys7F632LyDu9b9qoZJPLzwlXlgYh2EI+n29BQZY0gl0E
	bMEBO9CLHemYF/2oRXuC/2IqvWkuCeRUgwUv2jVTBzV2EoL+V43v2jyezrKkGNQWUXLtM1cJqzw
	is3lr9TKdeZA2JHSnr2YoXmTFF0BWCRZo5cqsya9mR3nqOS+Fp5nD2FJ5xObEVUmXTTobX0GrjD
	IL41z9RTs4HIVRIopSEntbo2zRaVr7C4BDfg6/vivk/m4tLAj/7U5bABqZwtNSIsuP4ziL5ipX0
	Wlazda1QW/kSjOz+0jcLeUdCvac8adFPyPCLqfSal2lUTZudHUWWANQ//3zMLAFHPGIvevfwapj
	usBqNLO7VO0afTlQ7qR4LOx2QpYmeuvsE1A5djWV
X-Received: by 2002:a17:907:9903:b0:c49:cdc8:10cf with SMTP id a640c23a62f3a-c513ac754cbmr586097366b.40.1795369097762;
        Sun, 22 Nov 2026 09:38:17 -0800 (PST)
Received: from [192.168.100.18] (185-72-186-61.cgnat.inetia.pl. [185.72.186.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acff65bsm343043866b.4.2026.11.22.09.38.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:17 -0800 (PST)
Message-ID: <6b032889.37338684.23e1f6.5476@mx.google.com>
Date: Sun, 22 Nov 2026 09:38:17 -0800 (PST)
Sender: =?UTF-8?Q?Dominik_G=C3=B3rski?= <karolvlesksk@gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: =?utf-8?q?Wizyt=C3=B3wka_w_Google?=
From: Dominik Gorski <dominik.gorski.671@gmail.com>
To: linux-kernel@vger.kernel.org

RHppZcWEIGRvYnJ5LAoKUG9tYWdhbSBmaXJtb20gdyBidWRvd2FuaXUgc2lsbmVnbyB3aXplcnVu
a3UgdyBHb29nbGUgcG9wcnpleiBwdWJsaWthY2rEmSBwb3p5dHl3bnljaCBvcGluaWkuIFdzenlz
dGtpZSByZWNlbnpqZSB3cnp1Y2FteSB6IGFrdHl3bnljaCwgcG9sc2tpY2gga29udCDigJMga2HF
vGRhIHogdW5pa2FsbmVnbyBJUCBvcmF6IG9zb2JuZWdvIHVyesSFZHplbmlhLgoKSmFrbyBiZXpw
aWVjem55IHB1bmt0IHd5asWbY2lhIGRsYSBub3d5Y2gga2xpZW50w7N3IG9mZXJ1amVteSBzcHJh
d2R6b255IHBha2lldCBtaWVzacSZY3pueTogMTAwIG9waW5paSB6IHRla3N0ZW0gZG9wYXNvd2Fu
eW0gZG8gYnJhbsW8eSAoY2VuYTogMTAgesWCIG5ldHRvIC8gc3p0LiwgxYLEhWN6bmllIDEwMDAg
esWCIG5ldHRvIC8gb2suIDEyMzAgesWCIGJydXR0bykuIENhxYJvxZvEhyByb3prxYJhZGFteSBy
w7N3bm9taWVybmllIG5hIDMwIGRuaSwgY28gemFwZXduaWEgdyAxMDAlIG5hdHVyYWxueSBwcnp5
cm9zdCB3IG9jemFjaCBhbGdvcnl0bXUgR29vZ2xlLiBUYWtpIGZvcm1hdCBwb3p3YWxhIHNvbGlk
bmllIHByemV0ZXN0b3dhxIcgd3Nww7PFgnByYWPEmSBpIHJlYWxuZSBlZmVrdHkuCgpKYWsgdG8g
ZHppYcWCYT8gUG9kc3nFgmFqxIUgUGHFhHN0d28gbGluayBkbyB3aXp5dMOzd2tpIG9yYXogTklQ
IGZpcm15LCBhIG15IHd5c3Rhd2lhbXkgcHJvZm9ybcSZIHByemV6IFVzZW1lIChwZcWCbmEgRlYg
MjMlKS4gUG8gb3DFgmFjZW5pdSBvZCByYXp1IHJ1c3phbXkgeiBoYXJtb25vZ3JhbWVtLgoKQ3p5
IHByemVzxYJhxIcgcHJvZm9ybcSZIG5hIHRha2kgcGFraWV0IHN0YXJ0b3d5IGRsYSBQYcWEc3R3
YSBmaXJteT8KClBvemRyYXdpYW0K
