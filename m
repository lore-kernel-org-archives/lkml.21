Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164072;
	b=JbLEzv3SKQCMoggyfnr15maYn/pLOpGeVMftm+esvP3SOJiRdfS1Kt3fmgHfV8GMyLe0
	 d8p/MHjxK/Bf2PVSfqyn2mPZR7e4+9KaNJW6Wh9P4lFLs4/oUmUSL5WiMBPrVnzl/ONKG
	 b2eFCcLvTQ6tV5P+yylIkhXPDiDFFy3H4PuSxqCNEnz6hfV612CHSyQ+mRL38VLhw5vtV
	 zbQuiHw2m71zZbTHlMcXY1YdBQeXVz/F6uezsECjnRcd7ETBzeCzo+gWJAP5Y4Y0AQgv2
	 rNrROpPeEBie3jWAKo9QMthqiMi/c2UTOrhAWhW8vdg3dP0jWZbObgaxi9CBmW971Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5JmkSy5fCLJrcwW9MXRthyg4PvftEZNu25217SCypdI=;
	b=uUzVXrQtWM95xPZxRPTojeFWXhF0nnXo94O11UMgObmoINq5cw9HUwbZYILC819El1nA
	 zTD6sHCMy43Vd9/8halssoMrH6KBLJL6X/PHG62RjTvhPFNdsM0TS5WNgwjKZYVNeAt7J
	 3tRy6EhhwlVNSMnIEcgmZCJAMfh+ND1eVDFm27EC11C+WKez8dbqPF8Co7eQPgsLkx9J2
	 mkMQHdUyNrsVnpBHItQt7Fa5mXY3mKzuc21fldcd2+1b4Ukq9Sbq29JOaXfdkYaBlGQ9T
	 TKKfH6vrSW/WjYkEIB+NeaB6iBYQZKhkofzXffuR4TCNklr6WGejiL2JTqw8SRf14yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zbJnG6vW;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2381D60A5BE9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2381D60A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zbJnG6vW
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so493753eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164071; x=1795768871; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JmkSy5fCLJrcwW9MXRthyg4PvftEZNu25217SCypdI=;
        b=zbJnG6vW8lVZMjh5L4f0PdVf1iEJ9VeCYbzBPHkz3LATPTp1G8XVGDo6x+wOAbGCNt
         GwDlraIDjV0qPITMpDxzCimJJ6hgch0pIl28QTc6CIQUnq0DqJkSNvgcUkOdMt9wpy+V
         ez6ot6IQczbLY4dkipXMwBfoP7VLZkDByyJ8kVhlrR79EtFyaG6wLJgDnEDfyVUgHTv6
         5TVp3YgENAXeWXoHEnTG9IHHovkjUWF002Z28SkO+YZ96eWhtj+fABI25Y8md7ANdjXk
         LiTPrNar9df66kntBvXaXwSHyr28YpGtGzO9QkQbYSIPCc3GJJ8zepXVSy3x5EmNUog0
         j2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164071; x=1795768871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5JmkSy5fCLJrcwW9MXRthyg4PvftEZNu25217SCypdI=;
        b=T969Lt8bUYIMe8de2Xu+PF3oXEkiJ5s8yinE4QYKej3mgKJafzXpraeYBVHP+XqFY0
         Pmsx4/cCDNuNAnOd0CNx2IEMWGFgHSEVQRAu0r4Zl3NQdUnn7orJAP0vGjuJb10bL6lQ
         cHtMSeNe+qJAH2KQt63ooGXHfRc4wpj/eYZspbUEibLBDy8zIHQSd3+B51Ossy8LyLlq
         HH8S8TCLIvkAny15BiwGL4+KmsFAHnA4B09ww4FOYAg+hc+XkJaO0haBe6/NAvVrorAo
         d3eXea4G8vPVndk7Q7NhSebNKIZ+mNPiSZsCVG/mvAg3d9a0RYaMe9SmgQsvC3hRXWuY
         H3lQ==
X-Forwarded-Encrypted: i=1; AL+hErHIY2Q+2/JslRj6msvEt/ox09LjdGcq0UXqW8xxKWwKahIOue65lhCOCnBmao90aHaqhhsBJ5rj1Z4JmeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pbCqgUwZiedPv0gZK0FaIFA06Hrpk5l5K2f59aDluU4k5pb44
	PFD31Brix0aGuoVa7H1Al7iFibOv1ZNQgZzJJkKh9b1EeiF1o/0RLn6e
X-Gm-Gg: AZFdTZfIRF1gxGENhNhKRPV2tMNAi+zK0AYhLnCu+xzsrS40yf8tXGcviSy4RoIDeeD
	JQ0Pf36u5MYhAZJUmgVLoqlETMUFT/HgRMHOSTLacgoj1w/GbSx05LrNHBd9POjJH7buxwIBoM8
	qPFM06TgfwtME7YKFJFFcRm90S940srhv8hy+93B+NJf0w+NYyrMDJZ2Md0dsLJMDI9W3cDo/ax
	5MbZHF05WShTjXCVNXqEjbrNO6pz2cgUIrIUBAGbSzVu70RmWIP7QjoDyWyEYY7ZBY4k25UArrI
	rP4nqCJONTsKecjoSRHJkhkRxj2sancOYdNixGDxlaFiKXcZ23SJlgTOLGqVYb2tCkmxVTMwmV8
	qLV19i38hNGDM/rGa86W35Vmo6sINvhp/xxmHbrNaVEqbtc2QwDME5hiVu0vEWMg99lG3iagMSz
	hV0yaXkGWwSAtdGTIJRyrGmQsj95l4kRyQ0rrv3aT/L9SBnFTc+Jo+U6vAsUgJ6eBj19E4ANWOo
	ksxcvhplVP1hkif90Z8Pn/Pv79Kux7lhqgbzWCL5IHFPBrIE8qMIAeUln2srkyDamWbkyKWo8dc
	yUv82iYTC25sukp9/91l7k5ybeH6OuwyM+oLPcQu/hs4syYQy8G3SiEisgFo/OsvKhHFXGIl/zi
	rZlL922nI7nc8AasE8g==
X-Received: by 2002:a05:693c:8083:b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3857083f7d3mr2158131eec.31.1795164071311;
        Fri, 20 Nov 2026 00:41:11 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:10 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:57 -0800
Subject: [PATCH v3 09/14] HID: logitech-hidpp: initialize response buffer
 before publishing send_receive_buf
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
Message-Id: <20261120-hid-logitech-hidpp-v3-9-cfe2caa1d0eb@gmail.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

__do_hidpp_send_message_sync() publishes send_receive_buf before
initializing the response buffer. hidpp_raw_hidpp_event() runs in IRQ or
softirq context without taking send_mutex whenever the mutex is locked,
reading question and answer from send_receive_buf. If an incoming report
arrives after send_receive_buf is published but before response is
populated, hidpp_match_answer() inspects uninitialized memory.

Initialize response with the outgoing message and clear answer_available
before publishing send_receive_buf with release semantics, clear the
pointer with WRITE_ONCE() on completion, and read it once with acquire
semantics in the event handler.

Fixes: 2f31c5252910 ("HID: Introduce hidpp, a module to handle Logitech hid++ devices")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index c486488efe99..16dcd79059d5 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -300,14 +300,17 @@ static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 
 	__must_hold(&hidpp->send_mutex);
 
-	hidpp->send_receive_buf = response;
-	hidpp->answer_available = false;
-
 	/*
 	 * So that we can later validate the answer when it arrives
 	 * in hidpp_raw_event
 	 */
 	*response = *message;
+	hidpp->answer_available = false;
+	/*
+	 * Pairs with smp_load_acquire() in hidpp_raw_hidpp_event() to ensure
+	 * the response buffer initialization is visible before publishing.
+	 */
+	smp_store_release(&hidpp->send_receive_buf, response);
 
 	ret = __hidpp_send_report(hidpp->hid_dev, message);
 	if (ret) {
@@ -342,7 +345,7 @@ static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 	ret = 0;
 
 out:
-	hidpp->send_receive_buf = NULL;
+	WRITE_ONCE(hidpp->send_receive_buf, NULL);
 	return ret;
 }
 
@@ -4148,12 +4151,16 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 	 * previously sent command.
 	 */
 	if (unlikely(mutex_is_locked(&hidpp->send_mutex))) {
-		question = hidpp->send_receive_buf;
-		answer = hidpp->send_receive_buf;
-
+		/*
+		 * Pairs with smp_store_release() in __do_hidpp_send_message_sync()
+		 * to ensure the initialized response buffer is observed.
+		 */
+		question = smp_load_acquire(&hidpp->send_receive_buf);
 		if (!question)
 			return 0;
 
+		answer = question;
+
 		/*
 		 * Check for a correct hidpp20 answer or the corresponding
 		 * error

-- 
2.56.1.750.gf70dc682cf-goog

