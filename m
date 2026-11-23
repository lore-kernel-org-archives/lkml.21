Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407674;
	b=4Me22WTCSsJmghl1wTb+PlBzZ+bN+2+3RX9kA2OT1MB+qi61qjH6pLLv2FiKoomsGtBe
	 k3gyG3TfgYrDBiok/J/gUHExsZrfXbhshDe5HeADIJfReHH+1oN/CV9hHYMC1Dnw67pUW
	 qds0moynRSJA0xG8HdND9ScA7YsYGuFFH5vTp6IHb2ldyd2ZgdIeBLfgJ/w7ytiw5Vpy/
	 +kAcOgi6WJZfZzemDo7qBDkpS8e6MKZioE7K3Q/6Dr/rv3V23T0yIoHd3oF/E25S9R1Ln
	 ATLuZ5GWmjywGiUiL7Y7djbg3j8OXn3a0hy6OQc2rWnFtcAEGRse28KCNsIPDvwC/4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3lcAY4q+qNuXrOlRujle6G1kafferflNNP255tdpCqI=;
	b=FKRYCu7nu/69vh26Qom1Z47hBM1rHQ2bRWW1/VBcKm7926vEnR4wA1981QVshhMKEsON
	 7+fMB33oNlLL0zXuqtCPakH5VWSmnFdfvjXSYEdc02kI7wgyTpYlJ6Z9cDKlKBA9/KCFH
	 qECZfB1TCPtmsEa41hY5dBBffElOkcGCMEbYEhlQ1w100hcDPOZl6zmxCiTBHTPjwti01
	 UcXKMfNqBLighLiJjr0Dp9ZhuaNdJVUHYfdRaZ7wT7+pvDKD2bNO0C71DCGjvz8Mhcz55
	 DVSzEW2vgP0Qv9X41ng5i7F9zGJ3VD1cZ/JsPNrPL63CLG5gRs4eBr+W1xc2toYDJng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a++1msNE;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A49C606A681
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A49C606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a++1msNE
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38431138772so3663927eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795407673; x=1796012473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lcAY4q+qNuXrOlRujle6G1kafferflNNP255tdpCqI=;
        b=a++1msNELjCBBUe4+xupGZNZ5/B5lHc/WI64n3cKoQyuZ+DdaEzNCqqoEfsqjKW3ug
         oM5i0Hz/l/CE0JS+wgWSBzk2nFPJftbQdAmPflY+lx5Xi69nr9Tw/m4sSRWWP4/Fztu+
         IcrMwIbyQ4cifeRYBV9WWYSgJyyBKiGkcz0B6JYueIjMzR46nf5uqYq9lsS8tJRhubxS
         t/wSWFBDbsSMr9mf6yz62c9/7bHLrjIK4/it6PBuEKKDV3DWcZB/OwjCe/npE6bW/kbh
         8G1NhZIzQERmeGN/XvSQtymJkMCEa1Fe/pIxPyJTcIBk3s449y3rgxsNOFImGXqqY7Bg
         OM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795407673; x=1796012473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lcAY4q+qNuXrOlRujle6G1kafferflNNP255tdpCqI=;
        b=kO7o2denJn6fMQQfHtnOrT6M4c41Ro0gehvC59deK1bGEC5B6ywvN3qQg+d8rg+AD1
         XlqYD+OYdGGiyPVmfp+qJbQHC8AFghdWo+C57a3T6P4zag5f+1vAH1CVVsqwRM+Vyg1R
         Kw8NwB3jgVngfR8AOJYwXMydYd4hTfOv7j8EA8dyvI6NRhVF4wRtrFPFC8TBp1NhvclP
         ihrP1UP36QLZRDFttm8QUfPXORL5OZFUKB6SOHazZnMDrcpd1KvjTRpj/oDfqRgi9TlD
         hMHj1d7tkWG4yHia09eLfFbFzxgQXYEVrECE0+YwEJ45kMw86Q7itZlKdCElq1weND2u
         T/nQ==
X-Forwarded-Encrypted: i=1; AL+hErEDNz7tZvtUzXdItHPSogy5XkqGwkR0HXgC01suTJtkRNI6jgpbp98GOMUh4sHWRiCWkW7QA+rdvDLQ2lw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DfdEKx4gr3qT55B8K7xyRm8u5ONJ46NuISvxuXP6CB50rZt1W
	ndAL4bgR893WL9NQk+DKn1PHaVDbXRVEKjNjiEK/eRNmWkrVA5X0FN8p
X-Gm-Gg: AZFdTZc8zHU9BpJ5u1kGOVgloc7FuX5f3TQVsN5lvMu25H+52MLtdP8qU4wX/dkRNJ2
	dPQHBeju56mmyg3TbvG1N0QpRyzEk0DYXDq06NePj6SyAaKV71LkUniql975DyuvPZy+PAXpYOf
	VBP9XEyMiy32hbFcLGIdn8fDigpAjxMFhaKLZJq5tQ8PIA+gfILNV5557jwVcM4a1LDi1UtIHwM
	v+cMzBVcG/NmAL+BjlzuR9yiuPmj6UQPHOkQ1uaB+uA5JsZm/09w4ng0vEV8qZB2iJOA8KEXm/C
	kuvqnDZJtVlw+ui5/lz/SiJGD0Un+IWizRNSMmiYtt7c3hb/vAHcrNIHIPBy1z/1YnT9/OE0N7b
	2O+Ldvmz2r5xSEnhVZiuM8/FXv+9LnzsQE5JrQdT2zuzAIZ6JaypQljxektfwhzi6Y8YRwkXcjc
	2x9fRy1FiW8Kb4g9HW8jTnJIuVDHyOu8ricTT5Z6WaaQwOI9/G4bqe3khiiI6r8TY1BM8aRGlsR
	jt00Y77gLZznXb8VWa2Sq2gVK/jUENFMm3Pgf8QMbeqVTvtDgoDf1U3VUe3I9Tnnrs867eJ8PHK
	fy7Ev0vezfkz5aOeIUGGzKdubsiW6ut6Ub4YLBvV0wyzdrEHx9O51+wN9mXXC0C4xCcj+/nXTnL
	tOQH4nEhwwufJig9b7ptOObeeNY9WB+OMd+OECUQmAnnkTnI=
X-Received: by 2002:a05:693c:65c5:b0:386:b5ce:4627 with SMTP id 5a478bee46e88-386b5ce496bmr502496eec.30.1795407673528;
        Sun, 22 Nov 2026 20:21:13 -0800 (PST)
Received: from spark-da2e.tail8e743c.ts.net ([211.105.22.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm30804737eec.15.2026.11.22.20.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:21:13 -0800 (PST)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	stable@vger.kernel.org,
	"Claude Opus 4 . 6" <noreply@anthropic.com>
Subject: [PATCH v5 6/6] HID: wacom: add NULL touch_input guards to remaining touch handlers
Date: Mon, 23 Nov 2026 04:20:15 +0000
Message-ID: <289785de10fffc66131938162155c1c3e3743a90.1795405057.git.jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795405057.git.jinmo44.yang@gmail.com>
References: <cover.1795405057.git.jinmo44.yang@gmail.com>
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

wacom_24hdt_irq() (also handles WACOM_27QHDT), wacom_intuos_pro2_bt_touch(),
and wacom_bamboo_pad_touch_event() dereference wacom->touch_input without
checking it.

As with the other handlers in this series, touch_input can be NULL when
wacom_setup_touch_input_capabilities() returns -ENODEV during an
otherwise successful probe.

Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Cc: stable@vger.kernel.org
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index db8d3432dbd7..c48f957f8970 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1489,6 +1489,12 @@ static void wacom_intuos_pro2_bt_touch(struct wacom_wac *wacom)
 	int num_contacts_left = 5;
 	int i, j;
 
+	if (!touch_input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: touch_input is NULL\n", __func__);
+		return;
+	}
+
 	for (i = 0; i < finger_frames; i++) {
 		unsigned char *frame = &data[i*finger_frame_len + 109];
 		int current_num_contacts = frame[0] & 0x7F;
@@ -1660,6 +1666,12 @@ static int wacom_24hdt_irq(struct wacom_wac *wacom)
 	int byte_per_packet = WACOM_BYTES_PER_24HDT_PACKET;
 	int y_offset = 2;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: touch_input is NULL\n", __func__);
+		return 0;
+	}
+
 	if (touch_is_muted(wacom) && !wacom->shared->touch_down)
 		return 0;
 
@@ -3450,6 +3462,12 @@ static int wacom_bamboo_pad_touch_event(struct wacom_wac *wacom,
 	int x, y;
 	bool valid;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: touch_input is NULL\n", __func__);
+		return 0;
+	}
+
 	prefix = data[0];
 
 	for (id = 0; id < wacom->features.touch_max; id++) {
-- 
2.43.0

