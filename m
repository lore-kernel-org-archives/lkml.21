Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795868141;
	b=dQVyVXHbx6lBnAYrykIZO4R/yYdDukQkiBkR+0fBGSuL4nfgtoUTlBVziHbi+Rnc4iTP
	 CyhCuavNwnEG0AfFQ4CYOaqa3qPFN20moffYaM+Waf9aAABZ0r0c34orGIU78DfP5HReB
	 NpOacGBLaTfEgeMO3TVjzemgfeYzEwhsDslYj1S8LPsUM8UonWg9fa1o1cQw8R8KYbYQo
	 H4Zl3aYYIEDTUIieSCLHu8hPtgBRxz+7EJPemwG+Ev4LWk0bEANM21aXBvKOH9fQ+GIpa
	 iHtPirK8nBpY0ztxCyq9p+L3Aob0qSOFERGlhCPUJBtMK9ETIeDg/0hNE0XxUSfnarQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795868141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=My3q2NYuQIQOhe+Fqr57BI1Ay5Ecub07aAfKnpyDQ1c=;
	b=RPftS2m4FEhh2YIVm7xIbrtrJl12byc9o4gMlDuh2QvFPx6ZV5luab7iW+yNOf+M4iPI
	 0cNfaradhnePLbbQYtPcfOf6mmD1tQjBruXZhyCiwfEnQoH9D4SxFjvXI6eeWTFwC/I6D
	 N8R82S0ltnmy4olgVW9yTEvap0DfJEv+jz+v6wIa5o0K+dCMoHHIrekrxa31HUfFK7fB3
	 drHcoTUjRgs1bNDROpHK3BVXz7VlI8Yvs5slo6hdj01zASN4VGreW2++/kpeQ/lDzkkaU
	 rgivzleYv6Fl34IcowroxgtUCM0nBo63urx3iHbJH97ouBspz6iK7JQrJclWFExSY1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=T+YIVCYY;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE65606A323;
	Sat, 28 Nov 2026 12:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=T+YIVCYY
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 44DDDE838CA;
	Sat, 28 Nov 2026 13:15:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795868138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=My3q2NYuQIQOhe+Fqr57BI1Ay5Ecub07aAfKnpyDQ1c=;
	b=T+YIVCYYeod941zHIpfBvy9iaTwN+lyQR93f6tOn2YpTqrk98AiYyh3MU+cNUfWB+ZFU7A
	9YMnZ2fCpz09j4iX905xV+EFK7LewLlN2rL+MN9m0MzHVnIMqN4/4jbjrMJv3lqko9Oiia
	qyhBfb6W000tYqBIwsdGmQhlhnRtA3nK4IQmwyW1yfgle3gXtbdomq1HeFM2ckf5X0hu3V
	lOZgoIS4elknDUYCRpTaiF7YhkP9UxtPFb14FaZL8ytXT6bcQ2k4BfoxXynPXt2WnFTUSP
	bkyO9sC6ja8JqnJSDq4/SrrX/9vm1HjEho7YoorJKKvOQ56PAEOuB4BIOuQksw==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id HvaaKXYACWPm; Sat, 28 Nov 2026 13:15:38 +0100 (CET)
Received: from p14sgen5.lan (unknown [86.103.60.175])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sat, 28 Nov 2026 13:15:37 +0100 (CET)
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
Subject: [PATCH net-next v6 1/2] net: pse-pd: add pse_poll_helper()
Date: Sat, 28 Nov 2026 13:15:23 +0100
Message-ID: <20261128121525.3909836-2-github@szelinsky.de>
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

Some PSE controllers have no interrupt line, or the board does not wire
it. These controllers can still report events if the core polls them.

Move the event loop of pse_isr() into pse_handle_events(), and add
pse_poll_helper(). It uses the same pse_irq_desc as the IRQ path.
A delayed work calls the driver's map_event() every poll_interval_ms
(default 500 ms) and passes the events to pse_handle_events(). When
map_event() starts or stops failing, the core logs it once, and the
next poll runs as usual.

The helper must be called before the controller registers, and returns
-EBUSY otherwise. It has no devm_ prefix, as it allocates nothing and
adds no devres action. pse_controller_register() allocates the poll
buffers once nr_lines is final, and starts the work at its end, so the
work never runs on a controller that is not fully set up, or on one
whose probe failed. pse_controller_unregister() stops it next to the IRQ,
before the PI data and power domains are released.

The work runs on system_freezable_power_efficient_wq, so it does not
access the bus during suspend, and it is not bound to one CPU when
power efficient workqueues are enabled.

With the "disabled" budget strategy, a polled controller keeps the
power control in hardware, as a controller without events does today.
The core takes it over only for an IRQ controller, which it expects to
report PD detection while a PI is off. With the static strategy, a
polled controller uses the software power control, as an IRQ one does.
Update the comments that say this needs an IRQ.

Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 183 ++++++++++++++++++++++++++++------
 include/linux/pse-pd/pse.h    |  27 ++++-
 2 files changed, 177 insertions(+), 33 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 0477cf6787bd..2fb10f5d8f8e 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -14,10 +14,14 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/rtnetlink.h>
+#include <linux/workqueue.h>
 #include <net/net_trackers.h>
 
 #define PSE_PW_D_LIMIT INT_MAX
 
+/* Default poll interval: fast enough for PD events, light on the I2C bus */
+#define PSE_DEFAULT_POLL_INTERVAL_MS 500
+
 static DEFINE_MUTEX(pse_list_mutex);
 static LIST_HEAD(pse_controller_list);
 static DEFINE_XARRAY_ALLOC(pse_pw_d_map);
@@ -392,8 +396,8 @@ static void pse_pw_d_retry_power_delivery(struct pse_controller_dev *pcdev,
  * @pw_d: a pointer to the PSE power domain
  *
  * This function determines whether the power control for a specific power
- * domain is managed by software in the interrupt handler rather than directly
- * by hardware.
+ * domain is managed by software in the event handler (IRQ or poll) rather
+ * than directly by hardware.
  *
  * Software power control is active in the following cases:
  * - When the budget evaluation strategy is set to static
@@ -1119,6 +1123,19 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 		goto free_kfifo;
 	}
 
+	if (pcdev->polling) {
+		pcdev->poll_notifs = devm_kzalloc_objs(pcdev->dev,
+						       *pcdev->poll_notifs,
+						       pcdev->nr_lines);
+		pcdev->poll_notifs_mask = devm_bitmap_zalloc(pcdev->dev,
+							     pcdev->nr_lines,
+							     GFP_KERNEL);
+		if (!pcdev->poll_notifs || !pcdev->poll_notifs_mask) {
+			ret = -ENOMEM;
+			goto free_kfifo;
+		}
+	}
+
 	ret = of_load_pse_pis(pcdev);
 	if (ret)
 		goto free_kfifo;
@@ -1171,6 +1188,14 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 	list_add(&pcdev->list, &pse_controller_list);
 	mutex_unlock(&pse_list_mutex);
 
+	/* Start polling only now, so the worker never sees a controller
+	 * that is not fully set up.
+	 */
+	if (pcdev->polling)
+		queue_delayed_work(system_freezable_power_efficient_wq,
+				   &pcdev->poll_work,
+				   msecs_to_jiffies(pcdev->poll_interval_ms));
+
 	return 0;
 
 free_kfifo:
@@ -1193,12 +1218,15 @@ void pse_controller_unregister(struct pse_controller_dev *pcdev)
 	pcdev->unregistering = true;
 	mutex_unlock(&pcdev->lock);
 
-	/* Stop the IRQ and the notification worker first: pse_isr() uses
-	 * pcdev->pi and the power domains that pse_flush_pw_ds() drops,
-	 * and the worker reads the kfifo that is freed below.
+	/* Stop the IRQ, the poll work and the notification worker first:
+	 * pse_isr() and pse_poll_worker() use pcdev->pi and the power
+	 * domains that pse_flush_pw_ds() drops, and the worker reads the
+	 * kfifo that is freed below.
 	 */
 	if (pcdev->irq)
 		disable_irq(pcdev->irq);
+	if (pcdev->polling)
+		cancel_delayed_work_sync(&pcdev->poll_work);
 	/* Unlink before the PI array is freed: of_pse_control_get() walks
 	 * the list and reads pcdev->pi[].
 	 */
@@ -1326,48 +1354,39 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
 }
 
 /**
- * pse_isr - IRQ handler for PSE
- * @irq: irq number
- * @data: pointer to user interrupt structure
+ * pse_handle_events - Process PSE events for all PIs
+ * @pcdev: a pointer to the PSE controller device
+ * @pi_notifs: per-PI notification array
+ * @notifs_mask: bitmap of PIs with events (sized for pcdev->nr_lines)
  *
- * Return: irqreturn_t - status of IRQ
+ * Common event handling shared between IRQ and poll paths.
+ * Caller must hold pcdev->lock.
  */
-static irqreturn_t pse_isr(int irq, void *data)
+static void pse_handle_events(struct pse_controller_dev *pcdev,
+			      unsigned long *pi_notifs,
+			      unsigned long *notifs_mask)
 {
-	struct pse_controller_dev *pcdev;
-	struct pse_irq_desc *desc;
-	struct pse_irq *h = data;
-	int ret, i;
-
-	desc = &h->desc;
-	pcdev = h->pcdev;
+	int i;
 
-	/* Clear notifs mask */
-	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
-	bitmap_zero(h->notifs_mask, pcdev->nr_lines);
-	mutex_lock(&pcdev->lock);
-	ret = desc->map_event(irq, pcdev, h->notifs, h->notifs_mask);
-	if (ret || bitmap_empty(h->notifs_mask, pcdev->nr_lines)) {
-		mutex_unlock(&pcdev->lock);
-		return IRQ_NONE;
-	}
+	lockdep_assert_held(&pcdev->lock);
 
-	for_each_set_bit(i, h->notifs_mask, pcdev->nr_lines) {
+	for_each_set_bit(i, notifs_mask, pcdev->nr_lines) {
 		unsigned long notifs, rnotifs;
 		struct pse_ntf ntf = {};
+		int ret;
 
 		/* Do nothing PI not described */
 		if (!pcdev->pi[i].rdev)
 			continue;
 
-		notifs = h->notifs[i];
+		notifs = pi_notifs[i];
 		if (pse_pw_d_is_sw_pw_control(pcdev, pcdev->pi[i].pw_d)) {
 			ret = pse_set_config_isr(pcdev, i, notifs);
 			if (ret)
 				notifs |= ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR;
 		}
 
-		dev_dbg(h->pcdev->dev,
+		dev_dbg(pcdev->dev,
 			"Sending PSE notification EVT 0x%lx\n", notifs);
 
 		ntf.notifs = notifs;
@@ -1380,12 +1399,73 @@ static irqreturn_t pse_isr(int irq, void *data)
 		regulator_notifier_call_chain(pcdev->pi[i].rdev, rnotifs,
 					      NULL);
 	}
+}
+
+/**
+ * pse_isr - IRQ handler for PSE
+ * @irq: irq number
+ * @data: pointer to user interrupt structure
+ *
+ * Return: irqreturn_t - status of IRQ
+ */
+static irqreturn_t pse_isr(int irq, void *data)
+{
+	struct pse_controller_dev *pcdev;
+	struct pse_irq *h = data;
+	int ret;
+
+	pcdev = h->pcdev;
+
+	/* Clear notifs mask */
+	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
+	bitmap_zero(h->notifs_mask, pcdev->nr_lines);
+	mutex_lock(&pcdev->lock);
+	ret = h->desc.map_event(irq, pcdev, h->notifs, h->notifs_mask);
+	if (ret || bitmap_empty(h->notifs_mask, pcdev->nr_lines)) {
+		mutex_unlock(&pcdev->lock);
+		return IRQ_NONE;
+	}
 
+	pse_handle_events(pcdev, h->notifs, h->notifs_mask);
 	mutex_unlock(&pcdev->lock);
 
 	return IRQ_HANDLED;
 }
 
+static void pse_poll_worker(struct work_struct *work)
+{
+	struct pse_controller_dev *pcdev =
+		container_of(work, struct pse_controller_dev,
+			     poll_work.work);
+	int ret;
+
+	memset(pcdev->poll_notifs, 0,
+	       pcdev->nr_lines * sizeof(*pcdev->poll_notifs));
+	bitmap_zero(pcdev->poll_notifs_mask, pcdev->nr_lines);
+	mutex_lock(&pcdev->lock);
+	ret = pcdev->poll_desc.map_event(0, pcdev, pcdev->poll_notifs,
+					 pcdev->poll_notifs_mask);
+	/* Log only changes: a controller that stopped answering would
+	 * otherwise log an error at every poll.
+	 */
+	if (ret != pcdev->poll_err) {
+		if (ret)
+			dev_err(pcdev->dev, "Failed to poll events: %pe\n",
+				ERR_PTR(ret));
+		else
+			dev_info(pcdev->dev, "Polling events works again\n");
+		pcdev->poll_err = ret;
+	}
+	if (!ret && !bitmap_empty(pcdev->poll_notifs_mask, pcdev->nr_lines))
+		pse_handle_events(pcdev, pcdev->poll_notifs,
+				  pcdev->poll_notifs_mask);
+	mutex_unlock(&pcdev->lock);
+
+	queue_delayed_work(system_freezable_power_efficient_wq,
+			   &pcdev->poll_work,
+			   msecs_to_jiffies(pcdev->poll_interval_ms));
+}
+
 /**
  * devm_pse_irq_helper - Register IRQ based PSE event notifier
  * @pcdev: a pointer to the PSE
@@ -1448,6 +1528,51 @@ int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
 }
 EXPORT_SYMBOL_GPL(devm_pse_irq_helper);
 
+/**
+ * pse_poll_helper - Set up a poll-based PSE event notifier
+ * @pcdev: a pointer to the PSE controller device
+ * @d: PSE event description, the same as for devm_pse_irq_helper().
+ *     d->name is not used.
+ *
+ * For PSE controllers without a usable IRQ. Every poll_interval_ms
+ * (default 500 ms), a delayed work calls d->map_event() with irq 0 and
+ * handles the events like pse_isr() does. The work runs on a freezable
+ * workqueue, so it does not touch the hardware during suspend.
+ *
+ * With the "disabled" budget strategy, the hardware keeps the power
+ * control of a polled controller. The PSE core takes it over only for
+ * an IRQ controller, see pse_pw_d_is_sw_pw_control().
+ *
+ * Must be called before devm_pse_controller_register(), which allocates
+ * the poll buffers and starts the polling once the controller is
+ * registered.
+ *
+ * Return: 0 on success, -EBUSY if the controller is already registered,
+ *	   or another errno on failure
+ */
+int pse_poll_helper(struct pse_controller_dev *pcdev,
+		    const struct pse_irq_desc *d)
+{
+	if (!d || !d->map_event)
+		return -EINVAL;
+
+	/* pcdev->pi is set by pse_controller_register(), which must come
+	 * after this call to start the polling.
+	 */
+	if (WARN_ON(pcdev->pi))
+		return -EBUSY;
+
+	pcdev->poll_desc = *d;
+	if (!pcdev->poll_interval_ms)
+		pcdev->poll_interval_ms = PSE_DEFAULT_POLL_INTERVAL_MS;
+
+	INIT_DELAYED_WORK(&pcdev->poll_work, pse_poll_worker);
+	pcdev->polling = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pse_poll_helper);
+
 /* PSE control section */
 
 static void __pse_control_release(struct kref *kref)
diff --git a/include/linux/pse-pd/pse.h b/include/linux/pse-pd/pse.h
index 17738ffcd224..e40ed754dbdb 100644
--- a/include/linux/pse-pd/pse.h
+++ b/include/linux/pse-pd/pse.h
@@ -43,10 +43,12 @@ struct ethtool_c33_pse_pw_limit_range {
 };
 
 /**
- * struct pse_irq_desc - notification sender description for IRQ based events.
+ * struct pse_irq_desc - notification sender description for IRQ or poll
+ *			  based events.
  *
- * @name: the visible name for the IRQ
+ * @name: the visible name for the IRQ, not used for polling
  * @map_event: driver callback to map IRQ status into PSE devices with events.
+ *	       irq is 0 when it is called from the poll work.
  */
 struct pse_irq_desc {
 	const char *name;
@@ -186,8 +188,8 @@ struct ethtool_pse_control_status {
  * @pi_get_prio: Get the PSE PI priority.
  * @pi_set_prio: Configure the PSE PI priority.
  * @pi_get_pw_req: Get the power requested by a PD before enabling the PSE PI.
- *		   This is only relevant when an interrupt is registered using
- *		   devm_pse_irq_helper helper.
+ *		   This is only relevant when events are reported, using the
+ *		   devm_pse_irq_helper() or pse_poll_helper() helper.
  */
 struct pse_controller_ops {
 	int (*setup_pi_matrix)(struct pse_controller_dev *pcdev);
@@ -294,6 +296,14 @@ struct pse_ntf {
  * @pi: table of PSE PIs described in this controller device
  * @no_of_pse_pi: flag set if the pse_pis devicetree node is not used
  * @irq: PSE interrupt
+ * @polling: flag indicating poll-based event detection is active
+ * @poll_interval_ms: poll interval in milliseconds, a driver may set it
+ *		      before pse_poll_helper(), 0 means 500 ms
+ * @poll_work: delayed work for poll-based event detection
+ * @poll_desc: copy of the driver's event descriptor for polling
+ * @poll_notifs: per-PI notification scratch space for poll worker
+ * @poll_notifs_mask: bitmap of PIs with events for poll worker
+ * @poll_err: result of the last poll, to log only changes
  * @pis_prio_max: Maximum value allowed for the PSE PIs priority
  * @supp_budget_eval_strategies: budget evaluation strategies supported
  *				 by the PSE
@@ -316,6 +326,13 @@ struct pse_controller_dev {
 	struct pse_pi *pi;
 	bool no_of_pse_pi;
 	int irq;
+	bool polling;
+	unsigned int poll_interval_ms;
+	struct delayed_work poll_work;
+	struct pse_irq_desc poll_desc;
+	unsigned long *poll_notifs;
+	unsigned long *poll_notifs_mask;
+	int poll_err;
 	unsigned int pis_prio_max;
 	u32 supp_budget_eval_strategies;
 	struct work_struct ntf_work;
@@ -350,6 +367,8 @@ int devm_pse_controller_register(struct device *dev,
 				 struct pse_controller_dev *pcdev);
 int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
 			int irq_flags, const struct pse_irq_desc *d);
+int pse_poll_helper(struct pse_controller_dev *pcdev,
+		    const struct pse_irq_desc *d);
 
 struct pse_control *of_pse_control_get(struct device_node *node,
 				       struct phy_device *phydev);
-- 
2.43.0

