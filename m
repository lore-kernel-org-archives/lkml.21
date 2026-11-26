Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795679616;
	b=4vU9Uzdx3EWe8ztecE4U2LTfR0e256ffp/LLo1lyVrfxep+VTncGJ7s1ywm7YCtnbMLT
	 n0QF2OMqeikOy70449yzch0+UrtETVfefdINJ+oLFW49L0y1OTOgAGSVo1sha9NkusCFO
	 LDEOv/ROdCtbhGNv9mu/C3WeHaEPSW1tT38kO2M1Czu6GD5u6fvXWliF1pWuiNOlYYGlN
	 azcc/DnJFLezGBcwba6NJVAoCRCpb++B1jIt9aZwsdgg7enZs2Fds2Gv08WwobZ5r+0I+
	 xYrlSWZpl8gx0ktFHyadpgGApspEtxTfTyypTLtiUlZvaH6uVDEciUQvV+xwK45xTdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=f+JhSTCQ35V0tEPbozGWtSbHVAIIwcRMu/dqMeaWMkA=;
	b=dal1mei34sAclU0dC1yYf4ABqqY65PY5T96HuJ+ejM7wTCeaS8lUsUpmevTxgZr/UZWO
	 PE+zbVg8QL6ATpBf9PKuB6ZRfKlzyDB7kjGJwH8iHeOs+ayxUX6MZMOfCydzInEKqePZ6
	 n4asdjVkesywuJ8GJv82A21FvNiq2hhRbVoPc3Y0HICJd9LUvL5dII9hIcuoC/DVrVCYx
	 xnaxprV7D3dsfhr18WPb53GqkdI80AuWrkmrGxdm7yXE98FRlq8B0LXyPEqZY/eLPKaMM
	 97Wu3jC6ycaDuSCW2HgDuR1g7nCIj8q/QZKre4XcCNaSpecMaoi34FKHZjJFE8tUxxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5kkW8y1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FE9606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FE9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5kkW8y1
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71aed54d4c5so3896737eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:53:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795679615; cv=none;
        d=google.com; s=arc-20260327;
        b=Hs+aHaOii7N7J4OmMeZVl5K2mlIdvLcmQxCqD3DVc0lj/0FDNx2C93DTFuloBBN5A6
         tI/+msV0/utCQCZwIcIRTjQJZfJ7PulcegqT7CXKjp+KIr3KX+zWpasXlWhs8AXsMqLe
         eWlKmCAHjIMwPHjWfcrApSiLLefBZW5bBRs8a8Kjv3jD6WI4mfSzE4DLnucfXiCathfu
         vlFNVpc/61WMHMeiR1hfciudf93Dang50qS+JuULcE5pXZ4koSHb4eNAdjl+JRXZ6MPP
         WPhz4tHTp3aDDo4P2fI+E2tYJr3V8gktsJFLbHsqBPno+dHwCbhSS+DtMbZxsVlwhjQm
         YqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=f+JhSTCQ35V0tEPbozGWtSbHVAIIwcRMu/dqMeaWMkA=;
        fh=WxKgLxe9SqWgf+ZUaSd/E9QOCKCWzbHnKePkWvI8NvU=;
        b=ERir4jb0eyuVOV8MkmHM7ET7j+yq6MF33BMS+8NBgxS0ez46Rmv2xJN4n3SueGHv2a
         QC1THqKMucwGujBBJ1b/Bs/EcKsiF7IZyMLoe0BrGpORWwA2TDQgidKL8MVFbpXAlKPj
         EAb46+bgt2O8+ZrODjmi89ZqPDnKZuVPQ7pp36QqYZb/VhiabkhvQJRI1L1gxpMrSIFF
         MH8oXGqG4Se8s2wVsZEdJwaCgmjn3gnHYmANBy3Wbs1fjBa70S/qOrOiFOydSyoqcYTl
         Ovv2hI5zHgLG+obtTJUAmdfOxRr2Y9OuIAPxnz5VJbgCwa443G6KpRLKwTZunDiSVg8U
         CpPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795679615; x=1796284415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+JhSTCQ35V0tEPbozGWtSbHVAIIwcRMu/dqMeaWMkA=;
        b=E5kkW8y1+uj/AL4HAy/7R3keTZ8WRi7yvuKp6YsNZ0xcYuFSLb6xgkUkJSDYYhrC8f
         whudVIyZC/fbtJx6AlJCAMwR48x8Ouhz8dQsfv0NnBBH96OlKj14EAw5BX56qq7bQSBD
         hh37SJrhZtbnKkP3YWONqNf6tc+JR7CF8Zj/uzg5NZPkqhFtdWvk1oU7ls5G8xBUP4z4
         XekK9bttxzpjnm+fPQxuE00EXx0+4EldQrNwLrZfKEwQ/AOCasqHNVsFwlfDWLPM4CRU
         UUdqrP+wZefB6ApbLQ5PhncS4WWWSDsZvcvP0WPac2QXYEVNlma9nad6tw35bEqEZbAQ
         dtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679615; x=1796284415;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+JhSTCQ35V0tEPbozGWtSbHVAIIwcRMu/dqMeaWMkA=;
        b=b6kX9wQPVs+pwo0ekD1Wjnp6u5Qi6cGGxvOtc/x78nW9nFEmXo95CiAsT10vjyS6+U
         hjPxW6A3TRk+xfB5Xc4dg3Gwzvmt/MCudJ8nt+gmmxoQrJfruM77NHOorx4U8H3zF9Dp
         IC5cbJIRwesybhlZgtve5NrvmUAXgQ11AZ1NGsxqwrNEcen0uPMje4zvMml6dC6H3KkF
         XPSJ5zISoq478nfwyDOCIUAD1+aYP/vPBlcO3rFyKl0mt//UEzA97KtOXhzCuzpgMSKz
         2t1blWP5o0LFxY9UyWaGheJSn0NXWhbqcYiEPI+IWoZ58Wfus1Om45JmKGOSMyxNYHCn
         tTIQ==
X-Forwarded-Encrypted: i=1; AL+hErENUjJJYZMGFRi7qojVVJxyLEnLNhqjnxvD0BSPXpZWJbpjqOMHEdS2xUlkGMnAjLAfWO6yQ3ePAuNjG84=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OJntn863x6yf3b9sG38zagRo5VVHdWwk962eqRs9k1a4bKJT1
	wljq5L7seVGN9CLHbu2OpJYqHfVrmc/tjGjsvubwbLBTFHF+Y3BbXGaFep1SfxQt/Xieb/LbuaQ
	vazrqV8H/QFhbBKiuctRmVTaS2iuo4U0=
X-Gm-Gg: AZFdTZf/OG6GAyAl4XKTmc0rUhkomoyy+LmPAV0Za9IW7Qd54epoGc6mFJG7A3cc5np
	R7jHXnBMKY2NFGh3wKT8y3VMZ/YEIMSTA2SIgNEqQu21q2bgARe3D7elKYeyS6hjuM4RgK86jQv
	tqMV5biYI4hdNTuo1QmVOOUZg5rvSIuI/Xfe7M9SHHIQaGjsOr074WBX0Xd1z+lEp0Xz5Tb62FA
	p39brHB2njI2cLIaDnXBrpDKoAuvfgC9jSIc/pV18ql64+jWyjy5qW58xIXTnt13ZUFwX7xcaLl
	h9LQciqsEai6WzKOk8FbfnM9gVPK+9FJ8IzHMr3hSmhLB8HnqDt0WjtE7PKH57MLjQisjtSsjV1
	InmzpUWLCoEmuVYs6SmTYoEOuUDzP+qdBGbKgUAapUb8rnVnAtpiheZF3DCla1aUItg==
X-Received: by 2002:a05:6820:f023:b0:71b:7f47:4ea4 with SMTP id
 006d021491bc7-71b7f477444mr3367489eaf.52.1795679615437; Wed, 25 Nov 2026
 23:53:35 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:53:34 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:53:33 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 07:53:32 +0000
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrCtvNdz8o0abjKONb0Ys78VPk54egzCDydpvgyZs0pWuQ@mail.gmail.com>
References: <CA+m4KrCtvNdz8o0abjKONb0Ys78VPk54egzCDydpvgyZs0pWuQ@mail.gmail.com>
Date: Thu, 26 Nov 2026 01:53:34 -0600
X-Gm-Features: Aa3M54oPXMB2fjt1V0BES71jpFNvvbQ0Xv1gBDJdg7ZSvr-29kEL3DAe9CQvkmU
Message-ID: <CA+m4KrDGFVFYJcCA0HYQJN2cg76Wk63C-0pr+Q-3KsfWoKBd1A@mail.gmail.com>
Subject: [PATCH v1 2/2] usb: typec: ucsi: gaokun: Set orientation before
 switching to DP
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The connector status callback can sample the old CC orientation before
the EC delivers the port update that selects DP mode. The mode handler
then configures the mux and asserts HPD with the transmitter still using
the previous orientation. On the MateBook E Go this was observed with a
reverse EC orientation, a normal PHY orientation and failed link training.

Use the orientation switch described by the connector firmware node to
apply the fresh CC value before setting the DP mux. Serialize switch
writes with the existing Type-C status callback, including its sampling
of CC. Keep references to the switch and mux for the lifetime of the
Gaokun device so the EC worker need not dereference a UCSI connector
during port registration or unwind.

If orientation or mux setup fails, withhold HPD high for that update.
Continue to acknowledge the EC frame and deliver HPD low on detach.
A subsequent valid DP update can announce the display again.

Fixes: 1c2b66a7d725 ("usb: ucsi: huawei_gaokun: support mode switching")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 66 ++++++++++++++++++---
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 9cb7c9bc1..606928662 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -88,6 +88,8 @@ struct gaokun_ucsi_port {
 	struct gaokun_ucsi *ucsi;
 	struct auxiliary_device *bridge;

+	struct mutex orientation_lock;
+	struct typec_switch *sw;
 	struct typec_mux *typec_mux;
 	struct typec_mux_state state;
 	struct typec_altmode dp_alt;
@@ -185,6 +187,7 @@ static void gaokun_set_orientation(struct
ucsi_connector *con,
 	enum gaokun_ucsi_ccx ccx;
 	unsigned long flags;

+	guard(mutex)(&port->orientation_lock);
 	spin_lock_irqsave(&port->lock, flags);
 	ccx = port->ccx;
 	spin_unlock_irqrestore(&port->lock, flags);
@@ -305,9 +308,25 @@ static int gaokun_ucsi_refresh(struct gaokun_ucsi
*uec, int expected)
 	return idx + 1;
 }

+static int gaokun_ucsi_set_dp_orientation(struct gaokun_ucsi_port *port)
+{
+	enum gaokun_ucsi_ccx ccx = port->ccx;
+
+	lockdep_assert_held(&port->ucsi->usb_lock);
+	if (!port->sw)
+		return -ENODEV;
+	if (ccx != USBC_CCX_NORMAL && ccx != USBC_CCX_REVERSE)
+		return -EINVAL;
+
+	/* Finish any connector callback that sampled the previous CC value. */
+	guard(mutex)(&port->orientation_lock);
+	return typec_switch_set(port->sw, CCX_TO_ORI(ccx));
+}
+
 static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 {
 	struct gaokun_ucsi *uec = port->ucsi;
+	bool dp = port->bridge && port->svid == USB_TYPEC_DP_SID;
 	int idx = port->idx, ret;

 	/*
@@ -323,15 +342,24 @@ static void gaokun_ucsi_handle_usb_mode(struct
gaokun_ucsi_port *port)
 		return;
 	}

+	if (dp) {
+		ret = gaokun_ucsi_set_dp_orientation(port);
+		if (ret && port->hpd_state) {
+			dev_err_ratelimited(uec->dev, "failed to set DP orientation: %d\n", ret);
+			goto ack;
+		}
+	}
+
 	ret = typec_mux_set(port->typec_mux, &port->state);
-	if (ret)
+	if (ret) {
 		dev_err(uec->dev, "failed to set mux %d\n", ret);
+		if (dp && port->hpd_state)
+			goto ack;
+	}

 	/* A physical detach can clear the DP SVID together with HPD. */
-	if (port->bridge &&
-	    (port->svid == USB_TYPEC_DP_SID ||
-	     (port->hpd_connected && port->ccx == USBC_CCX_NONE &&
-	      port->mux == USBC_MUX_NONE && !port->hpd_state))) {
+	if (dp || (port->hpd_connected && port->ccx == USBC_CCX_NONE &&
+		   port->mux == USBC_MUX_NONE && !port->hpd_state)) {
 		port->hpd_connected = port->hpd_state;
 		drm_aux_hpd_bridge_notify(&port->bridge->dev,
 					  port->hpd_state ?
@@ -339,6 +367,7 @@ static void gaokun_ucsi_handle_usb_mode(struct
gaokun_ucsi_port *port)
 					  connector_status_disconnected);
 	}

+ack:
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

@@ -429,6 +458,17 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
 	}
 }

+static void gaokun_ucsi_put_switches(void *data)
+{
+	struct gaokun_ucsi *uec = data;
+	int i;
+
+	for (i = 0; i < uec->num_ports; i++) {
+		typec_switch_put(uec->ports[i].sw);
+		typec_mux_put(uec->ports[i].typec_mux);
+	}
+}
+
 static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 {
 	struct gaokun_ucsi_port *ucsi_port;
@@ -450,6 +490,10 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 	if (!uec->ports)
 		return -ENOMEM;

+	ret = devm_add_action_or_reset(dev, gaokun_ucsi_put_switches, uec);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < num_ports; ++i) {
 		ucsi_port = &uec->ports[i];
 		ucsi_port->ccx = USBC_CCX_NONE;
@@ -457,6 +501,7 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 		ucsi_port->ucsi = uec;
 		INIT_DELAYED_WORK(&ucsi_port->usb_fallback, gaokun_ucsi_usb_fallback);
 		spin_lock_init(&ucsi_port->lock);
+		mutex_init(&ucsi_port->orientation_lock);
 	}

 	device_for_each_child_node(dev, fwnode) {
@@ -479,6 +524,14 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
 			return PTR_ERR(ucsi_port->bridge);
 		}

+		ucsi_port->sw = fwnode_typec_switch_get(fwnode);
+		if (IS_ERR(ucsi_port->sw)) {
+			fwnode_handle_put(fwnode);
+			return dev_err_probe(dev, PTR_ERR(ucsi_port->sw),
+					     "failed to get orientation switch for port %u\n",
+					     port);
+		}
+
 		ucsi_port->typec_mux = fwnode_typec_mux_get(fwnode);
 		if (IS_ERR(ucsi_port->typec_mux)) {
 			fwnode_handle_put(fwnode);
@@ -576,9 +629,6 @@ static void gaokun_ucsi_remove(struct
auxiliary_device *adev)
 	if (uec->registered)
 		ucsi_unregister(uec->ucsi);

-	for (i = 0; i < uec->num_ports; ++i)
-		typec_mux_put(uec->ports[i].typec_mux);
-
 	ucsi_destroy(uec->ucsi);
 }
