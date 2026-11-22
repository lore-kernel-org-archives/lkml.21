Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343053;
	b=seHUcGMwoWU3GEl4C90bX60+t4C8yTNoYUShXDmfK/feUBSJSSR8gBci3TlCB3lVI8qy
	 QL0AZ19FCeuQia1fxI9qWGhsh8iBlWVOSpp3YiY3muWhLdmX3kmH4eRE7jr8mpDnmr6oo
	 Zni+4JGMkChWDYjglrs0FyR2sMbrcEZ8byn2J/s4ssbzt11GeTadBc2GXpnDhHWO0aKrM
	 p6kD9Wb66hv9zw2KU5MIFWC57wxS+RCNEki1+iOPM5Li/eEiwlsZHlix2hXqgc90tefV7
	 eu0yP1cUhTTJ2/ubyqXmFZHA4CsT8+pTuvbFLUoWeGoNTWe8dZLOvp1ijkVc+UU5Slw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=reglDfAhKiwuYAIh/SV2FcRa1BwWNxgt4nMLKMTfz3c=;
	b=B+cpHhqy8dQH39ttQefurJblJurTvxluzSeBmo+xwPHmfOgxpBs1FZZ5t8ryRH73tHPU
	 lGkaTtr+QRmht+kPLl18eiTgP+Htx7FAfwRd11oIvNZnDg1cgswLKwEtwS9yvH0LV/lpn
	 JaTGxbx5jb43HEZOMDGuwE3uY6rJJ7Bmt1Mq9LgYbm3tVtnWfJIhlEjcbVRezF/JxyoQr
	 SJVt38tSm4WCNStHutpJAFcE7mxszvwtcpYiH2XCvwHgDZZb4Uv2PdfkqQ9hxo05Onxq8
	 YCb9tI+/HWqnhUVTECBBYYbl9iMD+Mm6zbWwjsEimZKSCLwFkiRTZc5dSFNVClKNU3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJ7coL3g;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E65E606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E65E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJ7coL3g
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so1792646b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343052; x=1795947852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=reglDfAhKiwuYAIh/SV2FcRa1BwWNxgt4nMLKMTfz3c=;
        b=ZJ7coL3gEISJl1PLlqY821FIpesNyJPZ9oZy8hSoA+OWxvgoggA01SeZsnpXWEw2ii
         BFYB6oXqgYny6UHivRXVrZKQItcGULyRPqk4+TYm0rfdbv3JnwNZoU6+bxBC3dItO5Z1
         asM/9muWf1EM+0ids3eOdYhVvAzVNIOgH2eXtFq5i5E6sOzJBRC26IKSuIrGPyqqaq+9
         EuDPQTYq//irCGiWokrunYABuDiWXGFyUrnufK5GUK+D6jxE5KoMcPS1rV7b/inpi5bj
         xgyuJX7CIwsOAIZtCtaWg5fagTJt4U5/3uXxmSCGMl1QO8WbMeI4e65ovcfeKR/5WzW1
         oAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343052; x=1795947852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reglDfAhKiwuYAIh/SV2FcRa1BwWNxgt4nMLKMTfz3c=;
        b=qQoPHViibBp5GGpsX7WK7/JstVe0fc9CHMbll1vbGoZnTRK4Cp935Pm9IoAIFFXFbL
         V/ZcZO1hHP+R0RReHxI6GGKoFcU5GzxembAjZgZpoXd9JZfvs1Hunq/4gXbUK2ziUgln
         qmzv9Oam0C5gYsGsEqzv5J6deG2OBPS08e/5nWkJeRCZb3EtFgxPumBB/6H2bGVlAKQm
         sH7iZF3hGmWoRr8BKpv5+Vl9/ePbPPCiQVQZsCOurIseeRzkcH+6LDt12r4I7BnE3IZy
         y6QlOoeyTo90VdnXrjePXRWRnvwJ13JjpbQC2wkWSZmTN9VrBdn4R/7g0hU6RzcSZ2+q
         pW7A==
X-Forwarded-Encrypted: i=1; AL+hErH7yA49QcDSjigT7vXLaucxTNULKADCHM33+xAU0J2/ZtemO0zTKkJX62OIOQh7U85DGb5FIYlgCDz5/14=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g0tiVBbm9QuED6GePQu8TDj0t5cu9VfuzI3WRPBdPV4C3E5nP
	CVOvjcPcfa2pm7uY7WTGyH13RlzzTJRK2Dkr8jKHZywsQmoQ4vlzNJF3
X-Gm-Gg: AZFdTZc/Sbff6HIi3hwAHUExI5IlN3uLkBfMpzyNzOEOXehX0z507CqzOs+T6U8Ky1O
	rMqXKv/P4WJ+B88qfbkiitw1HJjmvV0GNK+4EhWmggtTXFP3lH2Qz5HYjS2qPFiixPuvl5AcF1I
	zo7IlKVYVdZxUVF92VPzf5psPCLVWBZ94CfucUxmQELYTnMUZe6ddL9LGbeYlzEMTQ4edg+cOO7
	lf2S2fU3tpfAzzA5XhdoY0+ofyW/23nzgMwBgw2hgbPACduO13D1PELs9taSxhznuNyRk+lUO4Y
	z2BtKNCfaBJCvqe8rV577RkmggP4A1gl8zmAyG1OzWYkHUU2p3kGn9+IsyAB3SFh8XFQYzW1LOb
	runn16TTHhOsKRmsy/RWDiPRKDRIe2igNGcwca/w1LN4/uqV5+whxOQXxj/15Vjg28zwdkpz47h
	+b2YD08zaI6ROrcJrKyewtFi5GdYkBVgx2cSwNi4/2fsQvmk9I+LipYAIQe4K3IHdnt6Aw/ZZgv
	oDiGukkImpTGHwAwo7DwGZuys+cxt1Vneb4OkIJqxn/6iKOpVBX7+iiQvj9mzwkGIGmIphc+YWZ
	cb+Wr6mEnnH0l6IFIWdbSxgkxhPR0hLENnx2BvsKXTcxrp5+Oc9dDZpMh2CElV8FKyE=
X-Received: by 2002:a05:6a00:2389:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-8c87c38b44bmr7939461b3a.32.1795343052585;
        Sun, 22 Nov 2026 02:24:12 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm3968398b3a.36.2026.11.22.02.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:24:12 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/1] ipv6: fix MSG_SPLICE_PAGES with a dst trailer in __ip6_append_data()
Date: Sun, 22 Nov 2026 19:24:06 +0900
Message-ID: <179534083350.2499182.16169984227830330896@gmail.com>
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

sendfile() of a UDPv6 datagram that needs fragmentation over an xfrm
tunnel hits a WARN_ON_ONCE() in __ip6_append_data() and fails with EIO.
The patch removes the MSG_SPLICE_PAGES branch that causes it, as
proposed in the report; Ido asked for it to be sent as a patch.

Report: https://lore.kernel.org/netdev/179497871649.630760.14878797494884573363@gmail.com/

The issue was found by an LLM-guided test generator that we are
developing as a research prototype; the report has the reproducer. The
patch was written with LLM assistance; we reviewed and tested it. With
it, the reproducer runs clean and all its sendfile() calls succeed,
where they all fail with EIO before.

Kyuwon Cho (1):
  ipv6: fix MSG_SPLICE_PAGES with a dst trailer in __ip6_append_data()

 net/ipv6/ip6_output.c | 2 --
 1 file changed, 2 deletions(-)

-- 
2.43.0

