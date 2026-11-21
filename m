Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244284;
	b=YBUQC7Ks+WNLxnxhPZZqBQb6UbmJWPpfU/lKQet8mC3TyphIZTIN1t7DWYO0DvIoQ32t
	 QMOqh1qikxvXIJXTt+Ggs9sVD6VUeqenLriuo7IS9wKYpuQnuuMcnRqqpF9q8iu3QKsbW
	 YADdgV0FMnDScm93cyPKbwU/dP1pJ6JkbAkA8dQXBi/STMBT7ZdtFkXBtmLH7D/xo8Xw8
	 CILaHaSCNFeuyByu2UIIsY+Rltk906fOI8jwlsKWWlWhsZMTgmOaoQBI/uTm/ksB+i+Ky
	 DaOAFG1F4SEPoStekz8ViT5RCOZZn633r8jDc6xKQry+vu/DTlX7FFs8sKK7T3dzS1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HJvLZtYqV9IRY5S+Gk4Obo3dupP4kEt47B2cXHjBvWw=;
	b=3q7X2Tl7CfJOUNNwpJifYlq0+gKEEMwG5vyM9ivqdR3iOngJ5MheYJWv+jTsHgbMTkBJ
	 7IZtJ5x0gpTJPqKkKAJ+noE9oMPScP6qu2h59lY/UHA92s77R+fcVLOAO41riIdY9oB0L
	 79IlpVk5zGIDWNeH/3Cow34DB1SDIvF53nHkxuPFcS2RIueavY35lT86bRxhEW309kIt9
	 F3kiySpfbx/co5p2HMAk6bVzzioUsEP/Ey+DZz9OB4bnbmDv9g81Le2pBkrKLkHf1iPz0
	 gGVVKNT7NDX26uaqSMW3+tEy1wutBCGcrH+97dc9k7bm30scr7UgDdDN/bRTnrhMEwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SoeqgtS+;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919A5606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 919A5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SoeqgtS+
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f04fab527eso9548755ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795244284; x=1795849084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJvLZtYqV9IRY5S+Gk4Obo3dupP4kEt47B2cXHjBvWw=;
        b=SoeqgtS+1h/2ImBq/UuEjf7ZubtLd/vVrYcv1kJZWXz+PiNQNVFZWNIBtR17VmMt8y
         TfTkpCcECO8nHgS4VLKyTR/sUm3GwVWeqSjZP6lRWbxf638yFLhvtPGcWOxgkBB8gHUF
         vNhothvTxK1Gt5lW9YmcEXlvpUWMpuzuzCfK62NrbgJ/dvceFbRp5cY7GfAdk76iXQYw
         J12xwfMV1mizZvOMAbahnokRSDIE7zst+HAIz77OQRJNHn+ARhIj1hZcwzf6+cvi/tC/
         cdptZ6gFZzRmRfFXR/sgRyNaPqE05qQef5yQEII+forAcqApeDrnKgqoE7wNRHgEarzu
         9S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244284; x=1795849084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJvLZtYqV9IRY5S+Gk4Obo3dupP4kEt47B2cXHjBvWw=;
        b=ywAtwjTjvouqbjKE3fijUhrVLAQ7IJ08mffMIM40p3rJUUCc6vd/WzN5EAARODfmkR
         nJtTyEHw0rhJKGZMA+EVYysaJQu6oej0LOb0lH08ONY8E9tmqQ11uX3aBK5VfbJKMKrv
         chfI1B40WD3xNHFv+EgKsFQtZvB3Wh8PgweyUxsmWbSZ/om9N6G5sRX4dp8729rqDR7/
         GrWOGmhQgRYoNB0B+/7A89RZfFyqDol3e0geVW4C7N6pAHFuX6fWYA6C9PH+mTzQ/HWL
         W3V4VHfpLyfvdszO8wXK+oTF3iWpfrXbFUJw2aKOSrSUglC/PQk4AqrI6l+6t17EsaIE
         5Xeg==
X-Forwarded-Encrypted: i=1; AL+hErEIOUJx/N5k8Iyiw6iAzewGXuNI5O1Xp8/sX/4wlHxYn4LLR7xYVReJhhB3br5L0dHvsImRrnKP8/iF8Is=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PLwOwM3LryiPMsxWF3G+oevo8CfH1c6iOmogC7NVXQv1nDSun
	B6P//pnxeNoRwLlk7i9jriB3v9H6BttTwZwvJFbF4WlzKxWsxsu1jBVm
X-Gm-Gg: AZFdTZcFm816ehbsNeVpMiQXDejtqrV4OZ7sEnuiXQ0WWs10/qkKZttgWuoMbryFvDk
	Dt9ieACqW5Ia1N3ByQ6YiYsj6ulFDoBk2ydRR7hYd30fArdYjuPlPFVJru0CD+pUox4TKRXTHTm
	FmyoXP4RgNJ7eUhnofEhZN4yy6CD33kSY3jmlr4w0z+F7yuNKpBlNFNU4TRd/sgnJoh75ZGQ34U
	WjLrWI+rxOHGCsbZqJejvQ07QpCt2ZmcMmYYQBTo5D+jKDS7qDl4PL4gPGwA/BwgbpJG9dnKP4W
	2XFz5lobOdYLSEAATBJDKheDzYodJn4ktZHC2XBhC1lM6z6bmbwSXxZK2zqda3RKKz18bWAhYPL
	P2ApQiuoA3qxBCOe1qqZ16v1MhmyJ5QkPDxN7asWguTd77lv7Rmpx58zVhfuFx4kPV3d3ZFsleU
	Oqo8vQsTD0dYp72z34v1BUvgOnN/YqnKDzerFvtXQUCISx+d/zyx9N6oi3CNkriFGT3Nf/uh8/Q
	8Zi4fYN10XrvekFjMmHcsiqtoPUXSFV/WTZGTzVJvpwup8uhavC6QzNNXwECKBvmRCK4NWvMH42
	rKXhPkJ9w7/qS/t2pWRm1RZj
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr4963449a91.61.1795244283752;
        Fri, 20 Nov 2026 22:58:03 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm7447286a91.9.2026.11.20.22.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 22:58:03 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/2] Bluetooth: SMP: Avoid stale pairing key reads
Date: Sat, 21 Nov 2026 14:57:54 +0800
Message-Id: <pm-bluetooth-objects-candidate-0132-v9-b93d60723e48169ee3ae-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Management can reload a key registry while a pairing context is still
alive. These changes use the pairing's own flags and identity data for
the debug-key decision and IRK notification, avoiding reads through two
saved registry pointers.

Cen Zhang (2):
  Bluetooth: SMP: Use pairing state for the debug key check
  Bluetooth: SMP: Use pairing data for IRK notifications

 net/bluetooth/smp.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

---
