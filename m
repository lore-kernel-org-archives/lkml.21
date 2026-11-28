Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795846753;
	b=O238cx2PZP2cTJVfwp71HPF89E4xz6RVIYKEWr2Xwp2bpckHj7BI6QO7ZoDHE5eYne+6
	 qkJzJ9GPlj+sVLXUnDmnbdKFkFDl+1EZD7r4hYPIl7gl2WgBetTtVN0TtbB4XUUZdJEIy
	 kZfWlLmLtbX2xeu306az6sBrt2pSwRbFAwiC1nAzqS+ZqyfP9c14fKuOl3NiWjq6SSYD3
	 0S9iLWof9uI8OxcOUk8s7lVltXlW68wA/i740G/aiVVQBHJGNnqySUATwvIP2qtruNHHH
	 ubCvqme+7Bvrt99FbcVsCSbPW2/93AplCRROqs5EdLsLdYiK8PDpffD12bjdgHSbyig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795846753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LwkixGIut82JdvZ7GR3OWnVuJ+wu+yVSiif+/L1vzPI=;
	b=cln2HFpFcb5/zhQaDCqwxHHaaaULNdWZwwEbuCoVcSfZyhyWSXg/iR6ptghZO/q685JX
	 kQLwxvyq/jhU6w4RpROB1OXq7xjWVLsfh4aRDOM8yNajnoD7ufxdmOj6G49uAsE5Lmg39
	 tt3UBYk1tnE/oj7xpi9GvGEh3JQQ8eib8/eGfOReeGNoula892cUTGIUJeAoZJ5brDp5o
	 JGvi/dRA5OoiXbq77shr8Bnn5ZgpHC37ddfqYQ3+OQBgBcWwv9QMg/TSYMnO7plH49CFB
	 UM9URaK3TvfkyRgGb2dmMdzMWqsmhDy8W231ffAy+zACKVKxZPPBQ0xDskHAMRENeog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdfmLEwZ;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D47606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdfmLEwZ
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92110499585so78212716d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795846751; x=1796451551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwkixGIut82JdvZ7GR3OWnVuJ+wu+yVSiif+/L1vzPI=;
        b=DdfmLEwZ7o7QhnLgq298NVLTmp+v1Zw5KGDQR5HL/4YjkoIUnVkEtJQkzAtezPtEUy
         Lueu3cLUY0nqc62kWSkh7wwvOgqhaHpIOp63gT/oyf+CTdfxuGsbiUSlN3GskLxq5vNu
         43mq7oAV0ZndNOZ5gpHBk8LxivD4M5yxWCUW055yovDK51xZy1zFtUVsqw+AU1xl/g5m
         A9M+Usz0EIokbL/7tx5QjBzl9WXwBMVLdcUxO3x+16c/wiuJl1MZUdCDMQhxjgtBQACR
         eu+agRAQGopjkaO2Us1/xFUEEJkOsU48sR/twgCfuM4qnSj+Bcp5T4tbE8/BeKHwMSUa
         kBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795846751; x=1796451551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwkixGIut82JdvZ7GR3OWnVuJ+wu+yVSiif+/L1vzPI=;
        b=C/cabzhWPe7K3JwLKwefs/9mCSuxfypYEiK+gY72iG6wYW2MCi/vrw7XNHj+KAuozD
         ZQTE9dQNVXDQ+wZcPGaB/2lW4FFN0AgTC4Rybrs6glknsZzjg2gVaTgEglBM9LVZkYTN
         +bYISJazbhSxkGs10M1CXG6qoeQKtZVmt0TisfzILfIPgbZytcEWIX1MxA07WKNui25q
         xtamquijzdveh3ERwmYKEjQfhhdVv4pxkJwTTGXEufEh2K6hwhGTFo9wc4N+JjBgd2WE
         W+RfxpR1UB4BuACjXhVarmiePfS7snzBSvBHTDEooF4E4mJIMeL/7CukG4QaujUysA+z
         FLSg==
X-Forwarded-Encrypted: i=1; AL+hErG3s6skNXOV+L1Hr8R2Ysbe/Y3UdGiku2gxeNRibl6aw95k522n08EPzKN/uV9P9tiHNM9sJo8XvAv1my4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TZK+MsKrR9Dvu0Qybp3H5ZIOJYR9xzhmyqbkLTvoxehleQc5m
	AbCZICJaxQUqZa6KGDDSWq/InxftaBDkJs19YmTsPMxbssa2bSWspj06
X-Gm-Gg: AZFdTZfo/g0LhGN+0FqUUsKe8FQ02q5mC5OWAS/PDplOSVA35AftlKXnc0qTNR7Ku/C
	W0aOYRtzFLDSKTOea8//VTumEpskO22zq8jAaeGfn5p2Zhu9tm4CnIX78STKREFJ7zQqZ0zq3yp
	jrQRH5pwDGI5ZLqzYbFF6Va+ZTnrKMaL7xOtX/hjQUZa/oi33LrnNT05riBos4jzQbb1nJO+XBT
	eDugQBlJ1e+7KE4c0vnIv48sZCbagDJtL6r/5cgoh5dk7TsAhLi5nJt/mde6ILEzupW55oRjefy
	WF4jnx7XLZNBxBqJoT06XKRXeYt37fZDZSlJUn0vPQ4whEo06530gLZv4u4CCgoSr/xUfIBSf7p
	jdvW6UCCREMGLZ+7huF27uQUdSXP34kNEZFb6aU5i1MIq6y8WBwk1mn5KvASjsSZyx1NdLCdOu9
	XO6ZQepoJ9o4WCAlpVIQOeCAhhmbaDQJxz7el5dMjSIfW074taU3MrtXy0pVc9+oNEtj/VMsFT7
	sGD7wYYFUjJnJHu6fHw7wQ99BbCQPDS3zVAGJext8YK70YI03WGiCXG66aNleFk0hj3hkVK2lQx
	s29Hu24JLupNg7JxYyU4vnvAds524onrpNbkjJpyE5Za
X-Received: by 2002:a05:6214:2f01:b0:921:2e36:b781 with SMTP id 6a1803df08f44-92134a5457cmr539622096d6.16.1795846751423;
        Fri, 27 Nov 2026 22:19:11 -0800 (PST)
Received: from zmitepc.ad.psu.edu ([128.118.12.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347966desm232907746d6.3.2026.11.27.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:19:11 -0800 (PST)
From: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: quirks: add WINDOWS_CONFIG_REQ_SIZE for Razer BlackShark V3
Date: Sat, 28 Nov 2026 01:19:10 -0500
Message-ID: <20261128061910.742824-1-memobayoglu2007@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2026112051-smirk-omnivore-0d65@gregkh>
References: <2026112051-smirk-omnivore-0d65@gregkh>
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

The Razer BlackShark V3 and V3 Pro wireless dongles fingerprint the
USB host by its configuration-descriptor read pattern during
enumeration. Unless they see a single full-length (wLength=255)
request like Windows sends, they refuse to bring up the wireless
telemetry relay and battery, charging and EQ state all read back as
zero.

USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE already implements exactly this
behaviour, so just register it for the four BlackShark V3 PIDs:

  0x0576  V3 Pro (wired USB-C)
  0x0577  V3 Pro (2.4GHz dongle)
  0x0579  V3     (wired USB-C)
  0x057a  V3     (2.4GHz dongle)

Both the dongle and the wired transport enumerate the same firmware
and need the quirk. Verified on 0x057a and 0x0577: with the quirk the
vendor channel answers and battery/charging/EQ read correctly;
without it every vendor GET returns zero.

Tested-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
Signed-off-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
---
v2: move the new entries before the Kiyo Pro (0x0e05) so the table
    stays sorted by vendor/product ID, as requested in review.

 drivers/usb/core/quirks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f0b..dd926957c 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -500,6 +500,11 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Razer - Razer Blade Keyboard */
 	{ USB_DEVICE(0x1532, 0x0116), .driver_info =
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
+	/* Razer - Razer BlackShark V3 / V3 Pro (wired and dongle) */
+	{ USB_DEVICE(0x1532, 0x0576), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x0577), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x0579), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x057a), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 	/* Razer - Razer Kiyo Pro Webcam */
 	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
 
-- 
2.56.0

