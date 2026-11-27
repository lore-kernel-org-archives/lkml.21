Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748025;
	b=BVX3Q0baDxGvCnRuBt5WOwt68sy9vJCi94vgwk2tAFLhzev3MxzAjBG8/hBqrVmeGakj
	 dBbapHA0SP8+AkJeR4DXoy4CDOaeF9QubdhEJvZjOOhl0opZdccXaSKtpb202ccfRzyzg
	 FKLoimWMsmG/JKAuo8y++c5boF9aouAPcZSsOXspP75bVxlC1qOzL+a9T0PvTKfEDWHBI
	 YnMHRZS1Z3IwqY8C0yFJPksU/7h5mjvvq2kTJ3h0mLn8+M3youkftYeUP0xbYitxt1VD4
	 6kzgUvhcLsvhTAwWj6N1WICxJdP35nPZ6YKU8ia/cH/VMjOJPjJi70U0jQ+kJnlrOng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KXNHMPifP/e5qRDE0bFaZtFJnTIFQv9fIXCkFWUz1ls=;
	b=CqCAFRFjQwK6/NBK66RyfuGDSRudxg5Dxqr0eCFO6mautnk8kQoVopoS+psQwblTXzhE
	 GrojV4gjOKl77DTg6BfeWpX3iXxGG2iTIY3Y8BAiBbL7NAcCWkcsBcrwE8tx39btBX52P
	 bUHzDfa4ra71MiWTWtWFAw5uTTXNm3ONHiSvtfBymsD0u7L6t2JIYYCGk6ym/NV4JBYJ/
	 BfkvruhI9wvsDBB3XeGNJkjD4uSkCSqm4RK+ejxnTYX30ifzjFzmRyYl/J10DvQGDxZrc
	 LrTi43oJPvszf3OHE2/lZNY9aAMvj4jbI5OIjcWa/HXmcKZyS8/51GHnMsVnq1uRoVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vA0y//77";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B3606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25B3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vA0y//77
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386d1859e1cso1969390eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748023; x=1796352823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXNHMPifP/e5qRDE0bFaZtFJnTIFQv9fIXCkFWUz1ls=;
        b=vA0y//77SsF+5kLh3TbONqfnJKRRO1lstaDpusYK1bEhLcD9o/PcoE7+h0xRhVeark
         8NwRbapFbc9sNagT6RQ5Aod4id0d6P/E1+qVmCV9bnYmQvtmQm1Cfj2g1rNAMLDrppYq
         q1i8bBrnUjowYW2ZWgNCboCcYpSQO0QuCyCO2bZy6AIWaAk9v/4SdhPUALJdnVtHHsZr
         ZN+lGZBI7+hc0QFOrETVUq40d4iLQIa32/y1MlbIP3kA4iQT02yJLRN2SigiPrtYp+cV
         NFe4zbP8Z6Qq0ufcQgrJykFR/qaT/gMk4M8yIvZ//eUdMgK8/YQEnpTszqzdy30QZwES
         YOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748023; x=1796352823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXNHMPifP/e5qRDE0bFaZtFJnTIFQv9fIXCkFWUz1ls=;
        b=xxstnJCxOE4evG8Oo4U/C9/flaNSpiSIa4ulIvKLEsDvdLC2dR7N4nyshk6Z6yeJLV
         feMK8MKJjxtdjNGmtBNpSLBN4wPEEytE4eaPOwVFimPFmUUg+fr7DTZ0IaPGcoLPrHNI
         p7hulM6b2l629mkWmlaPDT09JYBYKmkr8lfHQ00CcyMi7PEzjAxxFgtXGKgqodpqh7XO
         uDWKZCE5NntTNPZCSKXF/CH9zsDpD8AtHA7QL0Q4yO0fv+Kq2UsXqaTeAoB9SbOQNPuH
         6udiZtB3AiR9NIfuF88oui83zXbXvtBvEk5d6jcadJaXMYNFGwt1HCoZyzRgSFd0Xg6x
         nFBg==
X-Forwarded-Encrypted: i=1; AL+hErHrBa4wIHspCaFApRVh5xTcn/Qt+tqG4LKXCcE6DbbSSL0iikjniV7r1gPvT3c2mx5+XQoKy/G7e9I0VFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JTmfKHJpF4cISyvUaFN7+ROajx6cDWqYVxuRPNnRLAeecCmOB
	Owe23TTgcj3IZRWY5xrcdq/FUkRxC3mQIv85B0umwY5hzNpZkgp0beYm
X-Gm-Gg: AZFdTZdwHZ/cflNVOYHe5TozxDIDmBDdwKXpYWZRPn5WH08pee3S5wO6RvXJzU6sWkT
	SVmlyHZlyCuNbgfjUSNXsU0JNuzYdoCPtiva79CgvRThpby4eCuqNz7DeYpvLnDeaMsYsyD6QXT
	Ef0w5T8YI6T6sQt7t5+tlLU6uSLPE5sRodzGYKars05GX+1ulgLNmVyfcaxPa7yGJeLbKzhh2s/
	VGUUcllAZAA16eqWPJoCoVCUcAO5kVMGVY50cgQolvsoIROB8xYyx9mvt2+rXF9kUpF+oqrzSK2
	FHscNbtRXz78tNi5tio5wZmg0i+uqoAxHMjtIZCThtzgfDeDmYj/a+B+HziQ1mXRY4vcqDu03Jj
	LAE2u/AHXOngsSubqejcEt/aMjGVdjg0uTJU9j84IxSdMYpISOGejG3gk7AFh/+8J4xnLuOUsT5
	in2cWFao16mx+Ot858ThRkg74gIR4qlErPsWi85+zpKPh54lgPP302/CRIHbz5HlIsb3eXF2ftP
	mW2Ud0k3hrJYoaQ6CiSHyw/btoOZ1KKv7/wgWlEcX63ReYZR1HIx0ihJS/1eOCwmJ9WR+vu5O6r
	MrW0G4ypivg/ykViWlc/oZdO9Lg453YRePr84C4NvWVzdQqbvRYUvZ8uADK0jtTe4+QW6mpEhHL
	InWXxqbpPRlBDNWLMnGeHG2MOCwFEhUvyHOzqetr1HbscrRlIkwAU2w0zvuXak8V10PUqSLi3Li
	MSsIBxt7sD/00tLU4sI+g9lew=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr23615847eec.7.1795748023378;
        Thu, 26 Nov 2026 18:53:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm75811610eec.24.2026.11.26.18.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:53:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] platform/x86: dell-laptop: Don't use an unread keyboard state at init
Date: Thu, 26 Nov 2026 18:53:37 -0800
Message-ID: <d1041fca76cb1ad27880d2e20a464993db13e975.1795747885.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795747885.git.rosenp@gmail.com>
References: <cover.1795747885.git.rosenp@gmail.com>
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

kbd_init_info() ignores the return value of kbd_get_state(). If the
call fails, the uninitialized state on the stack is used to set
kbd_previous_level and kbd_previous_mode_bit, which are later sent to
the BIOS when triggers are enabled or the backlight is turned back on.

kbd_get_info() has already succeeded at that point, so a failure here
may well be transient and is not a reason to give up on the keyboard
backlight. Start from level 0 and the off mode instead: the code below
then picks level 1 and the first supported mode, as it already does
when the backlight is off at boot.

Fixes: 6cff8d60aa0a ("platform: x86: dell-laptop: Add support for keyboard backlight")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v4: Fixes: 6cff8d60aa0a instead of the reverted 02b2aaaa57ab
v3: unchanged
v2: fall back to level 0 / off mode instead of returning the error

 drivers/platform/x86/dell/dell-laptop.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index c1a51bf95c25..eca348497ac3 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -1455,7 +1455,7 @@ static inline int kbd_init_info(void)
 	    dell_smbios_find_token(KBD_LED_AC_TOKEN))
 		kbd_timeout_ac_supported = true;
 
-	kbd_get_state(&state);
+	ret = kbd_get_state(&state);
 
 	/* NOTE: timeout value is stored in 6 bits so max value is 63 */
 	if (kbd_info.seconds > 63)
@@ -1472,8 +1472,13 @@ static inline int kbd_init_info(void)
 	 */
 	kbd_info.modes &= ~BIT(KBD_MODE_BIT_ON);
 
-	kbd_previous_level = kbd_get_level(&state);
-	kbd_previous_mode_bit = state.mode_bit;
+	if (ret == 0) {
+		kbd_previous_level = kbd_get_level(&state);
+		kbd_previous_mode_bit = state.mode_bit;
+	} else {
+		kbd_previous_level = 0;
+		kbd_previous_mode_bit = KBD_MODE_BIT_OFF;
+	}
 
 	if (kbd_previous_level == 0 && kbd_get_max_level() != 0)
 		kbd_previous_level = 1;
-- 
2.56.1

