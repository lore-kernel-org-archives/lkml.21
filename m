Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164071;
	b=C8IvmKB/6nmAfaX02m3LyxOL0dtRu3KZklfvRUmxtbT065Fi/fHFMnxxprtryi8McPxS
	 rC404n9N2/3n+C4/3Iym4RbZPbuYlSRLKabILo6TaxyvP4PN3z9CWre1w1HHk5BKqgf+3
	 1pzNkoO7lVjR4zooaTmfHRgTgqH7Sz4tN8A5efNB4FJBOQIgudV7sbv1tqDqE0GSL1eGB
	 wSLO23PU94vfFib1dI0sbZ/u+bV7CGD1jzjfeGMC8dgwjvRWylSyGaiQnjQnVfc8sEoSf
	 72l58JKvuj3xbi1rqPMWEeVY4UvxdLRzvmrojRWxvaeRF5idf42DSq38DLMnjWngr9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+q+bk6wBeU6DAMOAVWLCyHDeeW4f0hRfi2USDPpSdvY=;
	b=u6KYXgU1QTju4otUj9iSeNvANyb7C9kg2NU3RoBN550ySyz/t4YxovLcHNhXIgyfomiO
	 N6p/1xHh844EoVTb0IrUkmq4rkTDm1qs6Gv4ek/PvOgZh6pXT1EoFNr1pukXVEVOwfvvO
	 WYXUd1j5LJURKR52ROZDjAhpkCtpvGbJMa5rdAF1YwEapOBMmJTu2LAJ32tiUzy8LZT2/
	 DBkoDt1GUYYnoQ4iCJMlVno5klWnzmEr4VDUgx6y9rav894xURWUeA4CWb3Lq18d+XOzG
	 B3fsxERW9Q3L1KkM+G23mlMsYnr13J38MwhxFGScxQTcSYoPfaKXwldTkE/2IV/C6iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFxXblBq;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B718160A5BD5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B718160A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFxXblBq
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382f4710a17so1023023eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164070; x=1795768870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+q+bk6wBeU6DAMOAVWLCyHDeeW4f0hRfi2USDPpSdvY=;
        b=BFxXblBq1otoODFiqEI2i/efkRllhYlVxPiXINOyzCa87lxGRzRvo4ysEgErBhelYs
         8k8DFKpTnbFiViNMEIcQiEl7ek4JT8smZcZwR/XoEUg0HXOQuXzyfIWYXJ3Dm6erP4ar
         JYZ1oZQQ5uDIg+6LlfR2OHha4IK4Ub9DWeLmUuLsYQwOOWF0dl/zF0hoiJTr48raameH
         ZaUn6fd0Dp2ppnh6GWoz7swz1kHULWeoKiqN5seP7dAB+Nd9/y/JMeQOQeHBW2+7pXCb
         HGJJr8XQjTy4uB1JCHT5Q0FaRY+004ORNMLRjWvcxTQ/li7WDeuwUZeG26j1d6Qo8OJy
         Jowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164070; x=1795768870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+q+bk6wBeU6DAMOAVWLCyHDeeW4f0hRfi2USDPpSdvY=;
        b=GM8bZRxZvwiKN3W4/iJYkgaODX2GZLlP+mhMN3j4iTdQQNS5kUiLij2HqGg0eWkcQW
         fH7jNd+iPXjb5e+YkHTyApNloNCdwICYFIfiGfS8JmIEwgWnI/ctd6VV9BrL36Q3Takl
         bvdhQRIU7bFqL0Ry7wJNwZYhI2DU6iGDG6EYGzFFw2IFJ8RV90sN/U0gtgW76TIGcNBO
         ZEPQjd9jidsA4z67FgXFOinxHYkjCSHDzDG64PEKdkkd37Eva13vZAAYQqb8dmqe5Db/
         eK0jCIA5Ve/R0lYJwbXyEPD5SBDjytE6oek1I8scjeSPTaKTEndRxcSLdTN8+kWKRa8Q
         YADg==
X-Forwarded-Encrypted: i=1; AL+hErF5Uu4/5WB1o66eA2N4C78O/caaU2m9rBtikVlnhCTGCKP7KQ9IGGJNLmZlAuVBwYdlfep0YotkX/kq3y0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VO2g2Q+cVH3R65kqOT25JPgvgx5yOV92NaocHjTtSR7P1gP6a
	KJLWWZN31272fMTJoSS7aJUplAvU/pJBBu1XHPMtMolmodaNJ856VgfP
X-Gm-Gg: AZFdTZdiBuGnKyGuXNYYnQSfOnLeDxRZbElx8+o8OhAI/7IGe8jKZDgEy53d1Kn7Oo6
	YrL4/G5WBrESjlBuxs9XRE6rAGlg2/upuIZQxhlsnOZI6Qnt3nOSTbwE+yBJAQh4r5cg81jTji3
	EuHbRlf08/xVbT3w3BUOgFpBjr3Tn9npey8qlH7sPInOY1eu/LwxIpotW2zi+u6hQmsW5WB/Rxx
	WWKk1X+QY1OwdTAWxKFAWOs63gWAtgb/3xYTIAq8ro5JksSeuUft9LbIHXdBm07JQVRuCVASQZm
	9yKkNdGY8MwRqn9KZJbRTQIRqIC4/eL8KhX+iSfGaHAx1ALrH7ZRP5r9zgA6XOuC/8IOJQYJGtP
	HCscsdKHtSI/qWgaWSrpCMO/YAT1YZa8JdLrd3aYKB/ABcSDbnTW6kGQOodIJX91uMK9Caz5w/N
	M6qlUPQOZR7Q5PXa+bCDaHouC0BBmfdM9MIm2Enw3nuJhqISJUVeeb3Jj9SpsXL3/X5S30G6QV4
	1uD9hb1g2uEtu+R9d5GwOgmaL/fimXu6CQWb7/Sv8pDZ+uDn7MENq4Vtb+iybKEokS/LVwXb8K/
	gItdZaLosBN7ELjulS+HFL7ErkfHLKH/hrLSuWDXjCjsqebftqy9Z5a7N07iYfA275bAFXyJicQ
	L3p6L5jo2w1WHP9FeBg==
X-Received: by 2002:a05:7301:fc02:b0:384:c043:c5c with SMTP id 5a478bee46e88-3856c6b3470mr1883528eec.3.1795164069863;
        Fri, 20 Nov 2026 00:41:09 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:08 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:56 -0800
Subject: [PATCH v3 08/14] HID: logitech-hidpp: do not retry timeouts and
 transport errors in hidpp_send_message_sync()
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
Message-Id: <20261120-hid-logitech-hidpp-v3-8-cfe2caa1d0eb@gmail.com>
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

When a transport failure or timeout occurs, the synchronous send helper
clears the response buffer, setting its report ID to zero. Because the
retry loop only inspects valid HID++ short, long, and very long report
IDs to decide whether to return, a cleared buffer misses both checks and
falls through to the busy-retry path. Every transport error and timeout
is therefore misidentified as a busy error and retried three times while
holding the send mutex.

Return immediately when the low-level helper reports success or a
negative error code, and only retry when the device responds with an
explicit busy protocol error.

Fixes: aba7963544d4 ("HID: logitech-hidpp: Do not assume FAP in hidpp_send_message_sync()")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0264e4541edf..c486488efe99 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -364,6 +364,9 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 
 	do {
 		ret = __do_hidpp_send_message_sync(hidpp, message, response);
+		if (ret <= 0)
+			break;
+
 		if (response->report_id == REPORT_ID_HIDPP_SHORT &&
 		    ret != HIDPP_ERROR_BUSY)
 			break;

-- 
2.56.1.750.gf70dc682cf-goog

