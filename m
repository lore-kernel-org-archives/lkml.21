Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438095;
	b=u8nk2E8ofFWas0qERmOFqX6VNFTLTfcQidlY5Cbd5A7XaUHko4FKxRLPXBB+rgf1ZmQR
	 OvWAxO5bV5QTN16ePa9iPT7A+05zzGlrMk8MPORX0ubb4DQGj+iT1p4bWBI7hMwQMvxjv
	 F5itI1232FLCdxbYcE/dXoHQz/ZTEaxuK1jl4PuvRfsjrVbMSgLJ8lFh3iNhw0lBx1WB5
	 wFedGEWoXipN8tRxLG4dMvHbvYC6+5MqUPxvpdxJz8EJZMhZ7NEm7J8SObr1jqhudwknq
	 rWGUZu6yDmVfL6lhcjmQbwjEhDjOtJtUxsOlohA0zlZTr+1vzaaWkjH5jLP0ohcS/Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438095;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=KYlDHaU0d0BcNbHJgBpvpRlrSDERAzx5Le8G4/1rMoY=;
	b=vxNC8Mn/L5itP1ktESY4Qeu3ai4QsWcbduYFzomwJJ50ZoI2T8FmuA8zc7/a7zjsNOED
	 QzQNVGOxiV2wP/eSUcATphMa23lyXggzOaNwnHBmqmEj0yXTrX297IqjfdDdjGi9Pq6KK
	 Vh8Xa6Akr82Llo3QCYVD3KDZ7/45sWoBi8Jz2W+j9ZUWkS0+xcfbsAORZi0RqHUBB0mPB
	 E9CE0WdCw5MsOkMNtbF+ptEIsA6wl02zETZ7lrFgRRFECex4oi7ZD1q+DiNy2ppgDRfLp
	 WOQvpFBVSINB7sTDzEkr1ICFrP6bzj0AG878Jw5uQWxTLAv82aJ7SQIejxRTdRksuXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=e8iUMloO;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8EC606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=e8iUMloO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5BDDDC6914A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:48:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D6D7601E1;
	Mon, 23 Nov 2026 12:48:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73FB511E68F49;
	Mon, 23 Nov 2026 13:48:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KYlDHaU0d0BcNbHJgBpvpRlrSDERAzx5Le8G4/1rMoY=;
	b=e8iUMloOyNJ5zVEl5crV5boCsvIE2wqWJbvWJD1T/kqsFeIKQNBGWqNcHnCOFXGUiNYLY+
	sGj+sEJ5Ef750Gq6UB03oHHNijrhoaM5+i268AOMVpa/UREepJVHTthHBtSm40OECGKN4t
	g4f7lblY4VI/EFFs4FdqwdpjwEXfiD3wdu0OgDrBuHtqLrl6u3mdU9oy+Jwfc3MZpP+Yav
	qsseEMREUtf7fFvyWmDhSPmsj9JNcTfkkFx9omDo3/Qiuc4GM/ukV1G8O29b88Lm+TixkG
	8u07UvH8Zj746anst5Kk2/7wkKrVQefA/k0euVl7MVC8n6xWdRN7h2TnbhjcSA==
Message-ID: <06c5bb031304c493763b829899211cb46efb96f8.camel@bootlin.com>
Subject: Re: [PATCH v3 0/2] mailbox: Add Marvell MHU driver
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 13:48:02 +0100
In-Reply-To: <20261123094542.44101-1-paul.cercueil@bootlin.com>
References: <20261123094542.44101-1-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

WW91IGNhbiBpZ25vcmUgdGhpcyB2My4KCkl0IGRvZXMgbm90IGNvbXBpbGUgYWx3YXlzIHdpdGgg
Q09NUElMRV9URVNULCBzbyBJJ2xsIHNlbmQgYSB2NC4KCkNoZWVycywKLVBhdWwKCkxlIGx1bmRp
IDIzIG5vdmVtYnJlIDIwMjYgw6AgMTA6NDUgKzAxMDAsIFBhdWwgQ2VyY3VlaWwgYSDDqWNyaXTC
oDoKPiBIaSBKYXNzaSwKPiAKPiBUaGlzIGlzIHRoZSB2MyBvZiBteSBwYXRjaHNldCB0aGF0IGFk
ZHMgc3VwcG9ydCBmb3IgdGhlIG1haWxib3ggZm91bmQgaW4KPiB0aGUgT2N0ZW9uVFggYW5kIE9j
dGVvblRYMiBiYXNlZCBTb0NzLCB3aGljaCBpcyB1c2VkIGZvciBTQ01JCj4gY29tbXVuaWNhdGlv
bi4KPiAKPiBUaGlzIHYzIGZpeGVzIGEgZmV3IHRoaW5ncyB0aGF0IFNhc2hpa28gY29tcGxhaW5l
ZCBhYm91dC4KPiAKPiBDaGFuZ2VzIGluIHYzOgo+IAo+IFsyLzJdOgo+IMKgLSBSZXF1ZXN0IGFu
IGludGVycnVwdCB2ZWN0b3Igb2YgZXhhY3RseSAzIGludGVycnVwdHMKPiDCoC0gUGFzcyBJUlFG
X05PX0FVVE9FTiB0byBkZXZtX3JlcXVlc3RfaXJxKCkKPiDCoC0gSW52ZXJ0IHN1Y2Nlc3MgY29u
ZGl0aW9uIG9mIG1ydmxfbWh1X2xhc3RfdHhfZG9uZSgpCj4gCj4gQ2hlZXJzLAo+IC1QYXVsCj4g
Cj4gR2VvcmdlIENoZXJpYW4gKDIpOgo+IMKgIGR0LWJpbmRpbmdzOiBtYWlsYm94OiBhZGQgTWFy
dmVsbCBNSFUKPiDCoCBtYWlsYm94OiBtYXJ2ZWxsLW1odTogYWRkIE1hcnZlbGwgTUhVIGRyaXZl
cgo+IAo+IMKgLi4uL2JpbmRpbmdzL21haWxib3gvbWFydmVsbCxtaHUueWFtbMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDYxICsrKysrCj4gwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKwo+
IMKgZHJpdmVycy9tYWlsYm94L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMTEgKwo+IMKgZHJpdmVycy9tYWlsYm94L01ha2VmaWxlwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKwo+IMKgZHJpdmVy
cy9tYWlsYm94L21hcnZlbGxfbWh1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDIzOCArKysrKysrKysrKysrKysrKysKPiDCoDUgZmlsZXMgY2hhbmdlZCwgMzE5IGluc2VydGlv
bnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWFpbGJveC9tYXJ2ZWxsLG1odS55YW1sCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9tYWlsYm94L21hcnZlbGxfbWh1LmMK

