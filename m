Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795184778;
	b=LTk7HNv1snateCEdrmpv8bT+x2rSE2S/bEDO/YAbpEZaCRNhnQMJMjFa0UVtdO/w4ht3
	 vnkNa4LvWYwZIegPSxeesh3NbvgUz3vLFZiWYsP3sLOorFvUhTFlMxit3x4VdMrMS6Udu
	 SjOfzG9jP5ovaEIR4buGeymBdDQ6Pw7nrTgt1cWavOmn2u4H71zeO5ldg5Thg7DUTZoSv
	 voeMhC/OGe44a9MgtAyvgZXcHEda6HWMl9LIALDP5zGNvI3o86Map3D2KZFyaHsuUR1J7
	 /zZPxLxBwDvL5+tum9BDejfJnDmTvZepiAN59pC1bEQFENUeFAaCNNBvh5FpU+VuimQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xcn2AQuf2ta2YXdrV1a8uRQUDEFs6AHRKa6oE6FM3L8=;
	b=Ew1ukqB6j1d+bpVWxPDv+sctA6qIxbzYOvpc3aPaHPcZ9QwVqJqYQStUKlCPLKAD7RF/
	 ffrQwgGBJAx5qGsoHGH67YDZBOPsOXxaExdTUqJC11cwM3kqA1L8WOFsv7n64nBi75fZd
	 eql8w1Nq12zHKfG7F9KPdKuFLdx5WAwAvoI0MxajyjcEruH8gaIyG7/9+ZKuySCV1l5e7
	 HtIKsXW0Hle409W9OUUxlWSzFVLyLw01o1ZRqQdeDvbaxwAb/WIVwM8EsuRPf+2q6Ym1I
	 R8va6Xg609knsvhvC/tbwZ+NeS16Nzwi1CHBW5D0zyCd4vXxV/nQ8qQvVgf5WvfOh4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1f1RhkT;
	arc=fail smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B268606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B268606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1f1RhkT
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798eb0d190so867809d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184777; cv=none;
        d=google.com; s=arc-20260327;
        b=E5pHndbsD8s3DVeZ8dakx69vELb+9jcNWYJbMhxRtsOu92n1CYutpOlJFfpR4CRwr+
         h90nYnj14vl/EtNEpnlpHQsW/B8cFlaCclk5j2KB2+WB0E+2Mgl5BW94TtyWed99ktYD
         aEvI/FPComcCdhgDvsaV8VP1zf/pPvPHQ5e1kLiiHJtlKaJOqXxxd7OCxG3g4db/YwXb
         Ph3ZtxpS2fBKudplQxezg2Wt7jXHAMod7PRNi+uE0gcS1mVP40qZVj/l5ThLPoCZj3Xe
         mhwroWqynFggM8pMGvNVgPeUiOsD+lsDq4Xt9a1CC3Z3PrDBcgX99ii5MK7VQE600USn
         nuIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xcn2AQuf2ta2YXdrV1a8uRQUDEFs6AHRKa6oE6FM3L8=;
        fh=cnLIm80befVNBh4ZQHBhQl3TGIThs6X5g4PTPSa/mqk=;
        b=q1Y5+V0+8VNqlEvKmGiBXuMoWUVsrI18MK3LzKRXq4HaASiaXCHj0peg9iE8fTuZF0
         I7JS1Zxp4y7dWFq54CkF111Y5G33eClbF9D9SHxROVFZS/meFQw71XILcu+FqNG9q4ki
         Dy2RD9Esd1kHSWmsCeeKAIINhvOGlQ9D7fwgaNX+C4fymwKLHviA3OMPt/fgKWcny4O3
         huJZoKvWSvj7NFrAzeh3Kj/DaZvTE/XkubBU/ISQhOEAJsD9U15z0L6/UA+uc69mH71n
         FEI3zoStMA4DO8jGK0UvVYXwViLNwb23BV18y7UntbNuO+rpHHBzrtO1n4Qr5PnhEp+k
         rx2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184777; x=1795789577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcn2AQuf2ta2YXdrV1a8uRQUDEFs6AHRKa6oE6FM3L8=;
        b=N1f1RhkTN6QXGTBex5swCSX7bKt6VzVd5jQLXgm+4lbZ/Ezd1NPPUe7VZFqNjQUQfn
         kxEeBQ10Ag7+5jNe7ASubr2TDx5e0hwx8detiWZiQKMDLMyLgOMpBbgaJObe0YBaUZ0P
         PO7gon9M9PGyKOAcknjJj+JBPcLQObeC8jeI2Eye9dp5I2P5c7NBDqh88Vrso9YvphkJ
         7FAmXnIOGXyfgGkBkrEOvbB7/IM5w5qL4EE+3ffg49cGxPFg+/Q1vcgQMCeQKuoTbwY4
         PUW2bAUNFYweBbdojGvCsXQSAhoThyF5l9bUc7vG5/7ZMu3PmML53Z1XaCVJUW3+Q9DM
         sEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184777; x=1795789577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xcn2AQuf2ta2YXdrV1a8uRQUDEFs6AHRKa6oE6FM3L8=;
        b=BOWmldRCjlZKwVREImxFcN7a8aWrXeRxPeHAq6t1KMHCVq3+kzj0lF6pxCV6fsKns4
         2VLacGORDR+mcE6JzpHaJAjehG6828mRaB1DaWNw87ktkIqpuDDN4PWFwAHOADej7aWw
         UjnNG6NuiMN0RXBRYvNwlZtf3jrHv5TYRJ387GF9QKp3DQnO0i095kOLoei93KDmN4aa
         WFghgTow17JowO2Gdw6frHJm10glTE3zsxCfZNXtiYE8d1ArxC99HPPbco2CjgbR4mf1
         EUcsTvIhw1Lu+3g36QIZE+gekyqZCvXVZx0t2YSPb18LN6FOagOApYQtW1iOHMqQtbZn
         dIEg==
X-Forwarded-Encrypted: i=1; AL+hErHmrfQFzek/jZVw+G/uKBwaxK7fEXznGykRD0zizufwB21tI4KCY3XQVlOW7yQKeKamFEMF4Iv/U+uJqW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lvBq5DGTTM0Bn8sC2KhMj5lwSxM47vK8ZMsAwUky7skrrV5AO
	9EhdHqOvWAhCYLOE9ZCSyhfXQ4OwBRPbgabwDD93Q/iXrZKeia59b99Yfhrw+bgiCjP+4V3nGN1
	9acuMNBalXi6ujmGBynRoYHPUGeszPk0=
X-Gm-Gg: AZFdTZeWyX4lQnHDUjwPkszJK+CGWVWlIjEpar9V6n58tqAFZv0HdMHeWx3yAPzoRCM
	wLNDn4UHd5TzXVPhCoa/bnrfPFFYj3idA+QJSL0+xfZi7LxHLrYYjd0rKqOBTslYFVb9g2NsmlP
	dg/kK4tdtQAtv45uOJF3N3Q1nlpk9EwIbezFfaFjfhqTTJz7Svb+CjCLekCJXcIqhQ6UWYFCX1+
	yz1gQ6o4F4HmuZnGwZhTMcz6b+NX2QIhtdXFt4aovvmIL2OgxoO5QcEKx3X0VBLz8gdlZKs3S4g
	2zitjzZgcQFT/cAMIwYbU8jFHfLAdYDf9ev8IWabLpZoyRuPmJ0MrPW5L5U5AVMc3f5DisRrECG
	zKrVAqM9fm3rs6M1lfplXnSLAGcwNasoC7URPUFNOUMh7xCnNYWWSPg6aNzh80iAJrOgfpiQN
X-Received: by 2002:a05:690e:4513:20b0:677:cb45:a479 with SMTP id
 956f58d0204a3-67df4430e87mr1069873d50.68.1795184777535; Fri, 20 Nov 2026
 06:26:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com> <d966bcfd-1718-43b5-a2cb-ee5932bb361e@yahoo.com>
In-Reply-To: <d966bcfd-1718-43b5-a2cb-ee5932bb361e@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Fri, 20 Nov 2026 11:26:06 -0300
X-Gm-Features: AclHuK8IjZ56gnZT6oyb7irgAwS55Z1W7BkwG7Vqas5F9wBeh5-GbC7FzdoY3iU
Message-ID: <CAK+kzgxDs7KW_fZo82zSvxpniVrzNRwnGRj0k2spU938-hWoFw@mail.gmail.com>
Subject: Re: [PATCH net-next v12 09/13] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Tested on a TP-Link EX511 v2 (RTL8367S-VB), v12 as is: PVID registers at
setup, PVID set and clear on access ports, untagged frames dropped without
a PVID and taken in with one, priority-tagged frames taken into the PVID,
and a PVID change in a VLAN-unaware bridge with no effect on traffic.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
