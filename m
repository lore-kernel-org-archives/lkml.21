Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405878;
	b=faT9/qpaX/0jE5qg0d13tKsMQtipb/sBv+Sm8pps1VggNCkluz90qpqkbY/Pm0TsrP5i
	 xaFjBqqDRV0BojIM5UXws6Vz/QBw6MMQKJVAKEwB54CKo1ZvPYqlvHaqTlm5AOBz3XCii
	 qi2Ro7vqMOyeetHyrxNq3eDUF3oaf8QuZTq9ogsd9dlOuCooX2PlJRnYTVGdia7tkg8GD
	 4UuqgCXMAJyr/DxYO7gb7oVqM2nPMooIY5zZh2SAbKwSqI52qbg9ZScEeFP3aRAnQeXER
	 MR2yyjhRK9KQ+ApxG0rGUPS5O77OYI0k6voxBppL65tu3ipLh6mcd+CG+7ZdgMiib6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0zns/FuWCRSzTf6H3hGrIkVwqafbH8YtgIAHr0k4B5I=;
	b=ZkQCNLqlC6CbiKgpaC1ZZrYb7o5tjKXsnJhDNkIwXmC9HQrm9knWi9NKjeMFfj6ViIeR
	 3yMVsNiSod10tAVXBncvALL9XyBY46jaf0hhdIoYBG4JeKwu4MpAahNCMq9nqeac/ACLS
	 DiC1skVriVfei+AUIMsg+1uKRqf0h+DaFm4yq37T9T+qCeSREDyqjJ2XEyS1szvFjg1Rb
	 iRHMLU1rD2qA2VrAKez0P5AfPmxK/BJ6jTlIg9RXZWEvQ5vvDCe/r83ftyJyB9C8lMF1K
	 XmlXk7GDYiBETIcVkM2e8NuBYSViI4YLvDw2zUxxh0j3STw8axkRpeBlQqhXmO0jJZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGgQPVVI;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65669606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65669606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGgQPVVI
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso925695137.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795405877; x=1796010677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zns/FuWCRSzTf6H3hGrIkVwqafbH8YtgIAHr0k4B5I=;
        b=VGgQPVVI27LpeeLquO/xK7PrifE2nfRnVLaSiKUDRTSHUvbevR2As0M4LzQw2kAZkc
         dU7RsyTN8EfHSf3bhE1ttDC88cmAGidxpYIn9N521bNbw2Sje9kp6owvUoJtR4hg1cUc
         gYkeDVGDrgtVUjjDgAifC4V0RAUf8I+9ubAXiDOYYzgPCCQh0x3ZV1/ssvP7D4yorAaW
         Xf0MOU+lhjw+I3tg9bGaOCEleIgWRChQiWY1ZVWm7Gf2Bw++bULxmnqJkGLCnjk7vOnP
         WNq97Zj6wxtkiAF0xOpux2xfzGhrTuLPY9VKvXYH+kC/IVTKi5Ox0y9z/5ZOtqGBXg5s
         Nlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795405877; x=1796010677;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zns/FuWCRSzTf6H3hGrIkVwqafbH8YtgIAHr0k4B5I=;
        b=YqQqsb8cmaC935cdNEMdyOmDdEppu0iNx4aUAnUVFwZMT++OPQmBz7AviiMU+k80IO
         yeWT7Cjzk2ZJduWYvnhmKRHh7aymSuzqIMYiu6IsQBF15t7DcWMyMNLou4QhnIQXACmB
         Kn7Pmc+5HsHzY0/CSWSVRA/+sJ83TXF5pX0RBorIkzi9gGquxTia2AnJc/XEL8Zmnu7K
         RhzGw7+lEBDjvaoWn6pS8gttRx1c3/EnAJsDsm/qkg4XxfIu5SkD+CaNO59L9fWytquq
         rKWE+2FKUedAqTF/hrrL0MS+FE1DNTjh52lcIv8lSSnmUSLNKDC/w/PcYP2qrwzAqEEI
         8aMg==
X-Forwarded-Encrypted: i=1; AL+hErGrnLo6jWh+ihsBMZMgD7iZTkAXynLSmF0SGd6Bcc594gXkWxOvi0Ro8yzWJWQbqNprrF/5ZIymnG8XdSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AIp7FP/mWUOU1CzB2ptAnsvr1M0Y/PH+dF6ceVNJBYahKlvZ2
	NK91Do5MKDN/IyvuRJ4Vc70BbqbtJ351bCbogrLBVxWVZYs3DegXwa9ApKdW0rg0tD4=
X-Gm-Gg: AZFdTZfvRTV05sx1Z3P7tCX2nE+GYUbHZpQu8QtqbsAyWKeYAH4RCRSgIBZo3uXPRHx
	GbycVoZl0KEaj3gexwvY9LcgEZ9cFwxCWJInPl8bHtH7I7kUgPWf8miDMezy7q4X0252AXsHSom
	JrB0fA8+RljnjftjToXVqMMVr0gJtcSXx9mlaBQBwAeodT+ASZOwndEEuKBu5s6ftJYTX3FexpQ
	iC3KW/GMBKCjqGSf8DKEJL4ykaxIl8OpXN9irAjmqxpnhSCyCHKV0sU9HHGhfbMKQJbDpv5Dyf7
	RKnb8FZnHzpCByXf2rZU8gzL1H2hj0bXjpaOgemkpk7rHxQ7m3jkbphjbKHgQBJISvL8Ccu4iBV
	M5Xg/BiWrpye9sAjtQFG8OXfU6hiJeveXie6Vm+rsHvHMrbU6tzOFO6SAoK69jwLEmJupmOujZb
	TUYNh+fpOzBm/p9XX+Z2m2tuW90hxE3rdIx0zwi7OvJkUBA1yjq0rZ511lvxW/YPg+qz89LoBQ2
	X4yiUgeP7I0hCBQvsDHGnBzSV11uCit5izI1e6nVOY1hmH/ie0enJ1RZzzltbnMDaLFA2rwWgEN
	nfQM9FoOJ6Ikd/fFhDAsQgJKWFUpUreONkaIGSGrdg==
X-Received: by 2002:a05:6102:26c2:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d73935fca3mr4111495137.8.1795405877116;
        Sun, 22 Nov 2026 19:51:17 -0800 (PST)
Received: from william-VivoBook ([2800:e2:ad00:1be:2d8f:4024:2b8c:a109])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0a2865sm10463616241.12.2026.11.22.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:51:16 -0800 (PST)
From: =?UTF-8?q?William=20Alberto=20Jimenez=20Mu=C3=B1oz?= <alberto1192456@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?William=20Alberto=20Jimenez=20Mu=C3=B1oz?= <alberto1192456@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook X509UA
Date: Sun, 22 Nov 2026 22:50:53 -0500
Message-ID: <20261123035053.12487-1-alberto1192456@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The internal microphone on ASUS VivoBook X509UA (subsystem ID
0x1043:0x1961) records only silence without a quirk entry. Add
ALC256_FIXUP_ASUS_MIC_NO_PRESENCE to fix the issue.

Verified on the hardware by booting with snd_hda_intel.model=1043:1271,
which selects the same fixup: the internal microphone then records
normally.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222320
Signed-off-by: William Alberto Jimenez Muñoz <alberto1192456@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a6b5e8987..f527b626c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8196,6 +8196,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x18d3, "ASUS UM3504DA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
+	SND_PCI_QUIRK(0x1043, 0x1961, "ASUS VivoBook X509UA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1970, "ASUS UX550VE", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x197e, "ASUS VivoBook X509DAP", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1982, "ASUS B1400CEPE", ALC256_FIXUP_ASUS_HPE),
-- 
2.53.0

