Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483724;
	b=QcA6CfQ9T4lOywIWdt4mLShdpl6bxiuXu7MK/aGZrSfk7jl+/H6CLoCgZbfU39T6nF0K
	 CANatXpZwaKtT3hUJRrs3EqpdI1IypyV+rgGdot2et3gM46Z+JnOAxhAiFUGDg3IeK1UG
	 /uXtrOE2C7r5MLHnB20gNBcaLknDfNZjzCY3rU0ZfFbwP60N8AdADY4j/VIYq69i+lF2/
	 7fHj8bM6WD3pkXmslkqAC3rUZAuLfZHcOcHHnYzwIsgf0xm6gf1w3fnfsXsgSBElN7ST+
	 DhP/WbVjmyh6f+Ifs3mPX58xMOrjho7bgD3uAGGMLRsSTs8hw4vsDJQdp/AwC6GV75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gsmrT1Kg0rxxGoc36p22ViQ2rJPlJwTOuRCru3tpkAk=;
	b=xAZzFQHDxMhNOgl72HyAg9gmrHf6nRd7UHvruXscB+0evYWyYQmQahIvln6+7pCm4Nct
	 v6NGOhWtUmwMfCC3JAnBeaQM0ar5aREE8UE3yjYb6aexSjc5wZ5xM92TEri2AdtsE7VlN
	 ubbHgqzt9KE8a3SpmrnCC+3Rojina5aiY6cRL6K0zrFAfEfkRMeK0lox8zsho8nWcNIUH
	 +BHa8mOYNtxHXsK9PPP7MJigouYlQGuUlrXxmSmon1qgn9WM8GV3pOoqGZqsaEcKi5jNz
	 Sb0xFqAZZNaNXLwNGXbTp1XemsU3Tio2dLweqNztRKv+9l5aCS9iAFKvOARaa0dg1Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyyebHOd;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADA606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFADA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pyyebHOd
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3129565a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483723; x=1796088523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsmrT1Kg0rxxGoc36p22ViQ2rJPlJwTOuRCru3tpkAk=;
        b=pyyebHOdCbBRcqF32gHWfW7RT039/UxtIUyZxamidXzRK+iSjdTwMG44X7w/Tx1sKk
         0uweSFGpEzolUASUPkNndXdPNZYjLOaPj2rtqniZno3LkQVs38nzSrLPhExRvcX49OpW
         FGlrzswJ9izWUPnZ5hKSrxZpsj5IiBxdG+3iTqpXulkWapXt30oTY0lqWD8UPXGJZ9X1
         3W9t6EpQTg8u9MaOvungQT0JismsJM3gbhsmscXzzTJncoaJAHq9AaXTslXLx0lN0sk0
         qCE8n7Mr+YKf276O4Kb+3FsKSCI0T9bxk56EC7hFa663mmQjsi4EEUIDz/kzWpHmbQAi
         Qv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483723; x=1796088523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsmrT1Kg0rxxGoc36p22ViQ2rJPlJwTOuRCru3tpkAk=;
        b=Nqv8YULOacH0/lzvrJCvsackyCOFZfqDArKuIZL7vdIyA0+WmQruui+WIJEQP7qPoV
         s+j9bsyjesIa1qJD8zZuJWV9DfI4oosc3Bf/30NSAxnmjdtEI4cmhx5+YjQuRN6OveEe
         4QCVMvkbNeXdTVoabO26kTD6FaYgAvHfh0pVXtzK2CvtvtCykaST4wGTqHsjUb7FbB8A
         YCAr09/kSsjKpS3f6cpRq/263CLT/E3XAoPT5hiJVDR5oD4K/Q+lXtildHc+0ntzvfOS
         7cGTWMfNeJgJ2gVNOY3QTFVgQPV4FLb9+rXU85z43j2V3mHNSB923UICtTQgw8DqWrGW
         N4Dg==
X-Forwarded-Encrypted: i=1; AL+hErEc8oFw/PDduKDpkaqhC7naF2Q5VDtwFSLOHPo+exoIxonlv6jUDNLPVAFOyMju+Mgr8AfxC0I5hFRD704=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bS7epk9QFUCOBubAGQ0SG8loq/c+LfwclkmPYvWpY3tUEJ3kV
	YDbcdOyXfOYK7UOUsFgzDTT6lpzkcp3OwM5+5jg65Eqv42fKPZ5DE/0G
X-Gm-Gg: AZFdTZcNIEB3XB2zdGbnN2sOV4ea8ny7Mxvk1ZiuVTa6/RZruEEv/L4N9p0PYrgrM9g
	7cPFrNMh2Z3oHGgman1VU+nIgetpaw7414zUOHlygb1TCt3UO7B2yd/yYE/RBzep6+3hLyGnGgz
	A347QiP0lyCu5DmqzQAaneK0gvdwzFJSEVy+ntMnoiwQxFBAWkxW3REaf2umHd9NWVFidK87yn2
	afqGUnMMeKnfwSx/YydL7puAz1Gn2dS2xGJDok59JljNs6zUtytDZ3o5NAIfr69BM7bRkv4hJ/s
	252IxnTSfuSpKBO7eSxvHKZMfIfccjXZcoFT+MssnjL0gaLBIO2Ln9G3aowF06N65Gnu6F6fDSj
	dPCXC1QIvb5vvg6rpVfhGASAJd9rJOBTgUGk8SBes5k5QLAyPn39WAIxU20yWlo9R6rAqlE/mmr
	vjmUCEddLIs0BccY7fW0FlYtKJtHjcUVP+Y9kNpn0nTxq20K2UuJM3xSA03fVzYYHjD/dnrF3sv
	8k72/c8eGIHwHuOfKffCbfk4xPqPQB3hmf9fNk0QN9VpvONhB8ZI/folYMhuHm+3ENyrE9YhJy8
	ybCTCgnxzrPXiv9c9H61Ej8MLRtNYkvpV0h7
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id 98e67ed59e1d1-3b41c8fa9c8mr11382841a91.23.1795483722909;
        Mon, 23 Nov 2026 17:28:42 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm3954665a91.5.2026.11.23.17.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:42 -0800 (PST)
From: hanzhijian1991@gmail.com
To: linux-usb@vger.kernel.org
Cc: andreyknvl@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Subject: [PATCH v3] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Tue, 24 Nov 2026 09:28:37 +0800
Message-ID: <20261124012837.2071714-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhijian Han <hanzhijian1991@gmail.com>

gadget_bind() allocates an ep0 request and stores it in dev->req.  If
raw_queue_event() fails to queue the connect event, the function
returns without releasing the request, leaking it.

Release the request before returning in that case.

Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v3:
- Move the changelog below the --- separator and drop the duplicated
  entry, as requested by Greg KH.

Changes in v2:
- Fix author name and add missing Signed-off-by (full name), as
  requested by Greg KH.

---
 drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..33d70b552b6d 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -316,6 +316,8 @@ static int gadget_bind(struct usb_gadget *gadget,
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
 	if (ret < 0) {
 		dev_err(&gadget->dev, "failed to queue connect event\n");
+		usb_ep_free_request(gadget->ep0, dev->req);
+		dev->req = NULL;
 		set_gadget_data(gadget, NULL);
 		return ret;
 	}
-- 
2.43.0

