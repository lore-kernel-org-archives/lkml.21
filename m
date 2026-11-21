Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267978;
	b=oyExniz3HNcI4yqlZRj+qesICbO7SfDQwAkR65L9zpHbOnZYK9TgJjSygCTOwsZFKVDC
	 yZkVr08EeHaGpxYFdSHFUoY6whSdMVEBofzptPrFkY4vtukbvk4x2jMeBKkABlgv5aysB
	 mmNBGyuSsnCi5+YZJ0CAsjXwFxcALzdD9KWlI1ERRtI/rjO4Wb9ezZh3mftICviQWIZja
	 /5dcQtXUYtLVJ846GRqu/rG9jzHfOQ9z7txuvwKDkeJE7yj5UGRQSkScXi2QEsP4CLQ/J
	 6CNdIfc/OYuglzjHBXJN6/zmdSUskAoonk6NrbFrJCH0l8f/kcf2x+37VzJDK+9LHJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
	b=SFUZpg1vGlDX0W+XWZnOiX40etQUiPsHE9dihckti2OmS5wxh37n1oSKpoFKYU0tW6MV
	 nyZkML+GHX4skLcd96ljMzKgOiSOeafv9Tayb/SXumCpliS1jBb/2UxFiruEpFi+EWUUg
	 cTekZ5aTF+Ou6gVZz/Cu+Wh4GAqYEi1+EjArJVWBPuHQLh+Kb3SNAf4f+88ypPCAGkDPr
	 cqB0JKYNANOtPqBMNx0P09RXjrTJd84EAR8ok7fviBn1mC9JnOVhsZTVilWa7tqPHjEHm
	 1q5GQERuV+E5+RgOEOBVxHdRDub3WeS479ykbkio7jexlWdaiQ5PKSVOY/Sl62qJmTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4FSYklA;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F632606A685
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F632606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4FSYklA
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so15553285e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267976; x=1795872776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
        b=o4FSYklAFTz2MCeYPLpS/6EMK0P7m2UZ8gmkwXhHcI6T0QNTTe2NzKMKuAF3wubeYw
         MCIE31sJVJH0+ih5gbPlUOhtfVFO9zaThOnxFWMtgV7KQfkfuG5dkBTR8Av92hflocdG
         7S4cfW6GaAyU7kZyI85R37D/wXHVSxtbRFaRmUiRu6Oxxe3IIiTxF97xBRKnLNRhGlPM
         xBNC/EXU9nL7mzEpB6Y2pNZXwVP2T/0Qy5HkL2CG0MPcrzLpjwE0OXvftsYIh8GWiXFQ
         sEYj0b+wrmwrIn1JwE+mzuP/hS5h1FNQ+aXT/Wk4SX6LWRSXDjkyTE9CNRt1fHGvuNZD
         YeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267976; x=1795872776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
        b=uHpaVAGApYMpICEtYe8OAaH4SQVCb9yO9A1m8koHJHOGwVcIOeeV5hJP7TOVTMLHhi
         9q8Bd/gmagdGJyhpdgqIdwNO7fijd8ADGkqYeCszn9mqKg7JAqPJ2rCRNecKD7htmX10
         1BU7UomI0HnF0tDlmK7totjkButSX39Lmbhzs0tQDB/FUNIQePLOs9wWGNnUX+laTkSy
         hsONVilhJxjn8JJ6N8Wa5k4yhRH36Tn54ElOa4nFIvu5DikajqVb/eiCDFS1J/Y3Mqx5
         R1yssmRLn4/aiYe9QFnHuWnT7NzihDSeHqnGBUd6LembxAzeHMgMFVlXzCKWQxsvfaE8
         58OA==
X-Forwarded-Encrypted: i=1; AL+hErGluyAV2jTcV6433mtM0hYhGLavDw1Sc9eTLO1BTzJEUV2zGkNxYpMQjYLyS52jOMdSX2ursc3pLe2XzSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OkLdtHulARK6yB6s8Jv3zwz5h3zNuIYcCqfEysGfu7WD5+4Ap
	SYHCb+w1zeyM3oCOv2KZ/i/5A//nIIlTj/tktdblHVf0Y0p/GpWjlvxp
X-Gm-Gg: AZFdTZevEKPI6mI5EogfCLIyZRHBxPIM4QkpNXlUjGpYrsOmLk7pz7IYVLVQL5b+f29
	KsFH5FtuolANytICOrWlYdJdWGA2LFCsj4p6PpBohEjXchyDr4Yhy/nGEHKCTMc68lhTNbnSAoX
	9/PFwnwWLco+nfLyOgD5Xj5F80i/dH4E/ctjlH4ZmA72Adpu5ipQSuVyEUYeTiEcFvaqA6/pQA7
	JIOmlD4UBNjpQ0Qcp35sXM+u4x/kTMI5Th/G4qf54o9m0of6+80Ts0HAt59iICMXj/YERxm6yHP
	1l0pnynhipHWlzhVhA/wVJ8onWywdxtYemcmrfH6aJCfgoL9gknScTQAtyqZAJL/JAhQMZ7uC1Z
	oIkXJgj+nkeh2OusMsjzD++hgZtJtyZ2c2em3wEL2i3J40fxW5/Q/Jrkshp79yA4YNauLfg7ne/
	bdA4B/m6xwtikIeGJ37A6+JicQpJjDVfCN/bohbccn8lW22B9l11sJcKLv2rD5f8cFu6U0zs4gv
	bgb7WaXpQ17gKswwdOwPHx4qomtWjZYaNv838XiQNJUonKDoLTsIs5ez1JalM9MxCyT69EHleAJ
	ofBlssCYQOhtqdKth6ZJrELTUzt6q4IUUQ4/OXPikuNoOmsFpYyBefItkmASoI6jgKJZmMKMnMs
	qynDnYbs57xPN
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id 5b1f17b1804b1-4bb8880f2d8mr120065625e9.6.1795267976558;
        Sat, 21 Nov 2026 05:32:56 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:56 -0800 (PST)
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
Subject: [PATCH v11 05/14] media: intel: ipu-bridge: Add the Yoga Book OVTI2740 entry
Date: Sat, 21 Nov 2026 14:31:35 +0100
Message-ID: <48564c62d0c08d66023a40b6cdc175e5af88fbe4.1795267528.git.mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 uses OVTI2740 for its OV2740 front sensor. Add
its default link frequency so the IPU bridge can construct the software
endpoint. The existing INT3477 entry covers the rear sensor.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 2a38c4bd8..5f6baac2c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -115,6 +115,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV5693 */
-- 
2.53.0


