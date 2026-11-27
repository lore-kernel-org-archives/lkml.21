Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799586;
	b=0G09P8OF+5PwsWIx7PsnlS/4sqKRGJYQo85RPoxyTV9NMyg3BXc483OjE9YmR6Gdr0GB
	 Yr83Tv5q5dVI9AeaK6Mr315+5o0jViCRK4W8bSUVuODvpF/CotEK4FVIQf21nyST2hp4O
	 0+C7gOPKHxo/lypJA1/H9P7KgQ+rsiBHgrM97OOncuj6GWO7sJI0gyji3n3pT3GyjxbxP
	 jVZoSabDlNg9npfRgimJUvMybeEQTyVnLJJvM6+y4T+7JjOONJDIc/Ru/mhMaI679nvz4
	 robmcE4uRJTbYbJFshNR0HdOrRJTY8ftp9qqcvVLkjLGxbkWpj3RP52c1okoeDPnlzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
	b=XRultB6WcOQd8hhcJJzYaC0R7t71rJCiI79jxh2G8FwAkwNV+jUzyYa1x3kZ92gVTG8v
	 t0JtjoT5MHVp9Afe5dwsvuHSF+mGoIeknJyXdzfjsKMZNvhv7sMVuZio7Yy2OFzcEBl76
	 rNwyBA7nTgClizwdKZGyLHkqMyvktHwtsqECJrPZp7Gkd8/+QU5mIbpQbjp6E8aiSu4mD
	 vpdpqms/zYt98eUB26ugIQRepyEZMBpKzXRRuWL9kmo+qx/kTvxx0O3rGO0aReC18j6wy
	 s5rk/yox9dw60yaVaW0fE+Urf4XFOw+ZH9cBgzYSX0hHmBAMEPCqXx6Dwz9tfGDw0zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fj7vH0m4;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFF0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fj7vH0m4
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddc250d815so3245511a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795799585; x=1796404385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
        b=fj7vH0m4TeZVxSK8k5+Sz0uxrzg3f6k4UyMgACqdlY8cjUZo/6Vw64dAY+cCj8p6hp
         qJZMFHzUaWj11QpZHmyemfspjyUsV7SdGByfZPfNZ9pBVG0bEaCUp7j2xw0/KPrFXFTg
         JW9CWgxe4r+7O3oJbMpJT6sUt6Q/Hwzyur5mTQog7A6MM6zTF5Mhx6a9Etxm1eSZPzxY
         t/hi9LFoM9gFcRHYScoOsEZUlw5OWsUnc+WRVeQwBQHwB6lxQPmKtNgZ6mRoh/CqVkXi
         mWywp6E5Cd45e1sw3kU65/IWYgRbTYfUr5iSk9LULtwBEyvJHKhpWBtxpF64Af1+JfTs
         W0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799585; x=1796404385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S4J0Oj3sYJi1UqXP5r2+N/vXgyTszyUgul/cChtfHk=;
        b=HAfFKwf4v/8ToRXHAVaapfX56LK5d8PzTWTOp69wGeCIjHYJf7PIJboyYtxSzmYs3j
         ab643nFIf15WoSx9+xtRtBvfScmgA0wuv3pZdFndfDSQP4uFer5GwjUz6ZXnfpypy9ZU
         oK4jpPR5g2VqCmmR631Z0//UzzK/c1S2XJgIl7oeU5Lbchxccp3o6bIX4Mqixv56AsyG
         PXkVNwSgvClLeA2XFSiBVKEi+E51FsRUpihBingqfE1+pjgecCrVWM8vss+m2huDNAVD
         DxnUXGWi6DWiZW8Qp14bfUZIpRHx2Tw6xOPddCKo76ao1CkvBnevylVzT25PYq8ZinLZ
         7KMA==
X-Forwarded-Encrypted: i=1; AL+hErGGgX/wfHlOSZUdCNdZZo3zV0/yLs66kA6pJ7+oryUqX73g8bjqFkX6Ok1cA47+2mlK0twwt5qT247AtnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z82Lx7XARNTRtiO3w4fMSy5QCaVL7KMKWzBqpGIHaYG+Kd9KioP
	Xb60MeRicq7lV+OaQWw3teQOMwn/UHXIAmekFYPeiLKraW63xZy0KpTP
X-Gm-Gg: AZFdTZcp/MeOVzSu2V8KWpN2cY1hZzI3SMXF/bi90rNEUSRoC/tvMecq8SvwPWZYSLW
	AICLbwLut1i22fSUwvObbum57WbiKOcvaSZUk+Qj3apaWs8i8IAaVw14/dJ2FMn+gZ5kxHYQJCr
	0Z2EWtG4LuhSmRwxKeZA59anuSdl7dVyWZ6u6cCDRF63ZMdd8Up1w9Si/YpkFsN/BKqTDyrp3yj
	ZWUJXQIL1kNtr45siquVHnC5paBBMsIpXMa/NA7Tbotn8N2zVXl98YRNM5+r6OEh1I8Q+TyN5r+
	sAaK0RP8Rhpl+WjEWxhzGi+jC2d7FBzbQGJsj9UIKvAu+lsG+vLdVXiRlH+VzhR+pJPb3c+nvWj
	Na1GCK17phiJGhA2kv+PkcPa9PVFqJlYzZzYCjbohyVn887tgnboDMteJB0xrBrfsL3VgvQwL7w
	lR8r+PKe+F07/y5A18ONRvA1sS2PPXpG+BdcSjFkEVmf+q3M0YNpZ7/HwZaSufaQFhjG5alUgH1
	eGeIGC5/dRjl/WDRoQY49DXlr421LTtR45WIJyAgwOLYLHRH1XoAQDbubBfcIU3C4o3dUf0XqCP
	wDqaz78MQZ8NQRK3UVe/d8zhZHAAETxo3ptXCRWcaN7sefGiFrSZUrn1w16VwTGW5Pp/0bKrWTM
	b7VA0HG2Gy3jldt9nkwVtxBh+ACJ+Q4HOWza6mAX5eZ66QcMO+SvAO/Bjoe13juPtTPBO+JdTRL
	Dq0gAb2H6qNBZDJxrmGv+N
X-Received: by 2002:a17:90b:2e49:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b41c90811fmr24324820a91.25.1795799584854;
        Fri, 27 Nov 2026 09:13:04 -0800 (PST)
Received: from fangorn.. (97-120-153-124.ptld.qwest.net. [97.120.153.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm38643445a91.3.2026.11.27.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:13:04 -0800 (PST)
From: Carl Egbert <egbertcarl@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Carl Egbert <egbertcarl@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix mute LED regression on ThinkPad T440/T450 family
Date: Fri, 27 Nov 2026 09:12:41 -0800
Message-ID: <20261127171241.1619113-1-egbertcarl@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Since commit 8a889cce1c6d ("ALSA: hda/realtek: Unchain
ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST"),
ThinkPads whose fixup chain goes through ALC292_FIXUP_TPT440_DOCK or
ALC283_FIXUP_INT_MIC no longer get their mute LEDs set up. On a ThinkPad
T450 (SSID 17aa:5034), the speaker mute LED no longer follows the mute
state: no mixer control gets the speaker LED access flag, so snd-ctl-led
is not loaded automatically and
/sys/class/sound/ctl-led/speaker/card1/list stays empty.

Commit b2d447288fa7 ("ALSA: hda/realtek: Add
ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST quirk") added a ThinkPad
variant of ALC269_FIXUP_LIMIT_INT_MIC_BOOST and switched the quirk table
entries that selected the plain fixup directly. Then
commit 8a889cce1c6d ("ALSA: hda/realtek: Unchain
ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST")
removed the chain to ALC269_FIXUP_THINKPAD_ACPI from the plain fixup.
However, two fixups reach the plain fixup through their own chain_id and
were not converted:

  - ALC292_FIXUP_TPT440_DOCK, used by the ThinkPad T440, T440p, T440s
    (via ALC292_FIXUP_TPT440), T540p, W541, X240, X1 Carbon 2nd, T550,
    X250, L440, T450, T450s, L450 and X260
  - ALC283_FIXUP_INT_MIC, used by a ThinkPad (17aa:501a), the IdeaPad
    S210 and the Lenovo 145 (via ALC236_FIXUP_LENOVO_INV_DMIC)

Their chains now end before alc_fixup_thinkpad_acpi(), so these machines
no longer get the mute LED setup for thinkpad_acpi, nor no_shutup_pins.

Point both fixups at ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST, which
restores the fixup chains these machines had before 8a889cce1c6d. On
the IdeaPad S210 and Lenovo 145, is_thinkpad() is false, so they only
get no_shutup_pins back, as before the regression.

Tested on a ThinkPad T450 on top of sound.git for-linus (e79163b531ec):
with this patch, snd-ctl-led is loaded automatically at boot, and the
speaker and mic mute LEDs follow the playback and capture mute state
again. Not tested on the machines using ALC283_FIXUP_INT_MIC.

The regression was bisected on the affected T450. An AI assistant
(Claude Code, using Claude Opus 5.5) was used throughout: it helped
diagnose the problem, plan the bisection and write the scripts used for
it, identify the cause, and drafted this patch and changelog. I ran the
bisection and the tests on the hardware and reviewed the change.

Fixes: 8a889cce1c6d ("ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST")
Cc: stable@vger.kernel.org
Signed-off-by: Carl Egbert <egbertcarl@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5c3b383bb618..003f5052a842 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -5246,7 +5246,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 		.chained = true,
-		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+		.chain_id = ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST
 	},
 	[ALC290_FIXUP_SUBWOOFER_HSJACK] = {
 		.type = HDA_FIXUP_PINS,
@@ -5361,7 +5361,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_tpt440_dock,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+		.chain_id = ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST
 	},
 	[ALC292_FIXUP_TPT440] = {
 		.type = HDA_FIXUP_FUNC,

base-commit: e79163b531eca7f3fdc05031f4b43b6f7c51d3bc
-- 
2.48.1

