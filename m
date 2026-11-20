Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.202.87.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157395;
	b=XSzVWmQzM3IzKIKtRSnhZTqmjp18yJyHtiE1IaFADp/RVQedvjBW+KjNF7MLPwHgEqMN
	 AVVugUXlPLblR1E3XYhGU7tLLyVOPRM+rV9ZPL3qnn+jhzopDdsHY8C6YDuvak3Q2mePd
	 hddEOcRRtk4ZpwXFnpcWay0IBeN3ul88RXP0JFBgIXog1v1ZTs+ITS7Bnrd0K5YZOJzX3
	 WDOO7iM7wg6qe9Nq99ceBRouOe1zYy53P7HxYA8AUJn1mw4Lz0p5SGVFniIRvQ5uUg9ry
	 X4Ax9N8GEHssDwrm8no5WW93LCWXdM9CPXxN5NHEDNppEjEEvuVqKbcS4eX8AlxaP2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157395;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:x-tm-snts-smtp:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-MAIL;
	bh=mXYQzIaaSv6AmSi2udnXwEZprmwNs4qcFT5JHKRMs9c=;
	b=eyNkq77szH1iVzMlN9qn386tff0u4Y+8HxYZKlVsgtrxtUONeUo+arNEq8RxaH9ajgCv
	 0wuUAXCVxBUcya5vEZMsyCpr7gUspYgeWGOT1qCD6BF2lWzePEBVwSf1ldfIRkhrOaVtG
	 1rA5sUP3c+x1uy8xgephob6hCCdPf9sqsrgyn2ZG29Eai3ruPWszkNafyiGRYrLM0gdor
	 3oCbgIREHyHC2uL1ITFKARZvSmO6JaCuxPBjX7+l/gXA823bRvWR14sw1Ib0UXPpKwxmq
	 Yd4E1kDv89ikwC/hdrHDkjx/Bc5hxmqC3Q444NbeOVz7xLTA1n5LmeImzjmP3txpKWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ite.com.tw;
	spf=pass smtp.mailfrom=ite.com.tw;
	dkim=pass header.d=ite.com.tw header.i=@ite.com.tw header.a=rsa-sha256 header.s=dkim header.b=hAH12G5b;
	arc=none smtp.remote-ip=210.202.87.179
Received: from ironport.ite.com.tw (unknown [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE14606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE14606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.a=rsa-sha256 header.s=dkim header.b=hAH12G5b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mXYQzIaaSv6AmSi2udnXwEZprmwNs4qcFT5JHKRMs9c=;
  b=hAH12G5bQ2UlaOx5NeJ2GMg6h0Koh4UF5Z5OI0tWBiaLKyzLiwnfo9vH
   yo6BdwhHRJ0/6BbgSUG6fYNIjkma8ICyl+ytbcoJ5GxmTEvsZSp/tcrPh
   AZzx/as8fjSpX3At0Yp3X0cvRO6lyb2d3GTVZ4MHXXpkykZBacbGVormt
   EU73YNezgPtUeNKW6Eg/Mv1UK3mSXP/f5JaOgwanUXJ+akEwrQW2v3mLn
   mj9Jdbqez1lV6r6RfY3VaCykn2ho5KE2jXCvXgAxAeoG4ZihRBJy3mxxa
   Fu/6sPyNhw0/L3r5ZbpzZJA2qwtYdiC7KaGBJBqX7qM8wA1OsYwdlveIi
   g==;
X-CSE-ConnectionGUID: bEqCvRHgRlWKXLF3WFlqxw==
X-CSE-MsgGUID: knnoYdR8Ss6NQAgog7IGlA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 20 Nov 2026 14:49:46 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 6AK6nfum040993;
	Fri, 20 Nov 2026 14:49:41 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 20 Nov 2026 14:49:39 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.046; Fri, 20 Nov 2026 14:49:39 +0800
From: <Hermes.Wu@ite.com.tw>
To: <daniel@makrotopia.org>
CC: <luca.ceresoli@bootlin.com>, <andrzej.hajda@intel.com>,
        <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>, <allen.chen@ite.com.tw>,
        <treapking@chromium.org>, <wenst@chromium.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Thread-Topic: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Thread-Index: AQHddahmDGCOZ1R9702oMT4TMp7f/bczKViwgAHqqYCAAXcSgA==
Date: Fri, 20 Nov 2026 06:49:39 +0000
Message-ID: <da7b73e6ab2749438acd2909cc9deebf@ite.com.tw>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
 <179251509978.78870.2485132679226608837.b4-review@b4>
 <179481904178.211952.8076269834336042526@makrotopia.org>
 <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw>
 <av8jL0W1vgdqPQhu@makrotopia.org>
In-Reply-To: <av8jL0W1vgdqPQhu@makrotopia.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 60F66699CD10F79D09AD0BF56ADA95C39007560D7B71D33B564E58776966AD952002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 6AK6nfum040993

SGkgRGFuaWVsDQoNCj5PbiBUaHUsIE5vdiAxOSwgMjAyNiBhdCAwNDoyNjoyM1BNICswMDAwLCBE
YW5pZWwgR29sbGUgd3JvdGU6DQo+IEkgd2FzIGFmcmFpZCB0aGUgYm91bmNpbmcgZW1haWxzIG9m
IHRoZSBmb3JtZXIgZHJpdmVyIG1haW50YWluZXJzIHdvdWxkDQo+IGluZGljYXRlIHRoZSBkcml2
ZXIgaGFzIG5vdyBiZWVuIG9ycGhhbmVkLiBJdCdkIGhlbmNlIGJlIGdyZWF0IGlmIHlvdQ0KPiBj
YW4gZW5saXN0IHlvdXJzZWxmIGluIHRoZSBNQUlOVEFJTkVSUyBmaWxlIGZvciB0aGF0IGRyaXZl
ci4NCg0KU3VyZSwgSSdsbCBzZW5kIGEgcGF0Y2ggYWRkaW5nIGEgTUFJTlRBSU5FUlMgZW50cnkg
Zm9yIHRoZSBJVDY1MDUNCmFuZCByZXBsYWNpbmcgQWxsZW4gYXMgbWFpbnRhaW5lciBpbiB0aGUg
YmluZGluZy4NCg0KQmVzdCByZWdhcmRzLA0KSGVybWVzDQo=
