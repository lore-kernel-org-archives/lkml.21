Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639093;
	b=2TTky3pT3iojVTSKmmYVeIUaJ6ONjABYyvJx+COdhM1jq0JfpOi75pchT7SnX77y87dm
	 ugp0kXc1b4m+7YchrSVx0FORLYexEZp/h6Rcvyl6lUiz/PgqZa86iqUjyuNiF/8C27lSK
	 cVyLTqcjlj+mG3edEhPEW93Wa3pmAYO8FXZseHzJSfLjA+NG5f6eiRCWALPcs93Ng3npv
	 +xUt8PAP4nFugd8WzOgCiLOzvTo8p6CgJhRxmuQJx3PHDXpEk5ir9wOODjNm0yFuwErMy
	 RaRnHZvpg/HOjAhW923ssXd4ZumGJteqadnQ87U0KIl8Ux7q9LHr7cAgMO9x0eqMGRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MOLrrSGpfOvCRTdHbo19fWlRBL5HLF65kXhbZO1anXo=;
	b=BM/Oo33vTqLjXfMhjIxIoZD+3dwGyRyM9amJ4LOl3kVs++35Oj53ACl0uKAAqawGwRD5
	 hx6KtuoyXcehIfyReHdidxtRozLTfSfUuK5ZigFPnmnP1wGmwXYW8r4m0ts7xl2IGMN9a
	 hytKvw1V42Jm+rDpILDEMP7FrKOpLcqgHtX24j+th70MVKK4tR10EivO6QFG+H737uRYV
	 FBCfiymxho0NdmvZplTVQcNxpJTn6lnox1t1EXAmRtxYJervtefkg2If6CyFakQQlbgLp
	 W5bxneyAWr++acLvq8yViFSjG2h0zjhQxEECvg2ZR7cizru/0/FWOtgfckVTgggQLeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKaHkTYM;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DBDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKaHkTYM
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a070755c8cso3105773b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795639092; x=1796243892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOLrrSGpfOvCRTdHbo19fWlRBL5HLF65kXhbZO1anXo=;
        b=wKaHkTYMkPponA0AEVaZvEw7DJq5OaFNbRZiWtMwWb7w1iyF7+Dmo371gdqCFfcIXU
         gPJjJnqiHKl5dpJyfoJMw3AZ1XyfrGUQUmY7ElnmJYtgJS4igNzJJVV8xuBXbFGXflEP
         evdeYZTB321nf4kunLvxRNm0hpMCNbY81REs+X0udDjqmXKSxFTySEcFscOGxjygHWTL
         Wqx80wxilWJ/3F3wJQ0u7/2H2BMJ1HRj95yw07brifloVBq9M7J65O7guZuj9RTeZJ+j
         /0calMro9nDSMgjCocDQxnQh3g9Odxc59ra5RejW+0otU1g6VleXt6EEQ9de0Q4Ktux9
         0TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639092; x=1796243892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOLrrSGpfOvCRTdHbo19fWlRBL5HLF65kXhbZO1anXo=;
        b=mqi1Tudo6/8Xj8tfMWQik4EJoz0zMf4aXcPdajBNAGiw2B04mytI+qQ4Yc87bU8Lp7
         iwLTCkCJUFeMVhVQUk7dg3tDfV3tUK+XbpOemIsFIxNwPMcslz78P6AACn8EmzzEov2q
         o2VfJLL0vfOJ17bInDzUgs6kEWv2iyWlcvf28CHLLX6AkkA3eYDxJSzCqpxnCFXGOPLP
         5NBpfRvgte37pgk1JNr47Hvevd7yYaAtZIJffnHPO/qCpq/Ou7GXm459rBfgBwfGcJTO
         PZpC12MCCwlTRX0wyedgzU8EmPgeHp+IdXda02cSdZ5orHAfDW+tOOQavFEWpjnCRR6w
         LfBQ==
X-Forwarded-Encrypted: i=1; AL+hErFrrrU54GOyTp1NQ8GyORbqvmMlXKcK/Jqo8YdiFFwp2LLo3C+ZDn6jwUWix3zJsCGonvNNo/avEozzDKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kfx2lEVVJAlQpVSOaOd18xE0sUtk4vg9RC9H3nuiOdzc5EGVO
	PQ/R7Phw/uf0ZnT5PHBayN7xoZkdaMIjtXj27cP1fn455M1+Isry6egl
X-Gm-Gg: AZFdTZcNsMWh0Bha7eV/nqRMNmB6jvCn/RgMCBUWlG+v6S8A9oW40DgD/hLInMj23aA
	JrL9ZLlFmslqcA/UcMLSSM553EqndKxM6jkBZCp7mPGmwfL+z/M0fzZZAEAPVGvyyxRTmB6Hg/m
	6ZSmVrsXKYGxyHUh6qWdM/zM93ajg2vKHD7C1DgVzjqeEV6dTRGXqf+D+7o/dpVsjacwpDSGzWn
	p+I27Db/WMB1wPmQZQLEl1OfxUh/Q6Ksp/dxpHp2pnCK4ZENRBRiqE4lBNveLZ98NaiP/YmhK4F
	80WTPaFIAjge9hUWjn+d5skNzdyN8/lfv3IiqRRFQ64v4u76Ix7tYLkNVRHIfngqKZABO/egNec
	ciqidBon1DJUi8ynDnVU9A9xtA+zwtExFm6n/qNK3IeX8vhYaDrVZnUJsBjt2h881uaw5WZnrDU
	jvZvAPHiIbWlZo8CTC9KQvBCyvDWT73pffmd4Wc5fhcHmAD2vlzRbnbBjv0TnSXU5pzqrYTSp0i
	72bHwQITX1vJfr4FKFKTF8IbxwforDg9iyujzGuWK9YLG0oAdxbMbgns15qKZL1BnCT7IYqWn78
	SkVpeecBWaX1g4VQKDsRq8AvCpdYPR/f+/hBkv3D/R/YMgcKPpTW0ajn5cvjb0QNbvwyNwC1GtC
	mS3a/h4nCtGOuSw+sbYD9U73sNq4tuUvu1CI77XWS4VmE9mqdGACC
X-Received: by 2002:a17:90b:4a48:b0:3ad:eb15:aed9 with SMTP id 98e67ed59e1d1-3b41c7ac064mr16372116a91.9.1795639092455;
        Wed, 25 Nov 2026 12:38:12 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:25:846:8776:e78d:e6eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm28875632a91.4.2026.11.25.12.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:38:12 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v4] wifi: rtw88: 8822c: validate bw and nrx read from registers
Date: Thu, 26 Nov 2026 02:37:53 +0600
Message-ID: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() reads nrx and bw from the chip with
rtw_read32_mask() and uses them as indexes into dm_info->cck_pd_lv[][]
and rtw8822c_cck_pd_reg[][].

When the chip stops responding on the PCIe bus, register reads return
all ones, so bw and nrx both become 3. bw = 3 is past the end of both
arrays.  When the chip stopped responding on Ubuntu's 7.0.0-43 kernel,
UBSAN reported:

  UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
  index 3 is out of range for type 'u8 [2][4]'
  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
  Call Trace:
   rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
   rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
   rtw_watch_dog_work+0x217/0x330 [rtw88_core]

nrx = 3 fits in cck_pd_lv[][], but rtw8822c_cck_pd_reg[][] only has
registers for nrx 0 and 1. The entry for nrx 3 is empty: register 0,
mask 0. If bw is valid and the level changes, the driver uses that
empty entry. rtw_read32_mask() then shifts by __ffs(0), which is
undefined; in a test that faked only nrx 3, UBSAN reported "shift
exponent 64 is too large".

Return early if bw or nrx is out of range, before either is used as
an index.

Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
Cc: stable@vger.kernel.org
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---
v4:
- One patch instead of two: check both values right after they are
  read, as Ping-Ke suggested.
- No code comment, and a shorter commit message.
- Dropped Luka's Suggested-by and Reviewed-by from v3: this code is new.

Tested on an RTL8822CE with Ubuntu 7.0.0-43. A debug-only patch made
one or both reads return 0xffffffff for 30 s. cck_pd_set() runs every
2 s; "stopped" means it returned at the new check. Each faked run also
logged 2 or 3 normal calls before the fake began.

  Test                      Calls  Stopped  Ran with a 3  UBSAN
  healthy chip (60 s)          30        0             0      0
  bw and nrx both faked        17       15             0      0
  only bw faked                16       14             0      0
  only nrx faked               18       16             0      0
  both faked, without fix      18        -            15      4

The nrx part was tested in v3 (Ubuntu 6.8.0-147, bw valid, nrx faked
to 3), without the nrx check. UBSAN then reported, once in the read
and once in the write:

  UBSAN: shift-out-of-bounds in .../rtw88/hci.h:203:22
  shift exponent 64 is too large for 32-bit type 'unsigned int'
  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
  Call Trace:
   rtw8822c_phy_cck_pd_set.cold+0x15/0x36 [rtw88_8822c]
   rtw_phy_dynamic_mechanism+0x322/0x6e0 [rtw88_core]
   rtw_watch_dog_work+0x1e7/0x290 [rtw88_core]

Not tested: the value 2 (the fake only gives 3), and the USB and SDIO
versions of the 8822c.

An AI assistant (Claude, by Anthropic) helped me read the code, write
the debug-only fake reads and draft this message. I wrote the fix, ran
every test and checked the results myself.

v3: https://lore.kernel.org/all/20261115201826.181662-1-zeshanahmednobin@gmail.com/
v2: https://lore.kernel.org/all/20261108182837.682661-1-zeshanahmednobin@gmail.com/
v1: https://lore.kernel.org/linux-wireless/20261105113415.73184-1-zeshanahmednobin@gmail.com/
---
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 09315d23e2c4..830dea8169c5 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4406,6 +4406,9 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
 	bw = (u8)rtw_read32_mask(rtwdev, 0x9b0, 0xc);
 
+	if (bw > RTW_CHANNEL_WIDTH_40 || nrx > RF_PATH_B)
+		return;
+
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
 		dm_info->cck_fa_avg);

base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
-- 
2.43.0

