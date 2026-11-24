Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795493312;
	b=BZpV6U9ORqcvF3ASc3rtYK1Q/kyBZqU9n4YZqUk3qPd1mTiBGcJ6+I6xcUKlPZko6oYx
	 8MAbSTl+O9CF5zJE6W0FDaQS19syuycIAymgDR17U1F2oA/OHDKlDfyAdpGzjEfuLc/PF
	 lt1t62LmwVLDTNbR+MeDO2Q2Affs95MZxPjXeHBNHj6MJrS1N9j4O74ls8rQXV/rlyqfk
	 MgA+ko0SLjdUq6hSn0SPdFqUa64LGD3tlqE7z52sqCKwMfkW47RKtfB+yAgPX9kZBWZkg
	 J7m8SzRSxEuEZpriXhmBz7wjw+rQs3UqnLWIyEkr8gsCSab2sUZ+ZbPOW3KOfNP0WIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795493312;
	h=DMARC-Filter:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=DXqftGDNEC6TtcVu5qAokvKPDz6c4q39pkdugAXkr+A=;
	b=UehWCKHLzcj77PwjIhc5SHBK/GSg1xebbxN8E3Lmjs9thYoNZ15Y45FfHibM84FflFCX
	 WIVlGGm5ENfioTq5BtkWe9AEdW2UN8h4JNMtQuHDzlxe2GFTgmHx1QHjUX7jxqSD546qg
	 5OAfR0znVAjvq2n1SW/w3IPV5wSiIvz1PuIbdvJrfSPcK2kIoligzugd+JFW3LOJSncWM
	 3sKnkYW1zfZJPJo5Ka8pgBMlYDFYsaQxZ9sqkBvwqdYaSMk5n7LreNAWpX+mC4AJrs/GD
	 7bi9GrwEr3ulPqAQOKGKquxex2BXFKQKlptbAOHfIKaVXgkyYw3NyNqUXiaSTf7ULhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D657E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D657E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jYTn51rkdzVcB9;
	Tue, 24 Nov 2026 12:08:09 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jYTn22m9hzVcB6;
	Tue, 24 Nov 2026 12:08:06 +0800 (CST)
Received: from cncheex03.Hygon.cn (unknown [172.23.18.113])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id CC3F93792775;
	Tue, 24 Nov 2026 12:06:55 +0800 (CST)
Received: from cncheex04.Hygon.cn (172.23.18.114) by cncheex03.Hygon.cn
 (172.23.18.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 24 Nov
 2026 12:08:06 +0800
Received: from cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d]) by
 cncheex04.Hygon.cn ([fe80::1b6f:6c58:58a4:430d%10]) with mapi id
 15.02.1544.036; Tue, 24 Nov 2026 12:08:06 +0800
From: Shance Luo <luoshance@hygon.cn>
To: Borislav Petkov <bp@alien8.de>
CC: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H
 . Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/CPU: Fix FPDSS on Hygon
Thread-Topic: [PATCH] x86/CPU: Fix FPDSS on Hygon
Thread-Index: Ad17yWdyQQHb33aNRxCAZ2iec9bJgA==
Date: Tue, 24 Nov 2026 04:08:06 +0000
Message-ID: <3670e857db444608b685ca4785a62ffd@hygon.cn>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
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

SGkgQm9yaXMsDQoNCj4gSXMgdGhpcyB0aGUgbGVnYWwgbmFtZSB5b3Ugd291bGQgbGlrZSB0byBi
ZSBpbiB0aGUgZ2l0IGFyY2hpdmVzIHdoZW4gSSBhcHBseSB0aGUgcGF0Y2g/DQo+IC4uLg0KPiBG
cm9tOiBTaGFuY2UgTHVvIDxsdW9zaGFuY2VAaHlnb24uY24+DQo+DQo+IEFncmVlZD8NCg0KWWVz
LCAiU2hhbmNlIEx1byIgaXMgdGhlIG5hbWUgSSB3YW50IGluIHRoZSBnaXQgYXJjaGl2ZXM6DQoN
CiAgRnJvbTogU2hhbmNlIEx1byA8bHVvc2hhbmNlQGh5Z29uLmNuPg0KICBTaWduZWQtb2ZmLWJ5
OiBTaGFuY2UgTHVvIDxsdW9zaGFuY2VAaHlnb24uY24+DQoNCkknbGwgdXNlIHRoaXMgc3BlbGxp
bmcgY29uc2lzdGVudGx5IGZvciBmdXR1cmUgcGF0Y2hlcy4NCg0KPiBUaGF0IHBhcmFncmFwaCBp
cyBub3QgbmVlZGVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4gSWYgYW55dGhpbmcsIGl0IG5lZWRz
IHRvIGJlIGhlcmUuLi4NCg0KWW91J3JlIHJpZ2h0IC0gaXQgZG9lcyBub3QgYmVsb25nIGluIHRo
ZSBjb21taXQgbWVzc2FnZS4gUGxlYXNlIGRyb3AgaXQgd2hlbiBhcHBseWluZy4NCg0KVGhhbmtz
LA0KU2hhbmNlDQoNCg==

