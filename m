Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271519;
	b=bjCRXJQlfiHEscdHFYDPIgj+NjcAfvS/J2sGk/gj2Y1Miw+WjM/bJ0Ih0vbHJmASTGHY
	 hBPsE5TdOot8v3lgLVYR+WP9dfwsoMbk9oauKD9LCDAnNC79YsZYevYq3ZGsMjwFnXrSx
	 QWNj5yzILehMdyKLSNhnjgGeN7f8DgdoqODWHvblHABXXll6EwoazxgtefKHlyGDKuAVS
	 LFkcPjsUPNkES+5tteMjN1N+f19SEA2wSu5zpPdeOChzA03lapVvyyVQi4g3oU+/cTLd2
	 NIMBDt7lLLo0hIHWtXFRmdB54/lPp0Y5oaImQKHSQvYazllNkBLGOTM8hGF6x+14qlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iX4I4UBj/NeLdZvtrsfyMpeBn2dh2A8yomo86MmHEao=;
	b=zLNDJbPJweoLpIcY4Ug3p0fQndhLBc8QDoOEMj7LBavhRrzZC6X3bZgAdjBnQ2HO6pqC
	 2N5j0gQ/xnW3+Jamnh4v/vefqIUxTZy6VBgwOYYV78fXYd63PCdoA4BYK+OeSH9/Q61r9
	 AQecWHGmTc/SDgh/MIt6z3zEUaSx93P9mbTQSN3dhgyfqg3v3USolxvvCNA7QGioA25SB
	 Gzmp/pJjl4tdD19AZuIc7r2gjMSOK/LsjViEuyr2pNivoHdPLnn1/yN6mrys+7MpjP0sR
	 Bkg1Adgopq/PJegxfGSPsxmA+avZraDmLYBSuEH2d1U9a1S+lOlWF9vQrQJg4SjlvzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJ6BEUhs;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2874606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2874606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJ6BEUhs
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b244fb7fffso1885053c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271518; x=1795876318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iX4I4UBj/NeLdZvtrsfyMpeBn2dh2A8yomo86MmHEao=;
        b=XJ6BEUhsj4hodvd/X18RQqjfEaNp8QOypzGFE6oXtI2Ve5SmHA+JDuWv5KfUwPglW4
         QRIIZuxfyCiRyS1dkFG7mzii0v5OLlhBaEPsEstaTvJnEg5tQkA8xgW4lgyqEEahCxc6
         hylrUQQ3+atT6Tx+8u8RW3+/rWPYd2XwEUHtWAUW6rWPONWmlNXm5YzUkX+vrLcfaxrU
         TEGfKaQ6Yr94SFWeIOFK9GlnyfR8Jz7BqmWzXbFA6S2QP9MqM6GAcxP3mwM+cbNIrEww
         mwFsJ97absvKsJT+KluSdQfkIyQzIZIfU0g7C2PI4HhGD5nUaTEouDTQ/T++5p6Ru6Jh
         yWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271518; x=1795876318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iX4I4UBj/NeLdZvtrsfyMpeBn2dh2A8yomo86MmHEao=;
        b=0TYdolixNn7Za56kk57abP771VCeTwk208SJ18Uu1KoDU5cUgQSTBoCn8el9PrfXyG
         gAbEVTI4ScPw5/IGl7L3+RMYsMtQ1e8MeonMeCIuXygo47jAMADouky/mL3oXg8hz17K
         CWIpui8Xd6m7KN8AcjAbkInziDLLT5d7SSwL1lS0KELggRdaf5R6QGKHy9cA7WjcF03Y
         MezHNg6boWxAajiExFN4qwcaJoNf4EM7se0/iE3n3kgY2zICd7ULUdIf07FfumVm254W
         pd/u3eOn/oy2fTWb27eZ1stwLzWdDBLwy0vNX+/yUL1tr7IC0RoiFmIPptstxn9Pqm1x
         IPdQ==
X-Forwarded-Encrypted: i=1; AL+hErGvEnojf0E39uayWlnQB9IfHqh6i2Vh1zuQkXSIjD4Qvw50D3vUYf5HpTBfLjRMsiSwnD2xmE9TM9j6vdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kVHA62HofWTgIeq3opHY5LXHEXAubWbNicZSohNExpu3+UkD2
	+A3VjHyf7fqLyW+zlnloJoQK0BEwpUCME8NaibklLhUK4b/WElU3m7wT
X-Gm-Gg: AZFdTZdzBAIfQ69RS9nS/ZBfBTgP+EZ1JD81hxlHwbGQu0SKIupbpubQ8eU/xyHFs3B
	Iu9hz5iIgIsUynIfLpz1PoOqgwFcSwATZpUzaS81vKTWm6lr4xRaUoi2KgB5opczCxi/4Ua7Khf
	H4U9u2f0s+s45HCvWxzFQEiYU5oMxX3ZWFK9m0x+JufnVyOlFAXmH3OaTb6vVjMHo9YupwE/hNf
	/MwRVhKy1H4U40mjPhiz3ATY2slFnsZHFEriVmwp4ZY0ZE1+F5A6GIkcx8xtbMyH2wbfmlDDW11
	okCdQhKui4Wkfk+6rJcl8gqNf4FE/TMEcY+hmmSXyOI1JGl18Nu6/6XUvS82TangPNydL4bb/yW
	samHiXOik37mrX9Fr1kAmBucMASq8iblftEG4xTKj2JAAM0G3bklufPDiem9UgqDtwMT6yh94oA
	N7B9CZbj13JVlqWY5OI3bfh53cSZ6lGyC83uF3sI6kIst+l0g7UDUgxW7YvEcJdCnvmHVmHRxgt
	yesrcBHScEd/7fng2nBZ86eN9j2cp5Mgyue+//Z6yCUUEwPr20WFIAU4xVG11+1mMySJvhOoU4K
	MZ/7HmVzjfetwZOiWVaoecgoaIvqJB0GtRB4U19htAHzz9wBEBmXmOehqAYTmAW2c2AfEvJC5nu
	7YAClcZ4VyKCYAeFkcW/gsgX2f/PIp/h1Uh5+LDipB6O4iqfDPgg0mW67qsGWXv5NDcMCD0UcMt
	Rb
X-Received: by 2002:a05:7022:ea26:b0:1b5:58e:b547 with SMTP id a92af1059eb24-1b5568aa9admr7108376c88.22.1795271517739;
        Sat, 21 Nov 2026 06:31:57 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:3915:1a85:6d5a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm14658015c88.8.2026.11.21.06.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:31:57 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org,
	pavel.hofman@ivitera.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Subject: [PATCH v2] usb: gadget: u_audio: reject srate request for unconfigured direction
Date: Sat, 21 Nov 2026 20:01:42 +0530
Message-ID: <20261121143142.17721-1-kartikey406@gmail.com>
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

u_audio_get_playback_srate() unconditionally locks and reads
uac->p_prm.lock/srate, but g_audio_setup() only initializes
p_prm.lock when p_chmask is set. On a UAC2 instance configured
without a playback direction, this results in acquiring a
never spin_lock_init()'d lock when a GET_CUR sample rate
request targets playback, triggering a lockdep "trying to
register non-static key" warning.

Reject the request with -EOPNOTSUPP when p_chmask is not set,
before touching prm->lock.

Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate getter")
Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Closes: http://syzkaller.appspot.com/bug?extid=e1d0e66badecc32d45eb
Assisted-by: LLM
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2: Add Assisted-by tag (requested by Greg KH)
---
 drivers/usb/gadget/function/u_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e53f2927b539..ff811ea1e25a 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -575,6 +575,9 @@ int u_audio_get_playback_srate(struct g_audio *audio_dev, u32 *val)
 	struct uac_rtd_params *prm;
 	unsigned long flags;
 
+	if (!audio_dev->params.p_chmask)
+		return -EOPNOTSUPP;
+
 	prm = &uac->p_prm;
 	spin_lock_irqsave(&prm->lock, flags);
 	*val = prm->srate;
-- 
2.43.0

