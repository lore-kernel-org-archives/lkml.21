Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749425;
	b=X4uf/FTegkJomu0WM9l0Hzd/GBwJDmJmbEYgVm9kP34Pt3e08wN2D8fg2RXljt2PWgNS
	 7GHo/KYGfkosndH/up+vhSPtmo4Pb1j+vjzXnybNTXi6bjn0LMOAxNgwE1Qj1gFhnxM2E
	 yfHTrsfKQVD90hjXKmKPPeuIFjvBfQmrrkMtqwEh3J6uPiV2L7g5z/kmdOv9lQEvQ+hYL
	 5lv083mBbd16QemJHVGGIE4DXujtk5aCo8cTzNNWionuMB1XoNWaFUDnvrxtPJglSNXTe
	 YT/BZT5tmAmCr7/RxhLuaBhmyXJqBvFXPWt3fTUlnkSEDvtwHoklcVStbnGjAYemCow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zYwGFrVXRtVQNbh2j9jq0UMXN8rATCr949DIEhCXwno=;
	b=4qqPxIsje5oqoJDVoGgNn4MOsaa+CX7ATJAlFw8Se0/vC5wKozOxZrXS0v3dJvDHTAc/
	 /E/s4QDfVGk5bF82WiNXgRGjNxYVNv8D+G7C3hIBty4yxi/+Jg8h5Zui4XhsHUJShq4nW
	 aYM6gE+0H0I1yspdUuZeHTsJpt4CvmabGIcH+d2fk4NttMGh+l3e+cUn9qT/wLfyKIJ/9
	 xGZpaVJ6hLtAAGJB9iieyBDU5tekbFWAuXtkkhjiXa5LB10+oHJLKDCSI1kc0BIM17X1A
	 9ztC9tJEfa7JxPvUvV912PaLyjT30sOvwDs1hAyWJG8MELgAs8A1brNzXhSPa8s76mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nfsq6Q7w;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F859606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F859606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nfsq6Q7w
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b6b22be970so2944054b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795749424; x=1796354224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYwGFrVXRtVQNbh2j9jq0UMXN8rATCr949DIEhCXwno=;
        b=Nfsq6Q7wRhpNbfSiRyUNzpz5NbquK9H4W2aGEej2aXFwSsFi7ym9g86K1Pt8jpkXZ1
         pfg2Be/7L6jereXokz8Qwyx5kZdovJCpeuHGCeA630Yzk/DKYIbYEjNNYKnHOVDzWw3Z
         Qa1SoebOfpE1aG7OG+6J26FmTnVCImrBOdF5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749424; x=1796354224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYwGFrVXRtVQNbh2j9jq0UMXN8rATCr949DIEhCXwno=;
        b=mcsokEGUScsL7XNx2+5JGb323ejA20c2jgCzOzm8cN42zHD58TJ1Uwd8N2prnHf8qY
         lzstayjdQETRAICZGARIP5R8utZXSFzjRwUAn/sNDPFYF5AR/8Hfhc+TXbO8DmuzYkBy
         GSkY8bBILVuUNq3bsKmaxrXJzrM2di6cEK7FtzNHTT0yfXPtaEg5Va6+BNfgVvo6ftbV
         iIuWW/LJ/wVYyx7aKVStEqz4vjgeRv0MVg9YEMJvuTllBzJM+R3Ds+CzSsGsDfHVFG5R
         WKfCMPzNUaGkXj7Oc8FqHBbE2W8BI8ho9pB75PcQSwToPqaj5LoEyBg5rCpotzMILD8K
         yH/A==
X-Forwarded-Encrypted: i=1; AL+hErEe1mOtr/XZyG3OOcL8O6KWbXRlmiTxLQEnOdQxyiHgErsluo1+D4QQSkfvyYPpLKqJ01/qo03aPB3M6nE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xvLyArdPkCbPCTECLsUItfimfcm8EKkiLw4TeR/4/MdwbYSh2
	1SlRtidqci9klmBZgBJw0WRZIJ74kKKrrhxMYWkZmlyZdtM+1fgsjS2k+36rZRz3Xw==
X-Gm-Gg: AZFdTZeL4eDXDjQBLRKmhr720jUxq7VBirLavxS40IfKkATyMz4MOe52uQTe3E22xjJ
	z6nIZg+Tg9tzYWjn94EygTNarvS8uaVlMTmBEGfePZ08/85ITTMoC3M5TZHf2/0K+6MDaTnjvWd
	vjS1811lG57Z7CDHVncUnpvw8VeJCdgg/4QfImxrvkOvr2jh4ru42sK+iDESrpJsCfiGGNDvXbN
	jJZSt5xgwuuF0Vy2B93EbqZFRpwC7wW/iJM15Jd0ErtHgVUx/Ai2NR7tmALhJkBZPT081ePii/l
	m7E3TSRLT3Vqbpry2ycb2zFm3yyGZWW2d0rb5EDSOu/mt9BIyBIUxyzdWlChyDhabLg5IH4NswW
	xLIQWnDubfVipS1fTKlDVPdpX8u28XROoVQRJB8FZcFwZAMZQrzfHcuDyR4GwywNJr08GMgftjL
	GHJXjL46DuqJvVBwIaNwKPTAo9TXwCMVwGBdk/vJsCMuiy7G51SZ5l02PBxpV1NDplSp6tsQomY
	Q+EhwuKrXowCyUmRkdCKP8SUUvgIxHd5jpnZye7C3JzDSHmAdy/G95KAiGqeijM4Dr7ESQrEu0R
	MdeR9fI4dCTokjkCWHwbTvly4FBAOWXj+S2KIVJCZUm+F5TZhVQpDXabv0HjunWnBXJ0fiywaja
	/K9KA3d+/WVQMTSZoLw==
X-Received: by 2002:a05:6a00:419b:b0:89a:5:92b9 with SMTP id d2e1a72fcca58-8c87cf2ace1mr19349814b3a.44.1795749424469;
        Thu, 26 Nov 2026 19:17:04 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:5bf8:984e:5bb:e51d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm11333567b3a.21.2026.11.26.19.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:17:04 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] MAINTAINERS: add mm and block lists to zram entry
Date: Fri, 27 Nov 2026 12:16:38 +0900
Message-ID: <20261127031658.2049871-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

Route zram patches via linux-mm and linux-block lists,
rather than through the generic linux-kernel.

While at it, fix a DRVIER typo.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68811a0b7916..3f10a5772b31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -31316,10 +31316,11 @@ Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/driver-api/media/drivers/zoran.rst
 F:	drivers/media/pci/zoran/
 
-ZRAM COMPRESSED RAM BLOCK DEVICE DRVIER
+ZRAM COMPRESSED RAM BLOCK DEVICE DRIVER
 M:	Minchan Kim <minchan@kernel.org>
 M:	Sergey Senozhatsky <senozhatsky@chromium.org>
-L:	linux-kernel@vger.kernel.org
+L:	linux-mm@kvack.org
+L:	linux-block@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-block-zram
 F:	Documentation/ABI/testing/sysfs-class-zram
-- 
2.56.1.839.g22a8290db9-goog

