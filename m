Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795723691;
	b=KPVvAWsub0lfpPOKCGYhwBWHXyyk5nSyxlhhyUVUx5b7F2a7jIuCWLJbQcffUYG4byOq
	 8NkhmeEb2ntMnJrdJDq9QrO+KppQwq1GFmNZKR5ZVOTdiqK2rYCe1waud7eRvV/Eqlxk9
	 /v0qHUmP+hPnAYaPBN4tAw0TN92ymkcqBTyHiycCfFLW4OeQ19KfarLrE7Z0ni3k28EtT
	 MBsXfCQcT9JrpCWN32bCoFvwbYmLzfz6H//B44JQqNvfue2N2KsQD/dkdSCFbhlEnkSBZ
	 QwGyGoGmubnrKAFdT0bcg1GSYmLEn7NvxFt+OW2dUYEAS6lRhf7P+QIn9mZCE0OsNnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uLqWBBlD9sWHuj/q7x3/6dvATP1P6dXJhD0nvFViC8c=;
	b=qyAvrr0e5gcoBaL7I66jR9FkeR+9M20NK4TUVjVCcxp0bodzqLEL1P382r32iClxSU27
	 Kl8PcBciYkd2QEf5ywULSigGUzxLv8I/XCsd4a938/J6bELlAoFMRm2ljaSaRhOPyqT/R
	 1ZvBRFIfH8apZVvXUJ8LNDcaX6krIDfPzgbjLtlPSAqLk+ZvImXSB9UO+TXKYTVNjcDCu
	 R8LYgKDffxNpl7f2BujVOanfWYlua0PT8g+q2MVGM98RT2NF/gfwSZH+ur3WdICYZnH3q
	 F59CpX4ICh+oP0GP+LrC8aYuS1gWEQR5ElGPYglEzOv1HS5/Ej0WmXFhCkF0e3Qw1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=et9UYc6I;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C873606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C873606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=et9UYc6I
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c511c0e2826so846938966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795723689; x=1796328489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLqWBBlD9sWHuj/q7x3/6dvATP1P6dXJhD0nvFViC8c=;
        b=et9UYc6IVKul1QaHts9/mT2CQvZn3tQGTzj1HjxfgWwTOJIrSjdX2YJL59556Ifezs
         2fAD2qSc2MlAj9Q0I1+pTO9vg2Jlwubyv9KPUwJ/Ar85nkF+g57UvhO0Z/LOaUP2Qee8
         twfZlesxAybyrG3koc5BuyOuwYsjjDNoMwCH+UI3zzmeOjXpVJVs7pXcVk1amwQG96dP
         DJqoRsVAX7tyWdLJexvsIyeTbyL0FR5WDUfF7klz4qLf0G55GjxH1XjYverzz/XymrtQ
         NH8g8+zWyQs9w1NrefAjAeBZrttGmUtmqZaR4Lhv5ZxGtoZgBfxfAezcrcpm4YJn6hWD
         EfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723689; x=1796328489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLqWBBlD9sWHuj/q7x3/6dvATP1P6dXJhD0nvFViC8c=;
        b=22m7d5V4eKWJa/ZoTh+9pWFeSjFi5P+0rs+81N8NwwbMM6cLPpCtOSmTfe06fj0Ttc
         OLN+youYRpu76SX0y3wy0uaQvnSKLQ6PN8dkZKMQHWlQM/Mjrym7UL1bBixgaYnmp+yq
         0IfAYnNMaZu1H2jUYoJxt+EJhujb0mC8mrB2+b2btfbh3PrvXTwB3j7gRhg3xpIGnUM3
         ly9mIrveI7rQ3Vxemehxpq+dlhhp7/7Ld6vgacFI9ber/aQB6fpHccbNsdKYtqDsdXbD
         I9I6R8/YX5dbd1E1wjEBcniP9GPi7K3JuD2GbEV9AcaNuq/C63VB2XbSzWYROHPzVkZ/
         UGQA==
X-Forwarded-Encrypted: i=1; AL+hErFM3gqOYRVJpjl50jtTFDXl+feaULh+TZIlQA82BIPopPYK+pBK6aBi7EWvT++TkasbGCrmyp50ph+GkWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K+RoyfoIsfG6oevvSPHWXevz6BRF06jtZNISgBYSErK0bVRqX
	9Rf/nWwfqEiEISR0ukM1GpwR7I4TKc8tfnCIWVFmkn7lpS7soxnpeRpm
X-Gm-Gg: AZFdTZd3ZN3KgKCZK0rRM5VO5FkDdWpiZzRECJ1ByjUI8HkuvRJ2xp/uGf+x1laAWIE
	Yj7EVkckEIxpxmfXV3ZIEcDnxADw+9A0QBI9nlAiN6kvJh4T9ZyWTEj8eohc++wZLQ3xNS7hezG
	HEC14EgJK06rvwiaFRo7qHjwGULBEmKtIMtExGODlwJmQ+KP8jolnQ4+bEMWHg4ccZsJxs4fwML
	pw/rZ+G9ahBmlMxLCEgqcAYwxQDWIIJZDiSVo5Z+Qq8xJImtTwRMeIxQRLVAklLP4thpjlEd8xV
	BripdzjCBEeKbx0TfCgHjYHFdv+HcERIl1mQTaOMxaJRWUha5bUcMAnXkPWXkIufjRCPALuXQSa
	2HDKE/nqCrKT+G2pglGGeTqlew7XLlkQFJS8nu6BQgsnb+r0UnJE6GQ79l+MJkbEqF5PriodCIt
	+d91slIyYhHSws3z5tJFIaFzNwiNuX08C/cJNh5qZM2MRhbDEr9ZrXFDwTnDoOZMNXS1W3tlmfE
	K6Agzf9pI+Wdwl90vBEmneTKiYdad0ys/WqDaFSdZL7Ku9paKXBcNrFFUoUKydY3hB4nvNehTdn
	27tjCRZShLYIA/FJVB3vWf1DCW5ZZj6UGhxlUOYCntNT0pnghiny+drflU+oeyaM36fVSzPYdDy
	YoKA3uOMQKGs5ybwju7rNCvaDISD+UZeBI/bql4ataokBN3G2J+Ky0UAafw25JU6su7BGpoH3zW
	2d
X-Received: by 2002:a17:906:7ac6:b0:c40:4965:72bd with SMTP id a640c23a62f3a-c513a9ae10cmr1297992966b.19.1795723689407;
        Thu, 26 Nov 2026 12:08:09 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm799348766b.69.2026.11.26.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:08:09 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: quirks: add ALWAYS_POLL quirk for Ajazz AK820 Pro 2.4G dongle
Date: Thu, 26 Nov 2026 21:08:02 +0100
Message-ID: <20261126200802.3717356-1-stijncleynhens@gmail.com>
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

The 2.4 GHz dongle of the Ajazz AK820 Pro keyboard (0c45:fdfd) exposes
five HID interfaces: keyboard, mouse, a consumer/system control
collection, and two vendor-defined interfaces (usage pages 0xff60 and
0xff59) used by the vendor's configuration software.

Nothing opens the vendor interfaces during normal use, so usbhid does
not poll them. After a while of use the dongle stops delivering any
keyboard input, while it stays enumerated, until it is unplugged and
plugged in again. This happens behind several different USB hubs and
docks, and not on Windows, which polls every HID interface.

The AULA F75 Max ships the same dongle hardware and firmware (bcdDevice
1.38, byte-identical report descriptors) but enumerates as 05ac:024f.
That ID already has HID_QUIRK_ALWAYS_POLL, and that dongle never stops
working on the same machine.

Booting with usbhid.quirks=0x0c45:0xfdfd:0x00000400 avoids the problem:
the dongle has kept working for several days, where it used to stop
after about an hour and a half.

Signed-off-by: Stijn Cleynhens <stijncleynhens@gmail.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c40d818417a2..cab0b3fc21e5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -799,6 +799,7 @@
 #define USB_DEVICE_ID_JESS_YUREX	0x1010
 #define USB_DEVICE_ID_ASUS_MD_5112	0x5112
 #define USB_DEVICE_ID_REDRAGON_ASURA	0x760b
+#define USB_DEVICE_ID_AJAZZ_AK820_PRO_DONGLE 0xfdfd
 #define USB_DEVICE_ID_AULA_MINI_60_HE_PRO 0xfefe
 
 #define USB_VENDOR_ID_JESS2		0x0f30
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 39e93b1383b1..e7773c946bcc 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -116,6 +116,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_JESS, USB_DEVICE_ID_AJAZZ_AK820_PRO_DONGLE),
+		HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_JESS, USB_DEVICE_ID_AULA_MINI_60_HE_PRO),
 		HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KEYCHRON, USB_DEVICE_ID_KEYCHRON_LINK),
-- 
2.56.1

