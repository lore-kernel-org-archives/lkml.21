Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707991;
	b=b8ONsWqSQ9EVhMJqP1jJy41AGx/zVquze2icXgXkQMVuQVoEm1I0HO2O8SQXvp9mmG5h
	 t1FU3fo5Nh7JDEWSr0o8e1DwG/C2LZNmDLdN+mZq7Sr4I7CugiOgqgM9f3fqR8euMztia
	 UOGnaasVzSYeDL+StHp/QTOLTz+PoaoeZM7mX89CB+PowxnPO2gpYZnq20c+Eh9qqNSvE
	 /XbkCdBrCOHd2sSfJsMR1UjueehZhirdR1OJptIfgBEsjVgmadFMJGtBH0r9jey0Mh85C
	 u02wrr19fIuECrhbwhMsyMw5Nh265ybaSLxLL8FImQT7F7iyhibNIZRH8TtSQBxh1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
	b=ibmD0abRMOEo0xp7MBCrTbngQF5LjYSx4zT/5gTo1HBsNvqWHa1mHX5+kBHRWK6dAhBS
	 uPbGcrxoSjPb2K99iWWwG350WpoMSlKPjMufORPO+31y1GuIh3axiNi3UQlin8uyFcVQ2
	 o4UJHoDMmgMU7Y3feVb937LKnwWgGZV+i0zf3Omw087Iw4SFGsqZhWMkb80eXwqoucmD0
	 2gCnnq3wMQffR+jOLREcflas0LclxIKo93/tX6IQqIp8AmtSdlQA3gNAW/Ep3hOklTqaS
	 s2ZjEmCz/70b5tOEcUuDicFWGkruMJYMhVyxH0u3oAxcVZnJOlaok4Jw92ZTYoA8zgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehc10ZS7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF01C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF01C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehc10ZS7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a9be758734so4555501f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795707989; x=1796312789; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
        b=ehc10ZS7ZDz1IL/IvAdVNxSDL9JWgq3HoRFvbcCMC/gcCmwuyephjvNKdKPK3hrvvE
         4RCE4OXQLuY06pczn89BcHDypfWL0AOE1JGsWFEh6Dl+co/5zsEMvHMU6KLc5sKN3aKM
         /751XgVfwE04mMpsCScIeJGees4UX79wLrNJhicwJ2KzCkxFi2cFTKo2up3iQC1FPR+R
         utNhlLF1oouWTWO7LaCNp6voDYU7a+GeL9xC8nTRMukPT/xjPdk/s4HENEG8u++504fL
         JlmtVi8dddMGRNdxnTQk/MoG6VB2bBRsRc/Ed8RF/IfK0oOJGhyk/+sX0w7Me8YkHXQ6
         jTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707989; x=1796312789;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
        b=EffreMQ1gP+Ekv4QG8lAMxpGekMqsZ6ndW2jUtdOXcHU8HNm3zlOXCHVGzQdgQ3hJm
         jNCCVsgJ0/zggLTAVwheZ7Udx+c3lFXJC6qLPdWc/loCaGT4bjk4ABQvGbiqKHPytWxe
         v3BNuFQC1wURmC+6/D/vQ4CPoP6NESIgJQVSWIXud70MprCsqPshTG/0J+Rc2x2ypkw/
         pBWckILKTW84TwYOyGrL1vbih0woN2aZgWfc5E/24itSbQXmmvjNH4LlIGdk8xegeurI
         NrXl/odVYKwpLGq73rsmp3APhIDRHiM1iIcaTJs9gpiMt/W1j/Ua67xEQbMYwZ5zwQjW
         L4Ng==
X-Forwarded-Encrypted: i=1; AL+hErHzk4/sQUq6s3YZwshVWqnJlkHZm3EXX6lL76Vocok1OKOGrIck5wUglUwWQcTP7W6oRhDZD1Exg71yenQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q2kBz+KtS8rAuZhcyBu5HEb3LZbk6vz9PKW7v32rHuD6ZySHW
	CfgNGwCEX1WHulV5sapIjbW7P6UeVM5Ee8SRxB8iPr4Om3tjFaq+jiuM
X-Gm-Gg: AZFdTZcEmDhex4GE1GWoNcmiiXkGNjlxgFIpx7W38gYrKMoRkqWyOYItrnW+GIeV2dD
	wSh36MZv1BnvS7So+ICKI9dlMmXZNBaz5HJYJTtK9BVygCUkqE/IVIfdLEJq4zhzWYyeijyBzqG
	K3y6W2z8gtGXMOV8QESQrpbS6MkZoEDQwg84cpb6ygPyuW1h2/dPlLUnlb6x2mzqF5FiQ4sBET9
	eGBJs+X85X2ZxHVnxhusaH6Y3rCQ/d90H/ieTablh2wCFkmTT1nZqVMo0Z3FYuHQ2VPaHCdYiaU
	sDGM8G1m2l4lftlnSRniJYNl0u93m6Db8bqQzkAw4LPxfaTXLG3LxdFXUepXHilVl7X+O581I2+
	pobeh7GTfBWYOc08bRf37+d/TrbtcW0miCwF6JsFi+PLvSs1mAqyNPP+MKu6S79JJ56FsTpyxCJ
	6mfzUyR+SLiZ/oY6Mytveed3sl20FcrLwinN9X07O2crelIZ7F7RRSg6R2q33byVQRLilXXtpDM
	x/R92T/l5AcVCpVjLasTWBMhg12dd8xMIEuXdCFI+xuph0GqrByqwqAQ84pkoUDtZIY7B4JvbbU
	BGvVzBfaJOHquiC6oCVrGUeo+ooY2ITydPj5m8FkoaxwFEjXC9fP5qY=
X-Received: by 2002:a05:6000:188a:b0:4a9:4dfa:c150 with SMTP id ffacd0b85a97d-4abb2910440mr40139631f8f.33.1795707988916;
        Thu, 26 Nov 2026 07:46:28 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm40084330f8f.7.2026.11.26.07.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:46:28 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next v3 2/3] net: mdio: Add Cortina CS7542 bus controller
In-Reply-To: <97babf2e-02eb-4efb-8662-f960a36b9073@lunn.ch>
References: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
 <20261126-b4-cs7542-mdio-v3-2-35739a0f3225@gmail.com>
 <97babf2e-02eb-4efb-8662-f960a36b9073@lunn.ch>
Date: Thu, 26 Nov 2026 18:46:07 +0300
Message-ID: <179570796761.5.9467085930727317606@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

The vendor register definitions describe automatic PHY polling: the auto
configuration register at +0x14 selects a PHY start/end index and the
register to read, and +0x18 contains poll_wait_cycles. I have exercised
only software-initiated transactions, not that automatic polling mode.

Agreed about the comment. The MDC prescaler is bits 31:16 of
PER_MDIO_CFG itself. I have changed the comment to:

        /*
         * Select software-initiated accesses instead of automatic PHY polling.
         * Read-modify-write preserves the firmware MDC prescaler in bits 31:16.
         */

The code still changes only bit 0, retaining the firmware prescaler;
this clarification does not change the divider or transaction sequence.

Thanks,
Fil

