Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794966966;
	b=ttcquCABVN9GlcbQeepZ7TvfOi+h6oD3diyFvMHHafEOwDx5BB2MLBprAwr1p76wqRQ1
	 gRbDBfLAYjoFpGVIHP+iBiVyMNawF5U+3E5vJp7f+kK/XMcjMP+QJRNI4aEWK2u8m5SIK
	 zpEz3x6l0EH91x47EsMJ7/kfnsuXnciSociHBjbEJ/QV5eLlcv+QttbVPkv/8X8SCM9E2
	 VjKM2WmiTwI5IwIW1GPiekROGxL8RgnWJMBeBXUsO3iV8W6fgeoHpOhqKqz4iR2bSQKpB
	 EuGHCSQ5Tj+AzU04GmxLSpDw/4eW8Q03PTvcsBsDiQeE6j3azrj7Jo908009eBarCnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G2eyVexux7xZ2qLgWDwjsl1IL+COs4FsJsVc6uJeVnA=;
	b=C406WX/Zq11zPGLbN86S0yBMI6993SMlXKBk3DaWdrjVm9Mtc6ZIfInLuG1CNCujTIGJ
	 H8JT4AYQ3vy5LMO+ewfew1uyaJ98/5y2e1kg8dbG4QPkNKrW4qGJhEi2wh8G57oMU8S+s
	 nMaoizGAzCVyB5F4JGTvjcQmcGPdpCWCJiK+4ZQ5sb9ay0TGO0NlAR2ZfNTpz/RywMKQ9
	 UteqL8DxWH3hACiDPevHy0ZyIJYe0S3oQ4jsNUNbxqhfNlR/i89Cm+26B0aWbYi06OgsA
	 km4s4sjE3est+KyxqfPY2KkGKuVrCdqaCNr+BMTJSyXpItELiv3oMkotylb+/+CU1TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PgG4Qlw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D64A606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D64A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PgG4Qlw
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-677d35fd1d2so346943d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794966964; cv=none;
        d=google.com; s=arc-20260327;
        b=iRy/MAeZOcu41c0j54mnc/uu/H0h9hC/cNd1SauYocpmTHMKzkuf80Sr3nJkgB767z
         TKSrk+wFz6h7m4Fadig8hY3beJt5fSCV+Fz/fNoxleDFQG8iuxKxiIeISdrjRLcLZwpq
         8MQXsJSzgRk5bR0qa1NW8172itWkuQHieVvDoGoZ8lJUYGz2c9qeZpNINTPphY0mxoKl
         AfYiBfvkuVzwqr0pmbZv19mLDkqVyfg8cRm+Yw98aqNmzpqKV9w1vEKYoaRxFDOPok5L
         UoQm0BtEppRWQ2LSnYoKccctHmWQgrDQa7YaIAarf9naQbxTU4w1WStYZS2cdKkut8Tm
         A2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2eyVexux7xZ2qLgWDwjsl1IL+COs4FsJsVc6uJeVnA=;
        fh=F06qUgF9ecjoT6iMixoCaXMzPlAwmu/OS+MogxvX4YU=;
        b=DU/W2q2dD8314j7Jwa4kzviNTwI4Wan0fBt8rLF9kMQU63UTRH9m0madn2356r4Frg
         OjcORPwpwScLyVVsTjdwpIhEBDh6NM34d8qNsp+lJsqJU6tmn8ytwyjvs6Wplc5m33gt
         +ehTHuXzCttKX68pGnygn80w4NJY18gSEO586XU3PYaB4QBR6rEBjTwbHIDhCUH73o6X
         KonE21efO2LK2gVYpfC3nmCP5baqbMhz/48qpcFnOYQDcIZG03bVB1DYF7DL+SgJjKyz
         btqnpMpZC0xM+fhaBkWi0AiAnZUvuiL2KCf1/QEaqwxS8MQW65ff50FD8O9EE/TC8jHA
         Q1bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966964; x=1795571764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2eyVexux7xZ2qLgWDwjsl1IL+COs4FsJsVc6uJeVnA=;
        b=0PgG4Qlw7lF/CxqAO/mhpfqQWgwoMdyyVbMSI3RIowTfZTNlRnA1F+IDegq/0QU2mo
         iU/0OHEKudUImQJg3wVL5FNFnRzDFSyqPiKVZxlsQqEVmrBt/+3S9tqHgLWfDGw3gdEw
         kYzbOGFz3F4uGQn79pgqx8Zah235LyWDQy/Q+//wXwhLjidKsWHp6rsDzFyKf9Y56SuX
         MqlXyIJm6N2cqHkDHy8RAKRAt38yJc3/B8m/YTXIlwA6swGvW3qecFASE+PXtLAFsgbH
         V2aWgu3SfyOTvTw0g6lfXmi45JT0PSc98UIHEg0m+fSnGyskJm3fQQLXVyBkafyyAzzl
         MamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966964; x=1795571764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2eyVexux7xZ2qLgWDwjsl1IL+COs4FsJsVc6uJeVnA=;
        b=SQ9MSBXxK8i5FR0Hd2aWr39oxWidAAMkURjZkWO4uZNaXzElstmo8uSDlvs0uZfW35
         DOh5l3CGx3VeAQxqrEefmjPwU5Nm2U+DpyuMATN2kDcLGPeYoKC68fVkJ8uyxsOs7vS6
         b4mvECVW0p0hr599omIPsUE6R4rsMiYn3PWIl4fBpP+bd5Ec4E8nZyKMiBiw6yVoMKsb
         vSr0XGwlHPGZc87zpTfFrP5Sq3JrrT4YruTf7JADHUxODf3DvJ5fj483/noWf7DpztJz
         tE0/Ow64LZD2Yavrctt4Iv6cvp21v/uBOZZzO3eNu7/bhgMGKpv8WGnrS16JX8CFtbPq
         +tPQ==
X-Forwarded-Encrypted: i=1; AL+hErE38JArx6JQsD8kv0kUh/hb/RUI6hRt+UeT39zOFNEiu6gVEUTGOA2GNuWy9sp/3IoVTnXkFRW8MxOaJmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WQW4wNznfaGWcHWxIrvpZMh6PJh2nQP3eE2Qkb1wfYf3WBNQ1
	TfoPdQgI+9JpYGHgRPlkZ6gr25aU28kNgqYGyJ82yDNC0xGnVM7juEehadZpgGedp60OENU6ShW
	3UlPhZI8inkAD/dVse+HL4N2xPDavju0=
X-Gm-Gg: AZFdTZew2UlBpigbE/o2WeIB27fpRTipnxh9Xqb19iSwDzlInbaGDnQgzrg8LV5bO9C
	qkQsAohFw3E1dgDq+v6XbBBmSsK/ryJy3tz0QGKL6PNEUJlEf4oOUJbqYSg838Z1QdfwVLJEGXW
	B6bh4kO81PxG6hRGP7MTnmD8F9n+WYEZrd5MEMKSEegVwc7hDgwqeC1aZYvkobij/icVdAzbPoY
	65f8FRKrTckAfd7d5SkkhHdWEL8O8QQWvrtdqIhLTiMgg8O7+H6BNeA75fzXQ9UACKAgiwUjv4E
	PmTtMeFV8f0hbVRFjDWse+kn/mXqJqQYXkzuH6v8BKP2p5AmOjea9A9h3uB6x1Temiw5P3xENsl
	aYrmKD5EBAYedtTaVjPHf0ILOALaFxxptviRz87dSSgnzKJWtROTh5HgqqR0zr7Y7d1AwDUyQJq
	UVZzhLZo9fQR9RBiE3Vw==
X-Received: by 2002:a05:690e:4086:b0:67d:be72:8776 with SMTP id
 956f58d0204a3-67dd45ea00amr463913d50.91.1794966964498; Tue, 17 Nov 2026
 17:56:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com> <bee46abf-f05f-4ea4-9797-f47adf8c78e7@yahoo.com>
In-Reply-To: <bee46abf-f05f-4ea4-9797-f47adf8c78e7@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Tue, 17 Nov 2026 22:55:53 -0300
X-Gm-Features: AclHuK9EWKO0TFISSwiSK9OFoeyFR4IjX0irTWLTwRxNcN1S8kecosOA6iRlcK0
Message-ID: <CAK+kzgxnKDWi=Fp-5t5_JjN9dwARTgeoHP+XvryPQ1w_gkRn5Q@mail.gmail.com>
Subject: Re: [PATCH net-next v11 08/13] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Tested on family D only (RTL8367S-VB, TP-Link EX511 v2): the PVID paths
now reached through the family info behave as with v10, PVIDs set and
cleared on access ports, untagged and priority-tagged frames handled per
PVID, deleting another VLAN keeps the PVID. The family C implementation
is not exercised here.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
