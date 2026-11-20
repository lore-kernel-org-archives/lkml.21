Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164265;
	b=FqNRzwdlr4SwYsBkU/7nLFr9+n8ykhG74aPJIsMLFRsIhkG7gWO6DNHlkypZ3FyTltOY
	 TuR3+8s40Qus4esOTs+k/YGspUBPCgD5F5Alh55EIPBqxTdf8RhNj3edQVgHsEEP8QphK
	 /pr3UXrv5wCTbnJ7gcSbsc987sqtxkCDJoVeJP/qHfYaFypQkxrYHCDlX5Oy0RM8AnqhN
	 XgOzwN3OLX8pqaQrCqFiLHAPb9G+dHuW5BT8vDkN0cGo4psEElF/pvZ/b+4rEMvJG31Ya
	 E2iEzYl+iWuHsoAZxmK70QEuH8n1O3wQnr3Zf8jfxrwDOoYUEOQrRCt6CghsafilKKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oOg70XUHqfi12TxpW0pVKbA5osmPru2dGkR5UgTmooQ=;
	b=icAX+mU2NkBo2Tm7RI3M7TbBtHj9ie5c7U2Dpdvpw9YlXXrGX0PCbmULzpNd5yXd+ipe
	 r3+OENHauarG2J4M8wG7e2lt+SRjUmMyXwuqKQdTAymdYkRrLGa0BU+51h0qOPhtkmw46
	 z830VIq9srHWTUPZRDP7t23S90j+vGsU62kE3LqbRNBrTmxCIgo4r1HX3DpmFN2Ebgg5J
	 ZYFbTL3Sl1VJxVulRZGKJ3t7Z5DUFEga1L0ra+hBktK/QsUYNeTOuKoAS2r82Tv/kqUwz
	 hTym5PHi0tKqi6ZyVZkI7/47TE4XTEhHvoMDOvDm/eEvQL6jT/28Q7i7wK/EW3Kw+KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M6en4P/w";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5075560A5BC5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5075560A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6en4P/w
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so1078973c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164264; x=1795769064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOg70XUHqfi12TxpW0pVKbA5osmPru2dGkR5UgTmooQ=;
        b=M6en4P/wt5s1UHsDabE0RDc+mVA98YN7YMyKpPLbgi/1GLZ1iCy0aKoZYznC/wzztS
         rZz/rLWkDJCapYsprVN4ViC+H1Wf2yOpR2D1gW3MNjTXA3mZLAl1gFPT3dUHOsH5RzZi
         xzAb/F7yXvVlJz6V05yIGGoIK7tWC44tLGEFuQAf9AS8eqprknMXDze85cih8a5Ev3We
         Y+0awczRj94i3Rtqp0+8TThbvzeBQ6gagbwyyea+aL35cpgRD7TtTvvrqRAj0Nokzx8i
         /EAz/qsh9ULFmmDquVN95cCth2uHddikoY6yJOHwjJ5Ce8p6HEqEZixZfJk28t/kidy8
         bIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164264; x=1795769064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOg70XUHqfi12TxpW0pVKbA5osmPru2dGkR5UgTmooQ=;
        b=1NIjbOD27/a5CZcG8M+9Mkl53aO0lsQrBt4gBR38H05qF33xfI/L7LXYbmIQG26mK6
         zeZ1L4bkYNbVAP4qOH2uxmIyPrFYeSCRUm7yZbegjS0InXFWN2wzSEQ3FBeLmTKzJsWp
         4fhCdzEgj45Zystmvsbb4srelpURW0lcQpPONs8Pp6XQKh+SoordGRu7xCn3xfVtfpQo
         npwdk8u/H4EbyW7Sfp8qUAn650USyGULwKCY/6k9o57DB7OrIs+rRwA9HrWX3q9EOrMI
         0mOSudMvwphm6Rtrg5aCzcybrHRI6tQ9XmByC/x1kGwjvzH5WNnIeppkNqTpgLpDCRQO
         R/mA==
X-Forwarded-Encrypted: i=1; AL+hErEN9xvahoiEhULgtlnegn3xdpG6ChuHzV1oNQkXnSdSQXVY1rWbicbzY7YklbVp1VEj3Wpd/fCJRlFPEbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nLYrY3voK3yNSJERhTHKdnzgboqUMQBPLJ+L938H7AwhtbZXE
	xtamDw7ejc6dhJnWqLqAVA3fIgDw9022/E/odNPAZD1Ta+bH693VWrxY
X-Gm-Gg: AYBFou3wspCk7LOVjSmAMp9+FNbbVk57ZKQbO2AMsLTO8Pv5MA1AHQJtMkrsIeY8/Bz
	gebv56ESiSlLcx1+8FQM8wkWMzh/Xu/ORQItUXPRloAW384y5Xfj91MOJJAqyCEECwJPRDrEwXW
	KiJS3jPCdJ/1SN8henKgQY6gyQ6iqn1DceRaSQxp7pfE1FC9VJTxwd63rIVVSacfmsw3VTC6mgH
	nBfjLAqkciVMIwqemtieOLBY6FKkMaDYzZjN6vg4Zb+Cd0hdv6/vMpZq62BFPM0Qw0gsAsKUCg8
	IYlksOccD607+GajPiWNCRn3VTQAtCo8gCLudyObUv/NN97cu9culEf8UG1RLIBJ0/Rkc2KJn5d
	R9AuFuFTCcolElHTvWgwgIMQ7rXPZ+ot/1eOCFQ4NJysP+QCp+d7t33DPeCbUso42st2w7Fl/dV
	Qq9RgjdfYf/ExsU908zy0Lb0fSkDbyOHSpTj9PL8XvpAEE9G2wuNazi+LKAna9WnEh/TET7kovI
	Y+j1qv6eL2IVWTki699eAF09O8gQaZT+aZ/h8xdxjWXCa56pEKs8HCsS0qbParXpbrJ4I6zcKNM
	iaHmfEfkGizdGZrCUqVMEi/Xfq4Z9QaQPodz/cbFV6MQ3PM0TB70WnKFg0FFbkZ/rgYrfOAJsRq
	jgQK9OF3MS5gSUPQMCA==
X-Received: by 2002:a05:7022:23aa:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b5568e5983mr2837415c88.28.1795164264479;
        Fri, 20 Nov 2026 00:44:24 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:23 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:00 -0800
Subject: [PATCH v3 09/18] HID: logitech-hidpp: execute G920 effect upload
 and erase synchronously
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-9-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

The input force-feedback subsystem expects upload and erase operations
to execute synchronously in process context, returning errors if the
device rejects the effect or communication fails so that callers can
react accordingly. The G920 driver previously queued these requests onto
an asynchronous workqueue and immediately returned success to the input
core, hiding transfer errors and allowing user space to race ahead
before the hardware effect was actually uploaded or removed.

Convert hidpp_ff_upload_effect() and hidpp_ff_erase_effect() to execute
synchronously using hidpp_send_fap_command_sync(). Before issuing the
hardware command, flush any in-flight playback commands on the workqueue
to ensure ordering. Open and close the underlying transport around the
transfer, update the slot table directly upon completion, and report
errors back to the caller on upload.

Because upload and erase no longer go through the workqueue, drop
effect ID tracking from the asynchronous work item and queue playback,
autocenter, and gain commands with their slot parameters already
populated by the caller.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 126 +++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 66 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 4444c74053ff..cfd13ca93b2a 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2337,8 +2337,6 @@ static void hidpp_touchpad_raw_xy_event(struct hidpp_device *hidpp_dev,
 
 #define HIDPP_FF_EFFECT_AUTOSTART	0x80
 
-#define HIDPP_FF_EFFECTID_NONE		-1
-#define HIDPP_FF_EFFECTID_AUTOCENTER	-2
 #define HIDPP_AUTOCENTER_PARAMS_LENGTH	18
 
 #define HIDPP_FF_MAX_PARAMS	20
@@ -2363,7 +2361,6 @@ struct g920_data {
 struct hidpp_ff_work_data {
 	struct work_struct work;
 	struct hidpp_ff_private_data *data;
-	int effect_id;
 	u8 command;
 	u8 params[HIDPP_FF_MAX_PARAMS];
 	u8 size;
@@ -2412,71 +2409,23 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 	struct hidpp_ff_private_data *data = wd->data;
 	struct g920_data *g920 = data->hidpp->private_data;
 	struct hidpp_report response;
-	u8 slot;
 	int ret;
 
-	/* add slot number if needed */
-	switch (wd->effect_id) {
-	case HIDPP_FF_EFFECTID_AUTOCENTER:
-		wd->params[0] = g920->slot_autocenter;
-		break;
-	case HIDPP_FF_EFFECTID_NONE:
-		/* leave slot as zero */
-		break;
-	default:
-		/* find current slot for effect */
-		wd->params[0] = data->slots[wd->effect_id];
-		break;
-	}
-
 	/* send command and wait for reply */
 	ret = hidpp_send_fap_command_sync(data->hidpp, g920->feature_index,
 					  wd->command, wd->params, wd->size,
 					  &response);
-
-	if (ret) {
+	if (ret)
 		hid_err(data->hidpp->hid_dev, "Failed to send command to device!\n");
-		goto out;
-	}
-
-	/* parse return data */
-	switch (wd->command) {
-	case HIDPP_FF_DOWNLOAD_EFFECT:
-		slot = response.fap.params[0];
-		if (slot > 0) {
-			if (wd->effect_id >= 0)
-				/* regular effect uploaded */
-				data->slots[wd->effect_id] = slot;
-			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
-				/* autocenter spring uploaded */
-				g920->slot_autocenter = slot;
-		}
-		break;
-	case HIDPP_FF_DESTROY_EFFECT:
-		slot = wd->params[0];
-		if (slot > 0) {
-			if (wd->effect_id >= 0)
-				/* regular effect destroyed */
-				data->slots[wd->effect_id] = 0;
-			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
-				/* autocenter spring destroyed */
-				g920->slot_autocenter = 0;
-		}
-		break;
-	case HIDPP_FF_SET_GLOBAL_GAINS:
+	else if (wd->command == HIDPP_FF_SET_GLOBAL_GAINS)
 		g920->gain = (wd->params[0] << 8) + wd->params[1];
-		break;
-	default:
-		/* no action needed */
-		break;
-	}
 
-out:
 	atomic_dec(&data->workqueue_size);
 	kfree(wd);
 }
 
-static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id, u8 command, u8 *params, u8 size)
+static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, u8 command,
+			       const u8 *params, u8 size)
 {
 	struct hidpp_ff_work_data *wd;
 	int s;
@@ -2488,7 +2437,6 @@ static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id
 	INIT_WORK(&wd->work, hidpp_ff_work_handler);
 
 	wd->data = data;
-	wd->effect_id = effect_id;
 	wd->command = command;
 	wd->size = size;
 	memcpy(wd->params, params, size);
@@ -2506,11 +2454,16 @@ static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id
 static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effect, struct ff_effect *old)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
+	struct hidpp_device *hidpp = data->hidpp;
+	struct hid_device *hid = hidpp->hid_dev;
+	struct g920_data *g920 = hidpp->private_data;
+	struct hidpp_report response;
 	u8 params[20];
 	u8 size;
-	int force;
+	int force, error;
 
 	/* set common parameters */
+	params[0] = old ? data->slots[effect->id] : 0;
 	params[2] = effect->replay.length >> 8;
 	params[3] = effect->replay.length & 255;
 	params[4] = effect->replay.delay >> 8;
@@ -2557,7 +2510,9 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 			params[1] = HIDPP_FF_EFFECT_PERIODIC_TRIANGLE;
 			break;
 		default:
-			hid_err(data->hidpp->hid_dev, "Unexpected periodic waveform type %i!\n", effect->u.periodic.waveform);
+			hid_err(hidpp->hid_dev,
+				"Unexpected periodic waveform type %i!\n",
+				effect->u.periodic.waveform);
 			return -EINVAL;
 		}
 		force = (effect->u.periodic.magnitude * fixp_sin16((effect->direction * 360) >> 16)) >> 15;
@@ -2642,11 +2597,26 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 				effect->u.condition[0].center);
 		break;
 	default:
-		hid_err(data->hidpp->hid_dev, "Unexpected force type %i!\n", effect->type);
+		hid_err(hidpp->hid_dev, "Unexpected force type %i!\n", effect->type);
 		return -EINVAL;
 	}
 
-	return hidpp_ff_queue_work(data, effect->id, HIDPP_FF_DOWNLOAD_EFFECT, params, size);
+	flush_workqueue(data->wq);
+
+	error = hid_hw_open(hid);
+	if (error)
+		return error;
+
+	error = hidpp_send_fap_command_sync(hidpp, g920->feature_index,
+					    HIDPP_FF_DOWNLOAD_EFFECT,
+					    params, size, &response);
+	hid_hw_close(hid);
+
+	if (error)
+		return error;
+
+	data->slots[effect->id] = response.fap.params[0];
+	return 0;
 }
 
 static int hidpp_ff_playback(struct input_dev *dev, int effect_id, int value)
@@ -2654,31 +2624,55 @@ static int hidpp_ff_playback(struct input_dev *dev, int effect_id, int value)
 	struct hidpp_ff_private_data *data = dev->ff->private;
 	u8 params[2];
 
+	params[0] = data->slots[effect_id];
+	if (!dev->ready || !params[0])
+		return 0;
+
 	params[1] = value ? HIDPP_FF_EFFECT_STATE_PLAY : HIDPP_FF_EFFECT_STATE_STOP;
 
-	dbg_hid("St%sing playback of effect %d.\n", value?"art":"opp", effect_id);
+	dbg_hid("St%sing playback of effect %d.\n", value ? "art" : "opp", effect_id);
 
-	return hidpp_ff_queue_work(data, effect_id, HIDPP_FF_SET_EFFECT_STATE, params, ARRAY_SIZE(params));
+	return hidpp_ff_queue_work(data, HIDPP_FF_SET_EFFECT_STATE, params, ARRAY_SIZE(params));
 }
 
 static int hidpp_ff_erase_effect(struct input_dev *dev, int effect_id)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
-	u8 slot = 0;
+	struct hidpp_device *hidpp = data->hidpp;
+	struct hid_device *hid = hidpp->hid_dev;
+	struct g920_data *g920 = hidpp->private_data;
+	struct hidpp_report response;
+	u8 slot;
 
 	dbg_hid("Erasing effect %d.\n", effect_id);
 
-	return hidpp_ff_queue_work(data, effect_id, HIDPP_FF_DESTROY_EFFECT, &slot, 1);
+	flush_workqueue(data->wq);
+
+	slot = data->slots[effect_id];
+	data->slots[effect_id] = 0;
+
+	if (slot) {
+		if (hid_hw_open(hid) == 0) {
+			hidpp_send_fap_command_sync(hidpp, g920->feature_index,
+						    HIDPP_FF_DESTROY_EFFECT,
+						    &slot, 1, &response);
+			hid_hw_close(hid);
+		}
+	}
+
+	return 0;
 }
 
 static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
+	struct g920_data *g920 = data->hidpp->private_data;
 	u8 params[HIDPP_AUTOCENTER_PARAMS_LENGTH];
 
 	dbg_hid("Setting autocenter to %d.\n", magnitude);
 
 	/* start a standard spring effect */
+	params[0] = g920->slot_autocenter;
 	params[1] = HIDPP_FF_EFFECT_SPRING | HIDPP_FF_EFFECT_AUTOSTART;
 	/* zero delay and duration */
 	params[2] = params[3] = params[4] = params[5] = 0;
@@ -2690,7 +2684,7 @@ static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 	/* zero deadband and center */
 	params[10] = params[11] = params[12] = params[13] = 0;
 
-	hidpp_ff_queue_work(data, HIDPP_FF_EFFECTID_AUTOCENTER, HIDPP_FF_DOWNLOAD_EFFECT, params, ARRAY_SIZE(params));
+	hidpp_ff_queue_work(data, HIDPP_FF_DOWNLOAD_EFFECT, params, ARRAY_SIZE(params));
 }
 
 static void hidpp_ff_set_gain(struct input_dev *dev, u16 gain)
@@ -2705,7 +2699,7 @@ static void hidpp_ff_set_gain(struct input_dev *dev, u16 gain)
 	params[2] = 0; /* no boost */
 	params[3] = 0;
 
-	hidpp_ff_queue_work(data, HIDPP_FF_EFFECTID_NONE, HIDPP_FF_SET_GLOBAL_GAINS, params, ARRAY_SIZE(params));
+	hidpp_ff_queue_work(data, HIDPP_FF_SET_GLOBAL_GAINS, params, ARRAY_SIZE(params));
 }
 
 static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *attr, char *buf)

-- 
2.56.1.750.gf70dc682cf-goog

