Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=219.87.157.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971548;
	b=jAPMslO0UwS76dS/+Y1Vf+OkLXJoYyI6dfRJaMpX0KNWfOUGBtEOQtU9LtNfKOygoB7S
	 h4VDc9/1KCGhW2nUaX5KPj+F3jmxURZPGAhxwVbKenRWJ4R3jz/Wi00yRZCrK1LOoOfix
	 q/UZBPZag5Z8oB9FrlBCNDhFYjJU2IAb9WiY8b8MoC6JeR1zqpw641HTfqzOyctd/xOmS
	 N4vajCNLMif0JEF4WrmmXzwzjE+60IXhqQdKrSw3B8U6wgck3rPS9jB8j7HnbojaabBf4
	 Ho1W6zYi5/GmrClsRyQLBhGXqJXM8N1c/aiOD9z8RwqzB8bhbQsuckaf2EDuYqyrQ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971548;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 Received:Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:x-tm-snts-smtp:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-MAIL;
	bh=wfv7QEGo+wzGR5SC4MmODpuDqg+DpTMk5gcJUBNyPqo=;
	b=QSlWwdVToeQ9L+4NQ68dn06/987zW1jdTtdBk5tGPPfMqyno8oNXSJEjep/fiI2GRRwT
	 dH8wsM2gLq17mjFy9jOxfJrOm0BdyNqIbBx+wAup9L9lkGAgAv4atk0OA+aB69OXTgBRU
	 j+3koSGREVVt+V3vfWKjJhiDe0sMdTTOJP2P8m7AM4cgRigqyRv7lU056gYvQ6MULM68g
	 uRjNe2fltGBvoG1OszsMZAaK/NULYNzmGiD+Yf3EDAWC9F0E7LPCl59fo967grOG8x/zY
	 uZky0w9en+xEU1/VHETVQZcQeaneHX9RmnnzsRnRq3KOlkrPDZqAgzQ5HSEr8JaTBag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ite.com.tw;
	spf=pass smtp.mailfrom=ite.com.tw;
	dkim=pass header.d=ite.com.tw header.i=@ite.com.tw header.a=rsa-sha256 header.s=dkim header.b="PC3l/eCL";
	arc=none smtp.remote-ip=219.87.157.213
Received: from ironport.ite.com.tw (unknown [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AA3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4AA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.a=rsa-sha256 header.s=dkim header.b=PC3l/eCL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wfv7QEGo+wzGR5SC4MmODpuDqg+DpTMk5gcJUBNyPqo=;
  b=PC3l/eCLjEoNe4QWPF55sBqPyZ+ExyVqbsLbzysPEO2kPIvGpxpKcYwW
   WpnL/0h3RonkzmjhFrDMobM5/7bTqW1pZFQrGTMoyhY5eFrVrFJLW6Pbp
   8Qnc/+VpC7sZiJ5LqI0+IGcgdOG44D+VIaBl4QP0fsSbq+tdvcvB73hvV
   dksokiIJtJDjiI8FusYzWUBQY1lfPWJ2vbfD6ZZV0of6JjjpAh16oFh+2
   SJ9hQfbQKNbwJsSVvfrExP4ltih7qI6PainT6vftNIH28s82oDY7rJ6dZ
   aDV6ML2iX/kSnFoCm+5uRNkq73UOSfacl8uU0/cFH5TN/sKXIsiZD8XwW
   w==;
X-CSE-ConnectionGUID: 68dO5pZITKeqhx4uCEAlkQ==
X-CSE-MsgGUID: roNQFr7WQne9tU1LTsgGbA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 18 Nov 2026 11:12:18 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 6AI3CF3l027672;
	Wed, 18 Nov 2026 11:12:15 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 18 Nov 2026 11:12:14 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.046; Wed, 18 Nov 2026 11:12:14 +0800
From: <Hermes.Wu@ite.com.tw>
To: <daniel@makrotopia.org>, <luca.ceresoli@bootlin.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
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
Thread-Index: AQHddahmDGCOZ1R9702oMT4TMp7f/bczKViw
Date: Wed, 18 Nov 2026 03:12:14 +0000
Message-ID: <9485b4a86b124cc3a528ca147609bf4c@ite.com.tw>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
 <179251509978.78870.2485132679226608837.b4-review@b4>
 <179481904178.211952.8076269834336042526@makrotopia.org>
In-Reply-To: <179481904178.211952.8076269834336042526@makrotopia.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: E32998829987CCBDFA23848B7A003E0AABE1484F47372397C254447335C1D6192002:8
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
X-MAIL:mse.ite.com.tw 6AI3CF3l027672

SGkgRGFuaWVsLCBMdWNhLA0KDQpPbiBNb24sIE5vdiAxNiwgMjAyNiBhdCAwODo1NjoxOEFNICsw
MDAwLCBEYW5pZWwgR29sbGUgd3JvdGU6DQo+IE9uIFR1ZSwgT2N0IDIwLCAyMDI2IGF0IDA2OjUx
OjM5UE0gKzAyMDAsIEx1Y2EgQ2VyZXNvbGkgd3JvdGU6DQo+ID4gSWYgeW91IGNvdWxkIHNoYXJl
IHdoYXQgdGhhdCByZWdpc3RlciBpcyBmb3IsIGl0IHdvdWxkIHByb2JhYmx5IGFuc3dlciBzb21l
DQo+ID4gb2YgdGhvc2UgcXVlc3Rpb25zLg0KPg0KPiBJIGRvbid0IGhhdmUgZG9jdW1lbnRhdGlv
biBmb3IgaXQgZWl0aGVyLCBhbmQgd2l0aCBJVEUgZ29uZSB0aGVyZSBpcw0KPiBub2JvZHkgbGVm
dCB0byBhc2suDQoNClJFR19BVURJT19JTlBVVF9GUkVRICgweEJFKSBpcyBhIHJlYWQtb25seSBp
bnB1dCBhdWRpbyBmcmVxdWVuY3kNCmNvdW50ZXIuIFRoZSBkcml2ZXIgdXNlcyBpdCB0byBjaGVj
ayB3aGV0aGVyIHRoZSBJMlMgQkNMSyBpcw0KcHJlc2VudCBhbmQgY2hhbmdpbmcsIGkuZS4gd2hl
dGhlciB0aGVyZSBpcyBhdWRpbyBpbnB1dC4NCg0KPiBBcyBmb3IgdGhlIGxvZ2dpbmcsIEkgZG9u
J3QgdGhpbmsgaXQgaXMgd29ydGggYW4gZXh0cmEgaTJjIHJlYWQgYW5kIGENCj4gZGl2aXNpb24g
aW4gdGhlIGVuYWJsZSBwYXRoLCBzbyBpbiB2OSBJJ2xsIGRyb3AgdGhlIHJlYWQgYW5kIHRoZQ0K
PiBwcmludCBmcm9tIGl0NjUwNV9lbmFibGVfYXVkaW8oKSBpbnN0ZWFkIG9mIGd1YXJkaW5nIHRo
ZSBkaXZpc2lvbi4NCg0KRmluZSB3aXRoIHVzLCB0aGUgdmFsdWUgaXMgb25seSBpbmZvcm1hdGlv
bmFsIHRoZXJlLg0KDQpCZXN0IHJlZ2FyZHMsDQpIZXJtZXMNCg==
