Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205326;
	b=qQ+X9j3f2f0R8JOK/ZQr2m3wZwGbpEWv4+JcSjUmtiN4qYGFgAi4JpJLfeVuJidhTj61
	 fL/H2iuwRkBIDlOuO2jVTUhrJ6KxF8h/4zqHr+exWaDaFY6R3cp0uvq9Op1rpMdZT8Il/
	 zCJNQ1Wyqc3v/l9mS1nfrmVfvVFi/FFl9ISKW0X4RicOoDfUKe4ySIA9qoMITXsBW2HtZ
	 E/PA59CT+hwiR4eUmSZQuTqy+k3zXMlq5WzQjTF28jDsFqj1NP/Wt2091wTSlkMHH9YE9
	 dqRjeqZhenC44quUgI62fedxXibo4GncgSS2uAD1CKbNP1zf2OUBD1UOkcHrKD7yjxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=klt7sNsMkqxOJjCgtn7qempQcIN6jFeER978qp5DFdg=;
	b=ovLKZd3XQlkzm7q+BHxcl1jTnUCzaeZtP/h2aDmuhh5lwSCcXZAdKW/Sj4/VUafYVQll
	 qdycI1f8fWFBw1qHw0c/T7K1JqmAKdOD1c9Cmn7yVnLUTDvLniBD+GlP6anA2mKOhRwID
	 3UJH4yS6BD5j1Urnint1jAr90aQRkiEjF4UtCVnG1oY/uhCS2Kh/3rrdxytXeV8eAOJ4O
	 aVd0W1z+bXPmSRQnW/J4+bEwCX2wtBLNZN7FS7Th6A/iHxpw+HRN21Menp46EXdoieaVT
	 ARVuKk7LRl9lQ5W7Ngwye1vtcGDYXEGePeO+EegURtBtKPCOciHsk2Du4vzwm3+lx0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kiZNPRO9;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AA606A6C0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39AA606A6C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kiZNPRO9
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-86298f9267fso773752a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205321; x=1795810121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klt7sNsMkqxOJjCgtn7qempQcIN6jFeER978qp5DFdg=;
        b=kiZNPRO9aSLHwh595uHIJPw3VWRZxQQtlHlyBhCqISoqxDjJJRbhGFokU+hF4RLPK0
         BadnKnMfDz8etruoy+NM6FmHdYTqzO5r19Aqts8Y4jNjvLRgd81qMhoOSWCKfZa+eFjH
         ad2hoXqc52ivF2hQOz3G4zuI+EScddEIl3k9vCuRdnB+1tDLFPyT/ivzoTTrwch8qPlW
         Y1i4vPlTJ7aFGoDTy/wb20EhcBzYpi0M/mKgI3mfsyL+VmGfmipnibKnIPa9tVMn2fvQ
         zE8WvghgFrPsEkPUTDAL1f+zXPrkGZ5uKToOTXh9b2rf1Tc5/6rYlTIfOxGDchW1gdWn
         XANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205321; x=1795810121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klt7sNsMkqxOJjCgtn7qempQcIN6jFeER978qp5DFdg=;
        b=uGgJN96tQv/DZfnB7BsfuS/PdXFPcgLIPVyJphsN1PCTDRO0FMLFMIQ5zG1TrNRHPW
         rUlXNALyW8Nmu7ZL+zYFxlNFLVlHjgXCLihqN55dTA1yiL1gKo+idBHoMnuLI/rfChZZ
         +M3mfjaC9OAzBitVJHa7BFFrJT4RcMJS0la02zJ1r+P2WMWQeyq0crgfzUuS9XQm+l4Z
         NusFCuEYv0rM3YIfQdAn7wnpttCRLkBKB5rkqSh9xB6GUF8VZ7nWptQ8Xu1WvcafKGCG
         16Mxwl49raNEfoI5jZK8Nu/jCOOpH3S1ShxBb/5MYJ4uyX+Qrc7XwX8XhBaZQdNq7k1o
         qN1w==
X-Forwarded-Encrypted: i=1; AL+hErGSkruP8HYNeNv8zAzXg64XC9URFrikylbhobHMBIVFM2Ra2vgC8wCK3yqxDLW4PdCEgCqSu8IUUpIY9II=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kEzkPpcx6/YHE2KTSjy6fI1pIJB6fzMqYto36CZz6C81J4EUc
	FdamWQEtPeqocoyAxLpqt2Ka0aZsnj/wvymkqxe7YMEVxIsLGJ3wUfOGEwlIJFf/
X-Gm-Gg: AYBFou16xUOLl5gdQapebTqcAomV0ug1RG5GjLhAJP7+AD5dX+JgL9raJNZPor8QYTq
	MRkouhVISpiTE5dPIyOtuY4iBokHmRcZdCuPI6gUf90CANOWcVVBrQoYMTZ6sP4opvG8aTItpB8
	adl8Ni0ix6tBrLF1KlGToMIllqN1bkPKbbQMV1BCLIGsuoseAQBXiaP5dwmkDiylE4I5AC4OjtH
	GupG0Y0o1T37xPtuyav02rhGdB4HhLxUN4FqxFQvBISR8QlXgxndeiwT/kbMfgzv3R26l99hJQ2
	eDESrAzzbAzFJKLsukfi6Ur1Hz2jyRV3amBZDx3FEYn/+2VUjd3MPmgKtC56aSkKJkvAuiOXzdu
	yiJcrooYy8Mg8cpKLIPyLU4mdqmtiLAuuIVYUF+aq/3LEjgWYY1KlVgnUGkWn32oFLP1AyNCwzd
	9SDUTllnzM7rF8o36lfD4TwO1Zu5uUKjFYX2X7fZCqza4Ai3yK9YBuYH3u1nZWlbMTs2P0q5pY9
	GaiCESzc3RNqz8TsWWNxmxi9OEfBknRQvJcxzvdIdsb7+z/tJ0pStCJlNzhCurn1hM/Rd8cl/qs
	UVe5GPdm6Y1+H2WEDHSkSd4okwb9uidO6p89KLCWuP+J87R6g6IbEXQpY1MLFWfdcpx5u7LiEs2
	eRvuMl7sykx4MoKMDyw9zUSqRvxzBPHIjsQ2qa56lUsPw/kiFpazSCyBWXcMhRbq6Ger350DF5F
	0XBBf3PLDt9VE5eADTS0o3lxpVMPSskAGLYpQNyIEDr7SX3e1BQ47d
X-Received: by 2002:a05:6830:4c18:b0:80c:d30f:97d with SMTP id 46e09a7af769-86315a29b8emr5070511a34.30.1795205321627;
        Fri, 20 Nov 2026 12:08:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:34 -0700
Subject: [PATCH v3 04/11] nvmem: release write protection when the provider
 disconnects
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-4-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Retained NVMEM consumers keep the device allocation alive after unregister.
Keeping the write-protect GPIO until final device release prevents a
replacement provider from requesting the same GPIO.

Release it after draining provider callbacks, when no write can still
use it. Do this for registration failures as well as unregister.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d75076cda49..8c9dfd2e2a63 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -564,7 +564,6 @@ static void nvmem_release(struct device *dev)
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
-	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
 	of_node_put(nvmem->dev.of_node);
@@ -912,6 +911,8 @@ static void nvmem_disconnect(struct nvmem_device *nvmem)
 		ops = rcu_replace_pointer(nvmem->ops, NULL,
 					 lockdep_is_held(&nvmem_mutex));
 	synchronize_srcu(&nvmem->srcu);
+	gpiod_put(nvmem->wp_gpio);
+	nvmem->wp_gpio = NULL;
 	kfree(ops);
 }
 

-- 
2.53.0

