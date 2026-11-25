Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636258;
	b=l1lEQndZ2eEiW/B+ZvA90iCehOIRcS1xn+7Fd4TN41YaLlSidshsSq2uwDZnNonB1ye2
	 rn4WM+rbgbrkh76ahDPbI/4QsqeZJcW+6XvKYMKPYA5geqKrztruyTAdnRE54MT4m/ssD
	 66l/wZ9I/y6BM91MZgkb1fg+NF+GdnQJoarPl1bHEwJr2OliltSofaqRND4Fj1t44x9vs
	 zOSXefTBJmyNrYNMEhk/4vuzmmCpOiH/HLOwWsk78wHkVG8wj+55TUZ6WBi+WG6fYz0Qo
	 wiCey1oSuIzJevCeHDug2lw7TGiTMhoxFXBPYtY/mQ5Jjz0Kap56ZQCB2KXEX4MH/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
	b=VaHMXurXfcXKbFf+yfB/ZQ9rPO+PJB1pzoYohRjiaMO9nhWTdDqud6dHBqDAVfSLLM3c
	 +Is41HsJ8pJGC7eZeaSjczL5ClYv9GNN/eUD7ho+R5w+/iM25d4U7okhxqK1xQjpImOFE
	 3LeyM6Dmq0VsD6onqHOpP6HSJiVCccgg6aRJMlNUYCrlvpM8sb4yT9ccEMxT/9XfEnHhZ
	 8FDNT96kaA/lMjVzQYOutyR5sXl8RSanLqwUja9/P9rPosuYaFyNxFY9fdfprdtzrqXoi
	 8NpHHv9NakBxjUVd8ifDsyTiTi/30uQQAtst3vmF0Jnpj5w/NPQWPe75dxmq9WB4/CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PeJMmK5U;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919B4606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 919B4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PeJMmK5U
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4d198f1a591so6134224b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636257; x=1796241057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
        b=PeJMmK5UnDkZv0UhbpQq/aYEqbjZ0N2Wl9eU4Siu7VFoKHxBEOfy7+/dKRSzUs5bI4
         XLVtFEz7dpVTaMfAbbbAybkCDOMSfpmmk864UnzSR49/KyaHjN0fW8TwOdj9i0igKFAE
         RvHiM5NQOxWdt2SrgKthqwAKJPJX6GGmzX48zsB6tzsXRpc112Q5ChiOJB339m/s9Ca1
         1GdzDaNjjk0EQewwnWF1ZGw/hAc2eykpiGfjEQSyNrMGvNz1nqrvGXmYN3pa7mHG4vQN
         ez55JOZ6dnri9N2g5ZpTyR+7hxE/Twfr+k+iaL/2/vqabdALZGY77locYgYZKog+XsHQ
         iNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636257; x=1796241057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRUECku9MtNUtuZiZnRtB0skHYIdA8uwyD4cqahMADo=;
        b=sKte35GWys+GVSEhO0R2EzeFUs9jaXgb6HG2M9nycaV0FKaScwnM0i6FlvqmJGAAsw
         5mvmCXIVSmaLNxtLwp92FxTepo78ejwQAgpv8/5ExNRts1YExnwnmkUmHv4ehyqOobwo
         VIqHcngI2QoBsvrvc2XpaorbeCYGKcaxJtYn9F6OiSPRB3F9LCfUUUzk984wV6MKYSNC
         5IFwXrGVMj6fJ8HIo89VetFfNZ/QqxCKhZMRfffJwvd1kTHLv7TE5c/uGzcBScCr99mU
         fdTuYRZcyNkLNvt4vyJugKJ7LcamNo08dXKfplJRrFU5ioVdtg4tmV1f1Z5rAAZU4jO/
         uAtg==
X-Gm-Message-State: APuU4Z/GQX5jSnP8JlHXgIj3RShGnoqkK/ApXZ+l/0aq65q+DZVUlsih
	ONqBwYUbUyE9URLOckiccanKBgpgmh/v/rBq/5afuNhdD6FhlsuqX3Y=
X-Gm-Gg: AZFdTZdftXASWpZ/aDfA4HvyABulV8G8+2GAQ5QNLHlAKHO0fRCMzJzVLhFgJ9BnR6A
	5x2iHuq9JTVaAVCpxNfsSc3efX0zqK5Is9T80SQjHbgnHbYuEgfkxbWr3qydcCpqQSH9DoDKztC
	yd3WmtwyUOqg0BP9gUWSelTX4uBtur9erGPtiICLFPXzaWz5be5NszKQMGcv0x+jUpMmmA6HYg4
	DTuMuuZTW9A0TeZid4YOombkCtgTzQnAuzyM+wIixJ2UrG9g+Ix2jeREfNjW2V+mJytebwEA7mo
	kvv6SZd3EzTcc0/xgsC8xO6iJA/dBXkA2mMtCeHUJMCX5mXJ4sIiEK1Whw7faotXi0PzsqDqNlH
	m3yHcfesujoz0x/0Zi0WZnVoJ7f9HRIF/K4RRW4joCLjK39BTB43JyNhYl+Jt3HQHtwlwtzrOTq
	YZ1LNm+dexwNNZXpPlDaQBPD2tg6CIdjo6NE0Z49q2/YlJv8fFacg3Ay3Jlw2aBSd4cDqJ4OQd/
	hhErKUjBb405bGVWZMlddoHrbiNyZX+ETWCOffd68jRl1AUPghpNGLT8qin2j0Wkj+iVEJZ+hwT
	FjzBd0TMxpOCWMoAroexUH+s4ueTtIIECzUxNaBBYcU2WTuBn5RSx5nt
X-Received: by 2002:a05:6808:c123:b0:4ea:b0ab:b753 with SMTP id 5614622812f47-57a0b44b2ffmr19514343b6e.50.1795636257405;
        Wed, 25 Nov 2026 11:50:57 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:57 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 06/12] media: tw9900: power off the device on remove if still active
Date: Wed, 25 Nov 2026 13:49:45 -0600
Message-ID: <20261125194951.19072-7-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

tw9900_remove() and the probe error path only call pm_runtime_disable(),
which does not invoke the runtime suspend callback. If the device is
active at that point, e.g. when a USB bridge is unplugged while streaming,
the vdd regulator is left enabled and devres then puts it, which triggers:

  WARNING: drivers/regulator/core.c:2657 at regulator_put+0x61/0x70
  ...
   release_nodes+0x46/0xd0
   devres_release_group+0x11f/0x150
   i2c_device_remove+0x41/0xb0

Suspend the device manually when it is not already suspended, then mark
it suspended, following the usual pattern for sensor drivers.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 6309d9eda243..585509c1b41d 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -699,6 +699,14 @@ static int tw9900_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static void tw9900_pm_cleanup(struct device *dev)
+{
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		tw9900_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+}
+
 static int tw9900_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -778,7 +786,7 @@ static int tw9900_probe(struct i2c_client *client)
 	return 0;
 
 err_disable_pm:
-	pm_runtime_disable(dev);
+	tw9900_pm_cleanup(dev);
 	media_entity_cleanup(&tw9900->subdev.entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(hdl);
@@ -797,7 +805,7 @@ static void tw9900_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
-	pm_runtime_disable(&client->dev);
+	tw9900_pm_cleanup(&client->dev);
 
 	mutex_destroy(&tw9900->mutex);
 }
-- 
2.47.3

