Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092947;
	b=gkOSER8HtpYi5dViXFC60Tg5wNYseBR1SmnFSMqLF3K0kr8QlGdEqT/gyGpztNnbPqRg
	 1klq5pmSmE6kxF1MpqXCrrIB9KavHwcPbWhg6jYzAjpN3xAxS1g+Jar/C8xk81+IYAafP
	 MrcsA+JPRNOzuDCy1TWULDKwpMO4oVGQLcXlqred2t5DisLwwyAfak2OqcMPgSRWUX1RY
	 pGd37vcMoGpssbHNiPMmkmwwJtAQispImt/gfo5JD7fITD5wjeF3b+vtfYLYxXgLixrx9
	 Qq+dAltnXeMXP7es/aglqn/DgBuhlhO3SFeSMY0EW+PXM5HmeIzRzPJ4fwlY0xJk2OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=A9m0MKy+gVN2zLdhjCiC0ZccLlxnaGGI2IAP9x2u+h4=;
	b=jPL+cpuznUOlutFmqzTt2tV5fvnPQaSk1Eo0ge/k3V2AQJzydpEzKwnHCjuEBi8k9ZDp
	 UNm+nSw05OnRbuZT4pS4gw/C1MeUTn0iKVrnKgolpXgxY9TrJYhsJy1VuLZyd5UO5EpPT
	 VpWLGAby4AUa8vdo3juBguVsAQqAs+jb5ScV0jNKwW7r22YqwhFb5zPmN5Hblj+60rEhQ
	 utR2RIoVFjOtrAjoOCp+Ls/4EtbO8xQcyotm5TSEqHNOFA/Er9MphFNl9eMqppbitblTS
	 du3adjlhkYHTIWf5nC/D8qObAYGp6MA+ZtwLicWB9KPKY29JKwIez2I3eM8qdxnUpug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFbppI9u;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49000606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49000606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFbppI9u
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so24255715e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092946; x=1795697746; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A9m0MKy+gVN2zLdhjCiC0ZccLlxnaGGI2IAP9x2u+h4=;
        b=DFbppI9uXoNQpCDAY23IuUSwd/tDZ/XbLe2Z4E23B09Pyt9+YYT+gzIe4fM4wY3nul
         4t8u2YeXljKfu/UAwBgO/1pI3LBmbFSFJYEvVdAj6Ae3k35HelIA/vcYtTtZZoOzUPaq
         Xh/GhjO17OJafhlpQAmg0Ms9teWR8AI8D9+I2FWv3v7ZT6kq0I47MHH3GfGXq1Ryi3OI
         Mt4Oy6nmtDWSfUa1ZCVkGVZX8rUk3sFAc0WyITSBs9ZuNtApKloMHaxCXHBGyDqBjthf
         FTdlY1dSCjNjBzsuv7zPr7lCpMSkfopEKjzBJMGiukBMwO6dr75qwa2CBxWz+2DORqXh
         YdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092946; x=1795697746;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A9m0MKy+gVN2zLdhjCiC0ZccLlxnaGGI2IAP9x2u+h4=;
        b=af1BY0OZhcE+j5Lu2ay0qY4xsJtHvHe+EVj8twtzsyGJfruOvotUwpFb+Z1UEjycC1
         whIvZbVYHq4D1UbfahfK2ZaeUlgrK2QaiERDbKEvnv4c8jCA8DELKnJOZEPjKf0qENJw
         plHzXZ+AQS5z3MAKG1mtieVbQ0pjfRMurbCXANUcIIaH3tzhIW6clxaOHiBMpe/jsWSH
         lz8xSEqpKjAs4+ugka/4Aw/7syFzSmjpB53QloxlHSnWogH3SHCkHiebJX4/3gH5OKFe
         EYueh5tneQiorQe7qNU0yrlD661BDCcVOsHbe6EO0fz4ALlILg8sHdlONMxuINcB3Rim
         6IJg==
X-Forwarded-Encrypted: i=1; AL+hErGakVEVNUqJ51YnwicGTTJavTbc5a0tTobWT5KuE63P6GlYiJMV0CcwY7MeOV/yHfBJ4yTQafx/r5vvE94=@vger.kernel.org
X-Gm-Message-State: APuU4Z97aeGWz8iuZeXZsc3X69ysWf3ukd49BAiWtbSAgKbaOzZXCBXR
	LyqjjwdWZsY09AmsCWUScWp3IGOWFr7QQuxNivq/gU1ktSIfmkMALmnS
X-Gm-Gg: AYBFou0pANBvfHQaLQnkHCck1Z7IQNCKffuPFKTf9B0RGTXg4r44h6yrXOB1HDkagtw
	JkuYINdRtrRgoSFf5uuekUQFMrEa+sWViM9FCQ77gzUgyEoUbugdNmlQkpA60/yis4ZDzMWSQIg
	wQ+tYu8m4ceP2i8UMJs7EFs14VijcfOfALtdtY9dQtIh6WOJRTFC04XoG9Xx00SDivKmJZV81OQ
	K2dgS2z1riswNI2SeK6edtF2Tj5/gr/WvIFZso6RpvJ55sr9YIuEMmxK/N4pVeV3RMFPfpSkVRe
	vvYY0wRMb22O39IZdqgTaJ9MT75ztSGcbLeles/88HUXl14i/oRuOqUE3t30v8Ysu+LuDvnzH5L
	cFIeWGpKZT4QOdGJfEhTkj5fHekE1R77WV4eqS2Fm6hR3FnyrjLFX4Dwzu9O96zxzSlClvDD5oX
	vqx9oMJFL4R/6bJqAnwTszeAYeVRIL5OzfDPe5tTmca2pE+8w3iXUo3/tPHBsaBuWn5qlOsMlQ6
	lXeJ0socSQGPjUWuhMH2jkMwLMYbnOcLxeXFYUtjH6V9bqaEHQ4jKSp7m9Z5Rd7Ue6S27OVrijU
	BlgX+GMBWZUOD5Anc86Ls8fBfYJhpPegauMHNSeIA7o8ZA/RGTtfbre2SGMMsRI=
X-Received: by 2002:a05:600c:4e02:b0:4bb:6994:abf0 with SMTP id 5b1f17b1804b1-4bb7da4b889mr120201855e9.23.1795092945486;
        Thu, 19 Nov 2026 04:55:45 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm10198193f8f.4.2026.11.19.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:55:44 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH v2 0/2] drm/vkms: give every composer user its own switch
Date: Thu, 19 Nov 2026 13:55:25 +0100
Message-Id: <20261119-composer-v2-0-a935e9bae6be@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw7CIBREf6W5azGFCBFX/kfTBeXRXmNLA5VoG
 v5dqFtnd5IzMztEG9BGuDU7BJswol8KsFMDelLLaAmawsBaJmgJ0X5efSkRraVgLad80AaKvgb
 r8H1Mdf2P42t4WL3VfjUmjJsPn+Mr0er9mU2UUCINd0peBBfueh9nhc9zEaDPOX8BaSLoc7IAA
 AA=
X-Change-ID: 20261111-composer-cc9620515bcd
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The composer has one switch, shared by the CRC reader and the writeback
jobs, so either of them turns it off for the other.

Split it: the switch belongs to whoever took it - each writeback job keeps
its own record, and so does the CRC source - and vkms_output keeps only a
count of holders.  A get() raises the count for the user that asked, a
put() lowers it for the user that took one, and the vblank reference is
taken by the first holder and dropped by the last.

Patch 2 keeps the lock over the count and the queue, so the state the timer
read is still the state it queues.

---
Oarora Etimis (2):
      drm/vkms: count the composer users
      drm/vkms: queue the composer work under the output lock

 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 39 ++++++++++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  5 ++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 31 ++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  6 +++---
 5 files changed, 63 insertions(+), 23 deletions(-)
---
base-commit: 97429bac371273886238bfcf63d78e7405cacb46
change-id: 20261111-composer-cc9620515bcd

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

