Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195726;
	b=N2eKG0BYjXAJcGfKIo5Qh14Oc9RLcT0rv7OsGmwvcRGzrwN6qHSM01Wsefafh9PsHh06
	 9NRmBBd6tbYMU7SZhuuzGDYgtzie6+bvIJ96vvK7TUW2rqskm6V5OQvFhsd5eHcAPO7KC
	 Ipme2YpRxf0dOBjlnItYbAWTBd13Ky87AyfGmv0bW5+DpolZv9nNMo2KXx0ElFy07/Nbv
	 jX6l13wn9WbdUHN44E8RNDK4McryNrkd5A0fwoqBVtw02o+nqo0YN/Jbo4kG5enIBNjJ7
	 e5j1qAKpP5UZ5AzGtT/avnkETfU2bxxMVnpBBrtvx46xVFBS5/kxfo/wUhmLKQJrg5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/lQFrumXY/eO2ACD5OArHzMhyMrdljnPb2HKCmNt8i0=;
	b=BPzYbBlgd+tewDHDK39kZvm8rcahPrNdCWucY/yrBtSWhrD4X12j7Jzbe5LdtjpeMZti
	 aHpT5wDNWtv1+4NNTbLbDLHjOGyzm179Oojyxv9hh0ODL9e3+vMUeoK3WUxF3bNpxUhGf
	 lgjIZ6by7NHhR3HIICCCcZ5a/0yYRaL4FaR3fRF3UQBpfe/Dyi4aOdsyA7d/XfLNXb7TZ
	 qzF8Tp+XzcoePZXnztQA1emZMNIw58f1fpuryToqsWYXAoxIRvy7zqa+e8UiCQTLqAteP
	 Q2NhRzWC2dOQdFeQ5JoQPpucJn8j6pNxYnbFfkPcnM0HCa7CGVb8crc6h7BoOpEJtAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dfH6Gy+a;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACD4606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACD4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dfH6Gy+a
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso1316758b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195724; x=1795800524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lQFrumXY/eO2ACD5OArHzMhyMrdljnPb2HKCmNt8i0=;
        b=dfH6Gy+aSviOS1anR7xvcOw6hlW1P/zVeUP1d6jCiadqppqlOXcSVj8En2+UuWYn0p
         eRy+8Vv3YB+V6f7QILp1yqfa3nhh3dL1EClu/RNtmuk92/9v9KAKiD5EE3cXcqAiM/Me
         oZLaMxLnI7HdHnrI4310uvFtDudAq7MI/rrEvLZtkZD47KqvC0ZCpRIDPH90Uq0Mtio+
         NghmoS86I2dFndjeWGz4EpRJjEUSx0eCxI2oMMPDNXKq94zu+tEo6ejO5aub39gTJ+01
         4f2KC3v8fvePDD1wsNeGaskua9ba9CfoWx2mIhGP/mMoyIHj9ZBq6j6223BfTGiHZSdq
         vgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195724; x=1795800524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lQFrumXY/eO2ACD5OArHzMhyMrdljnPb2HKCmNt8i0=;
        b=DxTKIL93YfhMujFk2mhPY0uLf/AvrGmDiZs5TVyKXV/tMOOvmH1x6kmeuCKlqWu2ou
         bCYYpETD+uPvTEJvSMFc7thQvbtMh32qC7uD3alGgswsjsKD3o+g2g3ukukZgbkjJl4c
         lNyN/48g97Kt8BxPdGDd19jvgV8itWUJv3pNvnM14n/9H28efS7pM+i8XJPQ/2UZ6dND
         49tuHbwDHEmd9r+5wnrZWZIfjR90Ey0MRtOPFjbD6WU9e3gKkXr/ZJTGzu/ZFk+CICqG
         w+qpDuAXeT2zBOk3AE/CH7F2PMTALVu3r+3n7WSc47LN5/Z/+TdUwQtjL57US2sytG4h
         0OOw==
X-Forwarded-Encrypted: i=1; AL+hErEA23+Smcyn0N3ctDU0m+K6R/x5m8iIcwqx2YpYiG/kLZLaHckacXiGxewFMUME+RiOstX2zPGTodIhjTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YqzJojPGhqXXCO042NOWml8CZiSlE+YRM+jhxams3XR3MjFcq
	ZhUgcGAl1mXj69oecN3WX/+65MveCbJRBE2puFl396Ut+VCfnPVMEsIrLh5iMM3AA+g=
X-Gm-Gg: AZFdTZcYZ1k31azWxFq3PPxjmMcFuavHdj4nKCxuXQ7xI167kPfrGRm/9LLmbfcU/EF
	tpDkI/KvhInCGpySIcZGMZk0ZSuLqwcirCU83xXNLHSA/nBN8WieGn+OQtxmPN6+DAMnVbkh9MC
	8x5L4mSgjdCvrUvF/diHd3UICZCYbx/p8LD0qj3WUkboxZA5rsEqBuo1I6jBMO1CD9n2W1lOJNc
	/dn9VqVnzlNIiFeGnP0t5TGOcBAVJfJNpBSo3dNeWWfYgEsGc9/xJ/39ICIkg6YUcgmLBZagdqA
	1fJXchvN8s3hXwoogPjZmgRLSOWxtPd+XqyfA635c2wpHNTTJ4sIVO+pPtooli/zrn/cbbbGuCL
	01wJVOw5Qtse6XhwIrs92Sy/5Ec7XKzCkFduZeqDihRaH1lUsepn87NSmuRXnGmHsSzIkkHk2Lt
	Qb6OZWklwyKOX9RRac/kr1lFzhBZohiQn3w1hHXxkxQYggdzWEnd4rYiyNVDX4lwkKgbVgzyF4L
	f+3nGNGQzKBH6iVip5FsAyJI4z+ZANmzCqQAuUmXtBVWY3sluW3DSZ31epk68oNo+XSAij2+s++
	MK/2XRw83a2M+rQxKWOnA7835V3RzyrRxURGXx9jV818Hs0cLrlpXXEf3oqP4WGZKP941A/y7fM
	tDCUvYz1RKNBCuOEtt/wNpFd2t/xW35cz05BO
X-Received: by 2002:a05:6a00:3003:b0:8a0:550f:bb43 with SMTP id d2e1a72fcca58-8c7ddfb0281mr3651179b3a.34.1795195724025;
        Fri, 20 Nov 2026 09:28:44 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm1867911b3a.33.2026.11.20.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:43 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v9 0/3] usb: gadget: f_tcm: fix infoleaks and a UAF in the BOT path
Date: Sat, 21 Nov 2026 02:28:26 +0900
Message-ID: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
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

Three remote-triggerable bugs in the f_tcm BOT path: two infoleaks to the
host and a freed scatter list handed to the controller.

The first patch of v8 is in usb-linus as 69b3b657087f, so this is the
remaining three.  v8 was posted here:

https://lore.kernel.org/r/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr

Yehyeong Lee (3):
  usb: gadget: f_tcm: zero the CBW buffer the status path sends
  usb: gadget: f_tcm: reject a short write data-out transfer
  usb: gadget: f_tcm: clear the scatter list when reusing the BOT status
    request

 drivers/usb/gadget/function/f_tcm.c | 14 +++++++++++---
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.43.0

