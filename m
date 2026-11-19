Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047004;
	b=HUcadcxSAdgYra64RgDMzBNGZaY56zWmIjCotyT0HdP79xiN1qthSEz2Xg2KX8g3tEJ8
	 QsPtkxZcL7CAJ3UErEGBAPxgkyfUvxIOMP99LtI1CilR9W+Q/pfnO1Y7jC1rRHr7CG0FG
	 m1So9PunLSeBSV9mLaTdi0js3aIQSG5Pm7MXe9+ZmV4kyj8CaVxufcv99ntRJpvlfgSFF
	 CmwDcDugWhF1FUOtdhgBcbnJZxyJ5qulQhEZGhC4t46UbXKmDtLps8N0RIjW6R1BgY5LL
	 hsI1UJxDryz5FnSBMVLwyuuSGqfQYdv4uLUkQf6UOd3R4e9eNyz+sr6zRyrkeci8l6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
	b=mv2MU9/Y0Y4rWyQm9YwSU5VVH9iuWhvSJkL6iuXeB9fkquVVUbTu5o6SIkgnHF9a9MTF
	 dy71+wO1jctPlflZj72JlUjHbchZw15FKXSk05MbFN7J5SbK46ZZ5IGDzHJwQgrf3SqVw
	 Eay7K1HTZDHHKUzv9Iom+GecBa9L/sqN0vhO55cmbsecvRdIjvO1lU59VJldpvd7FznLQ
	 SQs8I0Edk0a0+lM+YFKN+q7kawXOOM/otsdaK86vDlI67bcsf4Jvc8X4Z3+uWlsWWBnkX
	 WZEWQ0Jk5TiiLnOG+UprbD0EnSS5HvqofObmx0ubZ7tKJhlD1Q+byz7cbnzY81YB4zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0HssYh2;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440C760A2616
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 440C760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0HssYh2
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4fb5d96b3so6787307b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795047002; x=1795651802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
        b=T0HssYh2SSHWHrSuOXQ97kVsD2vAdVHgdABDUZORdNsFg9hXotQCamW/b67k/LRdkY
         oPNq9O5RP9TDGOiVLO0O4j1HRnwaVJWs1ZlddnurfTtbfZWfOrPxrjc+0lQ2SoF655d9
         6fEcL8IpZcxhUdfl5+ehGszFQO2SrXLc2gJ4gl0k6GQM9/IfWfEYfCpwBLqteoTV2uAF
         VCNiWOSYS9GcYMZ1jrlPR9zXjMrrArSEPtNp/VLAo+ExjzvrVBguWhGL8qqxUVD84hC0
         vZCLwQuSg3afgF/hvvz8fm0zMZ4RLnDfYZfxMQojLt+S0F3GMlFk8iDbOEXEq7W50LZr
         pVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047002; x=1795651802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz6JhA4vgHQqGHllNtBlEMCpr/c5f2N6W+pIECb8wEI=;
        b=mD7yGED4fCAAYI8SUiOMbaAsWbkKMXGhBx+SllZGyjr4rAFJLQXB1Ih2I8OBDpjcqf
         ThSEvKccohm5iilwF+/HPgYzURCbZVKSVRcPIZMcryu/pEYdN2LaVuPN06+Fp1a6ZiKi
         8Q4Fk4FbyFWXOPzOhaBNjKVN8T09hGqObVSkh5aFbhXa3Vsj4R1F0OU6dWuY92TOfT+z
         HQlVzyU9p9KaKQtPRFwz8mMMKOCPMXM1qBBDmrLgTQCArjpXuAPvHbQ0TGUB010YOmDG
         zvgjk/QXIoedHXzHeiU+VSYWbs1gk8GIloZAF5GOr6oVKdB0AwoypdVvTC9a5fcnvNLy
         pqVA==
X-Forwarded-Encrypted: i=1; AL+hErHdZd3LTqErbPTxWwT+hjce8GTJRiIBina+4X5NOz9Yp0GeBuw/FIwGCwfNdgDydu0tMItVaiMMjr0dLws=@vger.kernel.org
X-Gm-Message-State: APuU4Z9579JSPzglayILuX/k9PmCWagWO8/L6nDdXftmzXd3LnlkvUP2
	ZkUv+1Yihr03uq1fHaYDQmFZc+/RZSyJRPZRkwjsbyLosOHiK72GHdPg
X-Gm-Gg: AZFdTZfBSWd71vKVjc97zg/LV7GkALJH+hW4sc4SEErGpcnNFArABxKf/Y2kJtLB74u
	QoGPDep6VK/gHMPrKrmM6tLeMCTzfXbI9tAlVAH21DCG4UoyBQokpqqG8ocTrah6XktkAXuZTBy
	kB1Xc0Faa9l2DQ2eMei/TsAxtUkMKy10ZZNgMR8PEZGM6YOiPnDh8/GCA2ttVxIkGtwXMkErMNK
	EUo3WS9a6CMmeghZ/DPcq4kdyb+wjSPpYp0QvazW1uYLAG1JfikydJ7s3eXa/w76OztRoQ7gaM8
	FEAKqjLEH71I9ntGeo/nMcWB9po5AxUNVS2ggwqGmBnnzH0t+oKJz3hq+7PSC4TOuq5MkZRj10x
	DHCH/23l9fAJ4z3mlYbat6OrkaUI0WWpsArT61wZz0QUpNq7a2sJdzFuKcyTrdRVLmfILOjl54Z
	2CkAyuI3DccEA2YrYsG+9QttT/FGn3CHfdhncDwjwJEZqfOxOyv2xIUZkaFktAhwoMHWVWz9tIA
	wPpExZdvVB4Tm6/Em5CX5flk+K6cdq2GWPNwvP3mEZjZQnidtLIugqIRsEtzrn5t59q9Pq0dVFQ
	vN5hQI4zzLoW66wv+l+g9ijXpsq+uzaoGAoUrXA+Utp3OKL2v63PDf9EnZkhyH9/+bRx619cKaA
	SbuF7+YM4h+/eG/4em5EFxtwFQcx0SbnaL9FIwAGYqF2I/skuXSUftDeGnRUer1exH8XnQureDr
	jBenOJ0lJBGeGEF5FPXg==
X-Received: by 2002:a05:690c:4990:b0:8b5:2a0:606e with SMTP id 00721157ae682-8b513d44ceemr1089987b3.18.1795047002245;
        Wed, 18 Nov 2026 16:10:02 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe0eb8d2sm25158667b3.36.2026.11.18.16.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:10:01 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:52 -0500
Subject: [PATCH v4 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
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
Message-Id: <20261118-marvel-env-v4-7-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6655; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=qZd97RW9IxalQgdmkxJLFmDFqrpkV05FcdnVxnLWCBQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XlJfX753nl10dmpc/37opgy38RU8HLwzZXRzH0o5
 7um7sTbjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmqjQjwzXlfz//+G
 2/+rxfSsn6Z13/ZyXf+qtn9s7I1vfYqv3lxDlGhitpGw5KN/FuDT4dXvhbJfDZri2+WzMu+h198
 euZ6X6FajYA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The firmware reports each change of a sensor's state as a system event
machine check. On one, reread every node from a workqueue and notify
userspace of each alarm attribute whose value changed. The notifier runs
in machine check context, so it only queues an irq_work, which queues
the work. The work takes the hwmon device lock to serialize the refresh
with the sysfs callbacks.

Signed-off-by: Matt Turner <mattst88@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/hwmon/marvel-env.rst |  4 ++
 drivers/hwmon/Kconfig              |  1 +
 drivers/hwmon/marvel-env.c         | 89 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/marvel-env.rst
index 02d5241749bc..4123c44fd2c1 100644
--- a/Documentation/hwmon/marvel-env.rst
+++ b/Documentation/hwmon/marvel-env.rst
@@ -26,6 +26,10 @@ cabinet and drawer numbers.
 A refresh keeps the boot CPU in the console with interrupts disabled for up
 to 300 ms per unit, so a unit is refreshed at most once every 10 seconds.
 
+The firmware also reports every change of state as a system event machine
+check. When one arrives, the driver refreshes all units and notifies
+userspace through the alarm attributes.
+
 Sysfs entries
 -------------
 
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index c0ce5591c82d..99c5d84c8752 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1258,6 +1258,7 @@ config SENSORS_MACSMC_HWMON
 config SENSORS_MARVEL_ENV
 	tristate "Marvel (EV7) AlphaServer environmental sensors"
 	depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_ADDRESS)
+	select IRQ_WORK
 	help
 	  If you say yes here you get support for the temperature, fan,
 	  voltage and power supply sensors of Marvel AlphaServers (the
diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
index 8ec3dd7c0b23..effa70b3b35b 100644
--- a/drivers/hwmon/marvel-env.c
+++ b/drivers/hwmon/marvel-env.c
@@ -17,12 +17,15 @@
  */
 
 #include <linux/hwmon.h>
+#include <linux/irq_work.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include <asm/gct.h>
 #include <asm/marvel_env.h>
@@ -97,16 +100,21 @@ struct marvel_env_chan {
 	unsigned int pkt;		/* packet offset in the node */
 	bool ps;			/* power supply, as an in channel */
 	bool present;			/* known when the driver loaded */
+	u32 alarms;			/* alarm attributes last reported */
 	char label[32];
 };
 
 struct marvel_env_data {
 	struct device *dev;
+	struct device *hwmon;
 	struct marvel_env_node *nodes;
 	unsigned int nr_nodes, max_nodes;
 	struct marvel_env_chan *chans[hwmon_max];
 	unsigned int nr_chans[hwmon_max], max_chans[hwmon_max];
 	bool multi_drawer;		/* label with cabinet and drawer */
+	struct irq_work irq_work;
+	struct work_struct work;
+	struct notifier_block nb;
 };
 
 static const char * const pe_names[] = {
@@ -293,6 +301,7 @@ static void marvel_env_add_chan(struct marvel_env_data *data,
 	c->ps = ps;
 	status = marvel_env_status(type, c);
 	c->present = env_status_valid(status);
+	c->alarms = marvel_env_alarms(type, c, status);
 
 	if (data->multi_drawer)
 		len = scnprintf(c->label, sizeof(c->label), "Cab%u Dra%u ",
@@ -498,6 +507,72 @@ static u32 marvel_env_config(enum hwmon_sensor_types type,
 	}
 }
 
+/* Reread everything after a system event and report changed alarms. */
+static void marvel_env_event_work(struct work_struct *work)
+{
+	struct marvel_env_data *data =
+		container_of(work, struct marvel_env_data, work);
+	unsigned int i, k;
+
+	guard(hwmon_lock)(data->hwmon);
+
+	for (i = 0; i < data->nr_nodes; i++) {
+		data->nodes[i].valid = false;
+		marvel_env_refresh(data, &data->nodes[i]);
+	}
+
+	for (k = 0; k < ARRAY_SIZE(marvel_env_types); k++) {
+		enum hwmon_sensor_types type = marvel_env_types[k];
+
+		for (i = 0; i < data->nr_chans[type]; i++) {
+			struct marvel_env_chan *c = &data->chans[type][i];
+			unsigned long changed;
+			unsigned int attr;
+			u8 status;
+			u32 alarms;
+
+			if (!c->present)
+				continue;
+			status = marvel_env_status(type, c);
+			if (!env_status_valid(status))
+				continue;
+			alarms = marvel_env_alarms(type, c, status);
+			changed = alarms ^ c->alarms;
+			c->alarms = alarms;
+			for_each_set_bit(attr, &changed, 32)
+				hwmon_notify_event(data->hwmon, type, attr, i);
+		}
+	}
+}
+
+static void marvel_env_irq_work(struct irq_work *irq_work)
+{
+	struct marvel_env_data *data =
+		container_of(irq_work, struct marvel_env_data, irq_work);
+
+	schedule_work(&data->work);
+}
+
+/* Runs in machine check context, so only queue the irq_work. */
+static int marvel_env_event(struct notifier_block *nb, unsigned long action,
+			    void *unused)
+{
+	struct marvel_env_data *data =
+		container_of(nb, struct marvel_env_data, nb);
+
+	irq_work_queue(&data->irq_work);
+	return NOTIFY_OK;
+}
+
+static void marvel_env_unregister(void *arg)
+{
+	struct marvel_env_data *data = arg;
+
+	atomic_notifier_chain_unregister(&marvel_env_notifier, &data->nb);
+	irq_work_sync(&data->irq_work);
+	cancel_work_sync(&data->work);
+}
+
 static int marvel_env_probe(struct platform_device *pdev)
 {
 	u32 *config[hwmon_max] = { };
@@ -505,7 +580,6 @@ static int marvel_env_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **info;
 	struct marvel_env_data *data;
 	struct hwmon_chip_info *chip;
-	struct device *hwmon;
 	unsigned int i, k, nr_info = 0;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -579,9 +653,16 @@ static int marvel_env_probe(struct platform_device *pdev)
 	chip->ops = &marvel_env_ops;
 	chip->info = info;
 
-	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data, chip,
-						     NULL);
-	return PTR_ERR_OR_ZERO(hwmon);
+	data->hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data,
+							   chip, NULL);
+	if (IS_ERR(data->hwmon))
+		return PTR_ERR(data->hwmon);
+
+	init_irq_work(&data->irq_work, marvel_env_irq_work);
+	INIT_WORK(&data->work, marvel_env_event_work);
+	data->nb.notifier_call = marvel_env_event;
+	atomic_notifier_chain_register(&marvel_env_notifier, &data->nb);
+	return devm_add_action_or_reset(dev, marvel_env_unregister, data);
 }
 
 static struct platform_driver marvel_env_driver = {

-- 
2.56.1

