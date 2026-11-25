Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645333;
	b=PA/sX4UY5WH0ubRTRUyuxJ8TX2On6MrCoM3PcOrUXxFU7NJx10rFH/BzPfVjqpFZWJM0
	 FDQLsV1REsKRbzArt/rPUjzQW/xSFf8BW+3VdPvpEaExk4Ukp94iK2yAhpAqHUKzSx31U
	 Wj73CgXT7yTxr1pvfQpGysmAK67CRDKVeKfNl7mcGhf4x6SqDdo+z4NPS59s8D3SaKpS6
	 eBQG41QEmb0MNSNSGIBXvnjSnwDTii0eAXO7swannDwzoXuBC1FagH+HVNnjNuF8gGch5
	 ZS4ISTcLSbTRPENdin5LIf4XP01qv5uG0P4NtZUcP6MHMoRsjacj7yZsIB59jjrJ3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SKmb0CjpLP4ITLhIHnRihH0kGoAN8DUIdYytp7QeTFg=;
	b=H6tIA8wgyKMYW+dlgIPmxVrlnZLO0PJnn5XvJ6pcmqMRSopCmOVY1Dzqy8TtSeUGpTPx
	 TCYHgj9lGrTfe/bGS8/tn7jH9/o3rtv71ygZdMVZhe4DIN1IoUo/m1p9mn43dYti6CBOn
	 LTPTBIi0MNEkdGSluSOEAIWyej2Uqio/u8EMsH9kyuhQep7+5EMZ2VHDLE74F2QPQiLk+
	 GrzRZudPsV3qrsWwNjPtq3j/1qNikKjW68iDIr1n3TP1Nss9Z5FvDIvzI7Uglw4qt4XwJ
	 YVnde9shuWnI3OyO48/diEnJBuFhOtSau3QzKV0IiDbZGi0wt/0E8w+5mAxQqTFVMLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="C7vmu//r";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF45606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF45606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C7vmu//r
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so6065060c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645332; x=1796250132; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKmb0CjpLP4ITLhIHnRihH0kGoAN8DUIdYytp7QeTFg=;
        b=C7vmu//rPE7qJxsInMDe3csjs+tO4/QDVHFDSIvT+y17NQiLq3mxOmMeX4DsnNWdMY
         bWqHcoTd7rsR18nOTJeMc/w5fSlUAcgZZznl0L6GZ0QoNzfxRZ1cfPRUuA3ApA6sR+RU
         d7A/D2mUlaZpWNJtO0CZtIilTiE4ODtGckcGiAJ+QQcKUXBoHcMCDI9eeG+XTzFXxwcb
         +AUSZRlNnCEltt2Vqoe8X7iMOHgPC4BKe2gucFk+itlmeNPP3wQ8dTXTVcisOQXi1yQF
         6bOqruEiFGguX062f7H0OnezvGrT4M9vYsUfBIjzmSnOa5ceuonw3by5TitiOH83I69y
         eNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645332; x=1796250132;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKmb0CjpLP4ITLhIHnRihH0kGoAN8DUIdYytp7QeTFg=;
        b=RmmGq/rqI9SRTalFPe0iqxvE99rpEZQOC830nguHtjksembcwQFyqomOFBR3lRcRzZ
         ds9ABiPiAP/lAnzfvic/CZ9eoOB1y4gsOZ17B+50LgzsObp+INMrbTNjtfE8wZKJ7CRo
         0B3SX8SE8ezyOwcMwluT4HHbx3H87POfmb1z6iU67iUAmfcanawrVTPn7qt7yD33kCwa
         o8eWLCVz4gjji6vp22UB2aihXhzSoDnFgXozMY0JeutyzwwFj3F5fDk84IL9kDyr20jE
         /54C9+E80ILBb2XDGERAuwVZyN0B+iYLSYNsTL/7wLBhczsDpe+9BzEgfOdmwa6UOgaX
         FmqA==
X-Forwarded-Encrypted: i=1; AL+hErFNAfaTLZ4Mlo3xlbg7xDue8CC3fagvNm6ASiksnWUg9lXjnLZf+PA+P6enHkHhsQVOsX8U3Rb8743CV6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z843GgzngViRSgy4fKcdYiCxVQP0QgDyR/sdBcFHXGTwldgQYRc
	F29g+HKLqdvZyo4hqBwWH86Vu7boQRORMaEfJEQm7w968E/+QhRkCjbRr7S4Wea/70/KRMjUKgm
	kUQ==
X-Received: from dlgw19-n1.prod.google.com ([2002:a05:701a:cc93:10b0:1b5:7477:ff02])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2701:b0:1b2:43cc:48
 with SMTP id a92af1059eb24-1b5568e8253mr16557418c88.33.1795645331978; Wed, 25
 Nov 2026 14:22:11 -0800 (PST)
Date: Wed, 25 Nov 2026 22:21:02 +0000
In-Reply-To: <20261125222102.1430675-1-elkin@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125222102.1430675-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222102.1430675-3-elkin@google.com>
Subject: [PATCH 2/2] media: s2255: advance marker pointer and use unaligned
 reads in save_frame
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In save_frame(), pdword was initialized once from transfer_buffer before
the marker-search loop and never updated as jj incremented, repeatedly
inspecting offset 0 instead of scanning through the transfer buffer.

Derive pdata from pipe_info->transfer_buffer + jj on each iteration and
read the 32-bit little-endian marker and header fields via get_unaligned()
and get_unaligned_le32() since jj advances one byte at a time.

Fixes: 3fa0060526ea ("V4L/DVB: s2255drv: fixes for big endian arch")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/media/usb/s2255/s2255drv.c | 34 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 9ddc13c99a81..9b6979c811e2 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -31,6 +31,7 @@
 #include <linux/videodev2.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
+#include <linux/unaligned.h>
 #include <linux/usb.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-vmalloc.h>
@@ -1716,23 +1717,24 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 	if (frm->state == S2255_READ_IDLE) {
 		u32 jj;
 		unsigned int cc;
-		__le32 *pdword; /*data from dsp is little endian */
-		int payload;
+		u32 payload;
 
 		if (pipe_info->cur_transfer_size < 20)
 			return -EINVAL;
 
 		/* search for marker codes */
-		pdata = pipe_info->transfer_buffer;
-		pdword = (__le32 *)pdata;
 		for (jj = 0; jj <= (pipe_info->cur_transfer_size - 20); jj++) {
-			switch (*pdword) {
+			__le32 marker, resp;
+
+			pdata = pipe_info->transfer_buffer + jj;
+			marker = get_unaligned((__le32 *)pdata);
+			switch (marker) {
 			case S2255_MARKER_FRAME:
 				dprintk(dev, 4, "marker @ offset: %u [%x %x]\n",
 					jj, pdata[0], pdata[1]);
 				offset = jj + PREFIX_SIZE;
 				bframe = 1;
-				cc = le32_to_cpu(pdword[1]);
+				cc = get_unaligned_le32(pdata + 4);
 				if (cc >= MAX_CHANNELS) {
 					dprintk(dev, 0,
 						"bad channel\n");
@@ -1741,7 +1743,7 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 				/* reverse it */
 				dev->cc = G_chnmap[cc];
 				vc = &dev->vc[dev->cc];
-				payload = le32_to_cpu(pdword[3]);
+				payload = get_unaligned_le32(pdata + 12);
 				if (payload < PREFIX_SIZE ||
 				    payload > vc->req_image_size) {
 					vc->bad_payload++;
@@ -1749,7 +1751,7 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 					return -EINVAL;
 				}
 				vc->pkt_size = payload;
-				vc->jpg_size = le32_to_cpu(pdword[4]);
+				vc->jpg_size = get_unaligned_le32(pdata + 16);
 				break;
 			case S2255_MARKER_RESPONSE:
 				if (pipe_info->cur_transfer_size - jj - 20 <
@@ -1757,14 +1759,15 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 					jj = pipe_info->cur_transfer_size - 20;
 				else
 					jj += DEF_USB_BLOCK;
-				pdata = pipe_info->transfer_buffer + jj;
-				if (le32_to_cpu(pdword[1]) >= MAX_CHANNELS)
+				cc = get_unaligned_le32(pdata + 4);
+				if (cc >= MAX_CHANNELS)
 					break;
-				cc = G_chnmap[le32_to_cpu(pdword[1])];
+				cc = G_chnmap[cc];
 				if (cc >= MAX_CHANNELS)
 					break;
 				vc = &dev->vc[cc];
-				switch (pdword[2]) {
+				resp = get_unaligned((__le32 *)(pdata + 8));
+				switch (resp) {
 				case S2255_RESPONSE_SETMODE:
 					/* check if channel valid */
 					/* set mode ready */
@@ -1783,19 +1786,18 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 					wake_up(&dev->fw_data->wait_fw);
 					break;
 				case S2255_RESPONSE_STATUS:
-					vc->vidstatus = le32_to_cpu(pdword[3]);
+					vc->vidstatus =
+						get_unaligned_le32(pdata + 12);
 					vc->vidstatus_ready = 1;
 					wake_up(&vc->wait_vidstatus);
 					dprintk(dev, 5, "vstat %x chan %d\n",
-						le32_to_cpu(pdword[3]), cc);
+						vc->vidstatus, cc);
 					break;
 				default:
 					pr_info("s2255 unknown resp\n");
 				}
-				pdata++;
 				break;
 			default:
-				pdata++;
 				break;
 			}
 			if (bframe)
-- 
2.56.1.839.g22a8290db9-goog

