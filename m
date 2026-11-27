Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782444;
	b=Gl85qtx/bee4OXg6K2TTrZvG1QZX61nhXlp9AnoDilmJmW5NFzwABMLzANOWIB2xsf/J
	 kS1QJu4R0MHvz9FgL7RCN0XLmAzgQHV05C/C6A1WUpgJ8k8cGKptuuJhXd6dqhx4K1Val
	 Vv3FQ4mth/xStZln2V4Yq6BiIwF04Pp1ZrAgyLWUmiEqOZgwS1R8XTLeyMvFZq/hsJxbA
	 ks4kOEzSOgCIiE9DQcaSGDL6vsqPmmMaTI+4rHzITcxqDZT0Y72uWENTwBV4vmNerKnu3
	 hdkAQIoZ/UQsctQ2swDQm2ZgPGyg9FopiISzPUrRZ8nBGF49GAzMmG5ptRJcTRQR8lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782444;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=hr3POgh8HCm2pUyVX82eXsx/WjAOvYbt4tkgYRnk9Fc=;
	b=arJJwMhrJyCCp84qgnOEtOPTYQUtTM7TwGS7ZqjPQjNmxb0ZLqFjjCb14fz+OGE0dCGS
	 7MmnQ5Lm0H6ML3g+H8VVoenzWdhmfInP8jPRtdaYh2jbTm8DdsudeZhwjiZjpCbplu9fS
	 XW2E0MkK9vb8zjl4kbPCZepTkqSd+mBddU45o7SllYo1WE5sH/tLl/VOI4qyf/T7G2bbH
	 k3LvUxsmZUnIY1egEfdLs9AbfvhaqtVu30lzSmad2nnuGUFmrzcEh4d8WTUkTyPTw0H+p
	 HNxiUyyHO4F7slVHk7wiBOS5TpQBNJjUKTEbMpg+a581P1lCNdXMcV2g0eCjgW7wA4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lq5aLGsT;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6AD606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6AD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lq5aLGsT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795782441;
	bh=e06JdsJ6NaTyRmO5sHK4ldp+a7pHU6htpMkP4M/mCXo=;
	h=From:Date:Subject:To:Cc:From;
	b=lq5aLGsTQ9B0nmXLKoiogYgQhBej7Iwbfu3ckr4wVR6daRYzWfIv0n5LjdbJMVkbP
	 tHx0eJ5eT80EdKl8lW8EbQ1A/Gz8S6yfhwMtfeKjQG7FnpfIYaLJMETNj717NQQ5vD
	 o8S4YMy/uFUoqN0ubqKcTY7mE0KFWKZluxDgMp/Xov5ZoZl3J2iGe0FLEE6hRWnIJp
	 tD8ja7yHWGohbB+AQiPaGCYlZp4JU5+k2sf75qGCyn5zSxR8u1yvNzNeO6RdHhJ5Fz
	 jAFZmDO+eRNnTo4ck/Z4eYDcFZL+s52zj7B43/HgbkIqSA0MSFCixsXAhjcpHs3dJp
	 wClDZQJvlO1tQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 160B717E014A;
	Fri, 27 Nov 2026 13:27:21 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D1B4D48002C; Fri, 27 Nov 2026 13:27:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 13:26:06 +0100
Subject: [PATCH] regmap: Support mutex-locked maps during atomic shutdown
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-regmap-atomic-shutdown-v1-1-1a0122144df6@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPduELhHQVzEeyqhQEzayDjUhv
 DtTj9/h/zcwSSoG12qDJC81jaGAThX4icMoqEMxuNo1RK7FJOPMC3KOs3q0ac1DfAfs+czkL11
 HdQslXpI89PMb3+5/29o/xefvDfb9AJFt99Z6AAAA
X-Change-ID: 20261127-regmap-atomic-shutdown-ba5a1c988107
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2427;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=e06JdsJ6NaTyRmO5sHK4ldp+a7pHU6htpMkP4M/mCXo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJdyRuZGW3wWp/GUW15z14qpHcM25iSx2fO
 OnZKZM9Gnp1BIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCXckAAoJENju1/PI
 O/qak8wQAJW/V4avOii36Nb4bstRttWUeXAynsEWjjsqsgu5h7a6Lnc9xd5ygLQWm+yzm0em4SD
 /tGa9InfBkQ/v/PliKRCwBicQzFZiIGOu/X14MmuCvDQZyqLuT8tkLE3oQp5nijnPtnUZv69TEc
 fecv3vMB0OlmUJMjVsgjEVmhUIevwJYa2eiwFnC7K4z4RraM3SPQ0ToMGuwPGtZHCJBR2K47hy0
 bpf1k/oCTVklTADOv4fQiPZnw+jYcLdxhLcHQb/4R5sJqDEpCrGGtiB4HHO6zosF8b1cYWGePnB
 B3S0j6+tXYTiO/JcPOig5JZiUDm132IpNbotir0/jmCrpLfGx2L+YiJ5iuALZ24zLk8/5ncgFS4
 PR1raTWBZ2TmQI2iLyaV3V/GI+PGv4fN22F7Uma8x0dqYqhBhsnIyxf3eBjrPOk6Ru2gMcdTsWa
 27+IEcitcsaNMplbjSP8IZtCeCPLc4wR2YQBB/LvH60+YJ49hf6dDazS9eYqT1VfQQXerGW/VMZ
 2rNLVgc9bRWZ4XdECAdJuzZvPN96UHnNlfJPo6qe0JVYzzewsl2VR1MSF+GZJiT471hR2yY9tmr
 /oZANuggPqebwL6tOSt2rF8BZui0A8cTkxiDG2fiWiOnmoeqIamRvIQhesfHTBQ5OFLxcVE/bw3
 acz2n8Dp3o3YN89XBI9Mu4w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Power-off and restart handlers run very late in the shutdown sequence,
when only one CPU is left and interrupts are disabled. I2C has long had
atomic transfer support for this, and SPI recently gained it as well,
so that PMICs can be told to move the system into poweroff mode.

Most PMIC drivers use a regmap with the default mutex locking though and
that may sleep. On a Radxa ROCK 5B+ (RK806 PMIC via SPI) with lockdep
enabled this results in:

[ BUG: Invalid wait context ]
systemd-shutdow/1 is trying to lock:
(rk8xx_spi:91:(&rk806_regmap_config_spi)->lock){+.+.}-{4:4},
at: regmap_lock_mutex+0x1c/0x30
...
Call trace:
 mutex_lock_nested+0x44/0xb0
 regmap_lock_mutex+0x1c/0x30
 regmap_update_bits_base+0x40/0x90
 rk808_power_off+0x70/0x110
 sys_off_notify+0x48/0x80
 atomic_notifier_call_chain+0x74/0x130
 do_kernel_power_off+0x5c/0x80

Detect this stage using the same check as the I2C and SPI cores and
just skip the locking as the regmap cannot be accessed by anything
else at this point.

Note that writing a cached register, which is not yet present in the
cache, may allocate memory in regcache_write() resulting in a potential
sleep. But this is not a problem in practice, as registers used for
power-off are usually volatile.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/base/regmap/regmap.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 0ba82fcc55bf..e73c4df194e5 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -440,15 +440,29 @@ static void regmap_lock_unlock_none(void *__map)
 
 }
 
+static inline bool regmap_in_atomic_shutdown(void)
+{
+	return system_state > SYSTEM_RUNNING &&
+	       (IS_ENABLED(CONFIG_PREEMPT_COUNT) ? !preemptible() : irqs_disabled());
+}
+
 static void regmap_lock_mutex(void *__map)
 {
 	struct regmap *map = __map;
+
+	if (regmap_in_atomic_shutdown())
+		return;
+
 	mutex_lock(&map->mutex);
 }
 
 static void regmap_unlock_mutex(void *__map)
 {
 	struct regmap *map = __map;
+
+	if (regmap_in_atomic_shutdown())
+		return;
+
 	mutex_unlock(&map->mutex);
 }
 

---
base-commit: 222b61e9c570dac6c7a786d039e4c226624b426d
change-id: 20261127-regmap-atomic-shutdown-ba5a1c988107

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

