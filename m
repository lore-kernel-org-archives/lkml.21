Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245077;
	b=ILYwIjxgwTyz+QhvO85n5qXIXb5JsrqgP1oyzg0fUMMK1QpvarjsvTKzLwr3iE3NeGLZ
	 BTlWPTlkR3v6OCcLRp0fsBhwhxXmBcXcrVxSdMQx4y8zqY+DJjxQ18hfpdpL2tnW1Vp3/
	 iRl5IvkKKYQ/CxtQkZ3R7a7G78q/F8KExJxWHFxKebTMYNFSVnulycWRLEEV39relyiNQ
	 loM6/XZkaSDdqr/UUCG+2uJLN5qoLFuqm5l4yaJUh2hszd7WgaT/vg/QC5x6wnQkjtyE6
	 IifNLc8vVzGadXB07j8UN9dpUjG9oQfeboXScgZv9WFrLdsZFoGojDF1lnVHtNw6N3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AmSy7sh2RQvyLBJSkgLlzK1tz/VS/54y0ytSBL1layY=;
	b=UvGI03wj/yvrbQW7a/uTwYBFgjwEY0qB7zWcP4EgHhOQAl44odynlqrRDSfM6KcBjAnQ
	 pn7KMpwb4YuQu1MqzcMKQ0ABg9eYVwILJIZff0+244zokktnVo74blNjf0GWheDOMTQ5S
	 KSngtfAThWK4FcNutCCuyUGTSYxVsQ3zbIapTpXfzQH5x+eOmRFqtZygyUbqE2wL8Tgss
	 VGOs+hjJr5Q7Bq/JzEU7VMTNO0nMSYCbtMnNBtHe6LuBEFE0xRduhfTcb265FrPECnKDp
	 riK/lG+nXDQ72JUol5IEoRTIdvlUsFi4NfgF8QorN/fpfJE1w+2opJFRyLJ/Wr9GCNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b+/szk3T";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D319D606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D319D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+/szk3T
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so851893b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245076; x=1795849876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AmSy7sh2RQvyLBJSkgLlzK1tz/VS/54y0ytSBL1layY=;
        b=b+/szk3T1w6AekUraZZuKPwggB0AMdY/uVa3uEJqPz4fPQVwmhFUCc+AY7+MCymwlB
         2GahBw7aXUQLkTniNV6is3ed9WLVKAH2N/Q4AYkTJUmTv+06zfggjzQGmMTyWgEJooVC
         2dye+pKsT/FNzHpM2JqN0x70Y3tjS3aPrJm8WaPOnD/S1OfUsEj1BhkULIdHYlRCCAds
         LJdeDQqkQ8ouxBiIe1TU/0Vytdims1W2TKOdMJiGWoiGzFm+DHsy+tbWeILPpC9HyxCg
         N9+0bigGbpkok8M0fx36ZsyjgwAnrGoaXYWoF6X2hd9YXntxXMjVN0qvAjglqyOXkU6w
         EBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245076; x=1795849876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmSy7sh2RQvyLBJSkgLlzK1tz/VS/54y0ytSBL1layY=;
        b=kwX46AhVDrv28OlZ5/DSYyBLVNw5Dw3Ynpu+uBHFrpsDhHnTc1XZRtgwzmBHUI0nc4
         QiWXjV6P3yQ/jxlXzyznTewg/blx4OMFHveAbW3LPiH+lMYHx0YUiEPTO0TTamx36sre
         3mx4L3Ue2ioYePgFb8Br+ioHskLDNkYV7l9xALAoz4xSVVUX3/1bCk8wkpQA7xpm2esu
         qvtB/Li9rjBInVivn11pbh7RU7gRmx7sZaQUnh4gqecLBsutnW08ZDMm++Grm6iLGqeo
         9pwbuxqMwS6fdOJivJsvlnbhuco8OdUhdoQyWogMul6gYPmSEYmyF64IuhAfZpT7GDEi
         6+9A==
X-Forwarded-Encrypted: i=1; AL+hErF9Ip09yUeO496D9s4LpsIaZv49sZ5RlIzlCVUx76z4wjRm79s7G1Q7e8pYuWfIso8EqkDJ1tmkRNjUomo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bT32cII2l+7X7dM7g4p2qVfIIkeGuA9bFFCle102DwrbB7dkU
	P9yk8ZRhWbhegask0dHN1coBJAdNng1qfayg00IPkG8wqG/76WzK+qJH
X-Gm-Gg: AZFdTZcN98C3w3n3zNp5N+ijQxTNx95dFCIudU0NvlNiczKjZgGBkNvAgDEWeeQM5y1
	LInDrsc/mNRuI5iU+uXkM/GvYGaWlSNEDi4AgxhKXPsMV5MD3vj+QWd86D2kdmKfVJWjLLK0aa6
	TsGlgaXhT4ckuQCUvhkC2MaNgMQWQOENChZD1eSCXY3z8Dzqy0bPR4BvT91/l/CIsmLlnWknG2+
	fh42qbL0B42GiOQMQRbCJ9RMzsgApv8edA8JoWosFptP3py8W1u4A2SSPbK+tRux73C2+LQ0MRt
	7disiKDQtrlVygU1gVVgxP/1qL0sBCcxCa7xzoIw6ah/stnCBJBw9GYWETGMF/dYBX+xgWO4r23
	dZRD/k2mX80aS7TfcHuypLPUtxJyGZpmTzTsA66LXXFypwHT9EtFoTA5gyLSlnb+2z+sokE3P0j
	ZEYRdqiGLbdhYXwjA6LE9yAGU99A2t4lDdUvhW/y6H5qhUwOzWOdTgGl3KpLGKO8BAfkBIiDfSV
	l+Zqc/aAePRBX2UVBjGWMxtCxyp0nk1L9jPrn+mZLess8Zy9T9fsM1WR09CJkW6pvrDBQVGOl08
	QA/e+EeaA6VdGpAHcn59epgW
X-Received: by 2002:a17:90b:4ec4:b0:3b4:1926:9e96 with SMTP id 98e67ed59e1d1-3b41c8ff5b6mr4583519a91.35.1795245076015;
        Fri, 20 Nov 2026 23:11:16 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm10614548a91.5.2026.11.20.23.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:11:15 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/2] Bluetooth: 6lowpan: Protect adapter use and notification lifetime
Date: Sat, 21 Nov 2026 15:11:08 +0800
Message-Id: <pm-bluetooth-objects-candidate-0228-v10-f6ced931e2322aa5c7b3-0@gmail.com>
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

An adapter remains discoverable while asynchronous netdevice deletion
is pending. Protect lookup and ready-callback use with RTNL, and close
the delayed-notification producer before deleting its embedded storage.

Cen Zhang (2):
  Bluetooth: 6lowpan: Hold RTNL across adapter lookup and use
  Bluetooth: 6lowpan: Disable notify_peers before netdev deletion

 net/bluetooth/6lowpan.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

---
