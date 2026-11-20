Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164067;
	b=TPpsrazYyx1KWSNh+TXRFD55Duku3Zx+gj8FI5Qw8U6jo0RpZuQ5rI7E1FzhxawvvbMI
	 +U9EYXGRvVSHPOpC92S/zNu5BpxW3D/jHQy+6BMbbHhJCQGcEpM4Gkqb7ycrkONIe+cnS
	 +FoDQPpQOkjQR0DhrgnKe2zPLtSdzx78j5IHPFlvew0vJzIYSZUJDDicHisxUDDcmrEZz
	 DEkEwB2PMwxDvjrNroxzJzF0/+UyIjoOj/ynS1U6VoEGapXqg2AZIaqgPg2DZk9X4oIob
	 /vIUoK968z4vfo8CigMfGliwz5O8JFi2W2S2SHZJfoUU0FiQi7U7PTswWNLaf7C06oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RtiWbm8KIScPzP7+gVQrDHqSwiwXMiL4Ojhbg6OvNUo=;
	b=QoMJUQRYX2mpFEff4Dtvt0MMTRFXppEGQrpk3WbQv88qy2B0hKtAT7m3Pzr+WlEmhdTq
	 Y7iuxCflkLhREH2yOU0gJZfECvweKP7bUfSr1xVVAxCwBf2w4YxXde/7ZpytPshq9zGcY
	 acYOkqKNwVCPjm4ploLt5a0Op15jx/TWBnhCLJvU4AlOz9AeQPqvIQ/PRngR/i/1R8Y7C
	 IY/IC8155JZjG3bhriigbZ1KgXDxWPxy/SyESyThyApJh2N10W9OVLRhIlmSVP2b3aihS
	 IN0kVxrQ2zn44zfdT9QGnVirfcb1NdO8dsbXUCLxB/dc/GtXB2oURkG+/h0s9feDCsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6vS6VWp;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC3260A3830
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EC3260A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6vS6VWp
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3712b6d9843so553644eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164067; x=1795768867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtiWbm8KIScPzP7+gVQrDHqSwiwXMiL4Ojhbg6OvNUo=;
        b=L6vS6VWplOM9URretomgFujZAhoTdSfoJ2zAX66pifJCF/cI5mcSbF06OrbisceRGl
         bh90xvXb2S6z+Cr/HNvB12Zhbcv+56FLs6hwcEvM9zd6MLli71IkpLf4dmfkhsUmmmtB
         vz6j2DHQKVG5FuHUOf3ORvr/lKqkewIK4CW5MtgfLx1+hsU96O86QTvue0oi645hd22Q
         cKa82CzO0OdVZT6oA8UAnCqnYTLMnSWBaeKEnG9T1j0QDBOALWw/Dszb6MDgeJzQfhju
         HBwv6STamCDm3swZ2S8+XuwApLKq//O2ylCa9JFlEyjzU6QlsOgVmG3KqjW0YSt0tw53
         aYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164067; x=1795768867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtiWbm8KIScPzP7+gVQrDHqSwiwXMiL4Ojhbg6OvNUo=;
        b=JxFFG2sdvSjcts5MXkrROnDfwNPnm+s8h+eqbDRAJuBxeZ/omUA4cjQTVpxsFIQ0hR
         13Q2SRXoKnanJkND2pTVW9pFPBkL+FTJ4ZdjxoJ6AtsCf9nK23g/EGabsoGVhCptShm8
         ZO4iqHZg+qnbVMFSjpinP2Sw95IGPFDjPHhFboK6fq+IqRE4UgTkT2t1a+O+NsvrplF4
         62Ojux3r42E19soEZrnPN8F/zCbJb+S4sDWgYVZ0vr3Rq34HQu3pZSHWXzRhpOznGbql
         CzviYVPP6eDxfxFwDZxkDwOYt72DT6DEaGWX6e/DEsdu3ONFNpqQ9s7RwtjHVPo0DMQG
         G/0w==
X-Forwarded-Encrypted: i=1; AL+hErHItMXXjFBm+MoxUDd4RP+XGtwCnd44Qzs4xu5UYPjc4nYnftD5VMbBfp0Urpe7mju+bRwtPD+ic7EQ2/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8F14TnVWK99y4Ri+Vicmtw5P0pAbcz6Uy3kpDjtQPHM/7Jmx4
	lDwGjabG2nn8xAIHLW0qB+Ms+DJP22YYIZbuCDWZ/cV9Ko6GJC10N2Ka
X-Gm-Gg: AZFdTZdC2NbuW/JZ75kwINysHm9ElLlPANNIxM/YpVmOFYnadQ5XfoosNQdpiUlrTHJ
	EWlJAKPwsxrCAaWE/Aj8CuRuck8Uf0LonukEmtsF4okWD6HO4VGuYmVqPKkvhtK6hQublLiEaK6
	yrdGGK/D87V0hVKIdNKpRmYM4rWulgWyefckyiQRjlIf7HrQJoiOCBqetWyOPdITaKoRIq42iAg
	gkfvgpEsmLtaP1HqNE8BnxU/Q4fqpPFoHJ22wNxWRPEWPwXoISwqa5y9zqGqjdQlJBi5bjbjr1e
	BZtRYGuv/nCjV/8eJVsFcgbXw+TJ57pyGXq7/UFv5qnX8HhST12fLXfbhG4s3mh3+70+Vx6sMp+
	xi92WlCae0wie6nV9PzQngzBfncfJgpZ2e1Hci9Wn5V+q4BqoarLW1Nqn/f8N2ZoTuzfevxSKzq
	jgaenPIPMqW32IHVxM/KKrtdlxmx3F6HW8kRekyvxM0zJde2UpEgqT7LOMczaZYY+4zkZ4o5vmx
	7HNyWOegaarVD7PRr9h8vaxfVlhxRr7vqRnHf+3uMBlFZ2afRUMGlYN/5lec1szXbwHRyBB67oT
	3v1qLtVho7dogSNasbG3NlG/eBrVELxxJFVEXV8jy2QNjrKWzDU8Nwkmc2nWGJlEI9coQaeX0cB
	ZSJUgLe964MOYxY9DlxegQQUIkw5Ik+nu0WXssHM=
X-Received: by 2002:a05:693c:87d6:20b0:376:40db:faec with SMTP id 5a478bee46e88-3856f65f251mr1756514eec.10.1795164066585;
        Fri, 20 Nov 2026 00:41:06 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:54 -0800
Subject: [PATCH v3 06/14] HID: logitech-hidpp: avoid NULL subtraction in
 consumer key report fixup
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-hid-logitech-hidpp-v3-6-cfe2caa1d0eb@gmail.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Report fixup runs for all 27 MHz devices because the keyboard quirk
is only determined later after parsing the report descriptor. For mice
and other devices without the consumer collection, searching for the
descriptor fragment returns NULL, yet the remaining length calculation
subtracts the base descriptor pointer from NULL before checking the
search result, triggering pointer-subtraction undefined behavior.

Ensure the search result is non-NULL before computing the remaining
descriptor length.

Fixes: 42bc4f3129e6 ("HID: logitech-hidpp: add support for HID++ 1.0 consumer keys reports")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 6ac41b7d76ee..53c171dfcf96 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3872,11 +3872,9 @@ static u8 *hidpp10_consumer_keys_report_fixup(struct hidpp_device *hidpp,
 		0x26, 0x00	/* LOGICAL_MAX (...                    */
 	};
 	char *consumer_rdesc, *rdesc = (char *)_rdesc;
-	unsigned int size;
 
 	consumer_rdesc = strnstr(rdesc, consumer_rdesc_start, *rsize);
-	size = *rsize - (consumer_rdesc - rdesc);
-	if (consumer_rdesc && size >= 25) {
+	if (consumer_rdesc && *rsize - (consumer_rdesc - rdesc) >= 25) {
 		consumer_rdesc[15] = 0x7f;
 		consumer_rdesc[16] = 0x10;
 		consumer_rdesc[20] = 0x7f;

-- 
2.56.1.750.gf70dc682cf-goog

