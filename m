Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005631;
	b=b3chbjUP0p0F5gk3+Gj9J+psPX3nv5FJJOFrs1C9p2+lcwvBBg5KVfWNgprJdLLENKz+
	 fm9uIQ+Hu0H7F8o7ZzfkFeUypGZBhdJIAR3GIPZHXAlFIVFXG1493WeYyyxRS6revpZtp
	 mQKcG2OKALWN6IDbhwl45nBCjwjyPXEPv53I6blYgG+hQn6YoWQdwoBVzzsGADZGfM2mR
	 RBwY9KZoQ5qCFkYzXtm79x0WUCGK4vxYz2x1PG28SwoHN6GWcJ/97564BolsV4LNOq/I4
	 X8s2Z8qVnm4yNPa+Vl6XST2hbfpvy6okg8QCVCvgJdwhTn/XWXq1FLma9hP5pwNjdWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LkQIR6xullmNca58dESOLHq+G6witr/d+tJ0Hc+yeYk=;
	b=TPX0rEvIKn+ggS9GkoLqzw7oHvvi/vjddwmeSIuAcF7KDJ4a/GqOhbbeM7Yu9vqANZ/3
	 3bNTaRX7NSbGQOEcs/YzyDP2/KvuukbXr9KI881A4GNgO9aaLEuwVnwyN1Xk2vB9cn3NO
	 zCtVPuGERJv5IQynI9PQu821cKY6sb/xjZPPMSk4MDQ2uD26GXRS5M7da9vtxdJsb/LIS
	 aOf/xdL6QnTxgBJ36KCLa7esokhndBJ8lwyPbYlH39+xhGFxlMD0gdvkxEFGwPk+aNKX2
	 ht0PjJiDlijg6ldV1fTHUSI1EB7Jgl+nydIlosSjLRfQvhlsTmhusjxLf6G9ujddr+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rWKI3Tdd;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F99E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F99E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rWKI3Tdd
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so518447a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005630; x=1795610430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkQIR6xullmNca58dESOLHq+G6witr/d+tJ0Hc+yeYk=;
        b=rWKI3TddjM8acucdR5sJ+4iTrnxQQMVeyJR2vXKW73kZ2BAlNP1g/IedL83z6fQoOh
         kFZmN214kJYrJbke7O1ArUouR08RhXy6klodXf2ZM1P2k1S65FiK1Jl0L3YEevNtjCRP
         ixN6KQYrnwS0fiLZ9SK5zUulqHyA+kUjdWyk1l+7GKjteJH328QG3drzydYZxmQdfwiM
         G2bmaaO1v2qLK2P4BgjlMxDSWWjHoKMnb6iOzTfGIOV/ZDjzTlUwlMtt/9lnsheeM0VU
         asD8f4pC/ybzLyF7n+U01cEPuK/r6KBoBgrUku7XJbCGfjnDpc7LNeKQGFsPPgwKgl1+
         hxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005630; x=1795610430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkQIR6xullmNca58dESOLHq+G6witr/d+tJ0Hc+yeYk=;
        b=JtHFoJSJ29xjHdQ1yyRPgOow4VroH3gQ7nHcPXFbPq6QWdB5ZqAlbkXC3eulEAjYeS
         0w649v3I3aSpwckX1Q4AVWewEB2VRE23fCxlhSVvD6qpei4D2F3dvDUgeBwU642mj05r
         jtiH2KNDmzfbJljKwcvtv6ZU9qQ1eU3Icttct2FeAyyOpS0Xr92MnMdy+iwBWbAZWM7R
         53RiBqNtqfWDQTSy+Kl8PstGXaKt3Q53e5UiqTBbF/Wl7ZeUZ7Rj9oir2+cGMP8YTL3N
         gCJicoWHMez3yw6y6n/hANAEO4FjBFwBdkqx0f7GQbzBskryY93FJVxsPOAswtU1O1VR
         +H5g==
X-Forwarded-Encrypted: i=1; AL+hErFALnA3CTDW3ilituYxeDuglGTPf+Cddb68GOU2WSEeQeeUgWTyvT3VixzsCZeDVmMGBLbtAKf8ir1KXUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H3PY72u3p4XcNjkCvORnTIRNqtx8Qc+joEYsTL4FFxmg+bTZ+
	SWm3alsIQ7+3V843m0DCAHENKE7kPTwaW9faKUnAo1ip/43XsP/aPVCsrWyjYEd0Inw=
X-Gm-Gg: AZFdTZdggkcTz2sXC7Mpihf0UzLPMvZECtMWsf2bh3ieC0KtHbiJTBpNcWx0lOo6a0O
	sOKNDD7/jmcJAW4rd20zeQCKrq7OTk+ltZ1uN3bD/2zYD0d6cIwHxAbG/+9QP9mC00ovlnALtBX
	NNRjRNrE4TffzlSl2x+LNUyc+HDx7LyCs7eURlDIj94hpHfJ8O4soGvQiu5+KlG5PWPehj0CW1B
	6RozafhGyAc7/KIeAjDPytdIVFN18brey/1U+uOFmaZ8Xb+SVdIygQkwhs+tphRJWvcyon+3eF/
	pwgfM82NmgiaQ7sudBjy4iICSq1DCtMGZwFVfZyPaIv7F434V4nfR7U3FcT/fvTHrm5y5mS9BUI
	BOughgwn1sYQOljxXg6u6ASLkyNlqWqFPBpgw9Vaj4CC/FjbvIkwVYQPumPkCiN3Bb6qiMRXHOd
	rUxnP/nXLSffYS7S8FS/Ek8PYK4SpI2j72kOBUZzSv/KLd7tfue3zWQflRO8bdHphksJ2dIfHlS
	5XvJ3j+3EUInd3rndPbBL+DJrVEhYXGRzcciyAP+AjAgMwDPm/xGoBKIMVPEVgb5Cj1xDDQoLzj
	WCwjUTDjf+iz5hp98Xu764zNAXoGv0TjSTCJG4sINY92EaKd7mFaepjreIa6HtTROjtHa9xVx9F
	i1wp+egwV9U2WA/w5QGiVxmzpIVgPiREB6aA4bg==
X-Received: by 2002:a17:90b:518c:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3b3d07bef79mr1656925a91.7.1795005630028;
        Wed, 18 Nov 2026 04:40:30 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:29 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 4/4] usb: gadget: f_tcm: clear the scatter list when reusing the BOT status request
Date: Wed, 18 Nov 2026 21:40:05 +0900
Message-ID: <20261118124005.2428068-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

A test module that stands in for the controller's queue path, so that it
dereferences req->sg the way an sg-capable UDC would, reports a KASAN
slab-use-after-free on the freed entry for a read command followed by a
rejected command that reuses bot_req_in: 20 runs out of 20 without this
patch and 0 out of 20 with it.  A normal sg read still queues its own
scatter list.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 970dba09d75e4a..e2ecd5922ee77c 100644
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

