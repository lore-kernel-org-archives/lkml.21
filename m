Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514796;
	b=P+HeCngcQfsHw/s5qINwgsrUwf4QrEFzjI9Tybp6tWc3Z62XC9vtkX1Aixs3XCVn1+NH
	 73hADy+2NAtVowcq9ztEdqhGRe2HMPxOB8ORxLuDdvuAAJ3Q9XYRVXathQesl1zY9fljd
	 LY6ho2tT3aj1etG8bFdSNoXxggTP0KxBF/Uhr5LzPxADp5G4njLk9e/2H/gPwRuzd78Qh
	 OYc4DEnisiy+YtGpUGNkDQ+RfeFXhHKIN9pJ4RVD3zJUG/JQVQ9TuYgq0n52MZlcYec8y
	 Stls55gTRneVr7JvTiVMAViBPPCkzmK2Di9BPlCaMVuDUxz/DWDJ9KdtawusAtXpaqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gfNvtXSxyuDlmfpI57mT75R6rqxcaduwh6nIpzcsO4U=;
	b=N/a96/n0rkT8D02I6MYcyXGzltegy6lJ5qSZlvQEfkhxg0cq433zpmIGwL4RWMtVZi9P
	 tfvKF4k1X5nDuUIQZjxcU3ka23gh2iB9cXOV199GwkwKzF7t1ZNcQTOkrflyZPaeILjm1
	 rhZT9QtHcVONeZEURhfbhIfjmSru7hXMMEpPgYBgeTMTJ7g/PbBhRAS5COFBXvEG9Sob7
	 t6LKkNDdAyV35PC1j6VEnq51sLrQmee2xAvhAbWGlJlZsPcM+tRwD7RgzarQfPNHG3DqD
	 7iVcUZy/XslznYOsGR5ZctOrwYfF+7NT/+l46t4vp/7XYbHTKdng2Mxjt0aMiklGmvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=agqZzCaN;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70D606A686
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA70D606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=agqZzCaN
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4096A3F78C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795514789;
	bh=gfNvtXSxyuDlmfpI57mT75R6rqxcaduwh6nIpzcsO4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=agqZzCaNDF12yx7F6w1BGAY6YRf5CRhfBBjHRMZlNb98PToIdogbkzD01HIQpf+y6
	 V2rHgH3REGFkCndoSAnMLVjfcantkSPdLX6hYDZTKRNTjNkAv4yodsLO4OKi7jHvMc
	 mwYp/1YSjCd4hAOoqusHKwJKikLkrgLblTwmuJboseK8Xq5Oshy00/grFfnS0f6qv1
	 Waz2EO+hQNNUmzRY/uRe0+tbjHVLiVkIbcnJ3zV6QT9UcMUNrC+1FOfljOKZyyLU7X
	 lM3kxLvygV7Gylj76DVWATSLeNFkIC48Z2TSJa5+odVjFgPaQ0AJ6vmzfhL8F/i4qO
	 ufxMRjh7zysXfQP2n7a130zgm8PeZdPiUPqF1zInSanAYREvQjyWv4DW/162mTMctc
	 hDoTYE0Gk9rV530WWqvzBmEkS/AgLL6oyefCdNOzla80dV5zjIXWCQ3kveTBCXbB8R
	 K6XspAjJi1p3gYiBBeNsFBxmAGTNyzSriVsOLI62WegbX0x7wSn7HAm3DyCMYGI4Jw
	 Nr7cMbar0DopaouXtsx5pG4VebB+wcs7rsCqqbqpQbCvrN1KkCqiYx9bUn5KqzqgKo
	 fgBgURCEpSEbQtUhu/L2MtDHINRn68U2RwbVQoPftfo94yPjzR6FmpW2t6RQSSBoiV
	 Bk/BrNOO5DclBzovLkQq1dx8=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so3533054f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514789; x=1796119589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gfNvtXSxyuDlmfpI57mT75R6rqxcaduwh6nIpzcsO4U=;
        b=bxQ3Wc7ScF3HDyaJLx9C8cIPpYsh5iZuQA9oVkMrP2RuDAddc47dnU6KAdLbizfi/F
         XNSUr+9PbQR1ZdRrfOPtGwwVFQqn2xCf2caNLKyXsAl8RtHUOKoLPXOBfaZsAzYnLcOJ
         tZcoOAkiY2RGciXq0NZDZkaQ5hPkSYY7J4aSqkAPqXcnh3WNypm9K7jxLoSqcgrGsvlG
         A/UMsknO5oiRq7L8K0X3ZXzDuvtKn6E+LvSCt3KQXT9kZ8RA2M5kQZyv4K8ma/88YGYH
         ELto/KRRAeCkaIXKpG9aLHZZpWKj41UeTfVEE2IA7eezTfKcMrOM1L3OZCNeesS7OofY
         EAjg==
X-Gm-Message-State: APuU4Z/uAuAe38InqCaXCK8NVcbudnsMQXplZNfDNJ9zA+7goOn3ZTyv
	75ekh/8hcQdqgateRrVXbbYPqvWbUaBt7AzHzwwWRAX+/t/J1+a4Mb7ebfWYOrohE+PB9DOsvUj
	VQ/xkBXea6dbMbRH8Ss98mRpwrVg+/AyBatTojiT8lawKysurN+AG/8kO5m0gMLb1kR3C3p4inp
	MOyToXOw==
X-Gm-Gg: AZFdTZduf8Tpe2UZY39RuC7DtD6oq5Zn4JtOb7COW8TYPPQkN6EJE0P6U16zsMuqJYL
	iZumJAIH03nYhC2sBSTijUr+p3y0dYP67P5AisQqLRnDGrHjEbQH3m1G4jBAbVLQs33oJoExxgK
	UD1gQ9a/rFU/Hs4ryIsKu/RSaJfq0+29uZQrM1G6LfZICzxgaYQ/gLc/IpxSvDCfA20K25VxKil
	ak9KpaUcm0muWmGf3Gjt+cS6PKIOlH9tJ74yHV5FP02E/KqQEnY8/tKt5wdB1qYw/6KobpKDi5T
	MiZGAvsDYMKOXfap+hXseXZHxPTgOVfkkLa6nWzOBCssGdnoyoJAMbvwg0BuEdBVUp3nOWoKjwM
	xrpdWXyPhpvIaCimrr6lOn8jMEuOwIy3HMXP+2u+Mwy+yhwEaZda62awHJWipBrc=
X-Received: by 2002:a05:6000:4304:b0:4a3:1e75:16c9 with SMTP id ffacd0b85a97d-4abb4c7bb49mr26336957f8f.40.1795514788733;
        Tue, 24 Nov 2026 02:06:28 -0800 (PST)
X-Received: by 2002:a05:6000:4304:b0:4a3:1e75:16c9 with SMTP id ffacd0b85a97d-4abb4c7bb49mr26336925f8f.40.1795514788336;
        Tue, 24 Nov 2026 02:06:28 -0800 (PST)
Received: from px13.Home ([2a06:5902:822:4600:d3c1:2e3f:2545:da9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm27831841f8f.48.2026.11.24.02.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:26 -0800 (PST)
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Subject: [PATCH 2/3] media: uvcvideo: Restore auto controls first and skip inactive slaves
Date: Tue, 24 Nov 2026 10:06:22 +0000
Message-ID: <20261124100623.2227323-3-chris.bainbridge@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
References: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
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

A UVC device rejects a SET_CUR request for a manual control while its
master auto control is enabled. On the Logitech C270 (046d:0825),
restoring WHITE_BALANCE_TEMPERATURE while WHITE_BALANCE_TEMPERATURE_AUTO
is enabled stalls the request with UVC error code 7 (Invalid Request)
and leaves automatic white balance wedged until power cycle, while
aborting the restoration of the remaining controls of the processing
unit. Two rules are needed to avoid this.

First, restore the master controls before the other controls of each
entity. uvc_ctrl_commit_entity() sends the controls of an entity in
index order: Auto-Exposure Mode (index 1) precedes Exposure Time
(index 3) in the camera terminal, but Focus Absolute (index 5) precedes
Focus Auto (index 17), and in the processing unit Hue (index 2), White
Balance Temperature (index 6) and White Balance Component (index 7) all
precede their corresponding auto controls (indices 11, 12 and 13). After
a reset the device has auto white balance enabled at its default, so
even when the user has set the auto control to manual mode, the manual
value is written while the device still has auto enabled, and is
rejected. Restore the masters first (committing the first pass only when
at least one master is dirty), so that manual controls are written with
their master in its final state. A control is a master if any of its
mappings has a non-zero slave_ids[] entry.

Second, skip the slave controls that are currently inactive. When the
master was restored in the first pass or is already loaded in the cache,
decode its value without generating any USB traffic; otherwise query the
master via GET_CUR using __uvc_ctrl_load_cur() (taking struct uvc_device
directly). If the master control is write-only or GET_CUR fails, treat
the slave as active rather than decoding an unpopulated zero buffer,
matching uvc_ctrl_is_accessible(). Clear ctrl->loaded when skipping an
inactive slave so that subsequent reads fetch the firmware-driven value
from the hardware, even on devices that omit UVC_CONTROL_CAP_AUTOUPDATE
in GET_INFO.

This addresses the restore order concern noted in the TODO comment for
auto/manual control pairs.

Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Chris Bainbridge <chris.bainbridge@canonical.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 152 +++++++++++++++++++++++++------
 1 file changed, 126 insertions(+), 26 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index f70fa37800a4..d11ad3da1d50 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1463,7 +1463,7 @@ static int uvc_ctrl_populate_cache(struct uvc_video_chain *chain,
 	return 0;
 }
 
-static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
+static int __uvc_ctrl_load_cur(struct uvc_device *dev,
 			       struct uvc_control *ctrl)
 {
 	u8 *data;
@@ -1482,13 +1482,12 @@ static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
 	}
 
 	if (ctrl->entity->get_cur)
-		ret = ctrl->entity->get_cur(chain->dev, ctrl->entity,
+		ret = ctrl->entity->get_cur(dev, ctrl->entity,
 					    ctrl->info.selector, data,
 					    ctrl->info.size);
 	else
-		ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
-				     ctrl->entity->id, chain->dev->intfnum,
-				     ctrl->info.selector, data,
+		ret = uvc_query_ctrl(dev, UVC_GET_CUR, ctrl->entity->id,
+				     dev->intfnum, ctrl->info.selector, data,
 				     ctrl->info.size);
 
 	if (ret < 0)
@@ -1509,7 +1508,7 @@ static int __uvc_ctrl_get(struct uvc_video_chain *chain,
 	if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
 		return -EACCES;
 
-	ret = __uvc_ctrl_load_cur(chain, ctrl);
+	ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
 	if (ret < 0)
 		return ret;
 
@@ -2572,7 +2571,7 @@ static int uvc_mapping_get_xctrl_compound(struct uvc_video_chain *chain,
 		return -ENOMEM;
 
 	if (which == V4L2_CTRL_WHICH_CUR_VAL)
-		ret = __uvc_ctrl_load_cur(chain, ctrl);
+		ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
 	else
 		ret = uvc_ctrl_populate_cache(chain, ctrl);
 
@@ -2816,7 +2815,7 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
 	 * operation.
 	 */
 	if ((ctrl->info.size * 8) != mapping->size) {
-		ret = __uvc_ctrl_load_cur(chain, ctrl);
+		ret = __uvc_ctrl_load_cur(chain->dev, ctrl);
 		if (ret < 0)
 			return ret;
 	}
@@ -3227,43 +3226,144 @@ static void uvc_ctrl_restore_error(struct uvc_device *dev,
 			     name, err_ctrl->info.selector, entity->id, ret);
 }
 
+/*
+ * Return true if the control is a master control, i.e. one of its mappings
+ * has slave controls.
+ */
+static bool uvc_ctrl_is_master(const struct uvc_control *ctrl)
+{
+	const struct uvc_control_mapping *mapping;
+	unsigned int i;
+
+	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
+		for (i = 0; i < ARRAY_SIZE(mapping->slave_ids); ++i) {
+			if (mapping->slave_ids[i])
+				return true;
+		}
+	}
+
+	return false;
+}
+
+/*
+ * Return true if the control is currently inactive, i.e. it is a slave
+ * control whose master is not in manual mode.
+ *
+ * The master value is read from the driver's cache when available, or queried
+ * from the device via GET_CUR if the master was neither restored in the first
+ * pass nor loaded yet. If the master control cannot be found in the same
+ * entity, is write-only, or fails GET_CUR, the control is considered active,
+ * matching uvc_ctrl_is_accessible().
+ */
+static bool uvc_ctrl_is_inactive(struct uvc_device *dev,
+				 struct uvc_entity *entity,
+				 struct uvc_control *ctrl)
+{
+	struct uvc_control_mapping *mapping;
+
+	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
+		struct uvc_control_mapping *master_map = NULL;
+		struct uvc_control *master_ctrl = NULL;
+		s32 val;
+
+		if (!mapping->master_id)
+			continue;
+
+		__uvc_find_control(entity, mapping->master_id, &master_map,
+				   &master_ctrl, 0, 0);
+
+		if (!master_ctrl || uvc_ctrl_mapping_is_compound(master_map))
+			continue;
+
+		if (!(master_ctrl->modified &&
+		      (master_ctrl->info.flags & UVC_CTRL_FLAG_RESTORE)) &&
+		    !master_ctrl->loaded) {
+			if (!(master_ctrl->info.flags &
+			      UVC_CTRL_FLAG_GET_CUR) ||
+			    __uvc_ctrl_load_cur(dev, master_ctrl) < 0)
+				continue;
+		}
+
+		val = uvc_mapping_get_s32(master_map, UVC_GET_CUR,
+					  uvc_ctrl_data(master_ctrl,
+							UVC_CTRL_DATA_CURRENT));
+		if (val != mapping->master_manual)
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * Restore control values after resume, skipping controls that haven't been
  * changed.
  *
+ * The controls of each entity are restored in two passes: first the master
+ * controls (the auto modes), then the remaining controls. This way a master
+ * is set to its final state before its slaves are restored.
+ *
+ * Slave controls that are currently inactive, because their master is not
+ * in manual mode, are not restored: devices reject SET_CUR requests for
+ * them and some firmwares misbehave when written in auto mode. The manual
+ * value only takes effect once the master is switched back to manual mode.
+ *
  * TODO
  * - Don't restore modified controls that are back to their default value.
- * - Handle restore order (Auto-Exposure Mode should be restored before
- *   Exposure Time).
  */
 int uvc_ctrl_restore_values(struct uvc_device *dev)
 {
 	struct uvc_control *err_ctrl;
 	struct uvc_control *ctrl;
 	struct uvc_entity *entity;
-	unsigned int i;
+	unsigned int i, pass;
 	int ret;
 
 	/* Walk the entities list and restore controls when possible. */
 	list_for_each_entry(entity, &dev->entities, list) {
+		for (pass = 0; pass < 2; ++pass) {
+			bool master_pass = pass == 0;
+			bool dirty = false;
+
+			for (i = 0; i < entity->ncontrols; ++i) {
+				ctrl = &entity->controls[i];
+
+				if (!ctrl->initialized || !ctrl->modified ||
+				    !(ctrl->info.flags & UVC_CTRL_FLAG_RESTORE))
+					continue;
+
+				if (uvc_ctrl_is_master(ctrl) != master_pass)
+					continue;
+
+				if (!master_pass &&
+				    uvc_ctrl_is_inactive(dev, entity, ctrl)) {
+					uvc_dbg(dev, CONTROL,
+						"skipping restore of inactive control %pUl/%u/%u\n",
+						ctrl->info.entity,
+						ctrl->info.index,
+						ctrl->info.selector);
+					ctrl->loaded = 0;
+					continue;
+				}
+
+				uvc_dbg(dev, CONTROL,
+					"restoring control %pUl/%u/%u\n",
+					ctrl->info.entity, ctrl->info.index,
+					ctrl->info.selector);
+				ctrl->dirty = 1;
+				dirty = true;
+			}
 
-		for (i = 0; i < entity->ncontrols; ++i) {
-			ctrl = &entity->controls[i];
-
-			if (!ctrl->initialized || !ctrl->modified ||
-			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
+			if (master_pass && !dirty)
 				continue;
-			uvc_dbg(dev, CONTROL, "restoring control %pUl/%u/%u\n",
-				ctrl->info.entity, ctrl->info.index,
-				ctrl->info.selector);
-			ctrl->dirty = 1;
-		}
 
-		err_ctrl = NULL;
-		ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, &err_ctrl);
-		if (ret < 0) {
-			uvc_ctrl_restore_error(dev, entity, err_ctrl, ret);
-			return ret;
+			err_ctrl = NULL;
+			ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0,
+						     &err_ctrl);
+			if (ret < 0) {
+				uvc_ctrl_restore_error(dev, entity, err_ctrl,
+						       ret);
+				return ret;
+			}
 		}
 	}
 
-- 
2.53.0

