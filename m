Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466524;
	b=QMCMx57NVPyK8hm6vrQdA+FIioXI4qXOITiboBehm77bKxYLohpxXfm1pc3R1boyc144
	 21pSFOY9vCnRWTQeKtB/5qUyBFwB2EWf0JKV4GZLxHVZzQP49xQ7fcaFO080+A0Gj+YXK
	 IcOYbrVD9kMbAMhcD/lOQRCxo8lCGBPfKJc771X/ZG8q8OfXrH0Aied8xpb0PtdMftb+z
	 hvySNvgwnb/d0yKzEmtwtxxvJoyn0H2yDCtuHVzm7HrJG9P3A9wMAL1GCxHCPAjCfwwWg
	 4f2C9oevqtgVt6+UqNQQogDBiCeF9790Fjk5vb/m8Qc4wH8enR27HkFDmyLjgESTs+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
	b=ll4OCKC3CklqJ+diMEexv7PifapQ1lW+49PNxPfTra9Dy+zSZiMRMEeasV1EuXF1gum3
	 xD/Kz/W4mqItWpH6gRPg8z8MM5gIcDCkh58V2jdv5tJtQtSb+cvC/TH1IJG9jERo6RNKQ
	 RHo+tVMulW2qAk9pqB5G7jJ8WMe/qYoLkVdRtiTO4MTdluph32D9HeToQOTXf8ZNfvFxn
	 rpZgXEmTy1QZe0BAKttg09x/+mnDYaeSZ4nEDb4+F8b48oUZRDtH6Ia1uZqiiZgRhjouC
	 dOxz2JTipzvde49vQN8hR8hc1dbwkN3IkXm7lKxeWBSrin3Q18BFBw4UWUljPmE7jlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnFeD6zQ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88D606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B88D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnFeD6zQ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49412eb1474so2421512f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466523; x=1796071323; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
        b=cnFeD6zQW3a3sP/sI++8Ivx5QONZ3SGCCytu8pWJ6yXswzRonX4P6Bpqmejt1rx/uQ
         QrDCR0k0lTPfCl9iUK2zDPqIFRils/CNHRhx2SE6pFXYenpcwViivl5vEwd8ENiLi+T1
         Ut04GB4kRKSPRB+sa4GmRxHG65TpA7bDZJ0S5mvwNyc/OPaa2HmFMiWhW4LS3FwUccl/
         WZGj4Ha4h4pcAUJvLPiYf5FbRFxs0A9M//Vknty0to55/G7QdwjTo973QfKrrKTzZbDG
         TFdna4iGvKllP5tL6XqfbIsqYkIW9zKEEMCRFGzEgm++4NHsDALb5q7Upb0ZkmRjK7D0
         4i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466523; x=1796071323;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRRa07G1xdUZQxEGMvbK1GZwIzrpVcIfzr1BuRr7tdE=;
        b=ZoJdgXtPN1NHRAOAexKwgQLZdzNOucNSiWZVwJhhcOcmMnZAzuuigy9QjCvlIDVrY0
         nSqnOfrhkhLw3LHitCVkWShvR+0NPAOAZ10CjTZXnG+SapOgqAFEaCAnWzGqqn2k4JBO
         4GitpFd+HXf9PhgGansonoKp+JOPD3KBLggitHQuaLn37ZCTiMg/AVxYWF9kdTZbU19z
         ynI/BDjjADP+JZ9BvwCJFXincwhSNulqNKGu8AZoRf/D4U5RV2mot+nmv7vj9urM41hd
         W5spyqRxVQ1qjckZSlN+xiai+GhzhleImhZu1I0024c0SiSQ98Mkc/Pyxbne9pLxLKS2
         1QFg==
X-Forwarded-Encrypted: i=1; AL+hErGzC8zuZb1yzO+lraMJhIoLOwl6w2NXV+03LbCcDzmmwJjYwFk+S89isOQrNSVBA1UueR97xgB2BJxJptI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GMjeiVeahU9OdbpW3t9zEKd7LZwDbCGp4CTu3w8TJA3oJQQiE
	ofZPgnMulSSO1sqiRrqCZoiMP4RgCluLlodTBM6yazHr7ccd4MP5aN/Q
X-Gm-Gg: AZFdTZfuxoYrf3leeMOtcVvGEu+O8krCfS8SMUYVzDtQIY/ePpWa1cuLnTzxZ/0j3CY
	TJv3MtW4w5tIDV9cSePLfqJUvmkfHUjTHk+kIrj/TZ2MlPKjVX+cbG9GlxLKqZuCpp2je0F86IX
	7nPasiDHVS65iquCvUFbBO4l7vJYfvk/+lYE50wT1cllxE+U13istGJrz+S8k6CXUJiWPZwnD51
	VTuNlm3VChZ2+qUr92N8UFk4m9xrgfv4S9onOGX7+2zbA300G6LdejnRexBlVh/Q+V05nKBYKL0
	Nem/x8vHKIcupdErC8kDCDKaKo5qyj6K9T5WYW5RICK//OkP+RmborldTWX0CdyS2DSsp/7vErO
	1Sp5+jS2AHsq3sive4TsjK3UtOjctyfZkzDaIwS+wepJZNvza+2HOPd8GL69DL2UxHiyw82OjWb
	E8Sy6gYcj5Nok2Zaq1a3fRF9KcVHp9PZdmcqup2T/xnKZHiQzRNzP19eHNGxyoMZHuDQuP0Hn9+
	99ZAA0b1NuwGHQhTv1GebPCDVOWgSc+QRuIxOxqIfnn12r7gG5ED4hxS1R3Ts5tCbfYQjhQDKdP
	2bWGyh1v9sp+wRF0gDpMP9bPBji2ki/JWrFo1b8mVS5JD6+BNiaFAp4=
X-Received: by 2002:a05:6000:470c:b0:4a6:ad0e:6cd4 with SMTP id ffacd0b85a97d-4abb759dd4dmr23243874f8f.48.1795466522717;
        Mon, 23 Nov 2026 12:42:02 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm28134803f8f.21.2026.11.23.12.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:42:02 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: Add Cortina CS7542 bus controller
Date: Mon, 23 Nov 2026 23:41:59 +0300
Message-ID: <179546651961.3814407.1392448728993928813@gmail.com>
In-Reply-To: <e55e5103-db9c-43ed-8bcb-406909fe8f5f@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d@gmail.com>
 <20261123-b4-cs7542-mdio-v1-2-626d0a0e3b4d@gmail.com>
 <e55e5103-db9c-43ed-8bcb-406909fe8f5f@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Andrew,

I have only seen the timeout in a deliberate RAM fault-injection test:
I temporarily slowed MDC with the prescaler. I have not observed it at
the normal firmware-selected rate. The pending state was intended to
handle that injected late completion.

I removed that state, kept one bounded transaction/poll per operation,
and sorted the Kconfig and Makefile entries as you suggested. Full
independent ARM builds with the driver=3Dy and=3Dm and COMPILE_TEST=3Dn pass.
The revised driver also passed the Almond+ RAM test: PHY IDs, same-value
advertisement write/readback and the controlled MDC timeout/restore.

Your Reviewed-by is applied to the MAINTAINERS patch only. I sent v2:
https://lore.kernel.org/all/20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.c=
om/

Thanks,
Fil
