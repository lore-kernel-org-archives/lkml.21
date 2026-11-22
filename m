Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323198;
	b=Oa3ic1iNLef8H3rCgQWEg0Aatc4p3xWiMJUWpzXXlVuupuDuerFFretGb6oKRbMMEkA4
	 xhGC92f+BNr3l5yqJMpnkA/drggB5HTqfVYmu64wzipsZkfPZcO+tRdpkZ/joTIHS/vUt
	 9U+nQGVkURODoDnpziLPof9azgm4bYV9LkK6g50wvV6S2Sn+sG872mdcV893z5wFh2mth
	 R3iH/+F54nadU0H3V+L2RdpbFE6ZoszhQ2BQl7OePElw4qpn/5FQqnvturkbp3y3WXekb
	 FHL4by8RROv/TVFNmVzNeSyUf/jZ+4s29ijoUC24TwNetWF5CaNhSfEfUKugPJR9XMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=oks9eY76UytAKWrw+eVWgHuLR6pmqJrjhRKQxGvvV4U=;
	b=SyM1QvTCdfV3OSA2+sdNDWN5+wEm7ZyGw80L4hA+qjKdtMNDFxWwwoSAebxlTYwy1T69
	 oeaMZhxMTiHPnaYM6UgnvtlZgR5sMXIld4WnIP/8yyJ7N7WgArJnjkGy6l1I8JoiZXmVn
	 8G9pWQHj2d5zXtQfrfpKV8J2YUc91RKH9nRtkkvocwBM63cX7uw6aUTqmaAX1RnBO3o7C
	 eD+axI6rAmmWrSNhvQrRbWC+jbuNYY/pF0Hnzur/mF2//OgvO9fhegzOL07F7Bf/MfZ0u
	 FE9+s4Zz6HqRqBkn7Q2PHzGNHn1qV7oJwOBW17mrFIG9Hcjhih+3KCw+k28biCwLk4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oOXM3PFX;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815D606A33B
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D815D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oOXM3PFX
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3766461eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323197; x=1795927997; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oks9eY76UytAKWrw+eVWgHuLR6pmqJrjhRKQxGvvV4U=;
        b=oOXM3PFXfNCanDqmX9+bq1Mzgl/CZu2Hoa6UA+XvowY/HKQTrUblcAlqyUhJrzpxOz
         5vbOZX2BrOv5JgX06ai6XEQCcs+XBHVFCGyrx3ggVUryBXtCY9Dc3AOe1cCAGlr+GKYs
         YDzeh8Y8CC1TmdUdNE4td+YxcavBwzN2FR6MPtLnu/OHXKgzREeHFmOTSPDdrXSD5kkV
         cmsD/3Ke0VuMF3PgHUHN9pDeG1MLdn8kknePNRksLpi0ijLzgYiMSS2Erxx9xeuCBaYY
         CFnijkL1YVjw2Y6Wg5SXidZ7gw0cY0nZxkjfhdj5/QzMtVb1nS/hJJHbQFLq7l+Qfocr
         HOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323197; x=1795927997;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oks9eY76UytAKWrw+eVWgHuLR6pmqJrjhRKQxGvvV4U=;
        b=te39edoTh/PAnKEsBoOJCHTIJwjrHd4mpDc2b6YbBsQ1qBaYbHoX2dTVzFnnr0M1Px
         WjuFJppWEHX1NQHKxU7lkCH6f2UM1REPBFkTccz9SrWQ/L/ZfF68/aNZgJ87/boabk0I
         dsrYGxPBrUwD3EhW6HTBK3fhIewng3IQQoyXxKzTw9rO7o5DpMdsNEDfyABy5KeJ1qBk
         BhDVuTzOOCU/R21MLCCQ1SRwwRM5prvRvrflAy0Jit4nm6AeZzdDU5MlsQxsreBv1zkW
         TJk38NVf8YvsuAfnMC9NMc0ox8EUa+GSQsn811jyE9mFxIOBtSQ3XkpjviBdiu+etFpC
         ZN6Q==
X-Forwarded-Encrypted: i=1; AL+hErGaZKbPZYybc0ZCZwy9OhT8iqsM9PNE2dZtQ/lCfZtNgnMoDVCD0+RtLZmO6fvWvCekeOxSEkZhfFojx54=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbd2g1DkebFoDOhmyolFQjxzzv/EcJ/Tb9SocgCmT0rXutYDG
	fluBDRJ6yoXmXvJ/1k+IpRUIuU9Nikac19V00vH+DtAJAuo1dnSItcCF2ON4FB76J566PK53mx8
	UV8apDaNIFQ==
X-Received: from dybgw22.prod.google.com ([2002:a05:7301:2396:b0:386:d33:70e9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e9c5:20b0:381:f33d:ed9d
 with SMTP id 5a478bee46e88-3856fb6a214mr9733196eec.21.1795323196565; Sat, 21
 Nov 2026 20:53:16 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:13 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045313.18372-1-irogers@google.com>
Subject: [PATCH v2] usb: typec: hd3ss3220: Propagate regmap_read() errors from
 attached-state check
From: Ian Rogers <irogers@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hd3ss3220_get_attached_state() has return type 'enum usb_role' (an
unsigned enum) yet returns negative regmap_read() error codes directly.
Neither hd3ss3220_set_role() nor output_poll_execute() checks for errors;
on a transient I2C failure (such as -EIO, cast to 0xfffffffb),
hd3ss3220_set_role() passes the bogus value to usb_role_switch_set_role()
and disables VBUS power. On role-switch providers without a .get callback
(where sw->role caches the value passed to usb_role_switch_set_role()),
reading /sys/class/usb_role/*/role subsequently indexes usb_roles[role]
out-of-bounds.

Return an int status from hd3ss3220_get_attached_state() and
hd3ss3220_set_role(), pass the resolved enum usb_role via an output
pointer, leave the current role and VBUS state unchanged on I2C read
errors, and propagate errors to hd3ss3220_probe() and hd3ss3220_irq().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.

Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Cc: stable@vger.kernel.org
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Propagate regmap_read() errors out of hd3ss3220_set_role() to
        hd3ss3220_probe() and hd3ss3220_irq(), and test
        !hd3ss3220_get_attached_state() in output_poll_execute() (Greg
        Kroah-Hartman).
      - Add Cc: stable@vger.kernel.org (Heikki Krogerus).
    
    v1: https://lore.kernel.org/r/20261119170650.1521609-1-irogers@google.com

 drivers/usb/typec/hd3ss3220.c | 38 ++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 60d6de9ba339..bdd4eaeca753 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -163,10 +163,10 @@ static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int prefer_rol
 				  src_pref);
 }
 
-static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
+static int hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220,
+					enum usb_role *attached_state)
 {
 	unsigned int reg_val;
-	enum usb_role attached_state;
 	int ret;
 
 	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
@@ -176,17 +176,17 @@ static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
 
 	switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK) {
 	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
-		attached_state = USB_ROLE_HOST;
+		*attached_state = USB_ROLE_HOST;
 		break;
 	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
-		attached_state = USB_ROLE_DEVICE;
+		*attached_state = USB_ROLE_DEVICE;
 		break;
 	default:
-		attached_state = USB_ROLE_NONE;
+		*attached_state = USB_ROLE_NONE;
 		break;
 	}
 
-	return attached_state;
+	return 0;
 }
 
 static int hd3ss3220_try_role(struct typec_port *port, int role)
@@ -229,9 +229,14 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
 	hd3ss3220->vbus_enabled = on;
 }
 
-static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
+static int hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 {
-	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+	enum usb_role role_state;
+	int ret;
+
+	ret = hd3ss3220_get_attached_state(hd3ss3220, &role_state);
+	if (ret < 0)
+		return ret;
 
 	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
 
@@ -250,6 +255,8 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 		hd3ss3220_regulator_control(hd3ss3220, role_state == USB_ROLE_HOST);
 
 	hd3ss3220->role_state = role_state;
+
+	return 0;
 }
 
 static void output_poll_execute(struct work_struct *work)
@@ -258,9 +265,10 @@ static void output_poll_execute(struct work_struct *work)
 	struct hd3ss3220 *hd3ss3220 = container_of(delayed_work,
 						   struct hd3ss3220,
 						   output_poll_work);
-	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
+	enum usb_role role_state;
 
-	if (hd3ss3220->role_state != role_state)
+	if (!hd3ss3220_get_attached_state(hd3ss3220, &role_state) &&
+	    hd3ss3220->role_state != role_state)
 		hd3ss3220_set_role(hd3ss3220);
 
 	schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
@@ -270,7 +278,10 @@ static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
 {
 	int err;
 
-	hd3ss3220_set_role(hd3ss3220);
+	err = hd3ss3220_set_role(hd3ss3220);
+	if (err < 0)
+		return IRQ_NONE;
+
 	err = regmap_write_bits(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
 				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS,
 				HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
@@ -501,7 +512,10 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto err_unreg_port;
 
-	hd3ss3220_set_role(hd3ss3220);
+	ret = hd3ss3220_set_role(hd3ss3220);
+	if (ret < 0)
+		goto err_unreg_port;
+
 	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
 	if (ret < 0)
 		goto err_unreg_port;
-- 
2.56.1.750.gf70dc682cf-goog

