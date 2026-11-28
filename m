Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868141;
	b=Qx2Ft7PJuMV+717aAlXWQZvzFspbk7HbK6sUhp6Pi8B693Ut7Emi0NuPdeMkX0QWTiTC
	 a1Os7/wMsHNbWnKKfNscmEeymM72vchPotu742miuShqOAQ5N9Wujz+tiNjhkMXOHoBHU
	 5CbifGVukOWno4gOnWS5Jh8t9+PP0MGnAPSAh77/eDCXX4jNzYB+jMpdYxVhQrwAJIpWj
	 Qe6mMXzzMBReNMEJoZMlDVpmnSsCtgz+rQ4e/uLp9q5WsLAioaEJwtIh+Smvxh70ZtnLy
	 jqR1w762J8InyvRCr5IqViKHxKSa6FgDJzoH4UvguuHCry16DXYVa9bQ/tSen8aYf4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=ZohlHZs01SzK+9+R8h0agM6+Xt812qr+8u5VogmXQG8=;
	b=NC6+/WXqiFLc+8EonjnNScY0d0YJgFWxS8zaA9A2+KYJO8OfVxePiVfJtByZFwRmnmqD
	 YDDHgAd5EgwTgPmEs8Fer1XGM/+q3ngtzdkG6Jyon8uufoxKq5QQzDoOLlg4YvlLul0ce
	 6ICQP+1vIbrz+sYFSHRggsKa57NN84pkDIVJ5NH+vvWN+bAqRs+NOwFPgD9yZmnwjKzAL
	 35y/EBLyfVuQ+xQLO4peuGIZRc1zhzPR7+Jpj7WzvHaX/tiWpDeKkK7sn9w13WPDjvtTS
	 J28z2E0ByudY7WvDJdAB7X0N5i0gcgFBOOfc1UVAf1iXMO1L8j555RCSB+Ms2SmSgwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=gWMSSg3+;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E3606A324;
	Sat, 28 Nov 2026 12:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803E3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=gWMSSg3+
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 08318E838CD;
	Sat, 28 Nov 2026 13:15:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795868139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZohlHZs01SzK+9+R8h0agM6+Xt812qr+8u5VogmXQG8=;
	b=gWMSSg3+/TcS7fzvfNSL6tF/3vpR9LshfBTm7Cyab3geT/4ZC9FM/uzwZq67ueeTh0SaEY
	Ry7tVbgLLFZIRxAVc8LCaKOfoay9pzV2WAdB72gv598hT3dRMwZKBnJ6IW/28NTBNZeBB6
	nA/JB2Xv8WCUVwSTi6B3bQPuCDK8Vw1x3y1k9IkJv1bGfZhrgqhCqLoSZE83V4XmnLCARi
	CLIPsmXZ/we0LdRFFnP5taar5kbqTyNm20KRrK89c6iJQF5kYRER3duQx24/0QCZU6/0Uk
	+ex2AIprOroEvbpe3H8cPGCnlIs1QJJG/0U2uWwtrdzT9EkJ9lBmB3nNGtFUTg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id Jc3NQHKOamHH; Sat, 28 Nov 2026 13:15:38 +0100 (CET)
Received: from p14sgen5.lan (unknown [86.103.60.175])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 28 Nov 2026 13:15:38 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	Ross Cawston <ross@r-sc.ca>,
	netdev@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 2/2] net: pse-pd: add LED trigger support via notification path
Date: Sat, 28 Nov 2026 13:15:24 +0100
Message-ID: <20261128121525.3909836-3-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128121525.3909836-1-github@szelinsky.de>
References: <20261128121525.3909836-1-github@szelinsky.de>
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

Add two LED triggers per PI, "delivering" and "enabled", so a board
can show the PoE state of each port on its LEDs.

The core updates the triggers when the IRQ or poll path reports an
event, when a PI is enabled or disabled through its regulator, for
example from ethtool, and when the core itself switches a PI on or off
to share the power budget. "enabled" shows the admin state as ethtool
reports it, also under software power control, where the hardware
stays off until a PD is detected.

"delivering" changes when a PD is plugged in or removed, and only an
IRQ or the poll helper reports that. So the core registers it only
for a controller with one of them. For a driver that calls
devm_pse_irq_helper() after registering, the helper adds it.

Reading the PI state can be slow, pd692x0 for example waits 30 ms per
command. So the core reads a state only while an LED uses its
trigger. It counts the bound LEDs in the .activate and .deactivate
callbacks. When an LED is bound, at registration or later from sysfs,
.activate also reads the state of that trigger and shows it.

The triggers are registered before the PI regulators. So a consumer
that enables a regulator right away finds the triggers ready, and
devres removes the triggers only after the regulators are gone. A
"delivering" trigger that the IRQ helper added goes away before the
IRQ. Once no LED is bound to it, the core no longer touches it.

The triggers are per PI, as phy_led_triggers.c does it per PHY, so a
board can bind a port LED with linux,default-trigger alone. One
trigger with a per-LED port setting, like ledtrig-netdev, can be added
later if the number of triggers becomes a problem.

Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 307 ++++++++++++++++++++++++++++++++++
 include/linux/pse-pd/pse.h    |   4 +
 2 files changed, 311 insertions(+)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 2fb10f5d8f8e..0e8584567042 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/ethtool.h>
 #include <linux/ethtool_netlink.h>
+#include <linux/leds.h>
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/pse-pd/pse.h>
@@ -350,6 +351,7 @@ pse_pi_is_admin_enable_pending(struct pse_controller_dev *pcdev, int id)
 static int _pse_pi_delivery_power_sw_pw_ctrl(struct pse_controller_dev *pcdev,
 					     int id,
 					     struct netlink_ext_ack *extack);
+static void pse_led_update(struct pse_controller_dev *pcdev, int id);
 
 /**
  * pse_pw_d_retry_power_delivery - Retry power delivery for pending ports in a
@@ -387,6 +389,9 @@ static void pse_pw_d_retry_power_delivery(struct pse_controller_dev *pcdev,
 		ret = _pse_pi_delivery_power_sw_pw_ctrl(pcdev, i, &extack);
 		if (ret == -ERANGE)
 			prio_max = pcdev->pi[i].prio;
+		/* The core switched this PI on without an event for it */
+		if (!ret)
+			pse_led_update(pcdev, i);
 	}
 }
 
@@ -501,6 +506,7 @@ static int pse_disable_pi_pol(struct pse_controller_dev *pcdev, int id)
 	ret = _pse_pi_disable(pcdev, id);
 	if (ret)
 		notifs |= ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR;
+	pse_led_update(pcdev, id);
 
 	ntf.notifs = notifs;
 	ntf.id = id;
@@ -678,6 +684,287 @@ static int _pse_pi_delivery_power_sw_pw_ctrl(struct pse_controller_dev *pcdev,
 	return 0;
 }
 
+/**
+ * struct pse_pi_led_triggers - LED triggers of a PSE PI
+ *
+ * @delivering: LED trigger for the power delivering state
+ * @enabled: LED trigger for the admin enabled state
+ * @pcdev: the PSE controller of the PI
+ * @id: PI index
+ * @nr_delivering: number of LEDs bound to @delivering
+ * @nr_enabled: number of LEDs bound to @enabled
+ * @last_delivering: last delivering state, for change detection
+ * @last_enabled: last enabled state, for change detection
+ *
+ * @nr_delivering and @nr_enabled are changed under pcdev->lock.
+ */
+struct pse_pi_led_triggers {
+	struct led_trigger delivering;
+	struct led_trigger enabled;
+	struct pse_controller_dev *pcdev;
+	int id;
+	unsigned int nr_delivering;
+	unsigned int nr_enabled;
+	bool last_delivering;
+	bool last_enabled;
+};
+
+#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)
+/**
+ * pse_pi_get_states - Read the delivering and enabled state of a PI
+ * @pcdev: PSE controller device
+ * @id: PI index
+ * @delivering: out, true if the PI delivers power. NULL to not read it.
+ * @enabled: out, true if the PI is admin enabled, as ethtool reports it.
+ *	     NULL to not read it.
+ *
+ * Reading a state can be slow, so read only the ones asked for.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int pse_pi_get_states(struct pse_controller_dev *pcdev, int id,
+			     bool *delivering, bool *enabled)
+{
+	struct pse_admin_state admin_state = {};
+	struct pse_pw_status pw_status = {};
+	int ret;
+
+	lockdep_assert_held(&pcdev->lock);
+
+	if (delivering) {
+		ret = pcdev->ops->pi_get_pw_status(pcdev, id, &pw_status);
+		if (ret)
+			return ret;
+
+		*delivering = pw_status.c33_pw_status ==
+			      ETHTOOL_C33_PSE_PW_D_STATUS_DELIVERING ||
+			      pw_status.podl_pw_status ==
+			      ETHTOOL_PODL_PSE_PW_D_STATUS_DELIVERING;
+	}
+
+	if (!enabled)
+		return 0;
+
+	/* Under software power control, the hardware is off until a PD
+	 * is detected, so use the admin state the core keeps.
+	 */
+	if (pse_pw_d_is_sw_pw_control(pcdev, pcdev->pi[id].pw_d)) {
+		*enabled = pcdev->pi[id].admin_state_enabled;
+		return 0;
+	}
+
+	ret = pcdev->ops->pi_get_admin_state(pcdev, id, &admin_state);
+	if (ret)
+		return ret;
+
+	*enabled = admin_state.c33_admin_state ==
+		   ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED ||
+		   admin_state.podl_admin_state ==
+		   ETHTOOL_PODL_PSE_ADMIN_STATE_ENABLED;
+
+	return 0;
+}
+
+/**
+ * pse_led_update - Update the LED triggers of a PI
+ * @pcdev: PSE controller device
+ * @id: PI index
+ *
+ * Reads the PI state and fires the triggers whose state changed. Reading
+ * the state can be slow, so do nothing while no LED uses the triggers:
+ * pse_led_activate() reads it when an LED is bound.
+ */
+static void pse_led_update(struct pse_controller_dev *pcdev, int id)
+{
+	struct pse_pi_led_triggers *trigs;
+	bool delivering = false, enabled = false;
+
+	lockdep_assert_held(&pcdev->lock);
+
+	if (!pcdev->pi_led_trigs)
+		return;
+
+	trigs = &pcdev->pi_led_trigs[id];
+	/* No LED bound. This also covers a PI that is not described and
+	 * a trigger that is not registered.
+	 */
+	if (!trigs->nr_delivering && !trigs->nr_enabled)
+		return;
+
+	if (pse_pi_get_states(pcdev, id,
+			      trigs->nr_delivering ? &delivering : NULL,
+			      trigs->nr_enabled ? &enabled : NULL))
+		return;
+
+	if (trigs->nr_delivering && trigs->last_delivering != delivering) {
+		trigs->last_delivering = delivering;
+		led_trigger_event(&trigs->delivering,
+				  delivering ? LED_FULL : LED_OFF);
+	}
+
+	if (trigs->nr_enabled && trigs->last_enabled != enabled) {
+		trigs->last_enabled = enabled;
+		led_trigger_event(&trigs->enabled,
+				  enabled ? LED_FULL : LED_OFF);
+	}
+}
+
+/* An LED was bound to @trig, at registration or later from sysfs. Read
+ * its state, as pse_led_update() skips a trigger while no LED is bound
+ * to it. Only touch @trig: the other trigger may not be registered.
+ */
+static void pse_led_activate(struct pse_pi_led_triggers *trigs,
+			     struct led_trigger *trig, unsigned int *nr,
+			     bool *last, struct led_classdev *led_cdev)
+{
+	bool is_delivering = trig == &trigs->delivering;
+	struct pse_controller_dev *pcdev = trigs->pcdev;
+	bool state;
+
+	mutex_lock(&pcdev->lock);
+	(*nr)++;
+	if (!pse_pi_get_states(pcdev, trigs->id,
+			       is_delivering ? &state : NULL,
+			       is_delivering ? NULL : &state)) {
+		if (*last != state) {
+			*last = state;
+			led_trigger_event(trig, state ? LED_FULL : LED_OFF);
+		}
+	}
+	led_set_brightness(led_cdev, *last ? LED_FULL : LED_OFF);
+	mutex_unlock(&pcdev->lock);
+}
+
+static int pse_led_delivering_activate(struct led_classdev *led_cdev)
+{
+	struct pse_pi_led_triggers *trigs =
+		container_of(led_cdev->trigger, struct pse_pi_led_triggers,
+			     delivering);
+
+	pse_led_activate(trigs, &trigs->delivering, &trigs->nr_delivering,
+			 &trigs->last_delivering, led_cdev);
+	return 0;
+}
+
+static void pse_led_delivering_deactivate(struct led_classdev *led_cdev)
+{
+	struct pse_pi_led_triggers *trigs =
+		container_of(led_cdev->trigger, struct pse_pi_led_triggers,
+			     delivering);
+
+	mutex_lock(&trigs->pcdev->lock);
+	trigs->nr_delivering--;
+	mutex_unlock(&trigs->pcdev->lock);
+}
+
+static int pse_led_enabled_activate(struct led_classdev *led_cdev)
+{
+	struct pse_pi_led_triggers *trigs =
+		container_of(led_cdev->trigger, struct pse_pi_led_triggers,
+			     enabled);
+
+	pse_led_activate(trigs, &trigs->enabled, &trigs->nr_enabled,
+			 &trigs->last_enabled, led_cdev);
+	return 0;
+}
+
+static void pse_led_enabled_deactivate(struct led_classdev *led_cdev)
+{
+	struct pse_pi_led_triggers *trigs =
+		container_of(led_cdev->trigger, struct pse_pi_led_triggers,
+			     enabled);
+
+	mutex_lock(&trigs->pcdev->lock);
+	trigs->nr_enabled--;
+	mutex_unlock(&trigs->pcdev->lock);
+}
+
+/* "delivering" follows the PD, which only an event source reports. */
+static int pse_led_delivering_register(struct pse_controller_dev *pcdev)
+{
+	struct device *dev = pcdev->dev;
+	int i, ret;
+
+	for (i = 0; i < pcdev->nr_lines; i++) {
+		struct pse_pi_led_triggers *trigs = &pcdev->pi_led_trigs[i];
+
+		/* Skip PIs not described in device tree */
+		if (!trigs->pcdev)
+			continue;
+
+		trigs->delivering.name = devm_kasprintf(dev, GFP_KERNEL,
+							"pse-%s:port%d:delivering",
+							dev_name(dev), i);
+		if (!trigs->delivering.name)
+			return -ENOMEM;
+		trigs->delivering.activate = pse_led_delivering_activate;
+		trigs->delivering.deactivate = pse_led_delivering_deactivate;
+
+		ret = devm_led_trigger_register(dev, &trigs->delivering);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int pse_led_triggers_register(struct pse_controller_dev *pcdev)
+{
+	struct device *dev = pcdev->dev;
+	const char *dev_id;
+	int i, ret;
+
+	dev_id = dev_name(dev);
+
+	pcdev->pi_led_trigs = devm_kzalloc_objs(dev, *pcdev->pi_led_trigs,
+						pcdev->nr_lines);
+	if (!pcdev->pi_led_trigs)
+		return -ENOMEM;
+
+	for (i = 0; i < pcdev->nr_lines; i++) {
+		struct pse_pi_led_triggers *trigs = &pcdev->pi_led_trigs[i];
+
+		/* Skip PIs not described in device tree */
+		if (!pcdev->no_of_pse_pi && !pcdev->pi[i].np)
+			continue;
+
+		trigs->pcdev = pcdev;
+		trigs->id = i;
+
+		trigs->enabled.name = devm_kasprintf(dev, GFP_KERNEL,
+						     "pse-%s:port%d:enabled",
+						     dev_id, i);
+		if (!trigs->enabled.name)
+			return -ENOMEM;
+		trigs->enabled.activate = pse_led_enabled_activate;
+		trigs->enabled.deactivate = pse_led_enabled_deactivate;
+
+		ret = devm_led_trigger_register(dev, &trigs->enabled);
+		if (ret)
+			return ret;
+	}
+
+	/* A driver that sets up its IRQ after registering gets "delivering"
+	 * from devm_pse_irq_helper().
+	 */
+	if (pcdev->irq || pcdev->polling)
+		return pse_led_delivering_register(pcdev);
+
+	return 0;
+}
+#else
+static inline void pse_led_update(struct pse_controller_dev *pcdev, int id) {}
+static int pse_led_triggers_register(struct pse_controller_dev *pcdev)
+{
+	return 0;
+}
+
+static int pse_led_delivering_register(struct pse_controller_dev *pcdev)
+{
+	return 0;
+}
+#endif /* CONFIG_LEDS_TRIGGERS */
+
 static int pse_pi_enable(struct regulator_dev *rdev)
 {
 	struct pse_controller_dev *pcdev = rdev_get_drvdata(rdev);
@@ -708,6 +995,7 @@ static int pse_pi_enable(struct regulator_dev *rdev)
 			pcdev->pi[id].admin_state_enabled = 1;
 			ret = 0;
 		}
+		pse_led_update(pcdev, id);
 		mutex_unlock(&pcdev->lock);
 		return ret;
 	}
@@ -715,6 +1003,7 @@ static int pse_pi_enable(struct regulator_dev *rdev)
 	ret = ops->pi_enable(pcdev, id);
 	if (!ret)
 		pcdev->pi[id].admin_state_enabled = 1;
+	pse_led_update(pcdev, id);
 	mutex_unlock(&pcdev->lock);
 
 	return ret;
@@ -732,6 +1021,7 @@ static int pse_pi_disable(struct regulator_dev *rdev)
 	ret = _pse_pi_disable(pcdev, id);
 	if (!ret)
 		pi->admin_state_enabled = 0;
+	pse_led_update(pcdev, id);
 
 	mutex_unlock(&pcdev->lock);
 	return 0;
@@ -1153,6 +1443,14 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 			goto free_kfifo;
 	}
 
+	/* Register the LED triggers before the regulators: a consumer can
+	 * enable a regulator as soon as it exists, which updates the LEDs.
+	 * devres then also removes the triggers only after the regulators.
+	 */
+	ret = pse_led_triggers_register(pcdev);
+	if (ret)
+		goto free_kfifo;
+
 	/* Each regulator name len is pcdev dev name + 7 char +
 	 * int max digit number (10) + 1
 	 */
@@ -1386,6 +1684,9 @@ static void pse_handle_events(struct pse_controller_dev *pcdev,
 				notifs |= ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR;
 		}
 
+		/* After pse_set_config_isr(), which can switch the PI */
+		pse_led_update(pcdev, i);
+
 		dev_dbg(pcdev->dev,
 			"Sending PSE notification EVT 0x%lx\n", notifs);
 
@@ -1524,6 +1825,12 @@ int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
 		return ret;
 	}
 
+	/* The controller is already registered, so add the "delivering"
+	 * LED triggers now. See pse_led_triggers_register().
+	 */
+	if (pcdev->pi_led_trigs)
+		return pse_led_delivering_register(pcdev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(devm_pse_irq_helper);
diff --git a/include/linux/pse-pd/pse.h b/include/linux/pse-pd/pse.h
index e40ed754dbdb..c7253332ec48 100644
--- a/include/linux/pse-pd/pse.h
+++ b/include/linux/pse-pd/pse.h
@@ -12,6 +12,8 @@
 #include <uapi/linux/ethtool_netlink_generated.h>
 #include <linux/regulator/driver.h>
 
+struct pse_pi_led_triggers;
+
 /* Maximum current in uA according to IEEE 802.3-2022 Table 145-1 */
 #define MAX_PI_CURRENT 1920000
 /* Maximum power in mW according to IEEE 802.3-2022 Table 145-16 */
@@ -312,6 +314,7 @@ struct pse_ntf {
  * @ntf_fifo_lock: protect @ntf_fifo writer
  * @unregistering: set under @lock when unregistering starts; the PSE
  *		   core switches no PI on after that
+ * @pi_led_trigs: per-PI LED trigger state array
  */
 struct pse_controller_dev {
 	const struct pse_controller_ops *ops;
@@ -339,6 +342,7 @@ struct pse_controller_dev {
 	DECLARE_KFIFO_PTR(ntf_fifo, struct pse_ntf);
 	spinlock_t ntf_fifo_lock; /* Protect @ntf_fifo writer */
 	bool unregistering;
+	struct pse_pi_led_triggers *pi_led_trigs;
 };
 
 /**
-- 
2.43.0

