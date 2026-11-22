Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348512;
	b=ltlCBfD17iZMI+H/bSH3xpyQRGZIS5oQzrFYPzZlbPWU3C5e8kPnppsosqkoNUd4OOJq
	 WgtXvpxddP7aLt/o0IxKNfjvXXs4CWOJ2Q6CHkFQLucZeKQbZoNjjr4A5amrOWiw+2/Ce
	 0Us/rW3Txs6rqjUFq+IviXusL8n+d7I7SvlP1mXg2QyMGnRkyMfmbh8Q/DxRVDhH1VnFx
	 tn5xR5N5q1LGgLMYzbiQg7SG3wLpW0tx92DAQkpbsytZ9vb5WeuOnEGLJqMe7w5cSOInI
	 i6Tsc9x5YHHGrMI1iTbmua8Egnt5gurrJzu/dMNvsHS2jbQ3kYYoSMTKqv6Xk0HeKZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
	b=Qx+tFZJn5IdrMiZvHm+8Bebt2jFrHimoT1ayKKewSsiGLFKc3rWVKrQfavwAJN30R68l
	 jFtgL+T6iFfrBg2m9TiyzPwDU0TYqSDS0BpkzGtsDp8uSy9ldAYdJaAFStAZKxggajAJS
	 +uY9wZKb0YjTCxU1gzJUa+IrIe8x3F8o3itlIR/Q4nzL6vfp6hd/yVov3Q4lv8MTmEgbm
	 cjq06EOJ1yzmEOWQh8FauKYVEGu42DGtTHPzYn+exxw+4Vspvy275dneGVMs/5b6jwvaJ
	 GPE2GEotHNLqZChUZEDvqE5jE+b2JLeajgB3nG/etgK31I3uV8itAwk1PNg+Zg3ZUJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZN2r74KI;
	arc=none smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6B606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CB6B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZN2r74KI
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c5055590e0cso118326066b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795348510; x=1795953310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
        b=ZN2r74KIziq21AkKRBZLDJ7DvPxD7SBxD19TzD7BUqNDbo2zoEoww15mGDen6YvL1h
         zwLAajjPeQcRT/hPlTmh/eQGAn5KKB2wx2KYWpQ3FWE6CV5UpyHuWeDQI8+xswW4UFpG
         p4hWKBucX9xkypVNyEG/2rgeTSej6yYeOlCCnD0rT0C+ya5haMNRyHZMhU/QrGjQGH7/
         Sb44uYB9E9sjmlNdWR2oLooBJzHv5YmquQi+5sgywXCS+a9FvJdk5cgK3nHYl+Er/8BK
         RpqUoIcLBNxfp8ZxfKUHaYdZIl4AMtR6xIZGE6v9KWJrDzyBy1H6aE0RQ6b1BxqpXhyG
         u47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348510; x=1795953310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
        b=eWIxiLVQG6Y5IKa1o7G725tmlyTWAAE5KRmkdr6WW1V024n07AI4/Qi3WY9gJIa1ve
         V2r6PKL4+1E8fhxCoKRYTO0BdPh60CCp0UXR203tWR0VOOm5Yy6HtzAAOHWOFLEaw+jF
         ECi4T+Jhei+rZhqhKasVeZd2HV7Txc750rw6fJv2SfFCQly70GPnseQWzPHnlp6ek+rt
         /sHZiIu9w9OLGuvp2Axr/8FvVpcXD9IEG2Gyjdnkil3LFhVAS85szUcguoIwfmYT7F4N
         GvW1hb9AswmS46T8yLesiTqn13aVLKXqHqMxQAGiJG8itb5BjSToJPqb/84Eq66B23Lc
         7vrA==
X-Forwarded-Encrypted: i=1; AL+hErEhA/+kE9clLDjA8ycMg1p1NbZAjjs/q/WmgJbT41NMcfjNAQbrDIcT+6Qjr0o/wxPxPkCEyfOojBPswyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8djxXh8GSSRlDdNSSnyTOZi8zKDmsNwSeFQgOrGXKgVIaZStol
	5EkiMfYtRr+otQhdzgcRan9vnCy8EyUtTbzZ2/4LMBDA6jMiIpr+DeU=
X-Gm-Gg: AZFdTZd0dtbeD6CTT9bvvKLhDopbwM6+HgrJ6fwAiOtMT8/GpagKAqTz+60nmrbJkiu
	sBZ7F5o0+08IGJB8HjKvKdSCtNo3xGlkesg3V8a8GL2XniELVqb6o7adZ6usHY1AdvTHv27eXZU
	3d6O8/VwFT5WmCrp5uH9q2YwPXhenr3jN0ozZwwUhqwvqAMkgzK7CSORhoO25XsHmhpkJH3Z7WQ
	xk0+Z1hWb2rpuIsu7CwSP0Kiuw5XPcg0q3uc5CMYJAaObr5xuMmBtwr3zPEq3HVv/Do8z2J2+PY
	5VrmdJQQE2CJTeR64HFOd4wzY5YUa8uXtwMStbLALOcKRRUxDwwrm+APRK0nE5P+XR75y2UREAw
	OYzokebetV2yjKGWYmvs7dUnrxiskX50btcHuLH/CJom3iqSuyrR+ZFm5vOfQ2S1SHVKfcfFWSQ
	j0T7S7jYOaistgaO7MLF+Rpt/X1KNIZWKUXpvbGHLfAqbGjvN/Mz6iQJaHIgV44Uqht/e0HxJ67
	km4zLhuVf/9hABk9wALrO0pKEW333pIBfL/8iKewViTS5TZZ2nGbVUIpd/m3pfViM3LXUYuosFx
	LWoUxhopLqgwYUPX+AvMwCWhkF+zGLCWGDUZZpCy/dGX
X-Received: by 2002:a17:907:6ea8:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c513a8069bcmr771965866b.19.1795348509787;
        Sun, 22 Nov 2026 03:55:09 -0800 (PST)
Received: from llm-01.drunkbatya.int ([80.251.127.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67bd3sm299486666b.27.2026.11.22.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:55:09 -0800 (PST)
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
Date: Sun, 22 Nov 2026 11:54:53 +0000
Message-ID: <20261122115454.2912448-1-drunkbatya.js@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2026112206-lapped-unvalued-8696@gregkh>
References: <2026112206-lapped-unvalued-8696@gregkh>
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

