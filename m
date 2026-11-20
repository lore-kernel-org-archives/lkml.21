Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195734;
	b=Lh4HNZk8TqEXgkJ3P6wOCGLuXHI+Ys/v1S0cP4qha7AeO7e4ox9gvd68/yrGdwS9/SQ5
	 wMBcmaU2zX5FbI0l+RsnZHQCZSwhszu2Q5BnHFAVEpgz5qGCP+9hvCpU7WHBNQnD/+O1l
	 e0VQ/wYR3Gm9qbsNY9SagUK3AbKBevZNv67EAkaPSum+3yn8PkgGCahhbEndRDgKGRUSY
	 aF2e/B/RKaVQeByabG57U3nUfNzLKuvYMajP15KHbDKJpMbfjc9/wDcfgdiue2uB3cUY1
	 rq152KoYB1vgLzzR0zOZYCtcPccbVQdWll6x5sHbkn8VvxjJrsojzTvI3o4D5bWrjmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EyBa1qYdQn+iPfoA42hZVookOq748rCRVECzEXuJvRc=;
	b=hD+Kb5O85l2WERZ4M86KeNOjH0DkecZfGF0306V6v0bZQj++Dd8OJlu52fvzN+3RY0AJ
	 4Unjp72L12/0/WRRV9EQPP3nBwZY8N2H+Nhbairp6PFfWp6voN0mIifzdfT1akDsXWskm
	 xZUTFQ4c0R7VvDRBN4P1gOR/GnmzRDi746OQnqk3yC/+Ffd0rrNL9SVVm1XtOgg8McZ9d
	 OSDS/ZbeUUoCNflEddF0q6CcrAAwtHVtTFSwN2LuJuUOe3qXSs5b3F2Oj5dBQB6XX9CEJ
	 TjglPMaZUTfivE9MjYzd6JXxZ8ezLMU/0sqD8WK3MnaP8XTrsfbLDAbk4Z0xI/rjInA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PnWs1XMU;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA14460A263D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA14460A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PnWs1XMU
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so651046b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195733; x=1795800533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyBa1qYdQn+iPfoA42hZVookOq748rCRVECzEXuJvRc=;
        b=PnWs1XMUfFDo4imkIzgO8Eef7daylampggE8X/caLT6qMzzb+/AYGi622TouMxSUfR
         Gb1oWHjIfXh4u7XfYODyeg41vf9ftHkikVM0ahGw7dFpihIXTd41GfswSRLFX+j1fW7b
         +XPmawmrK+Z4dMy6+AT9GRfHKYLKy/hzjkoFX/Xyr+BpG1x5xiP+SaBiPgmjCjmMLvc5
         Fp5goRuXmLstA65pUmlIhNvY1+vwHlKazsL0USxufxNhwWQhCW2sDMgKu1HJjVzzRrSG
         +fgEzKNQFUIqKr/KKxva+WLOCRykO1LE7Z+30ssryEXEe9ATzYcKoxL2p3Z0Ox+ut4Gd
         jXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195733; x=1795800533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyBa1qYdQn+iPfoA42hZVookOq748rCRVECzEXuJvRc=;
        b=C2sjCciQ32E1KidIOAvKpnkC0Y0ERemQRES2dRkfFwy0KWzKzi8+h6QaSsmUW/KbNA
         o6NYv4XHZx3uUyBNpNCtjbTw8ElXqui25yQpis0D3AzgoKztho3gQp4TB0s8h7EDL/pK
         1UNvmOFcC/RgbWRRRPGtO8pY4S/Shl0YENuksLy6YNvlJOi7DiwfQNGKoArw89sfv7ea
         i7oZASksPYfPOjv0LIifCMZtT/PS9WeQAy5s/ygiPm66r5fe2kRoSyrsLxSdem84xduM
         1PjqsnUl508IKC2s4ShwhdlZe/ZXp/PZzRnIfeP4a9kaIitakk8OniEWrWwYrudCm7r7
         4EUw==
X-Forwarded-Encrypted: i=1; AL+hErGUO677qBcf2dXuWSakEsl52dkIQ4pU/xCtJ+TESSxYLTiooqWGZe8LFaEUMBHZ+jCb6WPhHqjIT3G/8C0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3jOe7ZxcUIDDa5AsHcC/M2gY7RLUPa0Er7L5XBN1CgvQI+bXx
	jMVp/UjNaXeoiP8XtSjwFNnyTEDzASRIwBbqS7NRx78oRKKnrYWA+53yrv0dWeW5JYs=
X-Gm-Gg: AZFdTZepYHmUJZ0752FyonfvfxRjfCogrScDYn7WkyQZutyKVeAqQSYxi3B4ihTf0SX
	KdJQleQ0IoUg6hCpPvqPzV6YoFddVz0/1A3vj1QVYfwXtC8j/lrRsE+GzWk4G32SPqr6ZeUXnID
	HgokNEEEM0Nvpraqz27ryq+/BcsD1cwR4B8tBozzfLVgzhEcNNMVF/mGngnugBGL5Q7vD2M7tOZ
	HYwvtLeE4PAZcYDVpPeddu5bT99+Mowefii3JSDbM+AqkT6ObERI9BUYwfHK35fVREhInaNONrF
	dxCo1WapxtAk+zSD/2JBOzh3UmefUIiFxmSlIIvxskRrbx30IWCKQ5NudEUz/ha/UmiMTl5LKeV
	BDriBdYdMg5eSBd9CA4ynxauN7egRkRVnV9p/w6XeTTgtLoingB56TszJmFIBclom2oqNW5SSFY
	Jy86nJqclcQyD+Y7UNjjNLHO2kzRaq8/Y+nsQua6f/ZdcxdCt7eGG54+4AyfW3w4g3w60fSBw+y
	H6ABdAwHPbJx9iDEFnu539NQHyXfVrGaPtbXzzZaIHuN6HjdH0MKK1SjI2zN9a/GD9s2Nrwq26a
	lTvjeK94IqjztaDgkR0b9AGxW41mz0/YheDc5ty+hps4duD2K7m9CQvdRMZ8/qXGr05fyXt8N65
	Cp6nFOIez/6b38ljKKzkfWmV0IDS0FjToTpcu
X-Received: by 2002:a05:6a00:3c84:b0:8b6:4eec:f501 with SMTP id d2e1a72fcca58-8c87bac51a0mr3657544b3a.14.1795195732839;
        Fri, 20 Nov 2026 09:28:52 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm1867911b3a.33.2026.11.20.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:52 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v9 3/3] usb: gadget: f_tcm: clear the scatter list when reusing the BOT status request
Date: Sat, 21 Nov 2026 02:28:29 +0900
Message-ID: <20261120172829.3286180-4-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
References: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
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

bot_send_bad_status() reuses fu->bot_req_in/bot_req_out to send the CSW or
drain the data phase, but a preceding sg command left req->sg and
req->num_sgs pointing at that command's t_data_sg - set in
bot_send_read_response() for a read, or usbg_prepare_w_request() for a
write.  That command is freed before the status request runs, so on an
sg-capable UDC the status request is handed to the controller with a freed
scatter list: the controller reads freed memory out to the host on an IN
endpoint, or writes host data into it on an OUT endpoint.

Clear req->num_sgs and req->sg so the UDC uses the linear req->buf instead.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v9: move the test note out of the changelog (Greg).

dummy_hcd does not do sg, so this was tested with a small module standing
in for the controller's queue path, dereferencing req->sg the way an
sg-capable UDC would.  It reports a KASAN slab-use-after-free on the freed
entry for a read command followed by a rejected command that reuses
bot_req_in, 20 runs out of 20 without this patch and 0 out of 20 with it.
A normal sg read still queues its own scatter list.

 drivers/usb/gadget/function/f_tcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index a8fdb24f9d94e5..b21db34fe2a7ac 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -140,6 +140,9 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 		req->complete = bot_err_compl;
 		req->context = cmd;
 		req->buf = fu->cmd[0].buf;
+		/* the status request is reused; drop the previous command's sg list */
+		req->num_sgs = 0;
+		req->sg = NULL;
 		usb_ep_queue(ep, req, GFP_ATOMIC);
 	} else {
 		bot_enqueue_sense_code(fu, cmd);
-- 
2.43.0

