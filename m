Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685916;
	b=2jm2Usb93ke34tIMT5wYpJelwNZsBNQd68Dc5WdXgqHcSwIzQUWjw0zS5noGOk9CH0Zi
	 bWzlPEmQ1FUs++7r68WHNfOpg4fVZ4VXQniW6efZNk73CrlZwpzcYMiqQHhfEZou6hQfp
	 NEMfo+oRDuMsRMITspKKMtnOaBjxLe1H8pteh4HDONtuLt+4mBovKBARrhNUOoisA110f
	 0AOt1Vr0LJerDK6iw4r0kwGXPIb4hQQTHgtFR4sn5sk+31eDtxdLlY3T01IitjtW9hfrk
	 2jwtoEB+xYbjpfN/X+rLkwU6q2zQMNgPYdaf1iYFCUOLo3O2ROzgiMAeOa7pVRQAxCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
	b=pqMM9tgIdAP8jQb9v1HyxT7g5qT0GfZESz49TiJmKWZ23Ir4BJk8FPQecFzJQRJUqW44
	 hpNodRqpJjuhglztq/GBuU5dAsFlzWS1mBefeZKZzLu6flGUpssCfGjsgNeX3i1gHHAWq
	 73R3t5hRlh/mB7qTcWWIpJNPPthF4CrHcoHsoE3USAyRZItdKC91G8UYm82o0pv+G3FIo
	 /kkTha3xG2s+8CumQFIKJjuzRtPl79KKnMLjyhEvpPBplycn7t2JE71qwQChxj2vf5cCy
	 uR5c3hhtnxvjIVewqlMPYn5JwPkH/i6o8lFskMwlcjMFdBlSyUrKEOg694bhPuuYyrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mspHNW9F;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C548B606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C548B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mspHNW9F
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38692f62b22so8543329eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685915; x=1796290715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
        b=mspHNW9FnADo+E1ymBnNgtLq5lsFnyrQ2XEib50gP0GnXtd7/P7RKZZRJCIHL1dQNS
         mO+0RD0rMQKzUf6/Zu4ApJYHNvXF3j9dWnU0LP4vJnYRyCgPM7vT4mWFd3weRA+iYyDz
         z8Z9wjMEBuRwu+qrEP8lSRVjHpYu9lHKQgCWhJKoxtl2B+bWXmc2kJyIkOSf1k5dHLwc
         gkpol3mZs7/WVitJGWL2dVNh5m0WgcbzLBc6g+Hqa3hc5yiaf/eodMUiwKj/ROYddYBh
         dKEXyyYp2ZItKs4wtyqzcH3tZcvHAp163PDcMVwqKXSbW2g0v7a12tu1Dw12eiZUzh7E
         U3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685915; x=1796290715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJjcEC6A3l+rkxqAUXBKDBDeimXRqX3a+RszRTJllzk=;
        b=pEOjGyttL/I+HD//H0pliyBAN2P4BIL2isKG6Pjqo5xrbpKnXb0nOXZdIBKQCYevav
         MIBf7wfnNYKBZObdQuPwBRLYTbj0o8twt61NAI+PtKLklx0NcwY4BOX4U/kuFlvsvj2B
         Lm7AraVe/mJ21EEOzgk8ZY8cSjPGlUQ54OD88p9jTAg2wcivzhuvuz14OmTcGgPUL7kI
         WNPnPLFF553nFZPncBPvmiYp42mpzrXNStaxIX3uM6KspbyvR0zflgARnCFoXqgaNr2l
         x0txzOJbJtM1GTOg8Ql17n87K7VkdWEdl0uTGdACZhSL0V3ROF5TEjnxk1FTSCUcbSoG
         Y5JQ==
X-Forwarded-Encrypted: i=1; AL+hErFH6RN8lqx73AazC/ovhhk9tEa13ybrbrB15Hy6GAsbWKoJC0wiplEbEZUOg/fEdg4vVDtWgy28NJMUaVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R6b2n/5X3pT2RQcyCng3TMBNUmGJaB592gf7L2qSruYx/uWOj
	yD08t8vFm0uuyKPEa6GvponmmrgMUBw+GSCxm2+nukswz+h8rC972MRp
X-Gm-Gg: AZFdTZeB2UNjTWkbGsclamfjYrS1snhJwZsGSpNfNPYZKU8mxwLG49DUZVDicCQ6wiv
	U4lM7sBUu7Q/wpS6tzN8iaUfXVfxSuEhCwV/2AUSVp4CQEQYT0tBkYU+WbdQKSlsMWqSHbXgFvc
	4+bO2ne/sMJ4fiB3W7jLjuJybx+MP5h7WBjp158Ir37HJ8aLDZ8iPV6KoKTq9Y0b9eJ7Xva5y1g
	wm0s2+GtnAbRaBkaEENu3A3bSG3JIqBDMpl+jGulC+TqztRZatjYhgJwRRa2vabysz4vrU+RzQy
	y/me7p/GFY9Jg/JdOztjffdimeUwjfoYheqlLxPys3mp2JkLMkEvfVCLtsISlVWGLvqNNKWSr1c
	VT7LrAI0qFBJcQDU3FNPHQbRyfP/HrUEzEVBxGeaK8qDsv2c8UOYA6J6ydx8I1GsucBwXtT6+2Z
	/D4xdIuPfoRa9eId13I6c2Zd9p3Fm4anRWicgp388ilP+0ZAOEzQJ4+L7KkwZCuAbQGQFmTawiC
	ZRmHTFGaMeMoEfwII30DPHS2YhMKPDJsiOvZRLSLeZO+iFr5K7/MKCBtksykTjdr6nEXxkn8hku
	7rnnukUEPcZ/ryJrm+3ta5/yWzzWx/MShj5hpqwfQTw1xT1xhgXm
X-Received: by 2002:a05:7300:d401:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-38569256f32mr18976622eec.0.1795685914859;
        Thu, 26 Nov 2026 01:38:34 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:34 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Thu, 26 Nov 2026 15:08:18 +0530
Message-ID: <20261126093819.76480-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126093819.76480-1-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
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

Describe boards where the TUSB1046 HPD_IN pin has no usable HPD
signal. In DisplayPort Alt Mode, the device can be configured over
I2C to treat HPD_IN as asserted.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..a512df1bd6fe 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,13 @@ properties:
   reg:
     maxItems: 1
 
+  no-hpd:
+    type: boolean
+    description:
+      The HPD_IN pin is not connected to a usable HPD signal. When DisplayPort
+      Alt Mode is active, the device is configured over I2C to treat HPD_IN as
+      asserted.
+
 required:
   - compatible
   - reg
-- 
2.50.1 (Apple Git-155)

