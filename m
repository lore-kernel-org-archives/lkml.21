Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448401;
	b=LJMDvYpfLVJBXp7OMg0oike59qTeJP+tttGblgxVxc4rGCqyU5ejJ1DoOefxdLW+Yv5i
	 /tIEKjOlWGron3/i4b+zTrs34iYYWn6K/P6+zm2airdBAApIb3UnNdunqXux1YYaxTPHu
	 kzrAJVB16lJbCJF9sIQAW7W2mE2UIDPcciqFdRR/JSP3nlYFfbWA0z12uFUU0M1sJkk/n
	 016jdfPiO3il8GUL1uMT9corBExoixyx79W9baJ0HkoFZgXC4EPZvT0uBDKLsPDAIrG5r
	 5hGrR9Gm/NHyMzJDyqhPW4sgeB4Ambj7Oo6y0nKN73QLXNw9EM6QT34zA+pkKkF9EJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XJX3Ex8nGduAqMG0gIZpmZez7/YWlooFiG7PfMDoYPQ=;
	b=F45B1n+irGlCuhpC6enFiAgjUURxkzpFwh89hNJhwlE7mkQuDn2JgFw/yHcDKNZhsYj+
	 vneIdB5VV3t9A4wZCgvM9n6oTdQg1aV7hWrOuOgxZ9zsZN3ZXKJrognObZ2MYQv6ZoOU5
	 CDUrn0pb84hgmNspePghOnZN5OV6iPqOGykVXaYo7l2PDKquYHUCHCJ6NTojbe+mC3KUb
	 /uUqZRMJI4x7mD9luheQMhFodd37CTlxMEEWMh7bMRtu4sZtbfCiSpdDMloxSMSc0J4J+
	 TlDbar3SvJxnHXCIxn60NGF9rmaw03xW0a5Ifsgx8lBkbCvFojO2bpZdEoFeJLyxubg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ey3n1q32;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413760A2626
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F413760A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ey3n1q32
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so5753326c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448400; x=1796053200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJX3Ex8nGduAqMG0gIZpmZez7/YWlooFiG7PfMDoYPQ=;
        b=Ey3n1q324fTuh2x1h9suUDuyT9u6me4RojFtG9Xcvc1AT46clONF8xtPfYWyM1+19+
         iov3A84C7JrwPrJtSrkMfD7enpeBj1q14ipGNFElnBQXOBz24o+DcJxlgzIvDfx4bpyS
         Ed34u7Fm51Ddq6t1CgxXthqb50DOUvNxe5mN6rkirZMI0wH9Acf8Ey+F+XxWnl+hurYl
         n+rEP6016lHlQi5p9AlD2oG8F7bSPfdCFaf36//xci8mNkecx44DQU0/F5DSqRijAUMI
         BF/rMroMdyqU0Q8gLj/Xym686a0uvlQFq1rgyrgTE57/0wKtzLLqXQl5ChdhTRk4j0IF
         dYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448400; x=1796053200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJX3Ex8nGduAqMG0gIZpmZez7/YWlooFiG7PfMDoYPQ=;
        b=kJ4jK5lmmf0FDWBhYPrKtQ2IRoodJyAvb4GYcP/CvFv3/ipvV1yvxZ1DVX5zeaKEqb
         WiR/2YWquQ48Tk0hgdQNXjcZdhe9lhHEYu7VYNNH3rsKjBpa/5XoJ1u1Gkgnyk6gh3KF
         ylrgx/sIY4ABEiGSXBSmbEFbFI96PprXs6bVwlYrz4C2BkPbka0v3M1cZ7PtetAu/kKM
         ISrN5fN1DaeKQ0XvPYrVFtTBP84WPIeLkfN+ma0PwTNG/E0eMQiTKZxdwfNUOnoY7roo
         sZkEmQUQN2A+ZDK0JwNsNlQfPdt6hQMwN2FziGTwC0dC5cJ1oeVvpmCACPXOuS2fsmr4
         uueA==
X-Forwarded-Encrypted: i=1; AL+hErGVg1NgX7bXk/dHwBL3uUgpjYHrAmpCMsOc0RzluG8OBZJefkWCF1ZivmUqsSK6ifLDCVBwumiS0e6/uh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jx7Y3mQtqq7GdDgzkLxs2UJiozmPtaNpBkpL2E2+ntfveyr2m
	1s+9lk02GdSbiT0PrlT6yEJ4Quqwf6Fhnf8KgnzUnGtYtVNZau8J3UaV
X-Gm-Gg: AZFdTZdBmJETcrKDwswBk5+O14sPNn4IY7Ruzuw0+aYoy4qvtrM8rGwnOOpaKotsbCd
	QA3VXsD6m4ExucZ5Dq3FqQdqVzCZ0ETJmeJBxKcSkqCfmigxPOEfALMM3NyHyK77MRH21pYGxDT
	6PW+zWtdNhCxf5+34OSXuwMku79BKqhZ7uPNY9QLVGG+leytqdEiJtB9/UbPcv///vDWFABeld+
	pphKB4tVlH1nU+dSSNpZ3iWn/s5L3U4Vqldj4LAZ+giKUPiUaDIoBZWcY+uRoyd2mBoEbz24K2N
	obK5Ostzq6XcCNDflXzleylcaymI9RUcyL+IVCUQBZ3yTcyhi3W8+cElDNYMFGM8Y0mCAY6chHb
	cLz9uoJOri8MVV6kUcBODmj6UJeAd6rdexwAEYmpn7CeodD+B551+ce/FrMGczcD2bugdDC+WaL
	2JuH3+dNQiE4tzYk0QeH95kMczrdel140XaxdpuzYokLn+n3L7FtwHhSFQBX7+vc4wcXxA6USPM
	SgO+0yn5F/NttS112AfzBsWMJrUHudk+FPMNr3HzJ9eE6/QtH9mky7dHcDpRp09AfifWy2n8D/n
	Rq4/+N1dRA9RyawqzgAqGFpIpEqHbLrEliJt/Vzu2l7nB3k=
X-Received: by 2002:a05:7022:295:10b0:183:e993:7901 with SMTP id a92af1059eb24-1b556898be9mr11335466c88.17.1795448400054;
        Mon, 23 Nov 2026 07:40:00 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:59 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/16] media: i2c: ov5648: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:21 +0700
Message-Id: <20261123153927.2547169-11-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

ov5648_probe() ends with the device runtime suspended, and
ov5648_s_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. ov5648_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its regulators and clock
enabled and its GPIOs released.

After disabling runtime PM, call ov5648_sensor_power(sensor, false) if
the device is not runtime suspended, and set the runtime PM status to
suspended. Avoid powering it off again when runtime suspend has already
done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov5648.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index bb06e66d28e0..7b817511ab93 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2603,6 +2603,10 @@ static void ov5648_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(subdev);
 	pm_runtime_disable(sensor->dev);
+	if (!pm_runtime_status_suspended(sensor->dev)) {
+		ov5648_sensor_power(sensor, false);
+		pm_runtime_set_suspended(sensor->dev);
+	}
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 	mutex_destroy(&sensor->mutex);
 	media_entity_cleanup(&subdev->entity);
-- 
2.25.1

