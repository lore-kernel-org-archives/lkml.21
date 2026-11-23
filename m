Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396464;
	b=QEQleL3c/pIVdXmWL/gjmPvCS1fUmNTGJlrMy8YC5FHjdSiyd1dxOdeZNHwGu6HknHWi
	 ULLtNIQ6aB3sN4FOoWw5f0j1a6Z52yxFIm+cVf6xC5A5+MpB9+YaOOjpgPJ2KaGRwwLVX
	 LADTfvK2749Pv733Rn0izB+4BxC3YbR5VcR3sufe9J52uyxGGx4rk4OaiHdJ/pXrfia7u
	 cpAoW2rX9t524pg8PkvBM74aEJXcT2YUxNL87KVwfenP+p3MDKHHIYNBgn55JpJL1tQuZ
	 z5KTHI5OSHeV0bMSVjeggdTx8nNsZCYeztwwG7qnf5BsCjeHiYRBpM31zGF9nbsR4yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CHXXmkVwlU35isuKQoqN5mwPu5Ltu0MHi54EypRJlu0=;
	b=ne9aaRLhkvEFbJIpHhzOPaxEhY1XTadVLwyOylTvxj5/R8FOYfQi7Ym/kY/hzKPVT1+k
	 pUrW4xgV6ayEGxKO3BrxFypel7Fdbv9NRkBIgCf/qTyKYYUI16K/yGxZ1BzAy/4HBMDJf
	 ZaTswaf6laEbvj+7ndCt0csE5qBxG+ZBdSiDm3Mm7mS6lT8k0tJWo/lRcIMgjHeTJ+C+T
	 K0av46LTgGZbqONVrXFriHJe72y5TrCp7VjSUtKEFky+g5JsTWaOfO2+wbfsLMDBxBhDE
	 jN1rA/CzW6S1mq08PU13R11B7IGffevk1N/u1c/ofzm6XXWzXmnLaFAN+rhR7CUvSQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLYfZxYM;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7DB606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7DB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLYfZxYM
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1775975f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396462; x=1796001262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHXXmkVwlU35isuKQoqN5mwPu5Ltu0MHi54EypRJlu0=;
        b=lLYfZxYMSWmA1kHYYVmuloqDhwWyKpx9LPpB+YnK6yqlB4mSQb+5Hcpwr3kS5Rhzbn
         qISBeMDJC0bUkBW6N1b3qVISFlGRiAeSHrxg3qSnGKzIRAayoEFzuw6zw3z5SZ3IUZCO
         Cxb7SEcv6Zbqy3KF1ctTkGA8MmIB3MgaNPZIflb+43G/b0jAblyNdwvWt7fW1ycS6OiC
         cJ9ULSCo4wW8wmN2sE6o6CUVYbsUavY9pB3coDVMEHG4JIQw83wWyK1AqokgK6GqjtQz
         ESRspAsHGyGiRCDu6cDyR1DV1JOs1wows42eauZ5Z7f5QToolN1t7kNBfNxfJTnUGPuM
         hqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396462; x=1796001262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHXXmkVwlU35isuKQoqN5mwPu5Ltu0MHi54EypRJlu0=;
        b=LbyqTw0euzpRBuRNDFIjJ+fRRLWGJ7QSigdITke8wkkxNEMCwZSOYQfDM8Wi0ov5mm
         oO63vEVLnO2NNZybHIzFBVHfh9nqfkVBeCTDiv6gM8kJC1feBrWLvEQrct3G5VKMtHXo
         MoaLylicNxcSjl9DWu0813wG3xNmTrVnudQxExCNQQzoA4jc6VEwf0DNh41ca8TpkxjW
         l4Xfn568iQCU6Xo/5GHcXGU+Y0suR1/cl+MzMZ9mTByR9Cr0U4LvRM5a5gSWy6iT8hCg
         9cCFlUlLxo0zqe7xpsJLuKkxvvXsI9xupPNZRjj/1zw/Fzu13WMifm/ZdRr9aoIs/b1a
         bfrg==
X-Forwarded-Encrypted: i=1; AL+hErHwjdV9aNgXWeMGScnYY42yKdPOuMXD4xSPIJITC/mnB5YVMGckiA1bAM77iSHD0rVQAsCDIy3J/gPqlvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h1wlxtALV08SgXbV0aK2Fglh8zn23YZdOLovOwRIm505scnLV
	3PuSMYCar0efe/r1SQlHYnvCUS+3wR2TEC4BvRNJ7KhZINj5IqxkOq0S
X-Gm-Gg: AZFdTZd6Fum2lYtPRNqcFOzZzPjg9qDCJ21RhX46oGkk4g/FeoUddd2lQ+aBk6dvods
	OgK7CkNHPdjPvL2bf6176HuHhWCCD/P6SOpQaW3Wr0HHRy0oncJusA4UrFl+8VQdg0jKaI/M1yR
	kZ8hPXHXCqV2SzenaS+hibFe/mpjIGGDl90X2DgPWMAJtCOqy1t503i2/LxEupzONBPu52RS8T/
	yyBHQq/7RTVH1aSmDc8DdOeHwfL2FnTfGudXarfF8KS4Kxo6NQxVE3igQWfCdlPsMpRdSScpN2s
	CnJ4+5rARqVOHAbqRHLtvst5kryYyz4BfpMdUyAMPs5Md8WK2H6lgXvly/CyMO7tksjD9b1w0f8
	gap0LghuwZkgclvWADYqIuYdwNWF0KwL+Bhd5DdLva/Z6rDNj57vOhODv2YdNphLEgnNRCvJ/9v
	+W4XVYhPFmyHyCVTk0hwUkVMGOki/lE6nbAatasXaHKqsUh6SM29Aip7X9uYaEveQS44sYD+euT
	CBoM01zJC/BF9wGTkzS5lgVhodxClO0qqyIe/PV9z0CowFubvWgkh5V732D7D1KzmcsgvUmO3s+
	KQkxtTR3cQ5JRv62Ly9d7NnmnHng3twxQQn4ig==
X-Received: by 2002:adf:e009:0:10b0:4a9:2728:fdfc with SMTP id ffacd0b85a97d-4abb4c7af34mr12900963f8f.28.1795396462348;
        Sun, 22 Nov 2026 17:14:22 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:11:deba:33a1:e72c:924d:d172])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm18046903f8f.22.2026.11.22.17.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:14:21 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Enable native DSD for Fosi Audio DS2
Date: Mon, 23 Nov 2026 02:14:01 +0100
Message-ID: <20261123011401.1545242-1-morf3089@gmail.com>
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

The Fosi Audio DS2 (USB ID 262a:0001, Savitech controller with a
Cirrus Logic CS43131 DAC) exposes a UAC2 RAW_DATA playback altsetting
(altset 4, bmFormats 0x80000000, 32-bit subslot), but ALSA reports it
as SPECIAL without the DSD_RAW quirk, preventing native DSD playback.

Add the device to the quirk flags table with QUIRK_FLAG_DSD_RAW, as
already done for the ddHiFi TC44C (262a:9302) using the same vendor's
controller. With the quirk enabled, altset 4 is exposed as DSD_U32_BE
and stereo DSD64, DSD128 and DSD256 streams (88200, 176400 and 352800
frames/s) play through it.

Tested using snd-usb-audio quirk_flags=262a:0001:DSD_RAW on
Linux 7.3.5.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a4eb0d0cd..7b359a568 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2801,6 +2801,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SET_IFACE_FIRST),
 	DEVICE_FLG(0x25aa, 0x600b, /* TAE1159 */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x262a, 0x0001, /* Fosi Audio DS2 */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x262a, 0x9302, /* ddHiFi TC44C */
 		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
-- 
2.56.1

