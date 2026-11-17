Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954480;
	b=QNAhmp0AwXy76ktr+H+ekS6WwgAOqA5zmfrZX8cniLDc3Ficd+v7gEb2LhRNjYwL1rhC
	 gM2hYcSRrnfwzrlgKUKRKnXKASwWZa1bdwbfiTdoySwesmKYqzoIiYOTpEEojF28lgqug
	 aSnEF2wjrAsf9Vzdz188NRLxnuqAo8DXeKy8GLZwPoWLbKhXyy1YzAraSU+dnxGxzbeUa
	 KbYRycTZghHcxkuUK07JwGOlWdM37BGL2zWShXdprUDqWqYX8G4yLarFapv6Uu2wkc5oS
	 1dMqsdeHkvZNSmjLXxfQwIn7MxA/lu2TqZ4y/ueZrqBh7zJLyHSyngGr8RViOqh6XvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=hPezEz8U3+5Ayu7HR/Y/vZwTcxbwYJPMNSvefHQ3nh4=;
	b=hfpgkmM+rFn/0CiRGpCPxXH7zG/YBNhiMhDvFvkkocv4yqg+Wu4FWQHNw4XOWRsGfFZD
	 NTk/g43J3/58aiFP935Ej+TfBwht8tgjNbbjpgC7UGYAn5SnmN6INT3Z2bWYpTlz7Qjns
	 p5H91IKLvTpjyO3wJJKHhX6CiIVvTKh0a98f0tTXUWsE0/OOjabvSko0Y0TavkWKTn74t
	 5h30BYMPIc77cLTgLX6tZn08ZVXFTC0kYm+usX3Lw+VtObTf45qh+Lp237a1mAOuYsyU8
	 sj2B4mrmfui6oHcB1hrPwtiCdbYkYZH2FtBKbovkNYbIubFiDLdUaV6OUn0yZrsfheQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+wKUcVy;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481D606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8481D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+wKUcVy
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ad099391dso202711eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794954479; x=1795559279; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hPezEz8U3+5Ayu7HR/Y/vZwTcxbwYJPMNSvefHQ3nh4=;
        b=h+wKUcVynJxkQpaq42YCQ9VBO27XP0ynW5u2cpCAqvTPx6NKJWigoKU6JTD1FmBBxq
         LOCLbuIjhUfu5cT7G290fhVXkwcvguJWelAPkd1u8XaUF8K8PpuEFCSEODYS7KS0rfFf
         aBpEivYF2zy/mQVIAtQrediyVJd8JXqZfD1czpj0p1ISszVljX7MgpZ+2OIkynRjy9O9
         1goMVuKRAIoDqvmRJlIQXhh2dI16Lrb100Ph2XHhZ/6uClgEWXaUkee6QjIUO7IPlGod
         oeGJLBvSZOHmuabMLzufffKVK/WgxjWO1RaC6jqPGh+z9prPr/wCj68s7LpCAEaA4yqP
         FKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954479; x=1795559279;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hPezEz8U3+5Ayu7HR/Y/vZwTcxbwYJPMNSvefHQ3nh4=;
        b=hCjCW3V44H/ablWtLndwOm/qZoJlVZhVHoqNSlWOJNKmU4UeHAy+TvOJtpgifSNXZw
         LTLx/7TgGM6ypSpZxyLnl3p8fl5xhFlaTDcmy5yDemkuc2fNRSg+IuU8D1IznDVZCgZ2
         NGCft6ZEmBwIstNg0UgMWCY05a4JhArU+z3MJBtRFHSrmZEMApakicttvE3Eitl+L8L/
         SiebLx9NJXRZpIw0Uw5OUfPa+XqJENlv/HthPrU5RK8YZfn34c5ggrwiqBAGluDIlCgG
         LF+Tn2yHVxX8L0FOjn9Ue1P9r2cDQta30W1g8KptSWn5BCMKHQ6473iObVvMGQkw3PTW
         AEOA==
X-Gm-Message-State: APuU4Z9hZ8Uv3MRGNDlYqucM/ZOOAh7x6soJSgaaFpdd7z8lV0hEKIDF
	0NkoWsi1eE78rjUI9pzSDYfdOexPdruI7BJeO+BBCX4UbKfNjO3TCas1
X-Gm-Gg: AYBFou1IVTdXPHYgHNatS6SjJKBW+2CoNtooHNa3HZOMxTYlG2XDh+/aEsHI5HF3X4A
	PkSdjRsqVeD47litv8jtNaGxA69/vTNvAxyGF68meTnscXElJlJ1rHkVN+Whys2PeyZhOXm4XYv
	o7Be6gT5/4WPael4rf6nyA/ffVbCGLlJ/oKsIcjz46fkmMIcFsA5QataDK7P7fwvCaHiQsuvltT
	ahyGAwqHlE7cyPWT6/SqGIhguI9ISOpGsXrNVfrSh9QBYueZLjCtQoDZDWHNoBIYQBa6o/U8GOg
	LebW/BETIP6wbve9SmnOdsvKEXIcBTnoo/V+WcY2c/b5J4xmPyF9xVCdiPbxRrhGOJYOo4aFVLR
	9tfZchK2Q8cN3L9w25iOgPJ5bMe3YZqvBHJYghKSE6YKfCwuB5sR7F1f07F94Tl4LcxgKUaE9dA
	sq+K2Yuhu+KMdGlmZIEsqNAkDf4Px+3tEf1qC1pyRjxekoyyf++dJTKqX8kfxppOPcucmhLQZe4
	RPy77BNAcJn6U/5oZVqublk/0DYpzPqckEcrgp1xIoo8L8iIcf9Nf/aCMEYhJy7wUwiOtVtuSPp
	YFW40qTQNPKQXDvnB1ToqhrRX6T/dchsQLC0mCpdjPLzvq20HXiOmJqLhbVT17UmBBnibsaX8Iw
	+vsvp/2B5lh/kUiRiYtcy9pm9chWv0j6cT7QZCeE5zIM0eWYEsmDz+JbDHG62o8vehqwqPNJ0RM
	ullD+2ZL5p+X73kyck8yfZEdGyu7ZYuQ3zlk4TK3rs0uNHWWSQk4M=
X-Received: by 2002:a05:6820:1691:b0:71a:f390:ae5c with SMTP id 006d021491bc7-71b186099ecmr646533eaf.70.1794954479501;
        Tue, 17 Nov 2026 14:27:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b194a0da8sm481741eaf.6.2026.11.17.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:27:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:27:53 -0700
Subject: [PATCH] nvmem: layouts: onie-tlv: validate the base MAC address
 length
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
Message-Id: <20261117-submit-nvmem-onie-mac-length-v1-v1-1-e6d359b82862@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2OQQqDMBBFryJZd4wR2opXKS40jnFaE+0kiiDev
 VG7fMznvdmERyb0okw2wbiQp9FFULdE6L52BoHayCLP8odS6gl+biwFcItFC6MjBFtrGNCZ0MO
 ioFZdmxWYN6q4i2iZGDtaz8Krujgq3qjDof0vGL9zTIdrJpraIwRGLJM+hMmXUhoK6QfZ4ZCOb
 OQ0N9JrKwdy8yqvw7GRnsmRPL9LIyfdyHD1q33/AWHNDBnuAAAA
X-Change-ID: 20261117-submit-nvmem-onie-mac-length-v1-a1fd08e2b185
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The ONIE base MAC address field is six bytes, but the layout accepts
any length from the TLV. Its read callback calls eth_addr_add(), which
always accesses six bytes, even if the cell is shorter.

Check the declared field length before registering the cell. The read
callback gets the transfer length rounded up to the provider's word
size, which can be larger than a valid six-byte address. Skip a
malformed MAC field and continue registering the other cells.

Fixes: d3c0d12f6474 ("nvmem: layouts: onie-tlv: Add new layout driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/layouts/onie-tlv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/layouts/onie-tlv.c b/drivers/nvmem/layouts/onie-tlv.c
index 4da3a704388e..85562fc6b06f 100644
--- a/drivers/nvmem/layouts/onie-tlv.c
+++ b/drivers/nvmem/layouts/onie-tlv.c
@@ -30,9 +30,9 @@ struct onie_tlv {
 	u8 len;
 } __packed;
 
-static const char *onie_tlv_cell_name(u8 type)
+static const char *onie_tlv_cell_name(const struct onie_tlv *tlv)
 {
-	switch (type) {
+	switch (tlv->type) {
 	case 0x21:
 		return "product-name";
 	case 0x22:
@@ -40,7 +40,7 @@ static const char *onie_tlv_cell_name(u8 type)
 	case 0x23:
 		return "serial-number";
 	case 0x24:
-		return "mac-address";
+		return tlv->len == ETH_ALEN ? "mac-address" : NULL;
 	case 0x25:
 		return "manufacture-date";
 	case 0x26:
@@ -117,7 +117,7 @@ static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
 			break;
 		}
 
-		cell.name = onie_tlv_cell_name(tlv.type);
+		cell.name = onie_tlv_cell_name(&tlv);
 		if (!cell.name)
 			goto next;
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-fixes
change-id: 20261117-submit-nvmem-onie-mac-length-v1-a1fd08e2b185

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

