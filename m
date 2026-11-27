Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789419;
	b=pFhvba+Sao8tQIXApnWexDLsQ1a7LnrqynoaZb7Dicrc931Z1wyYyjaNAHlpLNqDJfqH
	 SJ83/T08pCq5F8ztOqmkP7uP66YwGxCV1Zne5gIAXKYlE81TspO4yhLL86wG5L915sgFN
	 zkyeaDuUEt+pLTaXPALmvuc9SEASf0wIvsFhN/yYgU6d7QTTyU0Hzw2QEoonA6+v154Zk
	 Tu+gS2UfSxq4YiqDar1R/wrJJkaUO4J+CmYo3vWDN5GWXcjAh4TUlTfbZBe9ZMWxnv7sP
	 XRAe1peyEuj5pqrbtMTo6FmrUl9uAr/GCpe5ul4SYnye4NVHKmrqZ/qxerG0gKcUykw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789419;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=rJjYlq0N0CiTq+K7tDYqTk/syJTuOendfcqgC38Nxt4=;
	b=NQAl4SALbBbyPs2iVVWnTBoDAz/un/brcCVLIoGgLl+08YARa48d9CKg56uTTdrp3c0I
	 fjZhMW/q1NrU0G2DR4hvXlEqumNDbP04vQgCoAC/ig+FJl2sM0ddNCnUuHeQhfbp5Mxge
	 7lURZXmrkm9C7s6FvmEWzFF1ZmAfPNLpv39Vpi0S9MvuiHxTkCNSmSFGITY46lm9N+kUF
	 bP6/syG+xFZp5n/7J2B+2nIS8y3FsLRlFaT9lVHWCyOsQML9cFLEhjmAx/1XlIuXYDKyx
	 zf/tAKbmZs4MD6HL/za4PJFiUivc/B4J+GuwVnJslazT/W8Bp9e0SP/3N6XpiueoNJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HdYgIQpd;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CFB606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CFB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HdYgIQpd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E68E01A1838;
	Fri, 27 Nov 2026 14:23:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8B466049C;
	Fri, 27 Nov 2026 14:23:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CA9A11E69040;
	Fri, 27 Nov 2026 15:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rJjYlq0N0CiTq+K7tDYqTk/syJTuOendfcqgC38Nxt4=;
	b=HdYgIQpdInN/Vp1iLZ4xl1gYvHUpbTPH7eK+GmBt2veiML6L0T6kz+Yk5DmgYIDt12xFI1
	XnjgOCfrPlAlHLd2WB2NPZdGZiJcs3ZnrwwdIWOc84DvpYc3DAB1tU18HkxCdjGK9GJtBM
	4MgxWztMigmYKGrXHFyBP4/6TIYOD4kcdAAPnEHg3sE5Him9gJME5Ryizt8uwbRAPScPil
	4Y3hdpM79V39XaVuHbUaj3gwnz5fW3pPx+SGA/1ePTdD/kdj3Z88hb6blun/ZNWl+GhpfN
	lJDHXH4ydCuWnQsJPeovZudsl0UFJI+pVhm8soBYmbSgRQlrr3SBsykhjC8hLQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 15:23:27 +0100
Message-Id: <DN627T3YFWKR.2YJE24R4DRSDN@bootlin.com>
Cc: "Vladimir Oltean" <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Jerry
 Ray" <jerry.ray@microchip.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bo Mellberg"
 <bo.mellberg@se.com>, "Pascal Eberhard" <pascal.eberhard@se.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH net-next 3/3] net: dsa: lan9303: add LED mode
 configuration
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Andrew Lunn" <andrew@lunn.ch>, "Paul Louvel" <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
 <20261126-lan9303-leds-v1-3-a96731317859@bootlin.com>
 <4d2a5db3-2829-4383-8f8d-05cf7c94fddc@lunn.ch>
In-Reply-To: <4d2a5db3-2829-4383-8f8d-05cf7c94fddc@lunn.ch>
X-Last-TLS-Session-Version: TLSv1.3

Hi Andrew,

On Thu Nov 26, 2026 at 4:04 PM CET, Andrew Lunn wrote:
> Ah. This should of been in the cover letter...
>
> [Goes and looks at the data sheet]
>
> https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDoc=
uments/DataSheets/00002308A.pdf
>
> So you have the choice of using the pin as a GPIO. So you can
> implement pure on/off. That gives you the minimum you need for
> /sys/class/leds.
>
> TABLE 12-1: LED OPERATION AS A FUNCTION OF LED_FUN[1:0]
>
> The functions are rather scattered all over the place, but i don't see
> a blocker to supporting hardware offload. It will be messy, yes, but
> possible.
>
> We have been pushing back on vendor properties for LEDs for a number
> of years, so i don't really want to add one now.
>
>    Andrew

Thanks for pointing me in the right direction.

At first, I thought that the fact that this PHY has a single field for all =
LEDs
function would make the vendor property somewhat acceptable.

Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

