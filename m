Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695924;
	b=vFd90lMcm02WVTMgr6fSXac8/G/LYk8IbkKvOveurohoqMiDCB/lNTwwF6DvTXL4qfX2
	 +qw7FbBDq4GHlift3QgDfwWp3FbzYqFBbZ4m/xqCxWziA+aZQ6CZTfDgrirvoJxixpDU1
	 7B1K3wk+OmbF51e3GXud8zy4rvLxqjA7SMh6xRyv67hUBEsLi/kMHQ0D7eg/tMgCXXSue
	 TZvJMdxMlWzwUJMsrguP201OPVAT2njfeVY8dkjQDY4LVVF00WpIgXFPW/RVQU4iXS94o
	 yYbg9bZpsCtYcGDGibCZY3OCaOSTlRGbLNfZ0lIIPLXzecTGPgqK8woeENnQxDGdjDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jY4prrYeethbYwaEBl7NR0t0hneBzAAuf7VOXeQQ51w=;
	b=2C7aVOFHn7DYA/T4BASjpMAqnIk+Gw/eAbE75cNkkKKxvr7Gu8KqFk/w21ef3SUgeYNt
	 I22fRpEyxVCW5VjI7Fi5QVDE5p6fBMvsF5FL7xClaAsu3E7k1NUIag87WzvD9EO/ReI6q
	 N+Lc2c9MTN++EH2Qh4/VSTHPq5g06O+mkoVEwl0BoYnF1QX8MzUYjOppeVeluVDnarFgZ
	 TAONPeY6t+pcGzhGfGXEt0QGXQ0HxPtGUFcISHDcszUAEQSKn47U3A1BLu4pGhfyNkEOF
	 VTFEa88o9OQHuCRDC80a0Lx+PGllWRNfzAji4dXY8uweVZlAhvMJXC1qULzQnoNEqoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHf7RVFo;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37506606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37506606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lHf7RVFo
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b563e32936so2825839c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695923; x=1796300723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jY4prrYeethbYwaEBl7NR0t0hneBzAAuf7VOXeQQ51w=;
        b=lHf7RVFojmOgsrIajjyLVRsOtNP3nHqiq6msIxIVQ8vR+xObUBpNW8eEgQKeBAAHdR
         oJaX0XJ2daoPYg5iWTrQ6Lxn6R0AphDdXK8prZw5OE9+r43bWVpd807tNc101RyDimRD
         dW4JataDYh4NE8Y+wyumVQp9maAD5n6QBJbmbPbMb/3UHvZF5iQZAVgLGJJaNTxkeyN0
         UYIJbaOpreLyc30zHwhFt10JBHhM7qt9+4jEkt3ai9gpi38UUEUSM+z8GBjTvLUmwngZ
         gubu+PaKNn2281w8Aoyei7jbkSIp7rDE6dwUAk0anbCWXbOq75+0VENbfPEagZ8q/9lc
         pV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695923; x=1796300723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY4prrYeethbYwaEBl7NR0t0hneBzAAuf7VOXeQQ51w=;
        b=naymhBmbh85lrj6o7H+AYF8bKngLRdTHiYs857FCAZw0K/PpXJVro0LPcY2sXtnjS4
         axy5Kn5pjH5qT9fhiqvhiAAPzm3KbeqXmhdWIrBW6FHfZZlqlcC/fwo8luIqEiXrWE1a
         OpxctjpaJtPEf6hkX3200xfpS5LaxSwZTuKKd/EpAclrOZ+bfE8lwP2Rucb0aHLWd/bB
         /cuEAtssNMeKSihMNgn2azVMrnvodjoD25ZbEuF9+UVrOOJ38g1Ihv6LK6UT8kh1Evb6
         qk3VQy4Ey3Ra7Ti/F7qjX6HHOPLfn/tpMLHzGrRysSAKFT87CBdDxvmC6wiQ/NiVPxHi
         PvsA==
X-Forwarded-Encrypted: i=1; AL+hErEyYx2lfRkql4OtjuTST0uHf+xiCI9W6GPaLZI0kyZ9LI17u8EMYu4Xbq8G45mCnUzQJ74FOkKNvcdletA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kd1kiGxm3vQCxelKIF25b1QtYcllYMZOQAxhwvmZMVcmleLpD
	NTRFSZHjeKRwOEP67f0zQPRjbX2mJNrri1kSuB/6bXc9UEXk4jsSf3TqTFeGAw==
X-Gm-Gg: AZFdTZdtVqSWlWt3ugKVJSzbd+GXsNkFCUg9p0cUR51C45g6bpk60TNfT/yqvRJ72CY
	eMrlafEY1VLiyGn5qFQyrTfHFSA58ntFBFmFoG9ArUVbk0T7CGIA+N7/D/1MokzvG1F4lmRVARJ
	KNYSpxHYn8Yy2R6yqkypE0ClO/4pc+EA1se5tfVB7EctNMTVXyL7SDRLsUEf706JLIdFiYYVY6t
	Db1pBIxPsEH+ZA2SJPJiI16ZSwIckrB4uUwbaa/EyaVrhEEtmwXlwMtEphZjjxzjKCStX+DxfMA
	h1vkU0JkboDoV2Ld8Bee/jTY5cHGHmBKV/3on22scZoCCtqbg50C41AdeoS7AJRNsLfURk8jtFR
	dKBi3OGGctyPvtwPtk3gHvPqfKOhggAMocY/bLiQXhluFk5p9x9yTaBElzeuzvgkmD26uUL8jZt
	MpYMzGIA611REGARTrVg2r9tE5t9gE+qDh94cLaQ4cOOqG5OvJj7+qlFl4eieXVeqIBoYpKLEo9
	p9hkaBfV1n67IxmiPidFRg3u8fQ2UfOQP6dE8Wz5hWH+4jr5lzAXrFDLTmDxvBpuziRcYTq4Fc+
	Z0N/4VITcc5Ixqo0cu3WcQwZS6Pcbj1T5ebqncqsiJXW1oKsd/o2UQM3n9RhDQE+0SHr
X-Received: by 2002:a05:701a:8148:20b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b55689eac0mr20511682c88.11.1795695923199;
        Thu, 26 Nov 2026 04:25:23 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm45954449c88.0.2026.11.26.04.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:25:22 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: sgm3140: Put the child node reference on success
Date: Thu, 26 Nov 2026 19:25:16 +0700
Message-Id: <20261126122516.1198461-1-congnt264@gmail.com>
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

Remove the early return so that success also goes through the common
exit that puts the reference, and rename the label to say what it does.
ret is 0 on that path.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Use the common exit for the success path instead of a second
  fwnode_handle_put(), as suggested by Markus Elfring, and rename the
  label.

v1: https://lore.kernel.org/r/20261125134013.2692510-1-congnt264@gmail.com
---
 drivers/leds/flash/leds-sgm3140.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index 107d02c3137f..e12f65d3e219 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -258,7 +258,7 @@ static int sgm3140_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register flash device: %d\n",
 			ret);
-		goto err;
+		goto out_put_node;
 	}
 
 	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
@@ -270,12 +270,10 @@ static int sgm3140_probe(struct platform_device *pdev)
 					   &v4l2_sd_cfg);
 	if (IS_ERR(priv->v4l2_flash)) {
 		ret = PTR_ERR(priv->v4l2_flash);
-		goto err;
+		goto out_put_node;
 	}
 
-	return ret;
-
-err:
+out_put_node:
 	fwnode_handle_put(child_node);
 	return ret;
 }
-- 
2.25.1

