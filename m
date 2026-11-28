Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863759;
	b=kyXUt6f5fQQMB+9f2IEBkdE+e/1vCMo0SQMJwb898x/Hs4+YV4KntlH6edv7IX+sYutK
	 WEi3RqnDQTyp5wKRZn6CZLstJ/fQO6sovMkH/zWP7VG9/sEuDUDir6Ryey3BFM9B7AXpj
	 zQn1oPloxzSILyQzDq19z8HTcqGCTupruSCdqe8ngu7N0+AU6/nLgvl/e09u5l9c3GKio
	 BwFvkyw30y9pzeiQvEERQTZNvzatNB703BAR92A+SfjfCSaHkyf0qqdVQAbwjn69JekW6
	 vLq6CAyWkF5sd0/pZ00hoduIPvMAEiaXxbAPUtky7iHUX56XfJgROJy7r4BdOfweuLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863759;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=I4CK2Pasc/eYuTkL+JLfqTmVFEdHZXJnbMaj5KnhmTo=;
	b=h+Buaj5t2hk7aXvdDruzbg8BOE3OevQgMBQH8boD6Pa+KAixySLGR6PpSqnw13WDoFIA
	 4oeLzaAvydTgfHQqKsF+Uw0JoJePHHYeKboGTrL00ZPAIxjMKLTDZScszuSnsT2UZBslw
	 bkCngFmPAUDJ5Jme1++/TYwA9++XyntP8dwOnQ6ZDng0m6psFJf+rHhFgqpjgfFj1s6f2
	 nyeTPO8oEp4ra4ct8hlaizpZkS7iogjeQZpzm+zmoThRGufn+s+ViryD/ul+n4jpGewn7
	 ly8Hbh0sW/+07wTpKJqSGrw9cV7znh+6szoJGbulgnTq1En0kGsPWviqStUcRsbtdJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Z0eIP5vh;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF5606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FF5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Z0eIP5vh
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652b3;
	Sat, 28 Nov 2026 19:02:34 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	romain.perier@gmail.com
Cc: linux-kernel@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] regulator: act8865: Tie the power-off handler to the PMIC
Date: Sat, 28 Nov 2026 19:02:34 +0800
Message-Id: <20261128110234.875419-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa221d238be03a2kunmdc6738653cbc8f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaS0lJVh4YS01KGEMeSUlKTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=Z0eIP5vhxslnQyxkXSnocoBXK2Wa/3jzBVdLwXYYVqAz6Rigbr0o9PQYphJ3vC6E50+v+U+cJ742+OqOvgyGSCUDflUCwDONBiRJlDskitEQ8SJTeMtz7k8ltM/m8Dyg8f6GVV6VWsxT8G54o6aAV0wneZMXm9SPYPCS68XVqzs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=I4CK2Pasc/eYuTkL+JLfqTmVFEdHZXJnbMaj5KnhmTo=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The global power-off callback can outlive the I2C client on probe
failure or unbind. Register a managed handler with the PMIC as its
context so the callback is removed before its regmap is released.

This issue was found by our static analysis tool under development.

Fixes: 2b17fa2825fe ("regulator: act8865: Add support to turn off all outputs")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/regulator/act8865-regulator.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/act8865-regulator.c b/drivers/regulator/act8865-regulator.c
index c2460f5904b9..2aa93baff815 100644
--- a/drivers/regulator/act8865-regulator.c
+++ b/drivers/regulator/act8865-regulator.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/power_supply.h>
+#include <linux/reboot.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regmap.h>
 #include <dt-bindings/regulator/active-semi,8865-regulator.h>
@@ -572,14 +573,15 @@ static struct act8865_regulator_data *act8865_get_regulator_data(
 	return NULL;
 }
 
-static struct i2c_client *act8865_i2c_client;
-static void act8865_power_off(void)
+static int act8865_power_off(struct sys_off_data *data)
 {
-	struct act8865 *act8865;
+	struct act8865 *act8865 = data->cb_data;
 
-	act8865 = i2c_get_clientdata(act8865_i2c_client);
 	regmap_write(act8865->regmap, act8865->off_reg, act8865->off_mask);
-	while (1);
+	while (1)
+		cpu_relax();
+
+	return NOTIFY_DONE;
 }
 
 static int act8600_charger_get_status(struct regmap *map)
@@ -724,10 +726,11 @@ static int act8865_pmic_probe(struct i2c_client *client)
 
 	if (of_device_is_system_power_controller(dev->of_node)) {
 		if (!pm_power_off && (off_reg > 0)) {
-			act8865_i2c_client = client;
 			act8865->off_reg = off_reg;
 			act8865->off_mask = off_mask;
-			pm_power_off = act8865_power_off;
+			ret = devm_register_power_off_handler(dev, act8865_power_off, act8865);
+			if (ret)
+				dev_err(dev, "Failed to register power-off handler: %d\n", ret);
 		} else {
 			dev_err(dev, "Failed to set poweroff capability, already defined\n");
 		}
@@ -769,8 +772,6 @@ static int act8865_pmic_probe(struct i2c_client *client)
 		}
 	}
 
-	i2c_set_clientdata(client, act8865);
-
 	/* Unlock expert registers for ACT8865. */
 	return type != ACT8865 ? 0 : regmap_write(act8865->regmap,
 						  ACT8865_SYS_UNLK_REGS, 0xef);

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

