Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699919;
	b=e4E/ZtKciyul/y+ptY9Zxr4CPxXwxEOjGNmZM61OPlhDNd86TaDhAL45mDKZZqEXKzWT
	 lt/90pOOTuv24nqKHGoZ2lMJPu9nU7yLDAdPgQOo4GeGYXqkOLn05af22qAl3oSHlPTJo
	 iLYkyd4nrC7zpWCO/S+x0NIjupqGaliShFOM0sFuyWorE37xW/63Ha+CdrqqKShVrYu/N
	 xiNL19nrL2I4us21wjuitJQ4TuNff6KrHRBVnIKTYb8yh9ADjC/bLLjx8akXhsGiSBoWR
	 aTUl0/BAzpQ7wZa1DZL/Ix1fnTHG+K+NRl5YajuZahiVRKvuU4ugabOm3cEHGPNkEWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O61FDlwjHKBDnCTbb8aWwb1F9/n+IACrfnZVxf0Y28A=;
	b=FhIGkMEf5EnIKoQ5ccNVfUVfd/IU7pfA6R0fMS8sSyEHjPqgmj6hCKCbQxbNVVBFwywt
	 uh32HjL8B2Q5kSQNIo8AvBDKwbBSzECkXX+KHMbx2OGMVXpC7DyLe//lvtuZhojIKOSRw
	 fggi7XOaVsPRiA86cdo8eyugRflAkn+b6sARefiUEoBUQ/hOCCcd2Qy0oiBzzv8kSDl7i
	 i3T0lYW2tojueIBmZNKSv4MW0FPvYHFD806WEXWgFzNJJ0nH3ktsB+zOTbmMvYaR6j3L8
	 lQ/eIo6Jh6+GgM5iGP/PAEXBWergl3sybdj+lBJkN1xyMHcGHOMjsm+eVfvqHHjjznw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdSwlU8B;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB26606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB26606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdSwlU8B
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5462693c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699918; x=1796304718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O61FDlwjHKBDnCTbb8aWwb1F9/n+IACrfnZVxf0Y28A=;
        b=pdSwlU8BdoCVHBBNrELrT0pqFgmmPZpC7zzITXacmHK/w/QFes/gumIDPg93npLdjh
         W0f6aU0w7gB2faGLA/43zn9xB/CibYNQvB5Gggca4LYwEOQEnxhUvgiYAa6aor35j+Un
         jJo4fl5fsax6zJXFwezfZoE/uVUMVjehew3PY26JadHcJy8a8UrO5ZJzRvxSYuZu4Z37
         9e0gUUtck8cc1Ax45OZ9H97uq6SJgsQYNM1PJHwzT1wYoJZTapkquURbS/IamMHVawwA
         Or+fX4lQbTr2qLguralc1DFjjh0f+u1jCVeEWzc5NySvxdjC9LGSgZbtLA54/tByKdNZ
         +j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699918; x=1796304718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O61FDlwjHKBDnCTbb8aWwb1F9/n+IACrfnZVxf0Y28A=;
        b=V8vvsTog7FAOHJlcn/Sa77QUH7SI/Kx5qxdEfN6T9vLuSRWUI//K9DSYyu7ZNtlHuU
         v+VRM0CP9qVF2qZHxkfjR92HU5zP5ihG/m0tX9rrIjOD2gpjcd65ulTYPLdps95+S4Bd
         sZyxBT6spIqN7vT+M+u9EYXgkc0fztZVnhq3vzr/S5rNZ/sC4P32ftXcFUX6vhvkyYa4
         tzf6wZV/OFjeBRdrRdq4tbzBqwNJRXDC+43GNGakgoCnUOvT++c8bvMBUOFOm4D+pAZT
         zvcqlfIZ7+G/Qrau4FDuuzedE/8ZLdL1MAWSOtMnTard+lBT82FP5t/hxY3nzkvPfEzF
         TJIw==
X-Forwarded-Encrypted: i=1; AL+hErF1LqarKptmnkUMnOx9DEjPph92bvxnvNK4ufTw8S8kU6Hh1GHuPSg3RvY0qAP3o3JAy0ca6QL6XDFn8sM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SZPLMetZrr46UYTL1BJm/ChSVdSDliXZcAcgiuOTsBmgcuwYY
	/C82g51JVu3IxweNMg7hL1DfwJsY1V928+VxW0fdCukD5GmXF0iOFxk=
X-Gm-Gg: AZFdTZdnkliDfOZSRjxu5HNuZCFbVYFVJiM5KSPLTMvsqYRHbzelF8vkLV4Z99rFMMc
	xejih4BHeKy0ZK2KbOpoJWQDJnfapaSdufrHWCBRgwgJs4I/2rHsNgA+dpOjkfTwwsUlmD3ik3G
	/8AGoQDwR8KlElfahLvMbzF35jGtGrhQulyij0q2eKcadFzkj1GYhmu57PehBSgMqdZsl60etgI
	uvAEmMWTZE85bsxFAHe3dDSOmqZ5uLLUHWRCmxU5q1w/JwtdiJxu83FYYAl0/5AS0kF9EKRKz8L
	qyVVLeb2miZXOvWLAVhitEsNZYn/2tYlUlwOMK0XxL6VCW7UI2hheQ4ZB+SBzJaqRqskh0GaQHd
	oxr8nnwz399B7Dk3Dn0P+D1pVQ2Nlzg2OftMUpXQ+0jDIUbtEk3vUj7GSfhU24+l8HkYwkodjzc
	NBkPgtNoH3q5YxIgg8MNX/RTzlKmh0PbNy64ctfACBUvZiO3N+EGfPMWRIxXuLM2ll44Tp2eN4Y
	DDklF2lF9dfNIDULjbKnltUHNOMky6kz2jxq2IKtitAuIhzhiaH4tcV5UeUqzahF+/Qoa4RW+6v
	KBkuVGFbVob2DSaAMeY6IztCpwBdtVPOvU/et6KJWdIAVhUEQA+UWMiLUvTXlLrWubc=
X-Received: by 2002:a05:7022:ed02:b0:149:50cb:2175 with SMTP id a92af1059eb24-1b5568fda53mr20186467c88.33.1795699918133;
        Thu, 26 Nov 2026 05:31:58 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm22321547eec.17.2026.11.26.05.31.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 05:31:57 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] i2c: rcar: release DMA channels when host notify setup fails
Date: Thu, 26 Nov 2026 21:31:54 +0800
Message-ID: <rc-b1-20261110-vc-182-eee62ef398fd@gmail.com>
X-Mailer: git-send-email 2.50.1
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

rcar_i2c_master_xfer() requests the DMA channels lazily, on the first
transfer that finds priv->dma_tx or priv->dma_rx still set to
ERR_PTR(-EPROBE_DEFER). Clients probed while i2c_add_numbered_adapter()
registers the adapter can already issue such transfers, so the channels
may be held by the time rcar_i2c_probe() creates the host notify client.

If i2c_new_slave_host_notify_device() then fails, the out_del_device
path deletes the adapter but does not call rcar_i2c_release_dma(); only
rcar_i2c_remove() does. The channels then stay allocated, together with
their DMA engine references, after probe has failed and priv is freed.

Release the DMA channels right after deleting the adapter, in the same
order as rcar_i2c_remove(). rcar_i2c_release_dma() skips channels that
were never requested.

Fixes: c4651f11d09a ("i2c: rcar: add HostNotify support")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_I2C_RCAR=m, CONFIG_COMPILE_TEST=y (object only; no new warnings).
No hardware or runtime test was performed.
Needs a pre-Gen3 R-Car I2C node with the "smbus" property and dmas, a client transfer during adapter registration, and a failing i2c_new_slave_host_notify_device() (e.g. a client already at 0x08); no in-tree DT sets "smbus" on an R-Car I2C node.

 drivers/i2c/busses/i2c-rcar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index fcb15be59cb5..b5c964c367e7 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1241,6 +1241,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
  out_del_device:
 	i2c_del_adapter(&priv->adap);
+	rcar_i2c_release_dma(priv);
  out_pm_put:
 	if (priv->flags & ID_P_PM_BLOCKED)
 		pm_runtime_put(dev);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
