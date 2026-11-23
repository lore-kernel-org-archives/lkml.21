Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407669;
	b=KHyp++hFYBz0cxefvAh8+jy9Om1+mdBYTsFtk771mm+ocfNuv+qMZVuWjOveCEW2zqfY
	 2XiBeC63nq+btVkRIVETAGVDz89Q+TfRwzzeLq4yT88dW76bEC0ZBDyXwZp9inROnTwCi
	 /JgYzSJpBhv5lITuwJvLXwsDsw5fqqWxQP+qd4I0N+yAjM3TicaTSngLZcJ3P8ranGfk7
	 8jRxRRzblEDB19j7hYIUYRIjJ0p7+ba1SG7t9wuJZcXdh+AEQKIuD3wWL9PmNN5idlIB+
	 /99V2gOiKNUDhHfBjUeeGUnrmoprSnyY7ExFzjz/W8nM6Yqkzwq7dX+r5m0qc8KKyEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mXOXzco4JXOw2bK4x0BEUYDwyxl2ZBiIH+SEBteFzuw=;
	b=VYNHAnI/aZy7COeZdgdFU3kN4o7dvudgELZybUgex79sfjnBaezn4uURg1r+e3eqYTIK
	 DfWH/Qvi0HsHjoc20HEtBxXaoE9NSP+WfDPlanAYZ3Xd7AWoCPhoZ2fTuVVBUyWOA8eM/
	 zEoAos03BmzYJy7H3R3rCiio+7DC+0jFbudlKsXZfSDYgcmWIq2DSnced6RYkZbk3QxF9
	 bHpL02JfZ3/jwlQJ8QNlWdQTnkMcPryg2ZcV4hHd/vXM2BKlfWlOECSHya9rnF47pYoiC
	 ShLu5Dq3J6E3A6JITB9E3JzYOleOWFwXtp9GOB7NTEK+PHlS8E8AdiuPaPr23bKFr+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgv4KHDp;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B9D606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B9D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgv4KHDp
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38564b4b017so3062681eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795407668; x=1796012468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXOXzco4JXOw2bK4x0BEUYDwyxl2ZBiIH+SEBteFzuw=;
        b=wgv4KHDp4LsqTvvDPqIPzN67HcYvGEiDwT6d6VtJatFbTtIttUMX8fbNDP+Y3ZurZr
         XWmwIO41/RSwajPzj5w+cuZ7FBvYDb+iZ8Mg2Lbu3+gUhW1emFIOVerbr90XmoLLul5j
         mjArwG6c+Z7NubYJ8aayXWGRxD84xC8sWTI07jbhog4MFCAPDOw83mPb84TUmw2oTLAI
         N4qv0hviGQZFUEpVr7JCr+9jtlz0D0CwpWmNZ8NZFt3TpJrMGxHB/u73UPC+rCQ8aQeS
         D4S9UDpu/iCO6xkK0dEBriBwuZwnIAPZDuUlcD+6PfyEq8R1KndOtuydrEr2RwhTg3UK
         UQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795407668; x=1796012468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXOXzco4JXOw2bK4x0BEUYDwyxl2ZBiIH+SEBteFzuw=;
        b=w8d/TR8NXm3lN2/w9xmIYz6LU4bKWJ0wUfCnwUep9Sopf9NrOwtGWXb7Pe+Y/9/Dta
         gvNcSd2/rgbcr5dG9SfdbFPawDpecA3LMsTZuLQkccbw+B269v+dI3VXJbL29TSn/JOK
         xpzaOvgeWL85rmhS3Dau3lzsWpvW87Qbf7hJnOnHCQxnq9wHfUxn2nUTJmFFcViEHYaD
         ZDGJEK1ism4QWH61aalVdPvMYOpRW/G5lasJNDmuXXCRjmmUQh5ESOZacbnZcLNX83wk
         bJ51ZoQLYsGhzQ3jmPIW1hxrtURnRlFyoqivA+VbPqFJKSLGrbUNBpJK99zbTzRMAOUe
         ZZaA==
X-Forwarded-Encrypted: i=1; AL+hErGn2eOPR2k5ES/waALcPlrr6E5lpiP9Lr5o3ES99p750otsFhTfAEnSQJscCCW1Brc0SF7W4Z97OyYmCNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JXj4+2fK74u6SLsZ2WrotmPlCA6VZmnVqr6DRAW3C1fBy9LU4
	cBb3fClTh9RfPL7svlUGm/TwvOggrrL2qPgHn5tV4lpzKlOPq8oDxlt5
X-Gm-Gg: AZFdTZfCYcvAV2mCaXvsWdDvmaB9hLy2hjwDHBEqGNuTvVQI05dhVOCBivBrTT3CW+E
	80fZJvVj2Xjh+NntLdMBZizhinSgrawlYjmaDxL+8ZuBaVQ2UDb88hZnEC5pW1Lrbhx85hCxiNw
	NI8j5HziVyIUbU97pGdYytsJkHFvkaizz2RGHv3oXsn9f21bOVyoO15Czjbuiq0ZtLCi6Ujdwg6
	VeEAJSXvcG076JpH+UjDm44Tw4FYqoE8lgP3x0j3xd3Mus960DY1DV3E0jvCN225/p1sRw6cnxY
	BZEq114+UGvLjvC/rsB6+NV8roT2d7DJM8ML3YZ/taZNLL42zt7IPI4QN8L8NyfD9X97O55FrDZ
	ye160h0s6nG1DMJM/tZJwYpZJYxRvClgcR6SrVgxmeXxc0bVEqNyz5Kvzx9lWXZxxtyjCAorVcY
	MPpO7TToGGT0pncayh46hYOQRQXWhR3yQg3G60sx3cbLpTMJcLPD3nD1d09Ya1JoLt/jXtlwQ2t
	Z2JumDnQF8AaeSCI89/cjG68LQ7erZOXtxm/a5RpoNSRoNuBPBns8gQHoa9eO7ECI1cNu9SIQsT
	S+QymS1zsCu3MOF8P+dXs5FV/mUdwqJa/JZnqFIHDdisHkgxbvyuA/FoniGoQfzom8uwtQccRA9
	+R8hAkItfV8I9QJ3a75B2FCJ2rn/e6neXhPgHRzxRKSmCPlKJQifkxWvjdw7k5n3m8o5o
X-Received: by 2002:a05:7300:d589:b0:386:9ff1:7f7d with SMTP id 5a478bee46e88-3869ff18213mr6674962eec.4.1795407667621;
        Sun, 22 Nov 2026 20:21:07 -0800 (PST)
Received: from spark-da2e.tail8e743c.ts.net ([211.105.22.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm30804737eec.15.2026.11.22.20.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:21:07 -0800 (PST)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	"Claude Opus 4 . 6" <noreply@anthropic.com>
Subject: [PATCH v5 4/6] HID: wacom: add NULL input guards to wacom_intuos_bt_irq()
Date: Mon, 23 Nov 2026 04:20:13 +0000
Message-ID: <5a4b092537e60ab22faadb3e8fd516e43c62e1b5.1795405057.git.jinmo44.yang@gmail.com>
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

wacom_intuos_bt_irq() dereferences wacom->pen_input in every switch
branch, both directly for dev_warn/dev_dbg and indirectly through
wacom_intuos_bt_process_data() which calls input_sync(pen_input).
pad_input is also used in wacom_intuos_bt_process_data().

Both can be NULL when the corresponding setup_*_input_capabilities()
returns -ENODEV during a successful probe. For INTUOS4WL, pen and pad
are always expected together, so guard both at function entry.

Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index b162f40397be..e2c2bdf91c5b 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1269,6 +1269,13 @@ static int wacom_intuos_bt_irq(struct wacom_wac *wacom, size_t len)
 	int i = 1;
 	unsigned power_raw, battery_capacity, bat_charging, ps_connected;
 
+	if (!wacom->pen_input || !wacom->pad_input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: expected pen and pad input devices\n",
+			      __func__);
+		return 0;
+	}
+
 	switch (data[0]) {
 	case 0x04:
 		if (len < 32) {
-- 
2.43.0

