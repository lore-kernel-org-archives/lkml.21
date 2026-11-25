Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636264;
	b=I02a2rHChp7IAXljzsvFBusyP6V98qDWRsoY2PNHSUyPZULwL6t/b33JF9maeRKSHup4
	 mPKHI4i0crDli4d453wdGxNFkt+emLP9yE1dj8xp4AyjBnc5I+1mqr4D5DFbLf0JVGD8V
	 kxmt1DkUqt/eLdOMFVJZytmamxkiWHPDwsTOOH2k0tt990MPNx3+P3NzjpTci16U6o/0I
	 42uqL7aTEcUHzeI8MlsfNnOSXkEjcZKRISW9yK0M2j4qZASFFcdjPM/sYJIdBgsF8lTbN
	 DJLAQbMjkgK5TASQXXvwIE7VZ9jjB7hPmGk2T0p1pA+l4MojYX2BnstX0ISH+DSEGZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
	b=N6lBe6Nl/Cooe4v+7/qcOOVBa6DuVcASVun+gQytrwiZFUVO0zgXTmn8j7L8+m0bdP4E
	 uyJ7s4H16DOwwyb93dDjE8Y+zxj4N1LhKNGnmnMPWfdElErwQ9oZFzVeUZ6JkP+VB2sFh
	 Z+c1BHu+Y+RipKvUQmKw/GZfNMSXdKqsOERxzP9bN5y/FxRx6MZDj8Be5vCqBBDcL/QNy
	 ElnRzRHNAzovCKqrrzXXKQuOBz2UfcjDw1hjVXE9nPEtB8R5WOb2MBQ6hvY74z5lFaLaN
	 wpA8fW/MHJvzgUwNTb23WEV40vzXawbSOfFqNv4wBgU/y/zxve35MF7XxG9Qbv9+HUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCtfbLhQ;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5303606A681
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5303606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCtfbLhQ
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53dda625f63so3971035b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636262; x=1796241062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
        b=PCtfbLhQ8N8rEGJE4PguHE15cSR8G9QA6ZThAxlPDU/aiHuRw0pUl2eMQfPC6SbkFe
         aLMyByv68yj+hWQfUSh+DaDc1h0vk6BF8wKFLEdJTQhb716gePUds5atuFK2H/Of/8UJ
         SsZpIzOzEZAs/hB6SgKCVPsQ53PzsVboLx+ZCqqUKQK6G/jhchOyJarUSk/pxE/ALcPZ
         Bbehz77Nef7Vx6LAB71I471z9enCOt/wGQaRxl2r9ZhDYEOA4CDBLM/IRdGUIMq5UVrF
         Oc1VXHp2oobRBZXFgcITsR1mrrPQ3GwQw6MYKoTbWXW/uA2iu1EL76IEFfdxs3nAWmOZ
         Cmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636262; x=1796241062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZHDPLNDBuON6r4+3mJFqDI1dwdMb/BwgwaZhh7obns=;
        b=rqkpDVqQ6dlQ9DkDsVZmbFCvgMYUyvtKzlyVbR5UAi0IhIEqndXhQGr0/XwtVkz1/f
         N87AETcZGG6MewtbpaUVjr3Se/gr5HETv7bfHbrVTvY8w0PUxcrmG5muTkkuEWyI1cZF
         WP4pNwm9e8hqk4WM20jML+HtDgw7XnLy5n3jh1F74yyVkq9DsnEH+mfAMVv+Jvq41Nc/
         E81Z09nzo/DKSIbhCSoc7w+A0wkbNaDrGp35aEeUOycojNAiZYMnBrYB3z8bv0DWhz77
         BUQj0kZnGLt52bfTbi4yTMGyPUtpPTm/Ip8JjHSYH7+pLqqqU+4+KKZg6E0nPhR3+Tnn
         xDUQ==
X-Gm-Message-State: APuU4Z9P980ZNtETh13jnOAgT2+y2E6xux1Xu1ReajSXFyal9fvW+MRn
	FL+j8pcIDLy+ubG7eFxLhl/E2KVzw+VcK/uTz5aheeyqcoNrNHCiocA=
X-Gm-Gg: AZFdTZddfVxTJcCOB57XS9nza7dI3Nyz7k2ADdK94jzWVtXz6Fq02V1QL+npJBySoZI
	JFy5Qe2QGllU5PayjNfYyeOAtNzSb+UxKHdNdjpkmVA25rsSy7UH3tWzic+kYlkW7vIvzpklqdk
	N8HkQnf1EPQ6qKUtVgGIxBDIk/WMdoYt8FctCSphDgmrH+3qubtGtCxZ5l7lfNftPvXx9l0RABX
	TUdtKoFq304P6tVAIGOSQUU9IAItZlmMrF4B6TmtRH3QdJeV49wSAMxyZTMnUqA6hC+juR1Ywo2
	3ktHylLl9SNmrLfJt4u+5JlHHr29uBWyL+fgHK/X9hTIxIMhmbCgkkCKtDCqJzjoibDKSVdIPks
	uNr/oRSfelHyIZ9JDZTeusqvISfxAgh/6P1Jc1ho86D5fqmG5ZqeXIpi4F/AyxS8MWdeQFOomn7
	bqH9jXp+mnlTwmxqqLDsiDea8ylGlYh9Zn/bG7l3thU9TQjZRWKlp2yGR2S2lrsKY1l9abWfUUG
	JTY68EHj9SxsFmPVzaugigMriPP9ChffJmz+54hj9TqqJYiLdhI0Ei16wX979N2RGmfb7X6q9vy
	xTIcBWXtNOqFs2/9NUnT3e41tq/cpfUzU6Vu1lSdk9/TjeILdnIE5nYD
X-Received: by 2002:a05:6808:23c2:b0:571:c073:748e with SMTP id 5614622812f47-57a056c8709mr19910622b6e.3.1795636262563;
        Wed, 25 Nov 2026 11:51:02 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:51:01 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 08/12] media: tw9900: use runtime PM autosuspend
Date: Wed, 25 Nov 2026 13:49:47 -0600
Message-ID: <20261125194951.19072-9-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

Each runtime resume enables the supply, toggles reset, rewrites the
init table and waits 300 ms for the horizontal sync PLL to lock. Without
autosuspend, a typical chain of s_routing, polling g_input_status,
querystd, and s_stream would suspend and repower the device each
operation, which adds ~350 ms per call and discards the signal lock.

Use autosuspend with a 1sec delay so that closely spaced operations
share a single power-up.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index b2b754e898c2..b2c30e84acb8 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -68,6 +68,7 @@
 #define TW9900_STD_AUTO				7
 
 #define TW9900_VIDEO_POLL_TRIES			20
+#define TW9900_AUTOSUSPEND_DELAY_MS		1000
 
 struct regval {
 	u8 addr;
@@ -346,7 +347,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		mutex_unlock(&tw9900->mutex);
 
-		pm_runtime_put(&client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
 
 		return ret;
 	}
@@ -355,7 +356,7 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 err_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -532,7 +533,7 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	return ret;
 }
@@ -568,7 +569,7 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -623,7 +624,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -712,6 +713,7 @@ static int tw9900_runtime_suspend(struct device *dev)
 
 static void tw9900_pm_cleanup(struct device *dev)
 {
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	if (!pm_runtime_status_suspended(dev))
 		tw9900_runtime_suspend(dev);
@@ -782,6 +784,8 @@ static int tw9900_probe(struct i2c_client *client)
 		goto err_free_handler;
 
 	pm_runtime_set_suspended(dev);
+	pm_runtime_set_autosuspend_delay(dev, TW9900_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = tw9900_check_id(tw9900, client);
-- 
2.47.3

