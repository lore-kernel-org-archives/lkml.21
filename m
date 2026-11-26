Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708045;
	b=meLSLg73CKxS7QIwBHCBjUu3Gk/1QvrwWW4ppEhEqCbiKtpPn7EytUo8OW+k6cQx0QoP
	 D0NWj68YP8YGt0gNai3LyOUBcM33d/JdAXGgsPlbBXaojf5cZsBB6hxLnNp7hUoHb21Aq
	 5pmqa5h4MlckVEtpLbIS8KGm+Yn3FgQRINuuK1RrjX6/aV4I/b8E1XAYciwmQ7x/4wzPr
	 /fBWTJwehLCqnYKd6KZBBBX/xBY2H1JhgexIqXA0lI8GWDiXrqgi/Ep1PwyDlfilwWBpQ
	 CZsdThyPPKYl2gbK1qvRxv4BoVMmjb82Vn9tFd6oWX4salKGSspmdAaaT2BSDAzpDGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=osJXjU1rT46qebD6ckyVu2UebnPef7ubsMKDr6bH/bo=;
	b=ltIFGa1ALgHtBEpX02TasKZZZ5kQWmxuNigygmtOBbNySDPuPKGoG3hrzDisdcDroWAQ
	 QAwaJDqA93lwletGqtuYlsBpQoO257lW1XNVE2m7buMDfouT+11EOLr2sjhzenw6GF5ra
	 9Kz/u/nTFuc8zi1nJzIqPIyco7aPvuEQoyRAdOZPYme60k45kfO/aHkXnqz9omGwNrVkQ
	 AR6eyEtkdBcCNgD/DLtIjoi1/1kJCC+Ny/m9MtXtZnImom38uH5b9xm3OWeBr+DgrcH+x
	 qx0k4iIkBMX4OcjKQ49gzpQ7KSZlP5DARBhnOXnNquDBeWLuqMcDDLQ3XrnL//+BPNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiaspNmW;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7C606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB7C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiaspNmW
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5056885f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708043; x=1796312843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=osJXjU1rT46qebD6ckyVu2UebnPef7ubsMKDr6bH/bo=;
        b=oiaspNmWZ4qM6Ei3yz4s6zAvOUT8B3GEevBgM/7wb6goeJuU+m0g3CqtViYiqxMsVN
         nxQYK5ETqnxLVtJfRTHLgl+fx81tk5Me1SN/5vzqVtfAztlamlwANx6WJPwQburmp/z0
         t4P1Vh0S5ciVkzQvG6eNJgiWOffu/L4NFzVY2wNiATo+wOhv34y9x89F7q+fH7ecrec7
         0Y/52ev4NPvI/AoKT4XT0xu5nfGg8PEBbt1kh2oebaWJYxYzWlVDCtL2830rWj+1D/Ce
         dz807dKxil90/wR4NMhQN6nPw8a0e6fwHCn8jvRCQKuy/9uYmoDC0nqhI9Wdk1xPYzuI
         atng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708043; x=1796312843;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=osJXjU1rT46qebD6ckyVu2UebnPef7ubsMKDr6bH/bo=;
        b=yqhhypWMhaSpTp4kOhZrXDtwBOVbToRuwLttpZny2GpAYKOPhlYqT1pYRwQ0fcv7+l
         OIuWT80AdybjW5avdfVItDgS13DwuZJVL7eIWbgUh5b4bhrdL4ZnJ34Bxal+P32gphx4
         h3rU3O8X6pcVMUhvBNsxlHeF7ArfaS755W5SQ4ZVsner2v5Tdbr2A9ao58QKfuUj1kdu
         9BOzcOX8zEY0gDJKagxDBmNIAWljr1Bx36/kSLeaYI5bu9QydKCBXAiOm3Ww88wQq+Kr
         y0+F6bRUPhmXsllSJwXYT/SQRWjwrgRP6I0d8b7eTApt2vPrpjq+Vzx4Pi6uvgMVRApA
         CSBw==
X-Forwarded-Encrypted: i=1; AL+hErExe+7on+CXhSo4e74Hso0PS6/zEhn4/AFBm2UrIVzx8gJSA3lVWXJMXt8ZtJVBNTZ3cWvbgb0xfYKZF6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qh5r28ID+Gp01O7ClOI3aoSEkCGnEr6sQbKiIh6+kiARLS7QM
	bq0gm5IIQMy88LH3LKDKVNGrg0dyFgTv62hoG+Q1peah7V0fhXBkqj6/
X-Gm-Gg: AZFdTZdCfcoy0At+Qtn1rpxgEDvgU1AoQC0cN2U2oDNjVF4s7vmq2CfAvZa59vgWdAH
	oIg1UNfSJJDGluxsqODF6N5kzCf5B6ps1swiLp+/xeW9+zUb8nwk0xi9AYp4ze9d5uTL3X+y4uo
	EREVMjX1bBEdcswLSYA4cJfERc3EjGj6iUKEs32MtcSURL6rVErUALx++G6WpvnsmuKm+v8PxhP
	iAlxECzomWUUuBDF/fqxYCUKLM53YerdcjuoGXGHTG0ioXC8od1jbGBYd3WQTFyHmElV/wn6mrA
	mNk/wWnXE+oLbPxny6zsKWjzdYosC1z1dpMGY5VzXrCWohTKxJ+3nhiBix2k6BNkrFjmcfyk+v8
	CHPRUlXTWlh865EjixlHzY/EiJ0HvK8L/BuhAla+P9N2bH3h8xrp0E4c67QYme/tYqwdorBPv46
	nDb+MjRJj60oUOHbaR4IddZkKEpBlCiNSTrX9blEUOkcYRopv/hLbSinyBt1YNd6kUIm8dp33Iw
	nv+t05QadMLFZ7cyMfcsrN1tBqX03MVdFzymoS26Z5ZY8+by0VzjmpIyqQKIrzjlnW2CFodxLAV
	BdDoDzxCFAnqcGIsVXEDBhsCn/wSFoLdKerRDN36T5tPnRI5oBVb54T1SsI=
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr437100585e9.19.1795708043010;
        Thu, 26 Nov 2026 07:47:23 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm683201895e9.3.2026.11.26.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:47:22 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH 0/2] drm/vkms: skip composer work that changes nothing
Date: Thu, 26 Nov 2026 16:47:06 +0100
Message-Id: <20261126-composer-fastpath-v1-0-aa7458d84a7b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrBtIAlXpVUoXMf6pU6gJmSgF8
 e5Gu/wW720kyAyhR7NRxsrCca4wt4b85OY3FI/VZLVtjbFa+fhNsUYqOCnJlUn1aLXvQod7D6p
 dygj8u57P19+yDB/4co5o3w/2D11XdQAAAA==
X-Change-ID: 20261120-composer-fastpath-8e60c7f7e58e
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Patch 1 reads a full-screen plane straight into the output line instead of
blending it there. Patch 2 writes the frame straight into the writeback
buffer instead of going through the 16-bit line buffer.

---
Oarora Etimis (2):
      drm/vkms: skip a blend that cannot change the frame
      drm/vkms: copy a full-screen frame straight to writeback

 drivers/gpu/drm/vkms/vkms_composer.c | 105 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |   5 ++
 drivers/gpu/drm/vkms/vkms_formats.c  |  26 +++++++++
 3 files changed, 130 insertions(+), 6 deletions(-)
---
base-commit: 5ce32a0c94a827ff44ee60898c28060714dcff75
change-id: 20261120-composer-fastpath-8e60c7f7e58e

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

