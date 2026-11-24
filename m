Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503636;
	b=DU7rjXpadTz1iFThwdvKmZwc4wPiWOUSqxlAF/Z3DPh/WNCgoahHn9qxT3xnNap1SOgy
	 L4IRtdAmWLnO+y+oRErWhjfbkyZzl7Q+JOTLqPqcto8Gc7JONTRkqdqmCFhrxz1k162Q/
	 4/cHklctNVFDl+PMqV1xm1auH6jWxNhJDBY3pzetJxJSzsL/0WEVwFpMRbftWLsrCFtx5
	 7af9MYa5rRybFIOC//QkOchdaDXUauIne2xDbAMFhSdEm5dVuo8KTpzCiHQcGrOgZV1BN
	 i8yHJmwjisz4lIcjOYLMPLMHUG1iiqOLEbdFvP33Z2YRVxER73bmQY326mIE0adNLgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
	b=QllVlg3vd+bJjV9PKOtzfCYEdJNaksPGbxsQCXz9Etrani5nsnLP50IOJ7WSkaAZXdEp
	 JUdbJo//bJzLboBlkoKZX2ZsCa7wtt8zskzWPKp3tJd7WwaKWHylhCixC/yvd/CTkkaAO
	 WbEv2gzNn9WjVd2Fo74XmuNnZiVegnZvqky6YGKpshHz0K+z27fxxzhb7PlV+oegl9BVM
	 yhr4907GYgW3RisWt4xLFtCILCjAlP23DRLaedSitD9lmWKY44Ztk7kNgPTZvR+kkLa8J
	 mFSM0D5yjOAU5nve1Omr4jOPQnNHQtRpkA/31WJfV14yn/TkL68O7uZ3i62709OwfzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gfm54EBI;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A394A606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A394A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gfm54EBI
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c08539c827so3099316e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503634; x=1796108434; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
        b=Gfm54EBI4fcos0re543fI6RXcyiEUs0tY0dioSTbUsOMcKVbUYEtG4QhLs+356Uxi6
         NkVnrcCacS05rQX8R4bUQsfFTT6qy9Wumse2s7VYU+Fklz+tkWEtkwaMpcQTxmDqiIDJ
         kE9ZfdQdk4uAZmXmoAdo5cQdVjLiS67+YAk6DHmlPWUX0gZQXukXZxaXjX8IAXsnxcOT
         5jN48kFWwlHfHgrZa8x1VAQijfaOr2QCCwQKjTZoaZQc+7HzZeQ41HyBDUOu8dNQ8Ab5
         ukIm+YvvYwhZ+rhX2Wrm3syfa2ziiudUb0Itt2kGbNyHwXBPx8kBF/6e30owK2ok02kY
         7QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503634; x=1796108434;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
        b=XcVqIgpsZDqXrvcDoh5mf3kMRtp4l+AR3DFK3/y/kum7ZF8C0DvrE7Lh4haNC3kfQ7
         AvHQNefFJPM7d+FMGv/lL8BCnda7TUUNE3Z2+zl9Emeilpm3oouaMOMeWtPdWJ7fKoGI
         5Oi8jpJ9uiFG62s6GoGpf0squaeQShs0PNVPYfU37wjRQZp2arWGSOlVSEsG+xlKwlKl
         iFcISaJ3rPyWwC0bCSxZp0l5MNgljv8JSk5ZbdwU++u+OJD9N4aR9nTpzZyM3g8+XXAz
         byFBvTOI67CQo/yyBAu2qjBzkke55YH3GZqJ7HHSta6DoeMcWrqb9EWUlJ6HRCFGRBtC
         UXrw==
X-Forwarded-Encrypted: i=1; AL+hErHovPtH2RDs38Knmg7bkJTqe2gS9F8VLFfdvCl0zOFeXhUOgxWwIRugV4lOeb9XTFtFfStODl6IPRsCFBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OZU0DHJ0HQEbSI6m628b+owSQ+pVmfud0MFo1oaRi3jmObhTj
	YnvylohD/K5OrO0Q7GaY7ZvXSxfy9+u6Ig99Y2hnQEB4RnS/AxjiEMJNmF2kk/M5vE8QKg==
X-Gm-Gg: AZFdTZclrrg7t2+FZFuSYUhraJUeew7UsDKRrmGIU4A7xonSSAfCyOJLe5VsTkhagTO
	p0x6sdmw+ClqGw2fZHd6rmAf+5tXypyWIRQmZ1AtvG0x+lPC7F4q0xNHemvUSvqYCLmaJXSpTzO
	LUyRlDZ/9AMuc1jXLrS17CQKTxNc0Hbn8/+8AkjdMioNBimJJQ6hfyXviaUsx0B1KEAnKuZzGXo
	OVWYSRoWZAYl4HM1cjS5A/RW6+nhLg4gjMtvZd4XR74yjJ5fLenkrOll1oZZwMRaWB0gF6tJbvD
	iAur1IpRY3o6ZiWBFo2wFMRmy3mXzeSzJoB77LBKGow5GFWHSbetvW5opNqr6tXT3vjhepb8xMI
	B4rGWyyHysg7glZkuhH26F/T9F39dHKomFZZIlIJ1IjcPCK4bzGFZXwACzSRKi9kQwRz3RW1VBR
	8j6tLkfbBNWy6C8vT6rNGXe7BXlNDt83DXKsxogwpq2hesn3+2BO9MXX3I/TQ5XamQwIUDWwf3c
	/pn8j2lrzAW3SJGI5nYxX1ljmhSUEeKLsU4GJRr5GUJlW0evFEkyYlhS9IovDji1je46L+ebrAp
	vGUL9dvvuG3ky0uqu/qVvVxXn4K3u/46XhQ/Pg1d1TfleFRiRIieIrTQxrQQjZVCOmmWsLEKFuy
	m
X-Received: by 2002:a05:6512:1394:b0:5bf:d004:a84d with SMTP id 2adb3069b0e04-5c1bc6d11ebmr3582097e87.5.1795503633589;
        Mon, 23 Nov 2026 23:00:33 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33312sm3554315e87.4.2026.11.23.23.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:32 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: reset: Add Cortina CS7542
 network engine reset domain
In-Reply-To: <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
 <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352891.6.12053051010700273859@gmail.com>
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

Hi Krzysztof,

Agreed. The shared-global follow-up moves this reset into the parent
syscon provider, together with the PCIe gates and resets:

https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/

The prepared Ethernet revision removes the resource-less NE reset child
binding/provider; the network engine requests its combined reset domain
from the parent. I will collect the remaining review before sending that
consumer revision.

Thanks,
Fil

