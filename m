Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431769;
	b=BMaC7I/IwwHaAiLmI/WZ8BCTLGlgvbsD/0nnsie5+IUg/WwyYxsJmCnMmCm00SWsQBcb
	 +kEKgtD5fi8LliMbZ7l85wl8TwTQk9RMshn1DuvcPkKzWgpe+XBn6KBerXs3r8yUhMjfN
	 /BfttFqo2JE5qtwBtr256bERXBiPGDF9Cue7oYghody5kdOwmgMo2YhO+yLqfGmksKJE+
	 +KSix4YHI7j2ciiDzRt5Q3pbZ9qu/1KRm8OrtqrjizUYQkSALpCtt873CWLgUBHYsh/4K
	 SO6bmRdNxKt+zATzu039AKeJMh+uB0aeGW9mf/djmrD7QW7YHLtaw+as1WOaEJC3T6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6jBC/pBEW6tYgxH37sEhPb6qD30sa5Ji6tQCEaIdAGU=;
	b=HkqlDySRDgU5vIaM8lwcl341djDsSZ0YvaK6HTCZaUAH/+JvbhOdPrSKsYOuxwbkg+Jp
	 CraQNX/Yn48PYMx3m7ed4LkxgtT1K01fwJVqyHoBYtFvBzT9hqxiaRann3asod4zhr7Q5
	 TxZWLp1tq7ivxmDB773aDgjnbluxZJQ9wKSCfKxYG8mMttzDkgkhkc5r9RAhtv3Cmd7nY
	 VyrfMVYZdAOIf3WZKZzkgcrrO4rvFl3+A6+z1uFXYUK1tWcZuSWwT5KTUKOXkOAaRK8i+
	 gPA4BXyx8Nj4gHpA7qqEch66fqtHvjDdHmTbol3T15SKHL/QUOhHizdGN2ee+6wtPmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlGkbCal;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25871606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25871606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlGkbCal
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ee23ca87eeso929325ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431767; x=1796036567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6jBC/pBEW6tYgxH37sEhPb6qD30sa5Ji6tQCEaIdAGU=;
        b=YlGkbCalmmbY1KS03lHZeM2uOkAZimmPVuxZtwqkBZthDiNoSrxrX12MgKNBANEJ2s
         egLHnVxXnNbrfvqNqEvMvezAwheoE2lFMekgH0VmiCSWHCf8q5rh/vkrTSpoETyrTWKV
         grvfCC53MGwDHJvYJJAmfzXdGXYN4PRYrEjlQRdU/wlhZAva4NjLsSaeNfj28Qo6sltp
         fe/uIyt7OzsUzIENgbugbsboIVDfNXHruVG+0c++7uQou3GYbJo0dAEv/ln6GXxlFwqP
         eOK9A9vRq46fIqK+9rQEkj8RP5Mv/UHMgB3cKFpq451GRfcUo7fEYaNGet9AsFHo+yil
         HOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431767; x=1796036567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jBC/pBEW6tYgxH37sEhPb6qD30sa5Ji6tQCEaIdAGU=;
        b=ani2e6jhL5FzSkeKs5kGLSqZJm5ZNvk9w6tI5xpgqYt2kmK5b3jDNTq/DltKOEMWFi
         GLNs3mNVNAlRQS4scZPR/fxiaVgodPb0x1UNwcNOn95kVZ4Il9O456MvsMNqk7N2bfsx
         PrrmxtgzwWefgnjHIZs77BFJRLWDs2AWt2FEbPqYnlXtrkYiRIzp0xgr32B08K6mB9Cn
         5s2rWyaWRO7C8fgJ/6flBKlD8Q+OBbM/IwiDBEwutkOXayTLfvp5v/pCeKvsk5kjB0BW
         +Yz8Mrc2Dos4M3A+2+iwdRDfM/rThTMVE7mlH2Z1MnxvuwygpKH+QnoaaEVJxWpF7knT
         xzCg==
X-Forwarded-Encrypted: i=1; AL+hErEMqjxnIpgaclcRC03qBKmq4KL8LhRBc4aoYiZhO1IrYGc3nd09CGZJ0sphnusn+5bAemNye5PW3PUJnBI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gmkZioajq4Hb9qiKXtTq/cKswHg6cI6+8066GWX8szJGRrzkc
	tz1z8HWch/Dtw4/mUXCDFB/NiuGaoMXgyal3/cJYUCX/kPbzr80KC7C5
X-Gm-Gg: AZFdTZdLc+R/HJlm8UHcmvVF13R1iRo+1V7OWDKfZaXZK5EbYRyw+j0qHqKebSW9pJA
	fAuXmSrLh1HqtvnxorVHmWy7j/+bLPxApyKg0a53hNqqik5Ljdp1zIl/uBEv5uYkSiMjyCFLR91
	aos+ETpffupMEx0nAsDmOnkX+vAWCNC12kFeBiGOrGlWWRMLhq2Oj8UyLdSeRc+tH7guxM1QLjJ
	cXlZFMq+e0i5pycBauIHBGtqy7j0qW9F0bkh8Zxo3IcMtmLLo15ZNe25vMbV3O+C/B8OhTGL6/0
	yiXywvzYszD0pibJBgSt1jg3rJFarb673oHnsaZrEN4Rzk+2q0G1E3MeFaiqPMMdzOTssJCt8Rw
	SnhL9OeK+aQUm4BpM2iucouL53ByKp54wyLQa/OrdESzRTwP1ySag4XJDaNToGQobMZ9L/FAVVP
	jfkIoPr1cNM6Agkya4OqTVh4L/Gknf+n+2QtzmM5DFiuqBzjvOOLBqJTdTpPp8HjtsiqOTJrmvB
	gwKr05kA5/WGbWYuJHzA6gZbOzhhcUYiOR+3tdP73VAm1ZtMZzSTFX/Iin37b2pq+5SWtUQ5vpU
	ccmy6lzbtSjJc2w1HUZbEKVxTtz2bO3dr6hGJfNQNDMfG2a+XMWoCTrBy0VX1hcT6gCpBc4KYZn
	bFOQyqx7er3nEGlKg4pcoLMky
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr177577965ad.0.1795431767354;
        Mon, 23 Nov 2026 03:02:47 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:46 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 07/25] docs/zh_TW: process: sync 8.Conclusion.rst with the English original
Date: Mon, 23 Nov 2026 19:01:58 +0800
Message-ID: <20261123110217.170025-8-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker.  Its first
paragraph still followed the wording from before
commit 9db370de2780 ("docs: process: remove outdated
submitting-drivers.rst"): it called howto.rst "an important starting
point" and described submitting-patches.rst as "something which all
kernel developers should read", while the English text now simply says
to start with howto.rst and also read submitting-patches.rst.  A
section-by-section comparison against the current English text brings it
in line with the full current original:

- retranslate the opening paragraph to match the current wording, and
  write TeX as in the original
- retranslate the sentence on why the kernel has progressed as quickly
  and as well as it has, which had been rendered as "as fast as before"
- wrap the :Original: line, the cross-references and the LDD3 entry to
  keep them within 80 columns, as in 7.AdvancedTopics.rst and
  5.Posting.rst

update to commit 9db370de2780 ("docs: process: remove outdated
submitting-drivers.rst")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/8.Conclusion.rst            | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index 2436263c6506..e0737d6e83e8 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -2,7 +2,8 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
+:Original: :ref:`Documentation/process/8.Conclusion.rst
+           <development_conclusion>`
 
 .. _tw_development_conclusion:
 
@@ -10,13 +11,13 @@
 ========
 
 關於Linux核心開發和相關主題的資訊來源很多。首先是在核心原始碼分發中找到的
-文件目錄。頂級
+文件目錄。請從頂層的
 :ref:`Documentation/translations/zh_TW/process/howto.rst <tw_process_howto>`
-文件是一個重要的起點；
-:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
-也是所有核心開發人員都應該閱讀的內容。許多內部核心API都是使用kerneldoc機制
-記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式產生這些文件
-（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文件）。
+開始；也請閱讀
+:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`。
+許多內部核心 API 都是使用 kerneldoc 機制記錄的；“make htmldocs”或“make pdfdocs”
+可用於以 HTML 或 PDF 格式產生這些文件（儘管某些發行版提供的 TeX 版本會遇到內部
+限制，無法正確處理文件）。
 
 不同的網站在各個細節層次上討論核心開發。本文作者想謙虛地建議用 https://lwn.net/
 作為來源；有關許多特定核心主題的資訊可以透過以下網址的 LWN 核心索引找到：
@@ -31,8 +32,8 @@
 
 關於核心開發有很多書：
 
-  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah-Hartman）
-  線上版本在 https://lwn.net/Kernel/LDD3/
+  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和
+  Greg Kroah-Hartman）。線上版本在 https://lwn.net/Kernel/LDD3/ 。
 
   《Linux核心設計與實現》（Robert Love）
 
@@ -54,9 +55,9 @@
 以及您如何參與這個過程。
 
 最後，重要的是參與。任何開源軟體專案都不會超過其貢獻者投入其中的總和。Linux
-核心的發展速度和以前一樣快，因為它得到了大量開發人員的幫助，他們都在努力使它
-變得更好。核心是一個最成功的例子，說明了當成千上萬的人為了一個共同的目標一起
-工作時，可以做出什麼。
+核心之所以能發展得如此迅速、如此良好，是因為有一大群人數驚人的開發人員協助，
+他們都在努力使它變得更好。核心是一個最成功的例子，說明了當成千上萬的人為了一個
+共同的目標一起工作時，可以做出什麼。
 
 不過，核心總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
 重要的是，Linux生態系統中的大多數其他參與者可以透過為核心做出貢獻而受益。
-- 
2.43.0

