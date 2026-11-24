Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513399;
	b=O6sx9vZitbp1xFM16lXPSMWgjD5SX3cwxMcsMIUUjX1z0Y3BpUPZhaUiVC/uDvOs4rUS
	 bI1f23bkfHLoIip5ONHp8T1csOg6DpXPsMtQuUTzD0PSnyDmWkWN1iN/X478gFGeIqaan
	 DfopVfP7DS4gFytOhBor3P0OKs8vfc/LvW3JF7RCFIebUVnFc6fIVfeWfxfUrYXcAJSms
	 tGuZtxkMv7ys1ed9uukLkl5OZJobi/TasKLCAbhyZ2Bed40id4Zz7XXCvuRc3pZTzKjrx
	 jgQrLMMwG0t/l/VrTtP9QMVAYhvBTTSyMjTrLbB4eOHQOK1bFMzYh/RV8ZytH8mNDJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cys2vr4FxOC2wy4EP90QfgsL/al4QuIPLlm3DrOvvqI=;
	b=pCBpGEUEODEpbLvuqCTSjY4hS1NPIclWy616e3qEF3M5yk0Rod8wsZpph2xDh4JzInqy
	 aUNLC98D0zzuCCGtFWFb/5JfqvCJAa6S+B+1kQrN0yfmu6KwKM7aCShI+tUcNI+6pDneI
	 9bxYsnxnU+pbix0o3T3BMmPTq1uQePINNYYXMEseKJQFysqAYOXUY8KOkF/G+VhQil7qH
	 kAFlRQ8lNZcAIla5Zqcpif/uCTcxYoQOnuDWe9NYH1Ue8cbt5K6aVrkloemh5X0tr2+lk
	 kPY3v1j+sRALl+9QuE19dYQmS/cAHhRlpyoQijFlb4nHWGXInvpBT1gD+OpPEFLCArQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="m5ZrE/oW";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02169606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02169606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m5ZrE/oW
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f0458cc9easo32264615ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795513396; x=1796118196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cys2vr4FxOC2wy4EP90QfgsL/al4QuIPLlm3DrOvvqI=;
        b=m5ZrE/oWTcngpvpsna2vU20ifvNeL/BZ0WaB/4dRujJ22EPG9MehITuesH1T0KvJxN
         cX09heNyEpIl/dR4PmP7cIz9nJK29KDfFGF+5CpFo9xLuinJ8/k0ApAOpG/A0Q6boSYi
         Ku6wmZLuAsj+yvUvGh0HIpPX7Pjv5OXiOJ8+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513396; x=1796118196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cys2vr4FxOC2wy4EP90QfgsL/al4QuIPLlm3DrOvvqI=;
        b=EVu7hAQD9TBf+11umP7Zu6XdhfBsuwdqG5vsJ7tnR1qanqTj5lATWQVSH+DgAm2gHb
         U9+shztGal6NGv3SaHuizUgATpOV5cozVpl7mnDmjVGYmHIHiczvA1UhLfjInGphgVlh
         cv6h/g2Q9t71Dktu860iUUmjU7YUe0CK/DW5fzUi5vWQ2JruIG4zdb/AMe058EHz010K
         m1Ay/JSnDBYWy70eippkqydHq43MQJsHxNSiCIBfEWWqs0zH9NBeO1ZU0s4CRSPiCyiU
         4k6SfHVy0tI+1HFOVLIofbb+x/vOlTY9TZj6TotQehT8oTZgAhmsESqsxi9kPYnlSB86
         dsew==
X-Forwarded-Encrypted: i=1; AL+hErENrSFX0yGenByWlNRcjMp8PDeq1jq/sy31J3JZO2TTZt/hGptpd27j1XeJ/ogDqjP1gMEL6odQrPgJP1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IAOp48+btci3R7SyxoWqB0JcDKByJONRCiMHWQbY9lKor2QOj
	iTqzeKCRYCXXbVBvqlXeZSH+gIVtSYE6Nt6BlqZO3HOQ0EoqA8X4XtMR9QRNrIuKqw==
X-Gm-Gg: AZFdTZf7zmRcy+2ZL1Fje3lbbr91ZkbM7Q2Udbcjno5bz/e+CXmVr96DkGBpqbswikO
	szEGcxc992tP0jwDpNZOyYNgnKPcusCiVmvPppZxUap4xVWibbLuCN0CcY5cPVZ8sZvYX01n4Hs
	NzoKe0xAZNwJ3Xig+5u+qSoe8TBUJ3s747iLDdpC/Rlxitr+CZQNnGYZE+Oayl1NEzvQ1rG26kw
	yHHl2T+zeU+EpRz6biYpYHzYeGhWJBVCEfOSMLqO1zdoLYrLRuxKf80R2y3wLeodYqAMN0E7DIn
	jEonto3Vtg8U68L7mWRYfuK1Iusm97qsiQLQZMpYpGhu5OVcIgECMwr3DgF94R9lr+jIno9Ihls
	IkYeFdC82DrQeJ5Hz4faWvflFLvn7O88m46VCo3hHuOGzsDF/HaBGHfGHdNIG/FVzNE0qmdPiVQ
	sN/3JBP/JoctFODP/m/PXiW7uG4YpxtQJVewiN7J7NMteLN7Y5lbvHnAsYqIvqVV61FrF7KnrKu
	fEUS7sTlUTTTGuIYPWcJlgHnsI6hrRFEzaYlq5rb3mBH0+tw9yQDwbcSsLezu5Iy7XQ3IGX+THM
	62y/xacNY5VGnYGSEs3fdnZGBlASRbO+GrMMw/2sW7zzLj8X9zoFuaeG4GPyZpfyx5f2FDrTYIm
	4znj9lg==
X-Received: by 2002:a17:90b:3a4d:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b41c8d488cmr13754267a91.18.1795513396398;
        Tue, 24 Nov 2026 01:43:16 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b4b3c71192sm5790650a91.5.2026.11.24.01.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:43:16 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Tue, 24 Nov 2026 17:43:05 +0800
Message-ID: <20261124094306.563401-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
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

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves |message|
set to the default "out of memory", which is somewhat misleading.

Set |message| to an error message that is more specific to this error
path instead of using the default "out of memory" message, and also
print it as part of the custom error message that says which port
failed.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Use generic error message as part of custom error message (Andy)
- Update commit message
- Drop Assisted-by tag
- Link to v4:
  https://lore.kernel.org/all/20261012092725.575885-1-wenst@chromium.org/

Changes since v3:
- Print custom error message directly and use generic error message for
  later, instead of using more stack space

Changes since v2:
- Simplify to just using a small buffer on the stack (Alan)

Changes since v1:
- Explicitly track and free the allocated custom error message instead
  of using devm_kasprintf()
- Link to v1:
  https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/
---
 drivers/usb/core/hub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535a89..878d229085f3 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1743,8 +1743,8 @@ static int hub_configure(struct usb_hub *hub,
 	for (i = 0; i < maxchild; i++) {
 		ret = usb_hub_create_port_device(hub, i + 1);
 		if (ret < 0) {
-			dev_err(hub->intfdev,
-				"couldn't create port%d device.\n", i + 1);
+			message = "couldn't create port device";
+			dev_err(hub->intfdev, "%s %d.\n", message, i + 1);
 			break;
 		}
 	}
-- 
2.56.1.809.ga0b61035b5-goog

