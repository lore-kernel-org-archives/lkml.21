Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785906;
	b=4FjCwpXGUS5UwioyB/QaajIE7sgL0RKmf0sZJIMYobEyRRd3vYCNRZp5L0ZAvg/t7xW7
	 98TWUifs3LWn1EdXevBxssNAHp/DPT9CvHRdHBDL699Z0nsSuBYdpN6PO7sqteiDm076P
	 FlgDwfgCzZvg5ZxeKjmqbvqy3mboE7DSX0OSsdOy7FIr+PJRUCcNZY8x7hFbEVIzNuuph
	 S90BjmVaJ+PQAf1zXQH+OvpY+BdC9K7XsoaRMQQ6U4B8uMBbebnJsZwdIKshE63C0mz6U
	 59V9UoGiZLh2H1ckgkp9vCtnmXJkILemCdAInzxBij6RqO/RiIkZHFUq+Dv+kvmem4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
	b=emgaCxZRrBKhkuGU5+fqWSGfWvwkTXEc/oEC6Qe46xd5VZMq9HN2SQazlxmwKW+EOkSN
	 Q+SV+tBWJYAQZuCCZUPdMhV65tdcaX9uM/vEjlRcq597uNlUmlWXde/mSWPl3SuQ6Q6E3
	 0caJqIOqh2M4HUTSEZUGA3bDcJ/i2B/7W8HvgU8VA83HaR1i0yrksylJ69Q5utGOA6N7Q
	 yI+gzeT9n1O930fALFPVDc1XDnLm7opePDKfnrGlC04H01ehIEvcOt5CPDR+0n9PFEHQS
	 TaD20KcvbQUhE3bHMkbtF6N5N5zh5IekIrb4VIwMqQiQkHyeKjVL9qQRmib5O7DDWdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASRq3L8l;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A6C606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A6C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASRq3L8l
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3863db981d4so11384440eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785905; x=1796390705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
        b=ASRq3L8l9m3LcjNpF0t+eQQPUJ9Fwq8EvMwI0BCwjgm3gdwZXYXEOjfQMTMWra9hL0
         8xz3OMkXgnsoDvetucfD9dY+3JNOzS2JndsgC9nZ40RTewuWaG1GIPQuulocrlONEYvY
         aCDXfa9qMYpHATNUIfUftcvdb9G57omxSKu+LkTEArByW0vbZAg7A3DzhXNpkSmi2hbX
         IjOLD14TmMQHkU7la0SUtLfkmt2vsMhcpNqaPBgvvP1MuSb+R8Rc5pdnchJiD0tK+yRe
         FQ+6a5jX8pvoRDPRC5HmnxJkjfgGqqbw65ngjT0En8kdYFjSMES0sLeUKDp1hd9AbonI
         4VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785905; x=1796390705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwhKEHOyEO9+u42//0OCYUbCH+AxqOH0RbDIKj60/dQ=;
        b=h+4Y6WuelonWfQWYbmAlPcxyOJNHeLBEq/8MRMvnm3rpsw+Ozwvyr/U0jTfxZR6o/H
         AjiqmaFQTmCJF7g/NSz1gvL1VFD1bHGkKLrjRz5bEX4YvE8Y2MaCt2L+98vX9uS/5sbq
         ply2eIsb9EEAExmBwgmCKbVL514gwLO2aIJcRaie+4ARynmkOSJEBxZk3jFUDEi21cbz
         pXfKG6/Twq2KexLfePJ4NKaROUgJMwUI/XsRSjOpnySQ7HNCJAnBGeLtp5W7en0BBF87
         aqvOxW1xNDigNlArJf30MPdKUIwdx15myc8rlxTpPEQQxdOZZqovdWCsXtEZKolqoTxV
         b+Eg==
X-Forwarded-Encrypted: i=1; AL+hErEi/v3y9JSYZi/QzjvYxPhKqFfDuKaqeEuiXwYPHiO+XEn/VqnhvyxJAnXPV8Dhb1KnZSJeDigsOry0UdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IjHhpFRwTl9VSGVaVcq1/dBM5ehyJvjo9AxAyfoS+yWuCGwmp
	EMNnneWwA8FoYOZOb/OtjdNdp5hq0eHBQWLLBK9nOJwiM5PlURFrYUL3
X-Gm-Gg: AZFdTZfZPE3l9NfGBgnj4FY//5gb98eoA6DGFXdZeHVZtQS16Kc9Ginule+JvhkGSQ4
	pd1Vhur+bc3c9Hwosy3lLWF+puJYAAn8GdsodFRgO1SEVYtFlPa9N0NgURfIjNViALSWtmJMzUr
	+EM7x92ggJMxOjhHh6tl7qRcNlnJpLs7LQG9s9UEz9O0G/sx5gd3KZmkmLSuJ/TV7G4KGzfRPyY
	PY3onPEW/Bz1of/jKzev4YL7OyhKIyBFonyNY3KgBSr53feyd3BwOMYRSZKckKhKWMhidKfhXAG
	7Go3eW6orTvyoXTPtMom6197gTrZLD1PH422kaHWYjbfYY0cUXbp+KgXYtFOJCqOqOBN4cmuw9r
	oEOosBOhY9W4usniueupV1CXmxIwQmXsYp85/BIqwWTkAwGVTrpLlR8Yk5xx//6n+5YZmMBoDOQ
	SBueBiUrSkRnH9JKX4/uBT2mqEnxib/boZ2AS6ZKTNq1qHHa4cHpHmvZ1kYyBWfeir01gQ+R5NS
	ua1x5nWdQzde/YinFE5VDyGalfWUpjX5IK9jwxB52Wrl79v9N6KixuftWIBZR7PjTydocujwtgW
	SB79XN8QZ0TE9nookMcT6FAa+uhtVzZqi6zm5324yXI9028pG4hP
X-Received: by 2002:a05:7300:a506:b0:386:c960:278 with SMTP id 5a478bee46e88-386c9600557mr13797608eec.17.1795785905017;
        Fri, 27 Nov 2026 05:25:05 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm59082431eec.1.2026.11.27.05.25.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 05:25:04 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Fri, 27 Nov 2026 18:54:48 +0530
Message-ID: <20261127132449.89081-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261127132449.89081-1-blfizzyy@gmail.com>
References: <20261127132449.89081-1-blfizzyy@gmail.com>
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

Describe boards where the TUSB1046 HPD_IN pin is not connected to a
usable HPD signal.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..8d09c98ecd42 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,11 @@ properties:
   reg:
     maxItems: 1
 
+  no-hpd:
+    type: boolean
+    description:
+      The HPD_IN pin is not connected to a usable HPD signal.
+
 required:
   - compatible
   - reg
-- 
2.50.1 (Apple Git-155)

