Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447294;
	b=T3cL28TKQUwoJFqsIMOvG+GEa+clsb59thDRNNBaEW+4Rl1Oc7UrHyn4H/nofcXjWTWC
	 W/CbZ8fL9YVyPXP5ghvWXi7d4CK846u+xaAphWU1hPoCNuxNNBtChiCyKN+jEWwEHNy8t
	 Wh//EkfTr4p2OCfxqi4cMnD1Ukr0iYezDsC6aCIO7YuXZntfk3Es8ywkGUGAjcGk6vkpI
	 r263GmWjWGnvmPZKQdseH8N7dtBBJf1OoawviAGgI3CqDbByXss1+HzbbDrSILbiCDECq
	 LrCHw7oDtwt3Q5jP5Ul1iJqMKHEwsGdB5w3vyFOJKLEEzL7/kjiQLNMEw2EYKHusTjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
	b=INaL80nc4Xo6/XyD6+nWf8lQwCNoG5ADVfLUBQsvAV1UsMejMkZ5AroWJ5cQ6zhbR+WJ
	 eB+oDGBnC0S/o1d3XbSa6k+76AwNitIvrPshRLMX4KvsM34b5XCbUGx3gsQs2HQ7DDhjE
	 xIYFHiTLMQfAR0phZveRXiLFjQlwl4878/LzzgwVclabaymOlQqs0KrazD7uo9lmNp5ko
	 1AGmhIY4O+XWcG411H/V9JNvnngTTfg1ccJM0eIe36xKmBVaZJ/mgPFB/RVK6GCtf4y4c
	 dxqhVG1w9taG0kJ8NzCB9DScbgt4FRSIc753psyh65CuOVyfaWEGKxBPeLuIji3Jr5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sevo7jMm;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2C9606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2C9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Sevo7jMm
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so5292105e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447292; x=1796052092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
        b=Sevo7jMm6bksXy8/ba9SBgxeTty3YJuD8V9D7GKyrEZ0QtrcKNwUH5/coJbaxYDgZW
         qc50RSzmYf8z8Oci7vMb5EJi8dzR0M8d+Rz2Vx50+ey59Gzoi540F9sxJ8da3UnVJ47S
         AgDAWZgiYl6r/CKoRuILxpGN1ZlTaqYbySmIqlanUOG8AmflyconG2n4Zs0OGzWjOP9Q
         FZVBXCwhkVdoBNPJ8g+3YKAxXKS+dy+gQrIlXY/PTEejOAa0axYO8CFYl1lhI6kRFm7b
         CH/0MVMoRvSp4uFeEYUpnDbHRh4zmWCdhRCxZw1zFCaTf/pSjPsqulNV4l99PJ4gzo38
         gRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447292; x=1796052092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
        b=gfqa1IwRDXZW8qTiOXtfnOJMqrSH23Gp8ETypl5AFL7eEQDKQl5vqXn414KWprxE3p
         x/VrrAX7IngtOYVmalVgfRljuBQjTUqgB4e0ahUhwaNfTMWGTlb9Q6QYGfo+WJL9X2F9
         jqYf1nCJ5kHVT7FwxV/fSGs6HguNrLJxvp0au8/MMkK0a3aoImrm54XQgHYEy+qpPAZ+
         5+yvf5HsGgnXuK3Plpr+DHY9vhvx7rl05bfMnM43aRhuc53ZuDxUz3I4Z4CNsT11roCY
         xDqz1v+TRpUXmO45ofokI/Y0Ffst9W3X/uJPMfMweAL+cZ5GKpztNwDknFj3NJk9KHdJ
         w9/w==
X-Forwarded-Encrypted: i=1; AL+hErG8efeJIwn+OqNMnXouQsxw3U8YQP5GVL1JaRRXlhm8WIVdG0P9Wc/SNrtFOIke1xVymHOySxJNp0kbq+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aYyzeuNYNbh8FVErRQb1+1aSw3VFz7I0D1NfH9EjlsvJ9JwF6
	+aP9HshkXz4azOAkcDhxuaWZjUO79tMiEH4cd1rC4mw7u9K8AjTeDmv5dQWnDLO/VMY=
X-Gm-Gg: AZFdTZco0WUMZCjjTT3RmNBzDiqpoqfWgd0AECrLsMJNlX8vPWlXAv/L98CHCyT+nIE
	43d008GIX25EXItcxHvUHFd4uQ5L8hrQyNAFOMZM7QFrupuXLbMLkgsFvta03iyE+ilNZv+nHPp
	whLFiV3OIkaG0BNr/NXKEwwXWUxHxsSJfnR6vKcYIiUebv7LNHKfpySYSdUdaa1NiWK+/o2uaKr
	w/70aeeo4xbh+YEn/M6TNw8PC5dckXmjsbnkwngy591yB44TqoiA5XEgk0dkDzdpY9GawJ+LNF8
	m+/TZPKZfsBGtXPdH0qoHcfri+wqonRHz8hm4giltDbVPD39hfQWDjGhkR8syVS5Fd3bz7iI3MQ
	RH8xqNYJUXkcPgktHSaXutcNAyznIsWaDkDJz0g4a9GAagPRRtsoJse59dSStAUHose4NIWL+8Q
	LJegwDCx2ktWa7oMarbXr9UT6WK+Dc1AFTgoxtJJ8gyt60ZD1xc3QJKlSmaKYH57msbQUWp2t1S
	6yDojVtsLaS282tEJi1dwXmn39YeDz4iT56RZ3fDUR/yddbazQNrXFFG1Po6/C3qapWRMM/2bUV
	lBAg7tqJS3tGB8m5VcOt19+YjxLW1Dmx3DJirmAtenxc6il57v0=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb88816050mr253067465e9.29.1795447292523;
        Mon, 23 Nov 2026 07:21:32 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm351526825e9.5.2026.11.23.07.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:32 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:25 +0100
Subject: [PATCH v3 03/10] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-3-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Return an error instead.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 18761ffbf893..b071d31b5c33 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -265,6 +265,9 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len < sizeof(*r) + sizeof(r->array[0]) * st->num_returned)
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.56.1

