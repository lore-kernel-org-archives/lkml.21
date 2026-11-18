Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007823;
	b=Z/VpPI6tY0+VYlsHrghh6/KL3DJnsQWiCrAW5NNSWrK9lzTbmVRDYA270nEXTEg+keuf
	 T6bbbZFB7ihjjwXHFxmZilypO0K+SjWxcWcaDC82+n7Z0DzQIhQRMF/MxHidFy2IMEH5R
	 vkisEc3sz/wVA3+gRxLqJJFwWIhX6+3v9hqpNcVJhZZhgDSLE6XgzyZlbz30iWC3ZDyW8
	 I1+aQ/ESKZD6gBv/rGwGS7IfLH8+rUwWWz9qdVei9n57i/pv49pCFGlL44v7L8VNEo/+A
	 FTwlrJqAhOcSYAM5Og5cwlgQCKlR7n2NBGwMtG8ercKsCE/nSx6PbK1eLTsOlnk5HfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007823;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Zmfk0UiuIYcl8UbsrERw8AcNgTEWYppM5yTU6jwtjIk=;
	b=KU0SE+EhoGLLzqOi7sgKu9EQpX7SKpFDhJpNxPZnWQ9kwc1w0XK2R856vh/OdoAWqo8y
	 FQQiCguLWYhedti3sRGnuWKrPeZWHyt3zajqZQZC1X5PVr3/Fj3L6WP4NMYn+vOqk/M0i
	 qXGiv5NAWUyNOf8D6PV4xh8qg2voWWbWO+tDQ5QMU3enmLEMF7HZZyJYmns3m8d9EiDm6
	 7N5K1P0/PymMzTWR5XzDG15K/ATD3QcGkMQqaZXEdl6fAp00Y83B2FLMk+ef1HyVkToay
	 bgELWVwiXtdw72M+uh740Wf/ZJ3RShbbQHSLpAQUzlzpXKRObXlyYymXgfEnqWIX1zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MKArAhwW;
	arc=none smtp.remote-ip=95.215.58.2
Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1D4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A1D4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MKArAhwW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AMzdrRLfDWMyU7UGPCZYwpksO2SRu8ahw0yiAFS/GEo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795007820; v=1; x=1795612620;
 b=MKArAhwWH781JhqEUl4kvHvV3QaFt8DM8XQ0fFz+W516O9rJzBvpronubTanVVVpTtG/OWVJ
 oYCcROeaP+kqfv8atHT9qCCcQVOMigJ8JNvsrYnW2klrdC7pBiUhJK68RgJ9j7/n8OkVybVofRo
 bvd7mFwl9tXf/9tTg57sVxXw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 268c1a0a607b1246;
	Wed, 18 Nov 2026 13:17:00 +0000
X-Mizu-Trace-ID: 268c1a0a607b1246
X-Migadu-Flow: FLOW_OUT
From: xiongwei.song@linux.dev
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	paulmck@kernel.org,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@linux.dev>
Subject: [PATCH v2 0/2] Add RCU docs Chinese translation 
Date: Wed, 18 Nov 2026 21:16:32 +0800
Message-ID: <20261118131636.5131-1-xiongwei.song@linux.dev>
X-Mailer: git-send-email 2.52.0
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

From: Xiongwei Song <xiongwei.song@linux.dev>

Changes for v2:
	Fixed build warnings and errors for both RCU/index.rst and RCU/whatisRCU.rst.

v1: 
	https://lore.kernel.org/linux-doc/20261113013054.5662-1-xiongwei.song@linux.dev/

The following 2 patches are adding RCU docs Chinese translation for the first
time. 

Currently, RCU is not listed in TODOList in subsystem-apis.rst. I propose
adding it.

Thank you

Xiongwei Song (2):
  docs/zh_CN: Add RCU/index.rst translation
  docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation

 .../translations/zh_CN/RCU/index.rst          |   50 +
 .../translations/zh_CN/RCU/whatisRCU.rst      | 1220 +++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |    1 +
 3 files changed, 1271 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
 create mode 100644 Documentation/translations/zh_CN/RCU/whatisRCU.rst

-- 
2.52.0

