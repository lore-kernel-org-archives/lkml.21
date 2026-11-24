Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526464;
	b=20JMJTdo/3gH1tMcNMkkTooub8sU05GEvN5i8LPMxqJqn70SgLBnstQA1Nml9QQwAL7Y
	 oHNbrV71lRXSjajkFkKtS0utzsF8lidx/P5KeqgoTCFOptfpTzzxYl2uyef8agEi4L1GY
	 DU8s7VpSO4iXPEAEBVZ1OwsErGE8+CrgayzXySAYrikqgfrSwJAQDShaByDswsbCQpYa/
	 QsIVqVoUMplrZcnO08OzHDhh7yRluMRq/CN0jbjMJw8dNWQpqphJK6hJpuz1SuTH0Otps
	 Keqh28wjUqEoovfahXW1URdhEDHrXNm52M1n28vRVhInzh8/Xr/FzTfJ3ghqXTZCZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4dS73s0RNBwQWtJKgOmGopns0VxsPPRrDus6J8zeb6Q=;
	b=YtC6sPIhJqhDuNDEscfewLS2KS9uyuo6mzrf/BfBzhwR+De7UTdQW9pi9qSHFdWqxRq9
	 c6rGTmaEk8j+NyGlSvBA7fgDNAo+3v8u5aV2zp+dJbjXlQ0GAVB90RBGIiuvXq/a1e4Pq
	 RlZGZVBo6ZcA8Wb2O75G4++DQVSBBrs1l1FFqMwx2KDcUrAdkXwDFUHlkF6h1tuvMoQge
	 koYa2scydr8oJC57S5zksL8H0TOJvdxarUb8j4WB5ucPP/JJ28GPUAK/kNG2tsLsEmN1a
	 UGs9tFWKjfwO9fED297vI3gx9ro+JKvd6Lm2Q5ANCxgKRmzK9+Nb5YIIGZK2OXsAHmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DLXp/EvN";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D6606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 412D6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLXp/EvN
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1807348a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526463; x=1796131263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dS73s0RNBwQWtJKgOmGopns0VxsPPRrDus6J8zeb6Q=;
        b=DLXp/EvNuPGuj2+h4sUiMmjZgjb4JJ4XKMfjlNl3Zvty6aMzCJID8AttAmR6UMs1at
         LarNW+D5s7o51wQ+9lOXA80jOXnp8FgwlgKFjClVTsXBYkFKybrhGGnbzpeDoKyiT7cx
         W/cYG7m3ziGLJbEJNmamp3oGSEc7BCQGS+NKHoN8jZVkLy2gNdwYoBn/RirsKkjd4/rd
         fDAFpEJyarnc+aEdc3tzFkb3iHCPaY/0TtSmIPDzVVUJDfPKz65JfPMzFHWRg9IA3QA5
         tnQ3xBZcA7kA+TrZ6yVFPJRXsrpSgrndZXs+RhO1Nnsac/0zvYihPJTqg3YLMWjsis5j
         BIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526463; x=1796131263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dS73s0RNBwQWtJKgOmGopns0VxsPPRrDus6J8zeb6Q=;
        b=NP1uAfeX88c2gYmRkGvUKGhSJx4rz7qkgfGfwe8xpbdWQ0LJBYUmF5GHMMmfMg9vfM
         0F9Clsqvb2p3hhlCwXRb0VmWHj/a4tQrFb4uqWKVSXP7D6V8BzQu8SsSkOGvPgqeTN3U
         MNb4JFbB9JH/nQ5AN9Gyq6hgm1EfCxmdeHnFw++lRQwXfL+PkGd/5Mj6avV+zGLnvtC6
         Qrxdp7G7KEIMrb3SXfeHVdnxX/jUNcbBntUWE+OfK+xCrsVGLDA++QpMmCHuP/xGbeME
         hAtxCo3llIyw/oZN32R2GYxmR9BkkQ+Jel7o2HDwq5f+d89hUfGbctvL5M8QzPAZtENW
         CwGA==
X-Forwarded-Encrypted: i=1; AL+hErH15eXQOuvshldgOvTjDZOefLP+kUzZitBo/5eSb6xiuvc0pnVvzP1LPYXK67GlOouYjJEjMRTEoY3V/1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Aeh+fZFa4BzNEA8ciATfRv0YNU9lAe4qDvnpNOru2c+9M3yms
	rIG5wMNTQYHEJyoL6Hpjk/UvCK8g6TFR2r+ok5J7sG2rlou3r/UMwy+Y
X-Gm-Gg: AZFdTZdmuCvIlmdoQ0OOYEmqorJ7ZXKNjyhSP6j8UIAemqA0ucbB4dFXpEhkPZItO1E
	buLD5rmB5a8VorCfT+J5I1sipuNKo21RJ6ZPAD305cOw49qogMmkinCQew6wEIgt9BLmbnqGaOc
	oQcal+5jiDI3oNClZF+QBzPtJF7PYfQGDncjE3v8xgPkZe3qfFmfUiUCVzSzdo2WTaV0fGBJ3qQ
	wtbBVagXsiNfjuNkLgpcxzW4lmwDYNo9s6V3gZ8AXYakCKKdt0XK1R2hpQDqvSuurWhBAJWIBbb
	/xx0PXIuLxhwJVsBNI/NjhE4fl72Zo4HP7AW+Wn9CSp0EpNR2NGFTSwBjb4+y6BRBudck1FZ75Z
	Ih0qhB9DwLBscRQrH+vEul6gTu5FU3lvpsn9r2Zw6f6ZctWV+oI6H+onXHLwDDDdnbnPdYFCFa7
	9yZwOOAQtllZkaVjrknVIH9OCOCdVjJCy3kj9f2s4fxEhRhu/rqgVhoyTVKpkTsDPJptSJIgjRn
	J/+dDabT9OpQW1Ov2TqfJ3wHNZ9hMiOzVMGa+HqePbOdLYt2SHKS0VK9AU4haUK5vwQz+9pWU3d
	jTpjyUF7RcJdzul4/cnK602sLWm1OLY6tgPF6mXxBS6JTraOeHy9wg==
X-Received: by 2002:a17:90a:d2cf:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b41c994355mr11715156a91.62.1795526463470;
        Tue, 24 Nov 2026 05:21:03 -0800 (PST)
Received: from fedora.tail41c118.ts.net ([2404:7c80:6c:6dfb:223f:1b1d:3633:124d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm12556863a91.9.2026.11.24.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:21:03 -0800 (PST)
From: Arshdeep Singh <chahalarsh342@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arshdeep Singh <chahalarsh342@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Pavilion 15-cs3xxx
Date: Tue, 24 Nov 2026 18:50:56 +0530
Message-ID: <20261124132056.57345-1-chahalarsh342@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The HP Pavilion 15-cs3006tx (ALC295, subsystem 103c:86e2) has no
working mute LED by default. Booting with model=hp-mute-led-mic3
makes the LED work on this machine, so add a quirk entry for this
SSID that applies the same fixup,
ALC269_FIXUP_HP_MUTE_LED_MIC3.

Testing: verified on the hardware with model=hp-mute-led-mic3, which
selects the same fixup as this entry. alc269.o builds and
checkpatch.pl --strict is clean. I have not booted a kernel built
with this patch.

Tooling: the working model option was found by manual testing,
guided by an AI chat assistant (Claude). The table entry and this
changelog were prepared with a coding agent (OpenAI Codex); I
reviewed both.

Signed-off-by: Arshdeep Singh <chahalarsh342@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f49021d01..2212e6027 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7837,6 +7837,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x86c1, "HP Laptop 15-da3001TU", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x86c8, "HP Laptop 14s-dr1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x86e2, "HP Pavilion 15-cs3xxx", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x863e, "HP Spectre x360 15-df1xxx", ALC285_FIXUP_HP_SPECTRE_X360_DF1),
 	SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
-- 
2.56.1

