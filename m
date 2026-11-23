Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429797;
	b=FIF2iz1fuTwG9teLk5G1Sm/vWJDoCRF2mzFBG4SbttFnG7lGqjh7nH4ZAhfAbnMrTwNE
	 6PByq6zSrj/6/VNh4zuGfjF9HWPFG4UGlx8qeQ+/gNhpBvhH8lIxcMTGmwd+QPs4VYC8F
	 +iKoIN67ORTFzcAzRdAhc5pe/kyMotYzEbHXXMZ5LX9eUthJ6h+wLfHC7EeXRbdxDFINd
	 03W7qll7QEwjo0VMFM7z8+zi9bjFJ1fRINL0Z1ZpPHeqiJfil/ImlXLIxpSGS8Qu1+j7F
	 OgLl0WoWSkIeDrGNpoMqPW1U4vm/ELAXDPAHXWO8+dL47wTqyWqRbZ61k+u0jFeSrfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iOgtqJN/g8S5vmccnJUO+N9pGJMh8XJl/8mA5i+Ub84=;
	b=0V4a37+aLoz/VlAUXemUHN3HwAuMRZp3UYgp4dYcgp7FYK8BtrLlOScfWPZPwZYe20vM
	 rgYpBrzHgmlD2w0YcwvaCk0Jeo8kbccVQ7qdArSEEl9jkaiuwvzjEOd6bE9Pe0zMFzQzM
	 REVOxYvL1s52jfCKTo9FYYksgCd6TsYC79S1bFBwQOg1rd3NST/dsLw7Az+QwwAJlMjwh
	 I5iJSVyjarVBG8BtYbBlFXyKNO4oooDoH+3q4JmmW8VQP2YvhclSXt27OBETdSFZoZogu
	 yiWXhmf3eqJ0ztE0Urs2MBvSb0vLYuOVjiIratQ4rRuL5zjM2IbjCXfN16MZI5Ey83w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JP154tCK;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7920C606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7920C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JP154tCK
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38644aedba1so4522915eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795429796; x=1796034596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOgtqJN/g8S5vmccnJUO+N9pGJMh8XJl/8mA5i+Ub84=;
        b=JP154tCKzfKSkEgXpH3CjD53LbF3lAsxfXxZssihMUogBuTWs4Xi7uZzLfDTzrYkLd
         zEA2V/qJlrdt0eyaAXP04CbCwIDEObVDk3/F2JxU7rZ9aLERt8OT4Rd9ETSTCSh3xgmk
         n76wizVqQtCsfX0geLPuB1hRrrytShyFhkWh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429796; x=1796034596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOgtqJN/g8S5vmccnJUO+N9pGJMh8XJl/8mA5i+Ub84=;
        b=ImBtlTZNzmDZ+MrLHEdNPKb/xPoy5S1ArtYr6rsfXS4ate9GDdtjRYpaV5+uikMfKr
         aOWvTDRisrJwAzNtRGEYMUQt48RGnmTid6SQvg7sATjRCONKLi01zfcdNWNz/3xHExIP
         /TKpBMq+KFqnCWxEaQ5gzKiXWPYgity4SvnqMjPPzMb1ayHur1e71qzJToON60ICgX/q
         DZIBM2Z+sGlfyX/8+rTzxOMy5XeVPZ8IZbTJZpDYUeLkCOC7f6Ww6w00ve1QMD5K+BHK
         M5vH61ln7SQhnzveW9/R/Bf3q9EW3o+jkUgBhE1N0OJVNfjGlqyNHyXVkIk5zOituuzv
         pOYQ==
X-Forwarded-Encrypted: i=1; AL+hErG8pM5mwPH2jxvOMqlb2E5wZObNvop70rAMGC4NI6sCQltbiDATzGKe6z6OLiy+4I7YD0zbUIxUAqMYvSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z89ZXQSmzg3VeZdO0WqnbMMXrr+gYvZWMf2SngGWYauIDoFSWKc
	te9xzjUy+CjwCnTZgMgAdlEZ0FzAWTV1kjd7Kc8qDp9PO46mouH2Pibik7avGubEXg==
X-Gm-Gg: AZFdTZcwBArAIYZxQzwx1PW1zwwt1YsEPbgVQNHAipdQqsxpIScxMsmvwL2lHGJniXj
	k7CVsK3LAbdMO/Z2MrtdbvP9N6h3CDr6JIBKcW0eYDoYXOtNL58FL3kQra3cAjoWPurUKh477OL
	YOFDON1X9OMj8VvsaDdk6GLx5Myq+BF+ALbX3b4ct95rzoalAaKHCXfAf3QX+Vau8IOGWmVHyZG
	mpDFb1hwj7vJ81pyj2xmgZfzbYMMRkrrlyv5hcqz/Wl3jCMH/B3sOr+a8sBE7PjkRkrmLjG6mju
	vyNdBsPROHC+INZBijN8zfCG7Hc+BiqNgVTimv+wCaJwB8Mji9agnQnLdqO661vNKvgbz8+fGHD
	vEAZ48L+d+l9c+hicEhN4HMz7d9ZnWJGwcaC+KMRAEYsQGQlD1GG1vX0uYXFI+s+8xpVUzxZOIt
	KZFlSjoJEG3/zBn5ws4DWDHc2zCf3/hq2qlhjc+5w6DTn/7BrBv8pxumn/v4swi8fSrDiRA7Tk8
	FC21fu/i3fNI24gJkWkQOvZwd9MyeDIi43JxEP2UxsaQiUpoP1B4WaNhX6rFU3Neq0PE20z8XTQ
	sXcPGf1ohHZCYu0Fz/NpTONiF+3aFcZZmyL7TbP5iREQsdDywoEST6RnNjwkx3QAgjORlpjgvk2
	gHA==
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr4149923eec.1.1795429796409;
        Mon, 23 Nov 2026 02:29:56 -0800 (PST)
Received: from localhost (224.57.158.34.bc.googleusercontent.com. [34.158.57.224])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-386aa203267sm11296660eec.0.2026.11.23.02.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:29:56 -0800 (PST)
From: Shiva kumar Martalu Gachanti <shivakumarmar@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@google.com>,
	Shiva kumar Martalu Gachanti <shivakumarmar@chromium.org>
Subject: [PATCH v1 1/1] usb: core: quirks: add quirks for Kinesis Advantage keyboard and hub
Date: Mon, 23 Nov 2026 10:29:50 +0000
Message-ID: <20261123102950.934878-1-shivakumarmar@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

The Kinesis Advantage keyboard (05f3:0007) and its integrated USB hub
(05f3:0081) fail to re-enumerate after suspend/resume or warm reboot
when VBUS remains supplied, reporting "hub_ext_port_status failed
(err = 0)" until physically replugged.

Add USB_QUIRK_DISCONNECT_SUSPEND so the devices disconnect on suspend
and re-enumerate cleanly on resume, along with USB_QUIRK_DELAY_CTRL_MSG
to avoid control transfer failures during re-initialization.

Signed-off-by: Shiva kumar Martalu Gachanti <shivakumarmar@chromium.org>
---
 drivers/usb/core/quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index a4bcbe9c913cf..d8518fb3517e4 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -350,6 +350,15 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Genesys Logic hub, internally used by Moshi USB to Ethernet Adapter */
 	{ USB_DEVICE(0x05e3, 0x0616), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* Kinesis Advantage keyboard */
+	{ USB_DEVICE(0x05f3, 0x0007), .driver_info =
+			USB_QUIRK_DISCONNECT_SUSPEND |
+			USB_QUIRK_DELAY_CTRL_MSG },
+	/* Kinesis Advantage keyboard integrated hub */
+	{ USB_DEVICE(0x05f3, 0x0081), .driver_info =
+			USB_QUIRK_DISCONNECT_SUSPEND |
+			USB_QUIRK_DELAY_CTRL_MSG },
+
 	/* Avision AV600U */
 	{ USB_DEVICE(0x0638, 0x0a13), .driver_info =
 	  USB_QUIRK_STRING_FETCH_255 },
-- 
2.56.1.750.gf70dc682cf-goog

