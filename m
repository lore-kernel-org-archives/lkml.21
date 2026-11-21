Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267973;
	b=HyTD6PUyaW4h8hig/k0kECwfPj8DySK7U3WmPppOw++6LEcZ5TXddDpbIjakaZAvHrs8
	 vb/l5KX8quBjxKEqEeCTrf+9M6+ZpjsUZrJv0bWDRDKPtuoLaz2ywvUUe/7BesGbNr75Y
	 Z7aVETBdDjcrzmhuD7y7z2eD5KSmu7GXNBnL70YvTIyhS/0St4BsaCOkjtQq6BLToMgzO
	 zxFXXK1TOFweC2TWRjLPdS40dkfdVC11ZmrLRYDOmhv9wyFbkf1S9bT//i2pGxLJJX84P
	 MTXA0sdr+4VJWcP954kF5usZvNrWDQNVh3d0OgtRdJW94nqEKpg55q9RHJtX2yR8S2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
	b=NI2s95oo9zViw8xZ5lWtDluqhgLZJUIn2vLxlcqk1eAvxm0Ppa1Ot5b7iZdcyXof1gx6
	 HRnUwOYXIcfndQGEF+4GGA+SHxy8pXHiCal3TaTMccmg3jROzKPkCzAg5UiIVgvaBymnp
	 2/kFO7WFxOy8abIFbXTn3WMkCKgylYivROO2AMggTKc78fPFvkFQ7uMMXNzbzJDVKmXmx
	 YZ/81f2WU9EKVhJPEwsOSJ15/lSJhDPvIx++P8Jg7aPrdZZJ7uqIwZL/dNMMS0T7ZZu04
	 gxKdXm7SG2QdDvIPWFBHvuLnQri0f6gulscYeZzhcz9yGV2883TQak/6x9o1sYtRbkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfMYMwbL;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD5606A68D
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DD5606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfMYMwbL
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so15153475e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267971; x=1795872771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
        b=NfMYMwbLjkEZqOIODDnUgjkgtMhF9U8bnMkrljhiUKxSJYouO81VUoqhRNbPSFc2zb
         2vRr0AmF/Z7x2EYzl/o15bawy09Dm6OQNs4tneiBvFWjqnySR+WOjvqjtLR4LvZF23iY
         k2liVBRkoNC2pu64nfMsnfJzHpvtw4yhILuqXPbFZSSrZEFColEfBqaLPLaC/DCC1OwL
         ZYDBHFS0mvvKSOu2BVhdqBw3XH+Jx32EhyLaKAkm1g8SGlVwMSj1z2xkA52HRUnQwcyT
         J1r9SGe4FbefNjQep/L+zfvBJH/izJRvG/rh7nJCuU//kfLB8rub5qE+YBm1qI8HpORw
         rjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267971; x=1795872771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
        b=G0vgcFugju8Gd+bKpNWUXUKw+4fiWZk2cr290H2HlcqSlv2N0XVvxxkMaYxmTJrTzK
         2g8SaO6nfe0wSR8L1YHJZjr1o1A3waYOOv887nkeqFF5T653+nUNmgThoyFhBAY6DlNk
         JXjCreBoxAI2DS6ebVkRxDgUXA/J4Uxb84cTMtgtv2Xme3VuyeP+K5zoTip08pvRjCMy
         WamwIumAJ4qWPfPWsMMONm8/2J13NSLwx0A8rnJvF9ke3aD66+SKGj7qCSBIVCxAs61b
         69NWdOJ29dEmfKcTCP1r7W6plS0HTEmHzP1TuD1JqP/E81AvjxIS/OugYh1NzyywJAaW
         4X0g==
X-Forwarded-Encrypted: i=1; AL+hErH2+jm7HIQeixSToJVSbQKV1+ZTUwmJMOMYCrX5teIC+hxRKJ2VN15ZnnSMfKIBm8Dlk0q2ftMbUINjx8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KA1OTTf98ITQmxvcQLA7cPKAxmqWrlABhATQk27hCMqX+Fs0B
	qzr+8bORP2jHNgXb2dWRyNCXjh/tHxIqyp4J713zfWGaTcEoZtbnSglC
X-Gm-Gg: AZFdTZfCAsC5UoElhze8vctm8GEdDGBWC3S8jssd8VELA17EbOY0eK2TgnwGSvKsIRw
	4faO0tlzF1nvXxmC7DTMrXdi2JIIXVB8dQhL9UJIwA/HPTSGE8quvcRugc78zHo9gptpfrfWElq
	JzKQ9qLE6/6ZimIXSJoIenvPyunyNRgwC/nUitC22iCI6mP5vIhHgHHSj53jgO2V9Sq4pylgUME
	Z3dDeE5wlcw6ApOl+PefhgZisEQJmbEGU9tDanUNOarh6t+CiwR0ER2iZCb8G8s2a27ysUBQMrv
	iC03H9x3hOYrMzvNaicIjnQuwPOqj8saOWcxvKM7Lve3qleKGYXIPzhNyIQ8HfS8cqNWDHFMjTz
	alIS/AchSrgzAOOnmMW7fN+H1VePxx802N1pKK/ePySMIW3M9u4lq4iwvnxGT+Wb7I5WEK5OX9O
	HkWTDQ60WDW/wE95hscUv/QXyNJw5TUl/yjLlA/CqXBT+EB8GrsC5ANvWeEkYkUqVS90A88Iam6
	NVmHYPe3Pbhx45Ae/RsyZ+mi710ka/kWlAqNINKaBdlrKAFN6XX6OFGv2hIH/BXEAS4pN4ZzY8M
	XC5rTzOUQlgzlXnHV8RL5ywnfdHT5Q3006gNQrxuFLK97gmRvVHJ1JsbV5CGI5vs0TwEUNtFpmP
	x/qiAP18HGFlkncGObChm78CWqzZU5+Dscw==
X-Received: by 2002:a05:600c:c4a2:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb88807d87mr146858345e9.7.1795267970892;
        Sat, 21 Nov 2026 05:32:50 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:50 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 02/14] media: ov8858: Extract digital gain programming
Date: Sat, 21 Nov 2026 14:31:32 +0100
Message-ID: <9fde79c38b265442d4fba0a12bd1bbf04ada510d.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 97448fa75..295c34817 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1525,6 +1525,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1533,7 +1550,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1572,17 +1588,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0


