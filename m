Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281835;
	b=m+avuwb6G7QKpnVesfhb3yYQqvtflMdnt7aT1EagltqDuElxUlUi0uNDq3GZ4jPvRAh5
	 J1YAWoGSLiBP/6tKSgyxD81fcnEKw9WPkUG21aKQciIT3a2PW29X425Wbr8gkgP0i8ldt
	 66tY/PEuF54aFkLy/7Av/+j137g/HetNWtVxdBdvMFXqADcevZU8tm2Guuzp6p5Y6qZhh
	 G3/x0juqGwijtWdr6lbhep6AJ8+W9i4p/sJG2JIUUlBiEy+3zitiY6lvpQy3Q8ANO0gzO
	 M0Eogv4IkPQBsVwMR2PS+PJF7gzp7SYqk9nPZdWtGK0rXQTNQPiPhUEGjkr0KMwNLhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DoN+jG5Rec1QoyXW9HZrwy95eguN461fzv/CVFtCCEg=;
	b=HBRfPZ+8lvqqhNyNi8DzOCtjKGTFGC+7sGTiqqGVUdgUzJ6lQwKC3UxWG+loI2GwwI3H
	 K1pjExAc30Gr7cU4HtD/LWQ6I+NSZiwqLAcWEHNC8iVXoLHUkZbQ2/hYyWb5W9fjNNwTW
	 nlfis5N+wVglQ+aiGENoS8G+kU11Vj8yOVMYOOfhMzDgVyMvOKeIee+GUhiTh8hwQIJwR
	 Fx0IOdDyW7GcOyF/KwlUpBVhq09UzSWUvF1IMpTLb2a2lulowMQiVqrxbvO7z3zexI/KW
	 4Aph7k21emixDvgmXze0CCwEar2S9cBykWPbOPQrLLFJzafMLIMD/zQkV++35d3+qew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3gb6nun;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC1606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DEC1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3gb6nun
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb61185057so12746605e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281834; x=1795886634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DoN+jG5Rec1QoyXW9HZrwy95eguN461fzv/CVFtCCEg=;
        b=F3gb6nunfOxohpA7FVOv6KfnszdYpDb9WP82vTw19QrSAAmnQG3pE0GqjqKbDi9k0H
         jUZFucmuBDSwmrthhIWCCjB7a+zhwww4n4cZ5w95TW7bwOeUAjNNHywm1DZE//YGUaCm
         d8GX9lZ2n39RKAlgNP81zHrRvwc62Ywo41UBMAHgZ3JG5xkSsZFCjxJP+7BLC5hQaiA/
         35GR6GwEKWOc2+UOM1HikHRfMwohnsH6GNNtycB1iyGXr2L12nerQIeDyU/0mnvQ7Iz0
         q1BHqsxkxOzpeIARsvVKxc2GIFQp7HJHwGxgkrDfloOQ1t/kt1zrQEhnwHySTm1wOW6j
         RUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281834; x=1795886634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoN+jG5Rec1QoyXW9HZrwy95eguN461fzv/CVFtCCEg=;
        b=h2Ejckeq6JXje5C6WyDuKoUEGjvofTFEjuLxVeX2NpsdRABr4yM8eNxGU/4AT9ebjY
         QZ9HNpvixns8Hkft33O8h+Blf7DAEsjddOggH9QyctWC4T13MFDpwIBpW36TsPwHDfZv
         HyDluVoTcYs4SHfpY9VsoXBsV+eRB3BFX4UfcHdi1q4/KZurbY+D2xcY+NEIb6AuAXjo
         jeazb3kT1C/qjVgnkty6Nu1YIOb8hYPvMuNPjetxW1DMEwjGRpJdaeeeVNmUzHrzDTk3
         amQuPXH3RH1jS2N0SKH2OGtVT2uNBcxmad9VkavgV3a35/a1MhNve2/RILTcM0vjk91q
         GqKA==
X-Forwarded-Encrypted: i=1; AL+hErEC4Qth1LWZLJqgHf+lasyXsXLru3t5Bfo3nyaC95800GfwR8Q+H91iN49Gs4DVPIlK7F1GNXE0Pxc30VU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ePMY8j/MoS2fjrI/3Lr9C3jnVkjepmJC9VvpXdLE9RAU0LdzD
	V3iJ54A3WH1eDFqNA6h7niWXQmXFe5ia1RyCNOdtf8tbpl9Wy5g2SPlx
X-Gm-Gg: AZFdTZfd9UNnQaYsy65PmkegQU9np1cSAsXvrpIxGMaS5+kCbU+zrVpqeUTT8PejV08
	tZJmjb/L4NTDCCebXN0qP7TsvN7rMlMCpiV8P5p9cG72JwPly1Tne/II9fqRdK9VXcjVoDDKefG
	uhazAE4Jv27uIv0qZ1tIsg3YnYVKMRqw5w8m8KQQmmGfTSA+0fIvN8oFcDH/3nKrwFKJXcQ0TT9
	Rb40wsIiaOgUhgy4icpnclPs34sfUi4RpYzmudZ5HObNuOT6DmOIElh8kdqbhUE8T0p7xtSGwKg
	c1yV/tO/2PpSddsPZQjvOzTXjuBawrE9mfvnEzuIXUmOGUOgfih+VpmXDEAfDhqLMXpCN0qwtGd
	cLJ9WHuwpqoAWPb/Q/Uag34FWbnhKed7RHLHgY/mdiyKJ7i3qFs4sB5TJxHgiAR1at4zbIj1T/H
	f6eJPghprBb83dBG3AwEm2HNbQSGPEMDr1E2ld+vetnX8fzEWVnKNSlfHpYwHdImwzfgKha4Ojo
	eHfzR9IFf0fjYG01bsfSvaoahCy0Ms68DlaeNbSY5Gn4lX/FYLHEKOTfbQOxsyOBAQ2D5d+5Cf6
	PvUGHYKx0p0ikdyCSvKPwcRxS7hzqV9LsviL9tMX1xkY1NPSwv1bT6xeEdMMzy/WnPumKJSd+Ey
	g
X-Received: by 2002:a05:600c:8b5c:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb8880f621mr154274825e9.17.1795281833492;
        Sat, 21 Nov 2026 09:23:53 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([37.111.157.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm207307265e9.5.2026.11.21.09.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:53 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shichao Lai <shichaorai@gmail.com>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH] usb-storage: alauda: track media_initialized per port
Date: Sat, 21 Nov 2026 22:19:56 +0500
Message-ID: <20261121171956.1455-1-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Commit 16637fea001a ("usb-storage: alauda: Check whether the media is
initialized") added a media_initialized flag to struct alauda_info to
prevent divide-by-zero errors when alauda_init_media() has not succeeded.

However, Alauda devices expose two LUNs (us->max_lun = 1) backed by
info->port[0] (xD) and info->port[1] (SmartMedia). Storing
media_initialized in struct alauda_info shares it across both ports: once
port 0 initializes, media_initialized becomes true, allowing port 1 to
skip alauda_init_media() when its media-change bit is clear and divide by
port[1].uzonesize == 0 in alauda_read_data() or alauda_write_lba():

  Oops: divide error: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:953 [inline]
  RIP: 0010:alauda_transport+0xe5a/0x35c0 drivers/usb/storage/alauda.c:1187

Additionally, alauda_check_media() never cleared media_initialized when
media was removed or before re-initializing on media change, leaving it
true if a subsequent re-initialization failed.

Move media_initialized into struct alauda_media_info so each port tracks
its own initialization state, and clear it when media is absent or before
re-initializing on media change.

Reported-by: syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dc208a8cf8d37cf3e5ac
Fixes: 16637fea001a ("usb-storage: alauda: Check whether the media is initialized")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 drivers/usb/storage/alauda.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
index 5e7f99ba8..5493f25a7 100644
--- a/drivers/usb/storage/alauda.c
+++ b/drivers/usb/storage/alauda.c
@@ -96,6 +96,8 @@ struct alauda_media_info {
 
 	u16 **lba_to_pba;		/* logical to physical block map */
 	u16 **pba_to_lba;		/* physical to logical block map */
+
+	bool media_initialized;
 };
 
 struct alauda_info {
@@ -105,8 +107,6 @@ struct alauda_info {
 	unsigned char sense_key;
 	unsigned long sense_asc;	/* additional sense code */
 	unsigned long sense_ascq;	/* additional sense code qualifier */
-
-	bool media_initialized;
 };
 
 #define short_pack(lsb,msb) ( ((u16)(lsb)) | ( ((u16)(msb))<<8 ) )
@@ -471,6 +471,7 @@ static int alauda_check_media(struct us_data *us)
 		|| ((status[1] & 0x01) == 0)) {
 		usb_stor_dbg(us, "No media, or door open\n");
 		alauda_free_maps(&MEDIA_INFO(us));
+		MEDIA_INFO(us).media_initialized = false;
 		info->sense_key = 0x02;
 		info->sense_asc = 0x3A;
 		info->sense_ascq = 0x00;
@@ -478,12 +479,13 @@ static int alauda_check_media(struct us_data *us)
 	}
 
 	/* Check for media change */
-	if (status[0] & 0x08 || !info->media_initialized) {
+	if (status[0] & 0x08 || !MEDIA_INFO(us).media_initialized) {
 		usb_stor_dbg(us, "Media change detected\n");
 		alauda_free_maps(&MEDIA_INFO(us));
+		MEDIA_INFO(us).media_initialized = false;
 		rc = alauda_init_media(us);
 		if (rc == USB_STOR_TRANSPORT_GOOD)
-			info->media_initialized = true;
+			MEDIA_INFO(us).media_initialized = true;
 		info->sense_key = UNIT_ATTENTION;
 		info->sense_asc = 0x28;
 		info->sense_ascq = 0x00;
-- 
2.53.0

