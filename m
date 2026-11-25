Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614023;
	b=O9KI/N94tiQxEfwyj0tJI93PATu7rTqsi8eWO0vaO/tAbedEg8787FsXp7qw1fTVZj+i
	 J0IMzT7OLt7hPHh5D2vYKFiZ4H9iM0OWCk/Xd4nrJBmqP2f2DfFKNzhaUKKyzyPPpOuyC
	 w6GA5jQsJLaTrudUnapE8JhB4mkqVJ8TOQymTgY5ML66J3S8DB076yCVubaFrro+CVRIA
	 kvuZeW2dXgppRpzYgfsS0GaJeXHxKNx7LLzYSmmPS+3v1MU16q5uIo5SRBXh0GakgbgiV
	 dI2cuJopELkLq71yWjdq7yiatZq0vpS9ascx4Rlbl1i+BD4nrCGUFYiStqVEXrqcVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JB8xYtba48EdonovEH96/gnrjsat71I+BpeZ0UxS0NM=;
	b=oSv1f0bmbZOGp3+Fy/1YWZ4WkZKI5cTo1HrJqAQf7ZERKPG3UYQLWBxHS5YN13tL+phu
	 f9+lG6Romfd85JrWdKtOhOf3nwSaDWvGXbFOjr2PEc1vel4PodGegW3/DSVBhJniYhddA
	 xrwV4LI2hdyd4VzzIrDj7DEAqIs9fkOsJS/v8cl95+Lk65Zo0XJsvlBZbC6VVht5vKlVv
	 2Z0sEavc7bzBU55OG1N5QGlKZwXY0xckMfkbeqj24X30JoaYUOZuqW0nPmlL/jNMQ9hiJ
	 ytm/bbN+eKDKCXf/1CN0i9N1icBhEiEkTjuzBnl04eW9lhqX2Ct3Zv8drMd+ZCgWmxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExbJpLiT;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB19606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB19606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExbJpLiT
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4003426c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614022; x=1796218822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JB8xYtba48EdonovEH96/gnrjsat71I+BpeZ0UxS0NM=;
        b=ExbJpLiTwp8PXqLdPNTio4e+83foQx5U7PYRqrLMzEDMYkXhXZyYuWrN2bvf/c7eNi
         49N768n3Xi2RC12UuVuk18uxbZMC1FOKJTLCYzLQc43E43OavFo6EyLXmI3shbDRkuV0
         sZ+KxuN2KBuzW3Sa1CC2clLskQHqN/TYggmHO5oUO4WAdhbrK8bAU+nNk1sJolSmL35V
         l3FN/+EqO06ar0tqrJOYeo8g0ULTvRXcdrD44GKC5z+YE2wE11aC5qupFkWChc9LPvT+
         0Hvg1niGOV7Te7tF7o676PRVOfdSSr/oVkWxe3ksot4f+Gwhru/QF3Gix757Vupqf2pB
         teVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614022; x=1796218822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB8xYtba48EdonovEH96/gnrjsat71I+BpeZ0UxS0NM=;
        b=Mv5zf8HxB+KfGCn5nsdtghja5KH+23JK7cTfknfAWA0IYPiZPSzo3DF6jHQD6IGtbZ
         qj8S30MaLCYY22PrTMHH4GSEgOid7mo+t9oqBnrsdgagcd1ks5u/8/f47vIjhlLirBK9
         WBxE+PFt+9UJ5jjGs7hJmyiQ68kOoT+aVrlXVbjGbEEdDInrQ7MT9XbhgxzXkmzX9RAP
         mJS5DdyXXeJyjF2BkMO0Aqm5VnOromA/708kLFUMu/LUqJO5oYhzMlqMG1bYB4GEdINz
         wzJH+5ZXtKby4YrNIVCMu9LNlxCtBl2AxinZRase8dIOrJjpMPlTZ+lJDrwXO3rskBqe
         /MZQ==
X-Forwarded-Encrypted: i=1; AL+hErGWQjUk+LpKTz07+fMwEf2ML0ke0NICcLAuPB+bDA55XZoEaV1+QeNDz1ZFnCbG3vKqiJ0xCQXHgLNP6Vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dyG1+EsKPMbOoL6VH3s5qInkLda7V0AM83b9OOCLfPpl7vuns
	6pSOJ1Qyq84hf20SIsEdRa4nWrl1tf5cMZLN6qwXWgzy4/77jkcb1RCx
X-Gm-Gg: AZFdTZe0dm4/8q97VEN19v84eRxHKTHSp9eZUf9GxthHdGbTJFRr5ORcsCqA8vz2f6k
	EA6fdA9oBb5Og1QVq74874Rwv/l4MRctNlEfTWRzZvSgf4mrKTVXm+WVaATqsczOOh8Og25Ffsn
	PWmdEcP5uiIQfPgJy3rGm18myZJ0qgxV2OU7PMfabp/981XmYGYAqwuhjyIacCX11VzNBjOLpxr
	PdeYoOJDnW4lTviKT5MPiOeRzb4NloRB/gpmOc6EDuW9Ssf0YEJ0gJ+4xO5kL77YdrhWVnglvSf
	7g4CHk2zSXihUeLyepgxdpCTyTdlDZW1y3VIDtHjV1THIYghGaE+/Jt1drgCvA/TKtvW4HQKyYs
	p4KNgsexkb45ei0y8HdVkDhJZWNYQIxHvtqx98TF2UjQpGRpc0nnILs/EGLl1KAY02A2DK7CZ2T
	Z7d636RLoHvBzx3Ritb1g3K9zrgAAATunNJXge6UiyKKIaLBL8U5PB7MkI3zy39j8nXeKxz5EM5
	h8caTycBacrYi2jAuFc8v/d9gk8hq6CJvBtOL8LspU29II+Zuv4b5COHxzE4Azz5WpURDkN631u
	YYXDmmLS8mDLfO4uABEPnhTdf9HIskmYFwGxI/WEAgNC/ks=
X-Received: by 2002:a05:7023:a8b:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b5567ab595mr19131681c88.1.1795614021736;
        Wed, 25 Nov 2026 05:40:21 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm56251563eec.6.2026.11.25.05.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:40:21 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: sgm3140: Put the child node reference on success
Date: Wed, 25 Nov 2026 20:40:13 +0700
Message-Id: <20261125134013.2692510-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

sgm3140_probe() gets the LED child node with device_get_next_child_node(),
which returns it with its reference count raised. The error path puts the
reference, but a successful probe returns before reaching that code, so the
reference is never dropped. The v4l2 flash sub-device takes its own
reference on the node, and the LED class device only stores the pointer,
so nothing else needs the probe's reference after probe returns.

Put the reference before returning success.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-sgm3140.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index 107d02c3137f..5bc21b192d74 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -273,7 +273,8 @@ static int sgm3140_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	return ret;
+	fwnode_handle_put(child_node);
+	return 0;
 
 err:
 	fwnode_handle_put(child_node);
-- 
2.25.1

