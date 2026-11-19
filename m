Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115050;
	b=a3p3WFNlzR589ZunnReTi7ZsuRQqkURd/JxHpsbl0l9t2Rx+M51bmm8J4d7moXzJSgUk
	 o7sYT7WREPfe19TWC46l9FQLfaxsreoI+4B4L8IjB+KvsKavRbX8siutt8UeZb29sSM2U
	 4JHcZ9rg+TkSdrvcjkpdliuoJ5oCPJQXfgVerq2zcufISPdn/4EIreVb2FTiJNTBNEDOu
	 4nhPvd1PY2wwCJ+6VBFEfo2pis1AV4+pxRZuD3xKV0r0iiVm1+qK3+1RL0MscWlH+YAw0
	 isfpC6K1Kfs6d0sHmeS8flXElYeptHumUOAV9cSGPvYLFkwsmJEvrHd5MqfYP3DNsqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115050;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
	b=3cRUL/uOOUY9RQXpV0rQHHxZAxCrcg0Cc8DiYlDJ5hoQv3VrqpdZ6DFBwNQnifp3jI5m
	 jrCqrwZv6Pe6R80XGiwD+DxHbCU5/0dt/YwH+FViYcUG6+bxT4pyLr21/6GDdgWC6VbXF
	 z76mImANioLZu8YJw3MFyPMWQ/LuSUPrdNEs9ODPQPdMOa2liwexaa/YzH9ssG3QRe2Fk
	 XHA/1WSNDtC4NWNH/O4bB7l4WEcfZKNvQ+2veOU9KgmdLXjYXxMmLqQWPCwTNqUfpGjYJ
	 xBMq5fhP31XUf+Z2ERgGottpi6udB7YRvFECkfCF0cHvJpKQtTDVZ9bQzoCCKxi6EJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VATJg7bD;
	arc=none smtp.remote-ip=209.85.214.225
Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A5860A2617
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A5860A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VATJg7bD
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2e9d7791b00so676155ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115049; x=1795719849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
        b=dToIPgwPiILxF+eYWI7ASNW9Z+Qsl0okXu/MzCAE3BLRQy4D928ZgFQ/IZSXhxN04z
         IUAKulZB5cTokVnD9U12j+jlSbJYcUfrPmLHwwGDC6Y/7pvkA5wMe4RTtV2Z9H8nbfee
         Hgl9Fm3BJ/7JKRLFIVN0BPIhjokBhGsKUJxTfq1nvlFJoFjffu+yFEgmeRnShCQzQiQg
         wmNyT09twJdQG4VY6jHzvhxn7M0hgEUg14j9Rcnu0yVf3sVlEIb4UIm6Nqlt8fwbnV1S
         m+okZAkfLdCBoy8RwNEvDyD1z0oDu92SQ5LvELDOw0SnjYuTnWNdgx6pyj1IsUC3VDW5
         ofYA==
X-Forwarded-Encrypted: i=1; AL+hErEb0VKnN8XG66cgPb2W98LuCEkSZG/uJVsfeX9HMy5DPKDNkUI9tbRs5jBC0hdnKCZgJDIjr7CDrp6yaG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m1oki+wxlFNbmyfJQG9IAospmK7DM+CGVHu1INg+KoAAHClqK
	vZxUa8tMuRt14/Ku0OQwcqoCJlhOEpxNJOEhNMwpFct0ObqYQg/p3QP0a+B0rMl2pXNwu2BoDXg
	AKcTnXbr4yu39Y70sAbFCQ8tBy40TTn+kihsKRg3SNctL5sQbpE54XyjCpPJ5OX3C95QLbGRtVb
	zCuBD2YLH460ZWkL7J+a4OflV/5+g7hmKn3MXH4lxyqFws0KDksP0g6gmbN6bm2W8zI3ZjUvRCQ
	R1cW5RlbDn5svksOci86/hN
X-Gm-Gg: AZFdTZcTeGDGRKfwkS9mHBzamP0sWLjgVkH1gOW7aAEjNsDtFf9PAoZs1ML3Lo8b7KF
	j+z/4KOBG+jAQWtfSm2gK5f1Fzl0/Qw+mYqQyq9zQeu62eQmTHub4OP4pXX5goSRC+8d5ZQj9JC
	qaOpR8grW046HLQtyRIuXRjVKJvB7Pt5VT/bFEo8Hat/jTSmYoKu3JWGV1S4dMDPCwz6bGijO7N
	BS7kKOTzhxYFG5/bWnxsTQsA52lxvPcoLHtoKtMgaJUhChLxROx+RykaAgzNbWER7r9c+snwYyb
	zmR3mOzc4F7iRbrWIZ4rHSzoCg8v2N8cAZzByucbNnoGjld6a4fdLH/rIExSbFkxhSV1lWm1Gci
	atNRlgpcz7yt7yna6/7mZgADOLq6zFNnK3k68ornjFNQUmOQ+hX9brLSxwFtpuLIuP5kfQPZbgG
	RL08HGw37bg+Wai9mn4bNeNhkRyTgreLw6BVkhtVpA
X-Received: by 2002:a17:90b:55d0:b0:3b0:92be:ea4a with SMTP id 98e67ed59e1d1-3b41c9830demr234007a91.45.1795115049068;
        Thu, 19 Nov 2026 11:04:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40567890fsm1742739a91.0.2026.11.19.11.04.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso20370485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115048; x=1795719848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK5FBo/M+wUndvHqiG8ifuSKm2/U8GuZDdG8PZlZvoU=;
        b=VATJg7bD55vetFvkqwZ8ARjMlUEO90ogmVqaoMMihBeotk+HZmICfCF2HRyU6U+uY3
         RykwkZKOXvXQhmAXDGlx8KAHQtWpBmpm4AoHUgqEK9/5KL23eMEV7xjFvjW3c/RG2tFy
         Bn77L8OWtnccfDtnG+NyQc+osAvtKxhHurdEw=
X-Forwarded-Encrypted: i=1; AL+hErGUY/NPqwj+6IJg0CueulX5zNngL3zKDZPjCALnCe5igtr+Za8dqvvAZV0KhCmTgjBObOJht5RGUMET26Y=@vger.kernel.org
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr96033785a.14.1795115047556;
        Thu, 19 Nov 2026 11:04:07 -0800 (PST)
X-Received: by 2002:a05:620a:c42:b0:949:5c62:e77e with SMTP id af79cd13be357-949ba9c6de4mr96025785a.14.1795115046934;
        Thu, 19 Nov 2026 11:04:06 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:06 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v7 2/6] net: dsa: b53: fix the SRAB grant timeout check
Date: Thu, 19 Nov 2026 11:03:44 -0800
Message-ID: <20261119190348.2317702-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

b53_srab_request_grant() polls for a grant up to 20 times, but checks for
an iteration count of five to detect a timeout. This rejects a grant
received on the sixth poll and reports success when all 20 polls finish
without a grant. The latter allows a register access to proceed without
ownership of the switch resources.

Check for exhaustion of all 20 iterations instead.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_srab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/b53/b53_srab.c b/drivers/net/dsa/b53/b53_srab.c
index e6d14fdc56fd..7306535a892a 100644
--- a/drivers/net/dsa/b53/b53_srab.c
+++ b/drivers/net/dsa/b53/b53_srab.c
@@ -105,7 +105,7 @@ static int b53_srab_request_grant(struct b53_device *dev)
 			break;
 		usleep_range(10, 100);
 	}
-	if (WARN_ON(i == 5))
+	if (WARN_ON(i == 20))
 		return -EIO;
 
 	return 0;
-- 
2.53.0

