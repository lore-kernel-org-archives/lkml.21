Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334867;
	b=wpckwkEFY/DpleLB/jO2Loubmbf7tcZCbOmF6A/cl/RHAkUXbYY+ndFB/zaFJuORQPiq
	 7Geus89Hqff7amf3SwUKnrGTiV6Dcg64vNGC8XIyfa3Tm+VO+7883jBEMiRGYcZR86Ali
	 X/LRzBNSWbz7d5Svem/06UrEuM1zNjorvGquPbR0CA4GoXCEc6MvyaWiqtE5Li0ePYINz
	 jzjjh3O19nhuYKJLB7beXlexkDIBY1mz6VlmAbcgtMhsy4R+YCDTgnkLcYm4DfsFMMugf
	 2Ry0kBo1sja0vFN3nqXM2uBSkFgXna7t7jFsPqIS9KA1K8csnvUO5cCcV6QmA0H6bjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/mkvkDb3xo2wy8tT3sFzQBOkkMEtSGCgH+EfHq4vbWQ=;
	b=oMJST30dmCPmFf2FqniovgDaWv5Khnf9vnZkPAU68qTyVXtsLgIv1UirRCwru8Cql0bS
	 Aiof6XFaIhvuvMoicLruyaEarLIo+dr1flKh26tcmFAL41NADwx/NzNR3hvUZOUJS1o+D
	 Rq45IWxQ1YMQtvc79T7OIzgVdL9DKAJpVa+uTTW6rcDnc4slunDflUPtcYZKELUwWbJB2
	 t3dwG6NZYLqTswpHG49959AOh90nNKWZpUrwtC3e5HxkgXBCvvT4bYl/EIWXtD50lr4T5
	 GVb/hCAiY8VogRZTidq4sem36z+Fet+3DoT16pP0KNSZnRV1o9QY4S4b1R2C6UopsLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qfcIlUD;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8260606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8260606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qfcIlUD
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1997414f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334865; x=1795939665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mkvkDb3xo2wy8tT3sFzQBOkkMEtSGCgH+EfHq4vbWQ=;
        b=0qfcIlUDQGq5L2wppOOw9G3oPE5JToOHIqSTxQnbYpOuCMV/ptEYcKsRkYEhl7KROg
         FTANui5eP9C8vt2oM9pRJFG7CxLBHXfhCS/O/ZazP7STzb6Pqrh0A1gRDi50ygUbYXvP
         m25WpY/MQXkAaZRK4U4V8ywZ05m2qALh6zEw4zahm8wsdTnXoVBPzVdHPnVmC2zT+Le4
         ocxsmMz4Pk4Nty2xsN6vGlrAbuiba2vP1zTOpj5+DuLqU8Zi20al5ZRaUPECkfhrxC/f
         71B6axce74PiqpX84RajUJzIIJzx0hDzCkJLi8AufQTddYxN2EGW+FU9E7g385gqmuJB
         ZZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334865; x=1795939665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mkvkDb3xo2wy8tT3sFzQBOkkMEtSGCgH+EfHq4vbWQ=;
        b=2qn9sPdYwH34N+A8ZOjkGlcHrPuVHsAud7joNNzfVgEm9WtUau9bNLQUBr9AKh0CJN
         Imrqe5eX1b2rhpaAUG8ipO9DN2nL2EFF2+6D1n9wTJr+8+9f6IyYn2pYAEUDXrcAK0QS
         +z5bj1ytSfvy2iYE8RlQ1tk2xPAKA65JPnjINbWhWXtUy61DdjzYWDKSD8phPki2Fe6V
         nZb0Rq9d2AIHNGCeiCushFbhw0zATcwexJMNJd1SQ3MCRltkQqbCAlgFvW5yTySxJAiM
         92M1RuRTiwgKA0jsA42NOMprAR8QswrdOTghj0PhoBDR0FNx13kQdBUuaxOHEMPIk85J
         E4SQ==
X-Forwarded-Encrypted: i=1; AL+hErE2z1+KUmTPPTdaMiB06YDCbh7UK2XzgMB1jJ7Cf86J3xB2sKXvx5pYhcI+iYtNoKks5/UEhXQne+pVGj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q7tHxAmXdsTBb9VQ5To1BLyWQCSQpUSr3J9IS5AFvV3NYnWtY
	A2Z6HThVMjvO3GLQI/vMJke7WGesFSvhkViDBnJUoshP3Q7FU36jIZ5B
X-Gm-Gg: AZFdTZcEGHYexX+i6Gh40mOqyTyH7R3d8F+SXtGyedI0H3EUqeVmbgCDb3P7oGxi29b
	y4siwDUe1oPmxoFcOwgLxblENN5whE6XH0+3EmzbxIP1oi9O1iq9BWtZPHkgzMMgHwolvl29thD
	0H02ZnqPpSCq5w1rkLI/Rk6zHDFOkqbTVXj0Ql3Uqig6o0X3SsZIk6WruUlGQzFt3nkcurw/SCf
	tKVTQx0LVep6XLkJLGABlqsMK4EPo5B00TmgZ4Z6eUHdLPETFyd/ZZg3tzrTrZoYZm9y7TaTyIR
	2iugmK5fynXoGX8arHus01P8cO0MB4IPEzsCIDM502x+0E2E+B4wgrUiz4p/wi3b9TFeuMKLPCE
	WCOitnPmiLLBwfp1cuHQfHCnkXOW6/E65/sPHjsVolk6vzAG7BhfKlN9VfAGuAgh1AMWbWB/2J0
	dt90tL7zI4jn9wn6IMNgshmGnuCdohxCVSAslvYHtBXqGvQSy7l4HrmA8moG1X6pGBP19Q+h0bX
	jJI/oIlNj6y/s5H1cEUc+w7sl6aeNBBt3dvTH7DUqy2K2/gAPNqayXqYQCVADDGGoUxI8QHN3yl
	u43G7w8y9kTmM6Ru5sY/UuJpZKjkjpeSCCAIdW/+vgZ/o/i+JOuPuPLj5af91gocb4Trl5H180F
	mTw==
X-Received: by 2002:a5d:498e:0:b0:492:3982:a80c with SMTP id ffacd0b85a97d-4abb70d7094mr12139269f8f.29.1795334865036;
        Sun, 22 Nov 2026 00:07:45 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm11929664f8f.17.2026.11.22.00.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:07:44 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: Re: [PATCH] usb-storage: alauda: track media_initialized per port
Date: Sun, 22 Nov 2026 13:05:51 +0500
Message-ID: <20261122080550.2181-2-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5d2e1310-88db-427e-ace0-c2a0590560b1@rowland.harvard.edu>
References: <5d2e1310-88db-427e-ace0-c2a0590560b1@rowland.harvard.edu>
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

On Sat, Nov 21, 2026 at 03:54:57PM -0500, Alan Stern wrote:
> Has this patch been tested?

Yes, tested in QEMU (x86_64, v7.4-rc3 with KASAN, UBSAN, dummy_hcd,
raw_gadget, and usb-storage alauda enabled). I do not have physical
Alauda hardware, so testing was done via dummy_hcd + raw_gadget:

- Before the patch: running the syzbot C reproducer reproduced the
  UBSAN division-overflow / divide error in alauda_read_data()
  (drivers/usb/storage/alauda.c:986) on LUN 1.

- After the patch: the syzbot reproducer passes with no UBSAN, KASAN,
  or divide errors. I also verified additional raw_gadget scenarios:
  * READ_CAPACITY and READ_10 on both LUN 0 and LUN 1
  * Media removal (status 0x80) followed by re-insertion without the
    0x08 media-change bit and READ_10
  * Media change with a failing alauda_init_media() (unrecognized media
    signature) followed by READ_10 and WRITE_10
  * Recovery back to a valid media signature with TEST_UNIT_READY,
    READ_CAPACITY, and READ_10

Regards,
Arbab
