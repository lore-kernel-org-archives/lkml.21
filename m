Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708247;
	b=UHkwGsqVFSEhWt6E9IhQFt+gJ02qTdIhO6d9A+76avFYZhVDyQunO55a75k2HnFTGEgB
	 lWkfD1IPRszS815OU8jxdUsFBxCOBrSZbMJgIZQQ2vP9fRkX/saAWylr1b+CDLlfN+cLa
	 JBqzLsG0WDd4iHaI91w/0UGQeO37fHO8yZI3W9uuFFt3AM9B50JkWtAG5v+3c0CD5L5cc
	 4/zI8SuSy4ceckjO00V8siGX8Tfam1uB6yYn69Ghiu3GU9AuM45l2VHtRjDyWsB7XbOrn
	 g7WYHMXK5rU8jXq68BYEIUXII8vjFy0e30SZiCj7AzcGTMBXbOoc8OrewPOBAMSYO/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=glyjOGPDQ3KqGdbTgWLeYjcqz5k2+ySsomlMSz6dDO0=;
	b=2Bg+2PirpurBmaVUjMQMzUfGdNELtuu33rohCWEcyGkhbTn8dGzd5IH8FSIwTNKDZjzY
	 RqdHQ0guSWs2Khxo0y3KwwK2D02RlnD8H/wa2Cfq6zPW+dnrajv7Ht5AChG4NpJW10Ylz
	 hMfsEt4Qs6cpL+Xb13FoUCc0ZMqxNhMuwPePEOhKYvWeI52d9d+KtyQs1xuv+CNsydO0K
	 Tb/naTdLmkVx44GbcL94SMFXVMqAK1kIZcZLmAo1YVrwmT9L8p6ySzNZHJ6a2FvpLdrDQ
	 Pid/q9+d3kwz+zTV8uPzwg4RP9NtJDfznqxhh1peLGZ4kj3WH9EPXBRoN1xy9dwoxRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBQXqR8Q;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D49C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBQXqR8Q
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5127c7abd5so1105818266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708245; x=1796313045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glyjOGPDQ3KqGdbTgWLeYjcqz5k2+ySsomlMSz6dDO0=;
        b=eBQXqR8QXglxtIrWeTn1hf+iL1MOC+PES2qgSa0gV34XItn0fnb5gKHLUOyNehF/yR
         aytIA1u7fERR7FfBVSSdRxgsfzglq95/Vek+Y9dhb/7qabeWE2fo3oK83uVQv4ggxpSD
         0d7qwfkmYL5NIP+8S7U7FvMlkvW0vzq72VS9SPIAtAwIcYsRBGfINlahZbY7b3UAAZdq
         Tai+vGYZ1yCyK9JVnF808Iw9YFMFLtf2SNS+EeMJWoPd9h1OHFfoHElrP0IhQ5Di3bTZ
         TNOu4hYlfamFFGfl3nWBqRxBaSJTtmo6CBw3ro6Hx70cWcXIgrdU2QjR8f5ApLfynyFP
         eVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708245; x=1796313045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glyjOGPDQ3KqGdbTgWLeYjcqz5k2+ySsomlMSz6dDO0=;
        b=aoPQFCg2svQ6ARg2v74gDhhWHR7U6uhLye9h8MSmrwu2lrjZAiOhraQkM/Cg8zfsi9
         mtem6lQd0EoeXr+w6CFgeJ/BYpXIfmguvyJss1zGvHytwn489T4xB7Sv+cwCxwPo5uNq
         xq5mWXFUwduaGw44P60tFYbei7I2/AuVD1pNXpx7Totuno82F7yHP39naaeyjhoXPFZc
         P+I9a8QL1Y9zz9kunw4QbaTlm5+WIzdxW53qooaSkqtRivXDDE1I0UpPEI1cvU4uT7y5
         yuDlBTXsp+873LDZvD4DvfCfdHp+8OCwCpshC1jU/NBhaYPzYRXgWhRvIUqym7QVeclY
         wGIw==
X-Forwarded-Encrypted: i=1; AL+hErHSkK332iY0CdGls+jj6nbleNtTUV39nDpA0PERFMRlHYyJoqyJW1tJF5ZhaCLGgUviBj5f7ICIjTj2e98=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AEYZAd6aA4BFkgkSMuKngWIPyPGm2uVbxpyREe6uSrOu3rzT6
	zGx0RkvtNhD3ONzmzlSfjhypBCKPbyhPluV3zZGA/u9TKpgtRWdh1jgP
X-Gm-Gg: AZFdTZcDAzsTbrf9rQeszUtPruqSj9D+0dNT/z9B4Z34mcFbRC6sIneCR2Sw+cgJQvT
	r6erNxXrHDsH3qlbHDFdEdaGVY3aiFqQRhU0E3Sqxw2X+Ds0RKn5FXVId5sh4yedhNo8KsNM2Lb
	+/v+A3eZus7/5yOA0pEQ7OlKpggBay1lnmc+AYf6dP9heoVa/1SKvFZ+5rAjeiDHYZlTY0ppj8M
	OqY+4keQZP7nYSYc6YS20WKtPvcsmDlxWrAi67HE7evRlPldnOy9s6/OPIQYdEc6TDQ9vAZ/Fws
	2127c0zjBW7CZf8csTAiuerPiMvntJw26IZyYfbtavtvQgFYh1LSfRxCpnM4ttSwPywYzZaiASl
	1tR3VVUZe1MZ1CpRjVRTL0OGn4/MhxSCRa0qiyZhY4ss51tFz4gbKH9AxO3tVWX0IE0ffQofODo
	KGOaDISw76urduFhNycEYcfJi4slw8GP5pKIyAatT/po0DI0rT6KYFNEWgA21y+nEYd+D68j/3b
	XJB/Mx9YO4+pQYtoQpG5nzZI6RYBRRssjJRCNNZWKROHcug7xqSrqCv5mZ12fvLHMpO6tBhmgCQ
	A9/DOW28qlgN+pV//vDO8yjnv5bNpmi5a8aaoE0cQj57m4B2zHLIPJFosVAZTFQMsjPdPNwMjYh
	u7OuVvNYxvQr+oApEcVqlheu9D4rL2fmg8+z+G0KhK5qI04R46KZ0tYzW3haC0rkCutk5ApPpMi
	of
X-Received: by 2002:a17:907:6ea9:b0:c46:645f:cee2 with SMTP id a640c23a62f3a-c513a3ab024mr1869288166b.4.1795708245307;
        Thu, 26 Nov 2026 07:50:45 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm766559666b.11.2026.11.26.07.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:50:44 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: netdev@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] net: dsa: realtek: rtl8365mb: fix FDB lookups in VLAN-unaware bridges
Date: Thu, 26 Nov 2026 16:50:37 +0100
Message-ID: <20261126155037.2897040-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125131339.908183-1-stijncleynhens@gmail.com>
References: <20261125131339.908183-1-stijncleynhens@gmail.com>
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

On Wed, 25 Nov 2026 14:13:39 +0100 Stijn Cleynhens wrote:
>  - Boot: the CPU port came up and passed traffic on 6 of 6 boots,
>    without the re-latch work from your v8.

A correction to this: it holds for that one unit only. A second X50-PoE,
with the same chip version 0x0050, came up with a dead CPU port on 2 of
2 boots with v14:

 - the switch sends towards the SoC: s00_p06_ifOutOctets counts
   (9884156 after about 20 minutes), but the SoC MAC receives nothing,
   mmc_rx_framecount_gb stays at 0;
 - the SoC MAC transmits (mmc_tx_framecount_gb 5606), but
   s00_p06_ifInOctets stays at 0;
 - the two user ports forward between themselves as usual.

That is the symptom your v8 describes for the AX55. The same unit has
run your v8 with the re-latch since early November without it, and it
came up good again when booted back into that firmware.

I put the re-latch back on top of v14, reduced to the check and the
edge: on family D, read the SDS link status once a second after
pcs_config() and, while it is clear, park the SDS_MISC mode field at
DISABLE for 20 ms and restore it, for at most 60 s. With that, the
same unit came up with a working CPU port on 10 of 10 boots; the link
bit was set after 2 or 3 edges each time.

Stijn
