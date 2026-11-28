Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853904;
	b=3UuiyUETMRCRbsVF4PiprWXXjbdVVnrZqitH1NV7vPd44inJNS59e8qApDQ1p8LPeh4b
	 oivlL6YOJFKtOjTZv+mSii60P9QYxKigpvXqYz5iSbn/nIkFnQ4HMkzUlcwZ8hC34tLYu
	 c/SHOk7NRAwSgd50nb+26GR47zIHFUvEAlUjoEEvaqjwYNX+LuKHSa7hphT1vAcDlf+gK
	 7dA2vxDWMxfdCfAJ8u8EyOdwqdQuFM3czO1rRvJ4PJE8KQwYbAStm4Xtj/xlT5FIOnemz
	 jOfXjosKTNc1tJEqm5Kma/VpGgOwYf21ZKWaa6wW5NwqvmgWWwpteTeurYU/bIJzADQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UQHX/qYS5c5kksZ77LXg1WqJxlfjKfapCZLkAYXEJAI=;
	b=T4rKkrlcq8s7ZfZrJt7EmYQrfonfmTJMvHxg9umVUF0Ku0MgxO9GC/1kbuyIQLt/ig8s
	 gpzEROIzMfEbZ/zfWPAPjtXzHopPYS429R4cjAQBMvYxpRcyQqBRb8l4fuWfQLtfI2ifo
	 n2urK/vJrm8uxPJKa8gMJ1aRz4WxtiOj3t2lJDnGA1bEW/ehBEGWWAwt0iCXg7UDc58Xp
	 AuCwck8xgv+65TnaWrLK3xKGGHOZrEnB2C35upMwo/c4sbNazRFzHbUs3xNhdjvT2wAH5
	 i8p38wIcG64PpSfLnmxhIatsXwpGc4Qcj3+b2al9MDJfRVqueI2YfNxkd1wvudUHU1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pL3F2Q9W;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AF1606A326
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pL3F2Q9W
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f07a960666so64201845ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853904; x=1796458704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQHX/qYS5c5kksZ77LXg1WqJxlfjKfapCZLkAYXEJAI=;
        b=pL3F2Q9WB7jP7gHpTdJVbvyZvP8l/9x6jogovbeNWcW056qwrI1F+QfS8G3+Pwn38z
         22yn8/JwUPDWE+c2us2ASxf5aaHue7JmHdRykR3EZU7CvZ03lDxRfwcP6nl0TFhuHu9g
         RaqRDceuHb/UmAZKZ2XwUb2cTzeixcYDg9G0txTsoXlBPuKKp2JWacoKM7tv7QwtgeCP
         x+C0RT8xRs9rDGJYr4ZxcOF9ETzO17nzZm5l8iNQzKlh8OykskKJaMJM2nUNKaNAzbDF
         ZzDtGi8WiTDFFO2lW6c2wrGsauFyQSDfel/2yTwVS9fMFip6Wxef9XnA/KH6eNQtSAwD
         QoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853904; x=1796458704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQHX/qYS5c5kksZ77LXg1WqJxlfjKfapCZLkAYXEJAI=;
        b=ipYAZTyh+0a8HsDqPpFF/POgTpBxAU3drLNPI/eg4WEhHZ1dx7CX9FS7s0rpi1cMRk
         Jsijgp289ou5CY0b17ygylFr7jD1JnBHYQXPFOOBO322XhxnxuRk3GTpMhyvE9re62K9
         oIyf+XONcS7sros6MRoA2GpcTBe6U7j0bPzV5LcMIrFD0T5dy0ZTl4/NbT4tOiKZJluj
         qHcRT67fW7m3QYz97xPEGGBom4y/uC/tggVb6Pb7gB8LTx+05XerdSlsgsYcnFYhmj3D
         qYpA4YnrXjbknqUAHz77Rtu9clvUaSZfalxTEk33bJEsf4mi19vLWxfv9UEWgDwVFKwr
         cFbw==
X-Forwarded-Encrypted: i=1; AL+hErGiT207FPUp8YgwEXpBtiCpzdNstVSvJEyYQADtNqESjF+eufV/DZiNbW/1PGLaEhHv63fCUnSE25uv0XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D/SOOCVXrQP2bX4TPQ7bfFs5brKZRZ8YtPgB1xiH6QKacqpAe
	SztyCuVCSt6m1W0DCgIWaLzf3XhpPGTxWGip9o1YcbS3H1KgPYsXjeVc
X-Gm-Gg: AZFdTZcADQswHoDJfNETwHc+pHjAmwQ07RRPjE51YHFk91wFR2rYCb0C5rMcRLrBhhZ
	SZ2IDUSDR14UIbqPGT1PKNoPLdjkHEfZfta782GJwnc6GeLr1b8J0LEZXc629iSzg4BCQO7GgfZ
	y7JuvKx37a/oLwieGtBMOerNUbO5SXObNz6KhkTtIo5wGc80BlHUgP3WZb1Xegj76VMrTO4GuJ3
	R+sCGk9W+90fTqfvtLAcEpMjxFJtl9FaZwC7qb5Ma/+wL2cvuL3XZFP5ILxHAbTv8x2MC9sJQuP
	U9ylKt68vaiBpUu/Z6y501Zs9ZpjInFV4GG0sXrkcYnBn9iYSw3/qxpoWeFy9CkrG51LaBtRkdV
	UUrpJvMwiD/+pHyRmMpIe6si6EkixaC4cntDmlEumViOAf7oxedOPGeGudWei0F3ELmJS+4r/1U
	130uwcSUpfDF3+av+15jXH/9nCWxpVyYu/Eeqc1/gIsj8wt5pEXPxhZWXDI3u0Etb5pfLh1SLRM
	lPXtOgCXbRVb9jIM2ZgiSC3zoZoJQ8s4SKy4d4OrCBnPttsGQwxMSNOMx7VG5U5z3tnKdxfqk0s
	TdIxAnHI
X-Received: by 2002:a17:903:b4b:b0:2df:991b:4368 with SMTP id d9443c01a7336-2f03f1817ddmr297156055ad.53.1795853903817;
        Sat, 28 Nov 2026 00:18:23 -0800 (PST)
Received: from wyb-ms7e59 ([2001:df1:7880:4::50a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm133882845ad.75.2026.11.28.00.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:18:23 -0800 (PST)
From: wyibo6109@gmail.com
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Sat, 28 Nov 2026 02:18:18 -0600
Message-ID: <20261128081818.365987-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017-literate-prudent-walrus-dc6dad@quoll>
References: 
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

From: Yibo Wang <wyibo6109@gmail.com>

Hi Krzysztof,

On 17/10/2026 20:01, Krzysztof Kozlowski wrote:
> LLM

Done, the prose now says LLM.

> We agreed to drop all these.

Dropped, together with the touchscreen.yaml reference; the driver does
not parse them from DT either, the geometry is pure per-project match
data now.

> P > N

Moved after ONENAND.

v7 sent as a new thread.

Best regards,
Yibo
