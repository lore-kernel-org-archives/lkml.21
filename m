Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034600;
	b=lQ892Nn5l8TRTNy1Qx+m6ipWdxub0sI+2Ii+oeOVeCnL+kUJtztxTgGPKGoVLvtxFmLw
	 GGTpdAwj3FIloK1J1YZa1Owpq4JzSKF1sPfIgv9qMUcQxkR+7ypmRx3BmecCMNudO1MMZ
	 l0pPUGxIbg51SCugft0arpQa0wqjA+5dTkxNt4VLr9z40tkKBSojjSvsAGEFunNEbrHN2
	 JBuDPGTHbzsUhiFawdOADXfVqzxLHZDr3Z9u4kj4v1QeNESfq3ZLMgNUKZ1DTOCKwUHsI
	 9gX1TOtrTQr8xG88zGyNx0+9Y5ozBfjfCSyjmD1VDntbK/XJXVrLslGqYPfjIq3p94w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
	b=mcI08OIP587B4iulqa+cA7Jn+oD9qGSFm2FGOsYplEKywz3JfNY6yib1Y+CUyvKk3tAI
	 GTeDhBwnOyfoBnxOAJC5fU/CvEGFFh6SIVlldzPhTZHz6lN103yZicglk5vXhtcA4WJNc
	 Mx9K9HVOHjQtMfR93Fwt4mVBIY3D3fTjwA5fVj40uFEmeH0p3Nr7HOWcZDjmy1O1/cZeR
	 QWl2+hCzoiLS2XQheclMlU2BksfOfTChnrSUlSh2JuR9oJXvsAYAp7Sb4aJ2ZB3UhHcBs
	 +DrFVsxmIMOP7u7juVA+24Xb3T+iby4jATSCSg2fpK7htfpey7DGE6cHVlh6qRmh0rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGYjOrtU;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3B060A2618
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3B060A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGYjOrtU
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-833e671ee9fso1327612a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034599; x=1795639399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
        b=gGYjOrtUC42JDCtKYouI+yWFTzU65mRkfpDFqaCp3GL0+bAavQKebnigPaoJPHkL8q
         Vq0HFOS+Dw2TYrQuXyPPWN+qoP+VCqWJqiUZhf5iqFqDI0vHok7G7Bdh6LP/N6PlKe73
         T84lZlmiL5YIoH0IHxgnbpiUOGSufqakHmsDVJGNWCA4K4Oig6j1+DkrJ1tkPGGe5ULi
         B5rqA/PNRva4rO8bamKmNR1Cs0/AQ2Eck6syeB1V1meQF1Q9oTCVR6QueReiCIudlEEp
         dZii16aV7J9fsScdWz3hziS3qnEYoyq+w/t6CK98G15DD8oshhB+/C8B/XZNQ+yTXp9k
         Xi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034599; x=1795639399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
        b=PEVWu58h1jWkmoSetoheNlTn4Vm1bUgHeRcEYCfElK0VpjQ1Yy9BIyX7t21HfqWuAD
         sXm9E/u+Nj6s0SF5BtvBtQ7Vr9uRi+I2BK0IlErTACDld4AkONnY41ShEUfHkjiz3frN
         Hf0G//Shv0IdAoJjROG8DBKKGuNR23M8n0ePZt6/wPRUz9/7/NOYN+u3f25ba9TaRD3n
         XBAXVf8mBC06U6OfGZoUrYDcem2NDpW78lGxYfvJjioAeZ0VN3oZSQj+x0RIC+1VoMZo
         ZPo4fjBZNI+k0wfsylmsGbPxfx12QJcbTFVGvUxcZfJXYqtli6lXy6Q0HOMNf328Brx+
         pCVA==
X-Gm-Message-State: APuU4Z/UjwuEjp05dyJAKVdoTHhStK4QShD878r6AQflhh1udsBnkYzJ
	UlFNuAkk4TefebMygUPNkiOG2lcDUPGkvW30kUBpIWDTDtncJmN28ME=
X-Gm-Gg: AYBFou03EqGdiH6O7xG5lrYTv3p27ePln3q1oF25gQac6wwFO5AXdx0KCOe0uNHRt/s
	EgknHQ2zh2TsuqVzWnt1E3qM6X8Pn46zT+zRh6pvErxkMnCapGkJAvg0WTelo1cMjaqTGAcgLuq
	Bwb4Vt7jPmjDrkW/cMNMd3JWosaT/+4C6byJBQS60gSrShhJ4YFvNg0PhkcniD1xdL4vMzRUTnT
	oXadOOrwH5dcZDKPRxz2rraem7aNnTCisXz6WryvPd5SFb7zi5iInDQw65LF9T+VXUq0UaftZju
	EH2KN4Uqr4NRX1KajNfmm98E6HR6zfvnABlpPqXql+4dXlGjyPdkyjnNb+5Y3FVHaSU/Jm4F3AW
	BBcrHmz2ERXiNFXzIPpl1QF0Cg7Wr/FhTZtY+i7ZGqODmBQ7xNALIT86R4+y4QdXoABJ3NljNoR
	I7EfyDslAkJyfw0dgeF8+51hjC0aAjFQwEGXMOtusGNZwwLlSsgPWpn5W29UEmMmDpqrNiWg2ck
	VgH21O5OGczu9fmRp7+wDQZ180S1AQMKo54NkIx8H2355T5nfkjDa0E3XjVsoSLXEs6aKYZtaj9
	QXsx2FLFv+ZIxpqE9THuh1SF/eAMh1vk8MsRpE5HARBY5Ps1uKD54InhTQ==
X-Received: by 2002:a05:6830:903:b0:862:a0ce:f557 with SMTP id 46e09a7af769-862f082f273mr5386807a34.4.1795034598889;
        Wed, 18 Nov 2026 12:43:18 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:18 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 2/8] media: tw9900: accept the TW9910 chip ID
Date: Wed, 18 Nov 2026 14:42:59 -0600
Message-ID: <20261118204305.28268-3-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118204305.28268-1-matthew.laux@gmail.com>
References: <20261118204305.28268-1-matthew.laux@gmail.com>
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

Allow tw9900.c to accept the tw9910's chip ID and revision fields as
well as the tw9900's. The tw9910 is a superset of the tw9900 for the
functionality used by the tw9900 driver, and USB3HDCAP/XCAPTURE-1
capture devices can have either chip.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e07924faa84b..60d5686716f7 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -23,6 +23,8 @@
 #include <media/v4l2-subdev.h>
 
 #define TW9900_REG_CHIP_ID			0x00
+#define TW9900_REG_CHIP_ID_ID_MASK		GENMASK(7, 3)
+#define TW9900_REG_CHIP_ID_REV_MASK		GENMASK(2, 0)
 #define TW9900_REG_CHIP_STATUS			0x01
 #define TW9900_REG_CHIP_STATUS_VDLOSS		BIT(7)
 #define TW9900_REG_CHIP_STATUS_HLOCK		BIT(6)
@@ -51,6 +53,7 @@
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
+#define TW9910_CHIP_ID				0x0B
 #define TW9900_STD_NTSC_M			0
 #define TW9900_STD_PAL_BDGHI			1
 #define TW9900_STD_AUTO				7
@@ -574,6 +577,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 			   struct i2c_client *client)
 {
 	struct device *dev = &tw9900->client->dev;
+	u8 id, rev;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
@@ -581,7 +585,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 		return ret;
 
 	mutex_lock(&tw9900->mutex);
-	ret = tw9900_read_reg(client, TW9900_CHIP_ID);
+	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
 	pm_runtime_put(&tw9900->client->dev);
@@ -589,11 +593,17 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	if (ret < 0)
 		return ret;
 
-	if (ret != TW9900_CHIP_ID) {
-		dev_err(dev, "Unexpected decoder id %#x\n", ret);
+	id = FIELD_GET(TW9900_REG_CHIP_ID_ID_MASK, ret);
+	rev = FIELD_GET(TW9900_REG_CHIP_ID_REV_MASK, ret);
+
+	if (id != TW9900_CHIP_ID && id != TW9910_CHIP_ID) {
+		dev_err(dev, "Unexpected decoder id %#x (rev %u)\n", id, rev);
 		return -ENODEV;
 	}
 
+	dev_dbg(dev, "Found %s revision %u\n",
+		id == TW9910_CHIP_ID ? "TW9910" : "TW9900", rev);
+
 	return 0;
 }
 
-- 
2.47.3

