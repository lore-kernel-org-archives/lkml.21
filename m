Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729071;
	b=d1USYYe+uwNUdrYgmlAY18JL0wRAdwV80rSpg1tEQ0h3iUiO++OukWgjXiGyHH7OXhGn
	 /G6XvRfrc4MVYGoffuqgBeb0nIckT3sAxiOKGtQQrEJEmC09qYd0EdXXvoBbEdMxcnesr
	 OcWtJLldhzX6z03Dh9qteuMhAZopBZITGvoG6eyg35qLH7fK+xCRrovmqnAitNOoHvD5k
	 x5T4j77IIZBRa8Q2kbaNAwpAoEPM9xNNbx2Pfk+gsCUSa4mBFqHJBN+yZna0wiTgj+uBG
	 RFpGGdNLllYc4RgaVtm0bAeqm90oTKpV5kMvyTh5TtKGjtQerbCFCl0K+dnoTMcayiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rTynq6lcaX88KnM2KiakTF5u9vz9SlmUwghXiVPF/vk=;
	b=XdIbjHYEzXf7+T9i7hpfJKH0YWnNiyl9zFmgqer9FY3FGFuvhUAau3iky99g6H2EXsej
	 bfDKlKhxm3XawoVyTXxRGGQxLbyCO6RPweouZd9J92Kz08tNuW+9rEoVzZyQEOeBReL6t
	 I5KCnuWamY0q259SMMHcT4HpB2psNOOQy6ti9sP95cIHD4SGO2KtVsQAJGbaMdlN4jAYT
	 ST1kmTh1CNKBoIp84drQYFMYLVgn5co7//OQWSV6npDVrGcW1IHYZI32XyhtmUbvdJ6h+
	 UGck8WcwBVLkzx5bAOES3Z20sjpvm80Xgtk0X0izuFCuIXwsn3YDo7ofKynh1XnJQ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYJdK2le;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40A606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B40A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FYJdK2le
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b439e37813so3858829a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729071; x=1796333871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTynq6lcaX88KnM2KiakTF5u9vz9SlmUwghXiVPF/vk=;
        b=FYJdK2leuJc0wKyHr8Utf/JCiuUiElvSD4mRQPE7LDHvoRXwg+fkuhy6hNbupkWj7F
         JPNnSRoGeuPpflmyH9PGKlb2tLm/gHBAVFkJ3nZdTaBXoDd+WUSeMXiFg0uEN4jX9b3k
         q5mW/zQvDw6LjKhf80DpuOpPrey8iYe3BLtk7OYCZPpoHiAI2rQCdbBQWEyfhBAOzpi5
         k5cwWstJCtFwIc0ZZjESkDjM1i+OvsqZih3Ejr8RsNkgEkSeKustz06ylaPI4EUf8ODy
         nKR5LrhOfGT4qOcl+TUGA3+zNYrHIePN+RwFNY0dAu/kiakgqYO/K+sf5oX4zXySNH1U
         OtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729071; x=1796333871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTynq6lcaX88KnM2KiakTF5u9vz9SlmUwghXiVPF/vk=;
        b=jno17XVZnM/x0+Oc7MtE0A9CNFmlSUyJ0B9UDSW2nQ7jf4IeNXSHzcVLjGIL6rhSMk
         Yin5z12Wb35NxmxQOpDeN648oJlyFgs5IktZotgNSVqhrL5Qc4mEgQJLcSzGHAbBbYlI
         /8oE4Hv/ehjYQctuWE9ltG8TpQAByIO++QsADIyikn1II+IgS2o5zNOV6SmTS8LAnvmF
         oHZ1JCzIR3umB9xGNGKsbRjroOGi5zBL6785ZXdZxUROWoeLfwafIkLhwTtawGdroI5O
         nyebcBFpo4frD1Phk7hUbGSK9CJZbLdiQWu2/KVyAeaRj0HqLZVPcuzZIzWCmkLE4Mfo
         RlrA==
X-Forwarded-Encrypted: i=1; AL+hErGDF48/OEjoOX6vMIplAfjl2JCQtOf6Dj350rxO6Ek2d3glqGBb7iKk9Zk08fMbyOjSgDWAafF0XBpXTOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mOimmSpLm38BopeJ39lIoKAhVmf+9zV4AXzHHxBQEPp1DdWQm
	PeDt9xrhBPg2skMvvvEbutCpXKhx+qrqL2ZXMamSk/sP9rvrCVf0jkF8
X-Gm-Gg: AZFdTZdq7fYdXoU7rFTuac/i814EhNrtE5RtfYl3mS2DSwlEfSQuN44zm7zFk9Ijbno
	lWFoNMa80cpDab2GG9HeQYO0NmtAbPWorNHKrGikcusp0XNie1LMaBtiZtQ/4vGtG4BurB57gT1
	tgP8yx2SXGZIX1OMm3GX7STuyr2RvSvyS1SCo4wT2lgRn9yxYXtcSaGBQLIxfFGEcQdFSyR5+yP
	9SyFNbDvR1KcAqnddJRFKsnW40C8lAeoTfAP6aFYa+09E6KCqb9EOo5c5EVkiuRE8+9IO+Qmt1O
	hJU+Pn+6L/qUI+LsbUuwRSYI5r0c6lA/K63FIcRLvRjr44t+dtXKZ5iHpskzLDEhymLhik8zdaW
	n/5/RkcEJC2XmXVMv5hXQENkP4WhG6gT8BsmA2E3d2tLOOv5cL2nRpJOx2LNgMWnO7brEBMrCfv
	6X8j8CTiFljVq0icmRAJv7kVjXp2yJ4W9fQWQq92CU0icfcHFK6odcJ2KzBz2fscnqohodcUIfN
	ig1i/IUktybUNc/QSV4/fbytuvvQiG8wRxtUebPcFs3McASCGIsEZMjYOl23umYLOkXnGApDdGZ
	/aAn0f8hummKX+JmeqHQSR32FR4Ss1+0DIjk0t1buiiPo3GL2lJL+Yyyltfvx7HqfKvI71PMDNI
	H83zfU+FWOpLDorUsqyqN+js9qAoSIBxRF6oDGbEjjcNdKPoa9fNsOaqyZ+Lox7hDnp4MSQN5Cf
	Q5cJDZ21ZnLM6nZa5egK+dQw==
X-Received: by 2002:a17:90b:57c4:b0:3b0:9cc6:62ba with SMTP id 98e67ed59e1d1-3b41caead33mr20255446a91.38.1795729070725;
        Thu, 26 Nov 2026 13:37:50 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm11703905a12.2.2026.11.26.13.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:37:50 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yasin Lee <yasin.lee.x@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 3/6] iio: proximity: hx9023s: re-enable interrupts on resume for events
Date: Fri, 27 Nov 2026 03:06:48 +0530
Message-ID: <20261126213710.1047676-4-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126213710.1047676-1-kapoorarnav43@gmail.com>
References: <20261126213710.1047676-1-kapoorarnav43@gmail.com>
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

The chip interrupts are enabled at probe (INTERRUPT_CFG = 0xff in the
register defaults) and stay enabled while only threshold events are in
use. hx9023s_suspend() disables them, but hx9023s_resume() re-enables
them only if the data-ready trigger is enabled. With events enabled and
no buffer running, the interrupts therefore stay off after the first
suspend/resume cycle and no proximity event is reported any more, until
a buffer is started.

Re-enable the interrupts on resume if any event is enabled as well.

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index 030a6265f896..d509de6e265b 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -1192,7 +1192,7 @@ static int hx9023s_resume(struct device *dev)
 	struct hx9023s_data *data = iio_priv(dev_get_drvdata(dev));
 
 	guard(mutex)(&data->mutex);
-	if (data->trigger_enabled)
+	if (data->trigger_enabled || data->chan_event)
 		hx9023s_interrupt_enable(data);
 
 	return 0;
-- 
2.53.0

