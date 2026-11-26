Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699560;
	b=yaMPBuUuPqV/lEl+OyMoyHMBdPh2plQbqj+CX+ZrUSIOrKmqlrFljws7ftvRqI64by1u
	 EHj1ql6Nhv6fNOGytKvGH5E3y60uKqkhKIOyhAq/DVI/E3AgTnp6MYo8XRenZeIuprLna
	 KkqP+Tc5zX8Cj9KBCBHY+1MRdc29UNIZNtrRMPbQ9BmnxDmNOALM94YcjwD29B5ctt9Wi
	 2yJv6rLpSHxq+qPTmrYmBSzZZ0JvvQ/C9ebrG+U7GfsGwEOq1p8XavypbG5NPfzvPFrj7
	 JLM5ZwPk1KYC00B6os14ZJfmY4utyL6ryTNJtfcjQS+tDD25h6DY6cUx6xDc90YFmFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699560;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VoBEgiO3LGgFu0I+CoPOV18doel8Lm5xFkwPKKF3UjA=;
	b=BRvCzmwzWzk7hcOEMyvkSZ5zYVvoyOJGf/iBnXp33PePsTyFtJ3/lpHwXXEbawR+AF8F
	 S96/qzXiJyL0+f9YrDfenl53IlueWhFwNBMJyXoVFOtPRvMsfm0wCfRXUaUTmud+xY7JX
	 hoSFNnYDDtNqs44F81jGHNrsOoJKAPHeiISc5Mv+ydxfc7Ue4TKQR9lsEXWzM2JZWtSIg
	 YN8BKc7K2NhbNNIdP5E5X0o8a0hn4P/HShE7kp2ct755IGigLo23FbFti/p7zmbpY25jE
	 f2+KY/zFVAyXMAkuG8YGkpXXU4Z+pwHU51Vq9/7D0SlF2LG9dzsRRTSQqN5DQqru1FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y9rvqaFD;
	arc=none smtp.remote-ip=91.218.175.28
Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y9rvqaFD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Mx9tj3Sgy8Z6jSByFbEw5wqlOsU+YsRRPEnrf0b0edI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795699557; v=1; x=1796304357;
 b=Y9rvqaFDtdwZB4rAi2kkOLlEU0MKeOql1Z9irBp20AYr6hqYlB2NX6WdwHy10k67cqUFEv83
 SfpgumNF3vuPq91qDvKKK/OypyAg1PP5OLVZRJ+XqfFo3R3HoQAsYMZfGaAuPuu1VCUw1fR/hf2
 9v3BdGFVhsKonyTYKKDpWTVI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id a8713e5558b39bcf;
	Thu, 26 Nov 2026 13:25:57 +0000
X-Mizu-Trace-ID: a8713e5558b39bcf
X-Migadu-Flow: FLOW_OUT
From: xiongwei.song@linux.dev
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	wy@wyuan.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	paulmck@kernel.org,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@linux.dev>
Subject: [PATCH v3 0/2] Add RCU docs Chinese translation 
Date: Thu, 26 Nov 2026 21:25:20 +0800
Message-ID: <20261126132523.6329-1-xiongwei.song@linux.dev>
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

Changes in v3:
	- Some translation improvements.
	- Deleted unused label.
	- Fixed indentation warnings.

Changes in v2:
	- Fixed build warnings and errors for both RCU/index.rst and RCU/whatisRCU.rst.
	https://lore.kernel.org/all/20261118131636.5131-1-xiongwei.song@linux.dev/

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
 .../translations/zh_CN/RCU/whatisRCU.rst      | 1218 +++++++++++++++++
 .../translations/zh_CN/subsystem-apis.rst     |    1 +
 3 files changed, 1269 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
 create mode 100644 Documentation/translations/zh_CN/RCU/whatisRCU.rst

-- 
2.52.0

