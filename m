Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647416;
	b=TFxp66ht9pLplfsmvtbeAIathXb9Msq/i3+vsARnDMMoWiAkFf6CRxN71bPAHtbXmxpf
	 bRB007uiwEJawsUeA1k603sYw/D5D+rRvOd/GRuqwbBT2D8V71cSkPMzsw0q01Dz/70XM
	 OHed3e7aMtDC0p7cV/FHMZFH9OYPrOEFI4v/v9mL486V+B6PL0YJrvU/gPJhVZzP7NQwE
	 vZNbHikKz76gakJ6kU9sBAzg1RjQCC03d7QMK4+i5brRB3Q02r09FHtyLOukO4/rgq6o9
	 brOnHslZEfYIYM+Z1PYKyKyd+fCLnfwGdVgWJdFatQSjbi4Po5NWh095ey6CnmBuVsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
	b=5hlML8K7djTWGKb0KJVO0Pz1iD5kiW1IOTSvb4ilC+zaSAUOOuOOn+Fhju50vkDjvPiZ
	 OQbZ2PJACkAEfWcesTUYKEj/Omlgr1LpnVQSvw1PLJNBUaFaWtbCBHsEf9a5hni7CXz7O
	 O/YwsfI0J6XuoTXnQJ0Tg8MP/U3sRH1W8a9JeL4ua7d2O/Dm8xCu5VXIPbr1JnIYqetTC
	 8dN4KceJRDgFFLzWgi5pWbi4LJT8gd5kgitNSeXEhRGAEdsnaizXQbi+C/+YMgRHiys2A
	 jU7yMInYHvHHJPSJDQ5gwuFhwzHpjNLS2HOIun4+LTBHQ7NW69iS/eqDYxGMM86mEYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R24Rs4io;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF570606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF570606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R24Rs4io
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso2910019f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795647414; x=1796252214; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=R24Rs4iordavR6xw7FQ0o/DZGxqlMi1qPyiseaTCiFjx7grVaeSX5uEyVemQjN4std
         P3Qbx8EGfB7TEqZl5LYeeUmy2V929SvoaF4xo/+uvBBSlDWcVu+jT/Q+pridMe32kf5c
         3iIK8HUn9cq/1cMPqfqd/w9fZfkHQZYpRRLJang2Ujxh6V6RKnk8txMDjYJpobo70uDT
         2/Ia9ALqMOcv+hs6xhhqW91UbgncBeY8wxwlb+TPGWgASMR55W2Cy87d6A56nmzgMwMZ
         fSNjTzium6njFnxG5ATdvgIUt01ncWzg7+Sknc4eQvy1E5rZmoq4ucFg1964Tx+DKk5p
         0pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647414; x=1796252214;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=J/IhCaXx1+2TrthlerBflYiJjbUQsydoJ9SL7zroxTkD9AEk5Bk+PkB1ffMpjPRAwT
         pgEPQtpAphIWVQDT2hSTQDjwF2eoSLWP3qgWECROOcGq8e/+g6vzhm0p5puNmdiPdFbp
         /uP2MS2G5eotWx7dlpeu5qj0kdh/JK5ULWwlD6gVPmIuMlq04Q4PW3xJ8JmyzGy4z+I7
         ty6xWH5ynGj7VN5dgOjVYHcVSvrp5ZhvDM+3mPtFg/KbHuHHaVWK3jZTzoVw/H5/7e+T
         d1eT6pXnpZEh/bdwTX3VHT8d0YRl3YwiKDoyiHQtVFsw0A01EKinnoiW1R2YnEykg9UT
         ZGyw==
X-Forwarded-Encrypted: i=1; AL+hErGCZoMFBxPOIabF9kqFLFB7YmOIJcFWE/ebAXtBk9Tv5YIZ6YRmescz25tnMpTpEf84ydbt5hAkLKEPJo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+675D82XadL1TFx3d2jB1bicZLIP0WLKfU52yRJpet+SRTZzAR
	Xe6S6+LJM7hA3lKFbAQj3XdXnY7AbcFsSRGtyhB7zeekz4XtE9v4w+6n
X-Gm-Gg: AZFdTZe7F5qqDfHcmUL8PDIsnesRnUj6m8ixp/Hjr8fGh2l9Yx/hriBUuvrQqAFySQe
	5zZzYIlpOTgoN6kD/nf1ueBUwhf7l08kZRbER+ehC/JDkiTRI2wND9JfAu6LLXQLxdDhBqVnw9T
	PMWML4G+o18gtwJ8ieKulO4kdRTHI9E5Xq5ysjdBNxWvL3ZM+bRXauQb2VBIcQMBDvF2Lm1LtcT
	a2ra+m9+hA5IWwN0sSosgmi6XIE0mPZjhztSIuyQaLpIFlFTIRpIZzt2KNbt6eFlV818IxglqSp
	MU8nNrE2c1ibZp4EO70Epp+4na9dh12S4I/wRRKd5ImiMd+TyEMKNBbK9MycbBFTWjJD7/V15Pr
	3XnXfE5DyekFGNa7GjcLWmpV65VblIggXNeTqwqiE1RWyKylzUPU2sH2mhQHvVwASsfDFtlZCL9
	r8eHRT4LlgSzb74t6lf5x2ye1YxzqmVBhxE7ySQre7XJHVjN2OK0YgTm9/XB0QHQui1z6fjKnCZ
	L+2AANWsRy4X3J+Ohq5lKULgI7eIyiIKIiGy6fyLK+On5vbRy8NUNbWcTcKrRBkf4UKJ2BBGaz9
	LHmlLMyjTFzcxO31PyWUY+o3+KH4kGe36qniczVgHYbVf9ob8LiCJWI=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr402625445e9.12.1795647414193;
        Wed, 25 Nov 2026 14:56:54 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm865695085e9.14.2026.11.25.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:56:53 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4 hardware
 flowtable offload
In-Reply-To: <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
 <179564372798.5.10006827612276789857@gmail.com>
 <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
Date: Thu, 26 Nov 2026 01:56:38 +0300
Message-ID: <179564739825.6.2717872099061772018@gmail.com>
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

Understood. I will focus on getting the basic Ethernet series reviewed
and ready first, and hold further offload RFC revisions until that
foundation is settled. Further offload development will stay local in
the meantime.

Thanks,
Fil

