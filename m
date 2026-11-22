Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343337;
	b=dif6gxPSGsbZcAxdWcJErFB0+wWje27s7myee5TE6C/klpX+q8z1zXtFJd6FaXSErY7q
	 r9nJQaK1Ha/lUyZeRIckRhrQtVqGcgtDg09orfhaKHrjqXxrJrmD/7zTPXYrMeEPgJaqD
	 84QO6w5LSuyUF2f/rvAd+5EHxl2b/7H3zossOTztDlHxysWoSw/9EqQJAX6FcZnrIgys6
	 1i9kBb0P+CaISwW7OKulGJ0WoddiHyO2ucMrqUZ1Zr005jk/3OHuRcpXk8I7NjS/Zv+yx
	 HTC2u1HbM3T123eu3I7SwaVgj2l6/INnD54Xu5LED/iJul3i9a8/sa+s4Jrmi5P48kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
	b=z61SigK5U2jzwYVs26w0mhsgwVmaNiNnOp5T4P6NpsWYVoD/wEvjO4TE93tW9SvN0BtE
	 DRy/ZnD6P+PV9g2w2Ujc1+lyhTxwmkU97QlObtEJSuDtjbD68IthlUGEmkyeuhKak7NWh
	 4qov5kMWIRYNCvRnJggyqysDVeDDe0HerK1vh4GQUfuvHu3ojBhzc0UayyCG6utajImEo
	 iYu5yCFyW30ntcozWsKWSXDwI31Drqm3fnACK9agWfMbfOVnnNOGgmpcNP0//PdqEvt5h
	 IJAEqDwDE5iWQUnZQ+4dM7iLRxQ7Yrr7VtXNEHGjZrE/QdxS2VAc9GINi7duEcjP3gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5SErA4S;
	arc=none smtp.remote-ip=74.125.228.138
Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A31C606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A31C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5SErA4S
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c4077bca4a6so100807466b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343335; x=1795948135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
        b=U5SErA4SKPMPlUUC8Hpj3tgK14H8t3haFRITvCal7hWmO1uQCJM23eL2NKSL+3abov
         t3Ga8hZjRhzvVJ9cbw4Vb7N1YpXch3MGgNvwtd0JFW9deXQsvKqE0TwaJazOc4dRIvu1
         A+bpYcoM/yNfmL4mNx+lNMVLOZqXuHsJKuyfndLRis90ncrcwXqJJTV/cR+xrjDTftiT
         uwHZqkkDG46HnkkpVn7osItNtMa00RW43rY6JIT9X89ugjEeOZaSyccC/Q6GDKYy2Px0
         USA7CviCcfLYoNdig0G51EYTgKP8yj4hbHGLxU06uv1f22bnjpU2zE7+sMkZ45gH9eUJ
         5Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343335; x=1795948135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
        b=WcXjlmzkF+sRO/Z68bqXKva+M1rZByGFHXKyAKrLaeXi90UU4HW/pf1mtn1x1hNTAO
         QfLlMfY27k24xu+pIrfRIZ1p/4u6Im8smxz6a/HT2w/tRNfYR6DBflA+AN0hO2Io+B6B
         gEHB35CAVNbrW3fkckW2RnvhgWbFHwyMWgZSlrtDaw43gxD8geAQXAR5w4LgZnrykIUV
         f6cV1pgqCklJpCEMxT2gXQqKpNVCZTvMQSuMPvU5giu2tEo7KHYvoQ9niXP0qkMvJnu5
         5bV3phl6QvmxQoL4yimQkJyEs2nhtkWPDeUcrMSpANfGaRWv2E+rPNHdYQtrpB+CmjvV
         r5jg==
X-Forwarded-Encrypted: i=1; AL+hErGbBecLLPKEB/6+O59rbO9UcGGc/hb8wKuY7zYPb9tWH5VQmKABGx/2efGNFjCayQ3IPREDZcBHY3krXY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3e15JgcW4Vp6vA2TyB45i1LivkCD4lLj7r1tms/ieGsIJ5tgF
	duezrzzSec5vrxYHeIMO/uFUIfPhB3iMUBeQYfw3qmshckKS5uEYKJg=
X-Gm-Gg: AZFdTZfstegXovQOdD3WgR4q5QRQSv68DsKC85jAiHt/wB5Qo3QGDVNa9Q7uZ0GlC4a
	DcsJcOnSa6PTqETexWzyfsuQsec6N/LNzI3mKBXT1DjeXSH/Ww80cL0YvnyLElg9LuhhKgTC80S
	msBr2Y8NCxxUqd4lv2q+yCF2ZxJwbnq3ZSm0nvif7DQM1y8sUbd0ipgD9FDRvvYyr2bA1fDshRA
	xeuuZtBQvjL8Eg808HWI64kwAPVaL3Eu64i1bOwhB6ofgrl+LUctVbpQYhnzymJTqF2wgQ+bIwa
	B8HTsXbivc+sOrYapYbIdpghkPXhQ9lzyh7JlYnGY02RR1LlR1t36Y97JA4looP9WZZ9Wr+tcbe
	KFQxZp8yBr2tBzExlGtL+payNjhuKQzANy1NfueWXJxGC7OyuwEGNHBEtBHgiRCbrtAB6Hogh8F
	Dc0TKF2E4Y6idP7dytaqpSWFR7vRRh2LLPq5aDVnDK/Wi+ind+WsFoCRZLYS/vpxGjcaZgox9By
	yrxhSCYdivlc3ufTWO0LM1tH7dnyQiLLbaCjDtVq6ZkctmwvmvPASVIYM2hKzQ7mDymyN2UzS81
	i2Wtlza27krjhwv0JLeRNQH12Kh/Tdv63pKfT5wOgoUm
X-Received: by 2002:a17:906:5ac5:b0:c46:b9b0:8e8f with SMTP id a640c23a62f3a-c513ab1303fmr511361966b.41.1795343334777;
        Sun, 22 Nov 2026 02:28:54 -0800 (PST)
Received: from llm-01.drunkbatya.int ([80.251.127.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022b2bsm295252466b.83.2026.11.22.02.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:28:54 -0800 (PST)
From: Max Andreev <drunkbatya.js@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyle Tso <kyletso@google.com>
Cc: Max Andreev <drunkbatya.js@gmail.com>,
	stable@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: tcpm: fix missed frs_sourcing_vbus() call during FRS
Date: Sun, 22 Nov 2026 10:28:38 +0000
Message-ID: <20261122102839.2902079-1-drunkbatya.js@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Since commit 0908c5aca31e ("usb: typec: tcpm: AMS and Collision
Avoidance") the TCPC reports sourcing vbus while the port is still in
AMS_START with FR_SWAP_SEND as the upcoming state. Because of
_tcpm_pd_vbus_on() ignores this state, frs_sourcing_vbus() is never called
during FRS.

On Pixel 11 Pro XL after an FRS from sink to source the phone keeps
showing the charging indicator, and about 20 seconds later VBUS drops
and the attached device reboots.

Call frs_sourcing_vbus() from AMS_START when the upcoming state is
FR_SWAP_SEND.

---
I'm not test theese changes on mainline, but tested on Pixel 11 Pro XL
vendor kernel 6.1 with the same _tcpm_pd_vbus_on() code, as i see
mainline tcpm.c is identical in this area.

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
Cc: stable@vger.kernel.org
Signed-off-by: Max Andreev <drunkbatya.js@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 51e5c72799f2..5caa649a92f1 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6889,6 +6889,11 @@ static void _tcpm_pd_vbus_on(struct tcpm_port *port)
 			port->tcpc->frs_sourcing_vbus(port->tcpc);
 		tcpm_set_state(port, FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED, 0);
 		break;
+	case AMS_START:
+		if (port->upcoming_state == FR_SWAP_SEND &&
+		    port->tcpc->frs_sourcing_vbus)
+			port->tcpc->frs_sourcing_vbus(port->tcpc);
+		break;
 
 	case PORT_RESET:
 	case PORT_RESET_WAIT_OFF:
-- 
2.47.3

