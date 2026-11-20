Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164621;
	b=XovAjWp6LVDJl4s8uJ3eqahbYiL16/mtyZ4jZmocwBH+OGUlMJAt594IRaOTAjj7sMN3
	 kbuwLwFP6H/AMKTC6IsRkDoRuLg6uBlzkJIQsdt1YAkPPWGJkwF61FuX5VcqHSxGKWzhQ
	 OYdhla+SHJGBeuQAPRsOb4wgA0KMX+ExsUz5lQlzeuTNNYSJdJF1vBFdiHvZ6r+dd6ezD
	 41Vda3nd9+MM7uIupP6H/jqoDYJcPg+UEAxyd+BxebYT4/ZJXSxtXtHhdCAIwSWutxPVT
	 kMN0b/4mHqV3KUe8eFkoSUUl0waY7N9rhzgBdf9b48yHWk/gbbzzB66pEvPi1cyN+MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164621;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C6f5TxS2kJ2OdvnPQrHvSYRMyjQfN9BNBaJyxN98204=;
	b=1kmgLnx2nSP3pvF57LucNfjVaujj3umwKTHMMs32/lz1qNb5QmD/qlHwc3+e+e3TbpAP
	 Vtfv4xWAHenOxEmJUBbKTo42/5uHTE5tiUYkrC6C3US0MD1AbbzLPbns9veUUKVMcx41z
	 vVXCxfZ7Bl0YrMM/kYR/HEtSbz/iZXZsX6QLia5VpRqRYK/snsIrHCkML/XiT3xWRnbHx
	 Miix4q6qlObjj812CGb+xjecC0XjWZlEnwvmbOuzNUjihl1wz9qhYCuTwSrVIOhPobc6v
	 z9hOAsHJ1nXBLKs9IGwuSZETOcb4Ed3+C1VnhUDHenRbcqgpixj0fXmsWesA9fBSOjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YeVQSB6Y;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA364606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA364606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YeVQSB6Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=YeVQSB6YDYyFNd4B1VWKBMF15QILokhVS5d4wo0zGftyqqECUPyt0E9IQDFcF6euLdWYtLKefnnP4
	 k7eMXBpa08jpw6E/m47unfs1V7UEVIDMcZPHJ0CzsndIoONSl8YXTGloDZjEWU+meXdOe6slt88908
	 PNbTnyg3YHQPml5s=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b0009caa45-c71b3;
	Fri, 20 Nov 2026 16:50:18 +0800 (CST)
X-RM-TRANSID:2ee86b0009caa45-c71b3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6b0009c6ffd-1e207;
	Fri, 20 Nov 2026 16:50:18 +0800 (CST)
X-RM-TRANSID:2eea6b0009c6ffd-1e207
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: srini@kernel.org,
	zhouzongmin@kylinos.cn,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] slimbus: messaging: fix out-of-bounds write in slim_msg_response()
Date: Fri, 20 Nov 2026 16:50:10 +0800
Message-ID: <20261120085011.2080-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

slim_msg_response() copies the reply payload into the client receive
buffer using the length reported by the controller, without checking it
against the msg->num_bytes for which the buffer was sized.

The reply length originates from the message received on the bus (the
RL field of the message header) and is therefore controlled by the
remote SLIM device. A buggy or malicious remote, e.g. the firmware
driving the Qualcomm NGD controller, can send a reply longer than the
requested number of bytes and slim_msg_response() then writes past the
end of the client buffer. Client buffers are typically small, for
example the single stack byte used by slim_readb(), so this can corrupt
adjacent stack or heap memory.

Clamp the reply length to msg->num_bytes and report the protocol error
so that the transaction still completes normally (freeing the TID and
dropping the runtime PM vote) without overflowing the receive buffer.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/slimbus/messaging.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index ee127ef42046..b20864b59606 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -41,6 +41,13 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
 		return;
 	}
 
+	if (len > msg->num_bytes) {
+		dev_err(ctrl->dev,
+			"Got response with invalid length:%d for TID:%d, expected:%d\n",
+			len, tid, msg->num_bytes);
+		len = msg->num_bytes;
+	}
+
 	slim_free_txn_tid(ctrl, txn);
 	memcpy(msg->rbuf, reply, len);
 	if (txn->comp)
-- 
2.33.0



