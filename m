Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415879;
	b=ACSjX/a4V/GySY18uq34u7GPghifuzbVx9WrZ28L1KG+ZQbFeoCRKx0qezdZvOz/Id2z
	 Rv1aIfYjhaqFMZEFPXy0BdsBlFJH2/GtP1bsDBq32MamYGsu/Pys3Nxz2hNWQwnaJ2yQ0
	 zW2THrG3TMhVpCUDkncWy/5GoDWzJwoOlAYv7b8zJY+svZbnJ6g1LZQW2pZz4y9eYfR1e
	 5hhH+9xWU2geVAj6ry12XgMBADLCwcvkKsjUrTqmfbLhzrbCBYqJWIvOZRsg9kgop0/8A
	 htJQoUmyqE2+3SIvduEXXUIMQ+y/gU9LP/8gHegtd9Nq3EA16TVd9Pu8lc6AIBE2Q8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=afbt2rmomwUI+307ATY0ZNant7Tutup0OxSCpoe3UL8=;
	b=W5y+swyD3CaQByLID8J9IO1sOa5eccUJjHh6h38ua3orzP22LpXa6xtxb7EXiAjTQZx+
	 ueH9jHZguABLlM8sPCu580XFSE/dn4os8mHuNjroKGCyBGoj8Y4x/CBsXeVtF2dkvsvM8
	 tuI6SXqLDQnm2R62rt5wQXfmv2bLT8Gztyee4CC1H6EsxZM0BPB9PfuApapXDq/t3FzPM
	 p7JuWkbEcXp47IEtKIjzylfgWr57JPQNIwjyAYJSROfcikUFpJvQOL4Zv38u0nT1/a6Kn
	 8c1yWvpxcP3cV4Q0ZIeCFSFoQtkV0IqzhPb6WJpFC9JAmJFJmVeUL8C3DjUWvLae+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HF8ETJgy;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66614606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66614606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HF8ETJgy
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3549700c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415877; x=1796020677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=afbt2rmomwUI+307ATY0ZNant7Tutup0OxSCpoe3UL8=;
        b=HF8ETJgy3K3P7rv90VlZFwWi6J86eea2v2fnG0piKVB5kjIpj0a0AQ9G7cHH7YngGz
         KXfKEwtvjrnuQZtt/HZ54IUDoUm0nwhMjsgTAn8+A7vUYiARe/zVs0WCd2Cb4JAb9k2T
         k8fgvsLynXsXqE2U/hGr5zmeZHCRiuHHDIPJPEOQh4D7Fus3hMMwWdKx8mOUqvuquXFI
         iP8TvCgSp+qnE00Vx/he9GuRfMQYyzGxumdM0f+DWb3gilrBstStbjI0qyMZHq4wsm26
         HGvDecJuiGSpyMatqkkTWh2l4vN5DBG3rPGGlQB3nxr3P7+4+7kUKgqAAuBLLny2pJoi
         xJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415877; x=1796020677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afbt2rmomwUI+307ATY0ZNant7Tutup0OxSCpoe3UL8=;
        b=aqUTFve42DS+hUYAsycyJGZuKR0flrlTxk2DMhc7V4dS08KtrablOcxWmTRr6HjjES
         1rTgVJjGqeuGaz/bBzcyrJd8Zd1WpY72SbpIp8VadqWX1y871MWQeB+CNqRpeqYaQKQN
         8bNHNFdHimwEojGqdCn44GykQM23phtq1qEjS2E4CXbvjRxS+Big9eMMBgziog1OVdX4
         tRPH3OVkmkwnrGdWUWVLcR7cpLknHHg6JqSvI5fXgra9HG7vA7HXPE5D7TB1aKcSYPXj
         K9PeCSUXyJqu4KHmWQTjtyOF3XZMvFh7DwYOjRoF6nw5NcgswQB1dtq6pvwCnJOqTkdr
         JOjQ==
X-Forwarded-Encrypted: i=1; AL+hErHF+IcUtz0AWDRlru1aFw1mE7RUhCUAGfhCIhRSAVQ9CF/8QjH5NdA/PZEp3b7zRQWpqzHyUFl/bq+/KWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nkhyeaIV4+OHS9D89xEE69JF89OnVcUa7IID/OcE2WmXPZdV0
	1BovjJWsaddI516i+RiS8PNZCvra860psijpSUXO5rz16sVXPecbXPMU
X-Gm-Gg: AZFdTZeeN1lYTn3mL0InUvRy680+R8sqsMrIIq1WmVAiKnGjM0uCO9SwEmyEcStlCV/
	qEezeiS67Cs/CIudXOjxoqDBZDf4aRgECTDcgOQMBoHPMId1lzQg9XSX9lRLPMRNgZFTBqnqJ3K
	qKDGU6HBv+EUfDUAkIbHxvx1IwwLdm2A5PzQoWynZRMXvSjk6BKHcEu3gf2RZalG1WJT3uv/oeA
	sVao3Npx/2CUDl6r9pSBZxAasM3w0E9epKFWKyeLHYS/dNc/m1wByj/N1aADHxGTenvaoLjm5z0
	eOR1qsxDADNOE7DBhR6R8q438k2oDDFkq+PNeeQLJG47Hxk88iyJEfTPhv8/8bvWlYxeAwTXUAq
	i+HnWEzyJlWKdrdmCPw0iVVMT/ImyGF+T0i2wcIwCQ8TLYrewqerlxrRsilFkCBOiB+W4VW3kQN
	Rp5p9eHQmz8hri7t2bsVV++LLvO5FmiDyHRgOJyNIquQ5mtcmR3yobPe5m5NYgCo5OML6D9owjo
	cKtpoET7esjhaJXq/Qv1vckakD388pirycE7+3y1By8r0y601Nnp2sZi4vbnTTxjlQm6m8dXkr9
	5iOoEHavZa/HT/1ZYag8WgHD6oS5jmwyKMFy+izFPh0BKFjqYsp7z1c2H8gMW6hQXfraJw9XKAB
	Lfj0HL6fL1xYQhujd46txSEvTfr24MyxMPQO5GGPFtAaz
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr9096340c88.1.1795415877349;
        Sun, 22 Nov 2026 22:37:57 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm35934568c88.14.2026.11.22.22.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:37:57 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	stable@vger.kernel.org,
	Ho Jie Feng <hj3108@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb: do not clear the raw IR change_protocol
Date: Mon, 23 Nov 2026 14:37:31 +0800
Message-ID: <20261123063732.1615570-1-hjf3108@gmail.com>
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
Content-Transfer-Encoding: 8bit

Since commit ec7cb49871e5 ("media: rc: Fix race condition during
rc_register_device()"), rc_allocate_device() prepares raw IR handling,
which sets dev->change_protocol for RC_DRIVER_IR_RAW devices.

dvb-usb and dvb-usb-v2 then overwrite dev->change_protocol with the
callback from the device properties, which is NULL for raw IR devices
such as rtl28xxu. Without it, rc-core enables no protocol decoder
when the device is registered, so keys are no longer decoded.

Only set change_protocol when the device provides one.

Tested with a rtl28xxu device.

Fixes: ec7cb49871e5 ("media: rc: Fix race condition during rc_register_device()")
Cc: stable@vger.kernel.org
Signed-off-by: Ho Jie Feng <hj3108@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 3 ++-
 drivers/media/usb/dvb-usb/dvb-usb-remote.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d25043..218397cc68 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -149,7 +149,8 @@ static int dvb_usbv2_remote_init(struct dvb_usb_device *d)
 	dev->driver_name = d->props->driver_name;
 	dev->map_name = d->rc.map_name;
 	dev->allowed_protocols = d->rc.allowed_protos;
-	dev->change_protocol = d->rc.change_protocol;
+	if (d->rc.change_protocol)
+		dev->change_protocol = d->rc.change_protocol;
 	dev->timeout = d->rc.timeout;
 	dev->priv = d;
 
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-remote.c b/drivers/media/usb/dvb-usb/dvb-usb-remote.c
index 6dc11718df..f5f30d714e 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-remote.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-remote.c
@@ -277,7 +277,8 @@ static int rc_core_dvb_usb_remote_init(struct dvb_usb_device *d)
 
 	dev->driver_name = d->props.rc.core.module_name;
 	dev->map_name = d->props.rc.core.rc_codes;
-	dev->change_protocol = d->props.rc.core.change_protocol;
+	if (d->props.rc.core.change_protocol)
+		dev->change_protocol = d->props.rc.core.change_protocol;
 	dev->allowed_protocols = d->props.rc.core.allowed_protos;
 	usb_to_input_id(d->udev, &dev->input_id);
 	dev->device_name = d->desc->name;

base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
2.53.0

