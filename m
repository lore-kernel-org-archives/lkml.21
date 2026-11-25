Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611805;
	b=ZTVi8NPSekezE3OvUTysRdU7pbgWMB2yt5n70UdEMn8tkj6nm0krjCoUaKfnqNkfQcFJ
	 PZ1A4rAs2XVdAC/KbrBYosoYgCMiNF1yGTrZSTymXU6cBgtFBiJUCkCcf+JvBVhKL0E8K
	 jebyw26JnJEJiqlcfCBU2cnAO3k93k0TAzCK9AeM1eGq5Lod28Lm9prfAzrVigYJRSOat
	 a0bgbDB4gsLcOZWS0gdUQV9+8i3fNb2z5xBJizKlyVGCxNbDvJBPYRA9oZhp1v9QoMbsH
	 9oSSM0oE4y7HG0Y7awUG7NKO5MvwXUQ8a/ckn33Ik0OxkZIgA/b0GT2+6cO1gzfjY+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5xGOy1Y8qX5kygqf4NcjH1ozs8nOHqjaESuDvk+ENA=;
	b=w8qIU4738Kk1NO9fvmyl4lZEQQ5DH5ucjk5OVACipCyoi3X8tAtFq6hdqFF6O4jKhX+w
	 8lADovFf1vtqHQlXFdbewo++NTR8RsG+7gv6C5zQ9dWPq/Vg095RAnEJ1OJUTA5RkfPHI
	 tfI1Ex+IajjSLv1XwnagR7JuiLdJa2rdAt1g+BPQqSgs0YadNxtRoQD2GN8riurpLcGLZ
	 QWSOelCfy01s1e3+bSKPwZucrKAqImjK878W0hcBtV07CgJGuXZH7UEwyugLAr3UqIGWU
	 KlUq21gcfCMiLZlHwT1OSa64FTtIPOZ7zEkXPA6uK2cjXgV5dl/sB9RZsPcTcX0liyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvtQCGis;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21357606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21357606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvtQCGis
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386c71feeeaso2013949eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795611804; x=1796216604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5xGOy1Y8qX5kygqf4NcjH1ozs8nOHqjaESuDvk+ENA=;
        b=qvtQCGis5R2+3zRGaI/MoSWQdmBSSqhgAhnv6ZHn4/NyKAVl9IymDMb8Wh2Kndo73Z
         ZZa0Li3HvnFKuKn749ON+gif50p8HGCpCkx1Bk5dV0adyVFJDVDOO7D/s+a5B+LQxZfw
         9qOTns9cWVsMGQNAAFMMNWfimCzhDXJBt/SyV2s0yr07SjEBflgE4mK2bzpDJ6Va87/u
         vm0jCyUKZAbn6py2afwzOhocKfGIJ15iCE3j2yBr1Ta2cW1aB7P0J5/yZRnoAdLVpY+t
         sYXwHZaeK+bYRHcY55tnuSlc6DViLTmbDiwt9kyU0+hTFM+dXNrW8IvdfCX/BTBSVPIi
         uNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611804; x=1796216604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5xGOy1Y8qX5kygqf4NcjH1ozs8nOHqjaESuDvk+ENA=;
        b=k2Auy5HStN+s1vOR6qpRWqZtSYfkG5LEdjgwh9fAMvNZnUYVeye/G0L4rBotVib5nP
         EmiPQJ8wMjB7fuow7m+ybXMaUcuK4G6YkNuPOWMsGJHLjOdHldXpS2Env0FkNs0zHSlN
         Asmk2qIlRz7bcNfxx1433Xh6kAwgIFA0G/tV4q2KZu41sneCeVknjLfIQcMuPaY67wWI
         sF6bNkVbMM8aT/5Hn7OJ3pk97hvlAqd7FSlqYRp8vW8OCLdKNfkBTQ01EeWOYo8GlPhy
         kaC/J9CKRcW6Ur5v+RuYW9QwWjnQ6YAtk3a0AJ8Fw3ZFFXV5EZnidSCJEkdGc+9EBgEZ
         7DCA==
X-Forwarded-Encrypted: i=1; AL+hErHq/Sl+nvvl3DTelkoAU4Tlcflm07xvHs4U1bV2CIpR/rEB2y3Y6Scdt5JNB3MWMyqVGwcQdxIgKRvAJqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yvzh/Okg9/JwMDlZqQB6u5svUIlCTYh365NlAmOMBCuYLUtOH
	GCuAAo7BmSJyHb9t6cCP/vr4CYlPg37KCvjxVDuo6VSLqZezmXRs9JlI
X-Gm-Gg: AZFdTZfO+82GY+9qNhmr2rk9thsWwwrjZHcz0LSCAouw1vq3MJEBIAbVUsi5VoApT/P
	enIYCWBGCuiQTxqmzY5whE0+ONo4kj+pRgVrBuWDxO7V+X9QJ1gi6fcQ2XuSUYXb23XOomADULX
	1X1wBA8vbaQEQfGss8+M7QDOZeQCkoPucZCJp1fdTLVl2G8FSigWJaSjqhP5Hg+OhLKX/G8YUhC
	OlrMc1aX3m71LNtLcU5lBBmkh2cVRSbKMOGkR2uE+9y2DNg5ai5FeRwEU/2rwsDzeriDLuUmAgO
	bALejXDWc0FJEmV67crm0JYqkFVy9FERPiLditCKzKzimPwjz697wXehB5gZZC6eyKIpCWdUMgt
	d7YzO+gNUKjGcBogcE6Va2v9120xaT/05C8z2jYJ0ia+Ru38ckxHDBLUOcp+uijhi6TuqzRQeE/
	PLpsqInD1ClVgP6DQUBdKkyrjCCMXKF/urlazOkbGCeDfDHus2SuCq2egtKez6QlnVOUMtkf8IB
	9gXPeRO0kfU1BE88Qpqrt15SsgjcStxSJHE/40Ey5O/dp5E7rpBO3C1Cb1hMFllBEU48tGhoZz8
	syUBzTSxg1YgsFy+U6HYEc0MlFkQ6NkXT0pXGyWJQMLL6Cfwzj1133jBn1mso1Q+1Nt3
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr20268857eec.2.1795611804054;
        Wed, 25 Nov 2026 05:03:24 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm55976030eec.6.2026.11.25.05.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:03:23 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: ChiYuan Huang <cy_huang@richtek.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: rt4505: Put the child node reference
Date: Wed, 25 Nov 2026 20:03:18 +0700
Message-Id: <20261125130318.2590336-1-congnt264@gmail.com>
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

rt4505_probe() gets the LED child node with device_get_next_child_node(),
which returns it with its reference count raised. The driver never calls
fwnode_handle_put() on it, so the reference is leaked on every probe error
after that point and on a successful probe once the device is removed.
The v4l2 flash sub-device takes its own reference on the node, and the LED
class device only stores the pointer.

Drop the reference with a device managed action registered right after the
node is taken, so it is released after the LED class device that was
registered later has been unregistered. leds-rt8515 puts the node of the
same kind after registering its LED and flash sub-device.

Fixes: d9dfac5419d0 ("leds: rt4505: Add support for Richtek RT4505 flash LED controller")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-rt4505.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/leds/flash/leds-rt4505.c b/drivers/leds/flash/leds-rt4505.c
index 6a47760645f1..d397b1237c93 100644
--- a/drivers/leds/flash/leds-rt4505.c
+++ b/drivers/leds/flash/leds-rt4505.c
@@ -338,6 +338,11 @@ static void rt4505_init_flash_properties(struct rt4505_priv *priv,
 	flash->ops = &rt4505_flash_ops;
 }
 
+static void rt4505_child_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int rt4505_probe(struct i2c_client *client)
 {
 	struct rt4505_priv *priv;
@@ -370,6 +375,11 @@ static int rt4505_probe(struct i2c_client *client)
 		dev_err(priv->dev, "Failed to get child node\n");
 		return -EINVAL;
 	}
+
+	ret = devm_add_action_or_reset(priv->dev, rt4505_child_put, child);
+	if (ret)
+		return ret;
+
 	init_data.fwnode = child;
 
 	rt4505_init_flash_properties(priv, child);
-- 
2.25.1

