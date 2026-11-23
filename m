Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431787;
	b=bc4zdkim0XxDw/xLRxfiSO+vfpeOOS8QpUUyFE13kvxBXCKMOv5NFpT88nmZ06Tj5GrW
	 ysO6dJe3JbpBmn5cNr5Zrf1RQFcCQxKUPWO6vxCJ+2EkMdRGayKzTT+OOjFdUsDMg80a4
	 HsrLSEnpYKvsyY46QuYt3DZe36/9T6D9XJqBx1mlwQSwdOaR+r0c1whVBO0GAj1ko3Tqb
	 RhxfFjllJjVtv3g4aJPTyNeKt0ayPCkFR9YDuSPqvgDlViKRgurPoficOBe9wJcO0xKkl
	 6UU+HNZ6scYutq6GAggmHkr3PukbtjOfyqCi/xQeGaoJHv0rx6FEix1mJrh+5QhfVqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
	b=q87LgUJnzd+jUoQMOxBJJ4RVIl/hafq01PbJZmCF6niU5sM5ilYrVI4JMmVW2GL0URA1
	 4HDTbL/ewuOiyqULu97MHgSHjT9gaRpirOaOXJVJBoWW5beTfOJ0TR/1+OI+R0TLHgtK2
	 +7oxNmGjVq6x8oculSnILcwECwxZTILYeJYXduhEJF8unwGwo8Rz0vEu+kHZX19r16RHg
	 rk5qv85owcauA5+Tb5RWZB7GvBpbDJu6LDlJDrFrCMMbLP9OiEvTDvvpdqrD7F4e4S0u+
	 NBVj0PR6ANbvsbtOVfG+V936prsV8H/c/hnIo6jo38JV3GdUmQfFzDBiXwTUAAubtkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1Sr1R9x;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F91606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F91606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x1Sr1R9x
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea19c28a50so1049985ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431786; x=1796036586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
        b=x1Sr1R9xbejeMEj13TlW3oO+uSBWuHxU3cdIB26jmBpjP+7CzfqZP2aF5LtuQajGpt
         i0dhMcUrjbMo/zh0t7P4n/cLOcALR2ifURe/Zfe2sgfR0OtV4T3FdqxKxSpN9YlYqMCa
         lo6aRkO8bSmKfgYw/B5CVaLut+okbAK1rTtsM9yreX6xrnNrZM8vHmX4n5DX2pp9XxU3
         dY/mxY6bgWnWRYTzzI9yZzNPZ5Kot0pHhW1lYvJz/J5tbBMGjGBXA7D2+YBIuGX94RXL
         l10DOGLvD8JtjUDV3xGXdIMW2DncyjMCdk765DezgwTdrF1cUaLAHKyfxyLK23stxSce
         2z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431786; x=1796036586;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
        b=l/MPF7nNpdvh9E+TrT+lDhMJGhTEXFzcSaMm53ksUglW2dqKlX1o8PfWcLHaQzESpR
         ycHv1xnogxUwOdedWoNKROUhZepp5/P6sgNnKEVAUC/hwvguSTVRko3CGNqOjndJfbep
         KK+C1oRJ7dXqasYg9jHDOtJpuz3hfvruwsPjNPAqfjMS9CC0ptl0ntvy/U9sJRh9cNwh
         C5NfBUPEhTuXHaPyDeisiH52hubdVF1bMDZ7eRJWdBHt082H820D4n+/gdVV/CDlvhRV
         M/cIeejWitbKnJe+Zg/FTTExw+O7SHm1V4G1OYOBlDsKUfLE5nFGIVLFjnbeK6UD3MiG
         Em1A==
X-Forwarded-Encrypted: i=1; AL+hErFnnnBN+EugokPviH1Nni1UhwDwyLR6YvYUjV8DO2pKi7KiqxqcIigOIw2nA6UDeWumIDMK8T1enZAUSds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nJJw7j4pBPy4XiwZvj2PBnbijjAML5vYcnL8+2AZOwB2k+b68
	vR2ZFyIEGAWQiUNCQaKrYu6qgibh2Ph+DiGQFY+f3R0fgNUwh2cDBJHR
X-Gm-Gg: AZFdTZceZP7DwdsH3EGYadlC1A2gRGZ81CGwIzBTArV/RmrNn+IoQ/TWtqllKH0rvFR
	jHDQntzCMrAsGTPQDZQrBcnd709yWi0acdhjrLHDzH96zPlDTQiAE0RR5fbGD6guDP1fqcbQ5iN
	1xidjTLzthVg63dsY9Te+x68EkJejBJ135M9TTEUmXQstMaKa3JdUP+uZdNo+3xGkEkB3airVw/
	uUFv3zFrzFyFPDoQJfmcJBQAsjQxyZm4UKHGsmw0IV+5TY+bRXH6wigCjeMffru9X0PnFSNkc9q
	Mt9wDxJK4XSKszco7Z58Nft4RaTshn+zUHMATNduURm6EtE7xd1eNE86ZPbm8J6+ZjV8emhkAsz
	UO+HF6yFXRWVmeHcTE3VSrtPCJZIX2n/ulqjh/4RIgERHQhbEoU7mrzYmjjng1VwAvz1cADqdJ1
	0W/fk8/iyoUk7g/yFLgucW6fi86sM983G0mR3CP7bQHmH3b82awoXzGd7OLA4lXZ0L//wZioyLJ
	BK5wSI5feIX6lPosuZ6n1cIPC2hks6mIOp0767AHcZzqY9mVbmKaXzPS9ldz60DboITgAlH2+0L
	HAkAjdfGQhmegUQ2dHtTBsZJPwokf+3wFAVbq8U8Fa2eJtCCvnKHkalA+yq2sSGqRN5cKn7v0p2
	GCSFAz+oYqTn+Z9awwZHQ8rFs
X-Received: by 2002:a17:902:eccf:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2f03f0c2295mr177433535ad.1.1795431786344;
        Mon, 23 Nov 2026 03:03:06 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:03:05 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 13/25] docs/zh_TW: process: sync kernel-driver-statement.rst with the English original
Date: Mon, 23 Nov 2026 19:02:04 +0800
Message-ID: <20261123110217.170025-14-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110217.170025-1-chenyou910331@gmail.com>
References: <20261123110217.170025-1-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carries no "update to commit" marker.  A comparison
against the current English text shows the content is complete: the
signer list matches all 177 names, including Aaro Koskinen from
commit b13267ba579d ("documentation: add my name to kernel driver
statement"), and the process_statement_driver label from
commit edba5eecfd6e ("doc:it_IT: add some process/* translations") is
referenced. The prose, however, was converted from zh_CN and still reads
in mainland terminology:

- localize terminology (內核→核心, 模塊→模組, 驅動程序→驅動程式,
  用戶→使用者, 社區→社群, 代碼→程式碼, 支持→支援, 靈活性→彈性,
  封閉源→閉源, 爲→為)
- render "adopt a policy of supporting their customers" as a policy
  rather than "taking measures", and make "We speak only for
  ourselves" read naturally
- wrap the :Original: line to stay within 80 columns

update to commit edba5eecfd6e ("doc:it_IT: add some process/*
translations")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/kernel-driver-statement.rst | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
index 34bcb6f164cb..11de92a7bcf3 100644
--- a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
@@ -4,22 +4,24 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
+:Original: :ref:`Documentation/process/kernel-driver-statement.rst
+           <process_statement_driver>`
 
-內核驅動聲明
-------------
+核心驅動程式聲明
+----------------
 
-關於Linux內核模塊的立場聲明
+關於Linux核心模組的立場聲明
 ===========================
 
-我們，以下署名的Linux內核開發人員，認爲任何封閉源Linux內核模塊或驅動程序都是
-有害的和不可取的。我們已經一再發現它們對Linux用戶，企業和更大的Linux生態系統
-有害。這樣的模塊否定了Linux開發模型的開放性，穩定性，靈活性和可維護性，並使
-他們的用戶無法使用Linux社區的專業知識。提供閉源內核模塊的供應商迫使其客戶
-放棄Linux的主要優勢或選擇新的供應商。因此，爲了充分利用開源所提供的成本節省和
-共享支持優勢，我們敦促供應商採取措施，以開源內核代碼在Linux上爲其客戶提供支持。
+我們，以下署名的Linux核心開發人員，認為任何閉源的Linux核心模組或驅動程式都是
+有害且不可取的。我們一再發現它們對Linux使用者、企業以及更廣大的Linux生態系統
+有害。這樣的模組否定了Linux開發模式的開放性、穩定性、彈性和可維護性，並使
+其使用者無法獲得Linux社群的專業知識。提供閉源核心模組的供應商迫使其客戶
+放棄Linux的關鍵優勢，或是另選新的供應商。因此，為了充分享有開源所帶來的成本
+節省與共享支援的好處，我們敦促供應商採取以開源核心程式碼在Linux上支援其客戶的
+政策。
 
-我們只爲自己說話，而不是我們今天可能會爲之工作，過去或將來會爲之工作的任何公司。
+我們僅代表自己發言，而非代表我們目前、過去或將來可能任職的任何公司。
 
  - Dave Airlie
  - Nick Andrew
-- 
2.43.0

