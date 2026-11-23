Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431749;
	b=1m/lVU9HK+lawTMtXutZLbuwM23FDUqYvpmyXPQoOu7S8J2+/BUFIkWN5cPmYeiceFIc
	 PcwwPvTW/NtLdW197mIOuXzcxBgy8N5DBPOfhkKXCbI0mzG+RuXlTnvst8UptdZP0hEG1
	 sSZefC7FDE/1soR/jYGvdTUDkohT0zwG0ux3HA9uM31uK/SOJuugb90c1HVFIAj9dxt0k
	 I0UlhjhfN/HuqX0i0JQKoUbDvwaLRgSf3LsE9wyHfA3uL+vEVHn5XauY3znkqQlGoLPAV
	 eB/Bark0ltB7wGjpv1Oj+D9a+SD4R0vuPAag4hLYPXJ1qSr+wWlwPL0ijgATNYla/qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dRvEKvMtMy8DOufQg+iuIpfqGC13XWJHeXFYO1A/GwI=;
	b=q3r3CYCkYa1qnaw9iEA4nVy5VE/fv2lhVaRJMlQxKC9ICBl6jCKiQCzIypQSUYkhaxBw
	 1UgroHBdhPTksfSbZLMdb/iLQWGXSPEpstrb+Y4BYAY0XXyZ2bin2PlEiHW6xcC1jqJ+B
	 uCdrbr2O9lc1ztH1Pq2rP/00f13Dkdc2czTsSo6bxJeA+leSsRtMmfn+Z8R0IDep8sGYu
	 PInBkg+S/MbfVdVCCcGIJOGDbd1zCjtzoJUPE9dfz/5oUBYZ9FBa4Gh+q+O5VxEdXqm2v
	 vlyVzWxFIB+B39oRbKUpVUGPu3VtA+nsR2BaEmfQlictk6a8yGFTt72DTUbq8TUHPVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p8yPmJ/J";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D8606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8yPmJ/J
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b43d6c3485so327994a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431748; x=1796036548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dRvEKvMtMy8DOufQg+iuIpfqGC13XWJHeXFYO1A/GwI=;
        b=p8yPmJ/J8xWWYI5GwzDPD4Ye/raKwwrIt3d0oSePmZFEp4arpTmWLjQsGHWbNeBikv
         TEt1lE+zBfYNszCXgG/7abMFipZBMSWPoNAMwLVesvt8FuAiZocZl0Cnm4K8x+nkOIuU
         XGM8wrZ8Ip/QOszbGJdR77ZY90EBJJ6NClU84nmjAinvcbPOG9c2bSYCZQDgaik5bogD
         nU57S+3QXvoOkFYutiXbUAjKf3TFlejCURgwvWpqenWef0ygcz1w6EMAAanMvhiiFr19
         VOHQiNUBOc4HTEIZmEP8ROqXbQED5ACoXuXG7meU7VdNovPLtuw5+mm8vfRQ/cpSqJ+j
         MbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431748; x=1796036548;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRvEKvMtMy8DOufQg+iuIpfqGC13XWJHeXFYO1A/GwI=;
        b=Ec69t3emM8LxFLj/1hisPmb4s7hgBLh053qiCI23wN0y1qTl5JGv6Q+qRIWvo8/ef8
         V8fcoY5xJsARznGNeHVAUAmAJQuN3Vy2MUL3lR9Nm8LOl6l1+UIwR1Qr8jYb3+bUH4SJ
         0m+024O5Jz0GbKko1GiKj3pQLvlDP5yjlynddIlTsYtwlhYqqt7ianrd435CjqH5b8+5
         Wcjw/6j/OpMY4SPpkw87v8+KTdlDxZPkEOhc2m/uyNW7p401kL+IS3nQk+c/p4hQquCW
         yGxrQfxDkxBmrBGmJHQA9CE/YCbiUoxDRSPPV9pZ1zJ8QocX0WehrSMZgkeBfybibCJV
         wkHw==
X-Forwarded-Encrypted: i=1; AL+hErEn3if6Zu4z2W794tof8r/BVUnZMdN11PsSbZYnqJvBLaZ5R2vzNShtHka+PhVD9Nv39gkS/xNNVkreBg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K6wxtWK45x7SX2xXVfLDNvVk4jyyMg8UUC/FsMnrupaTXfD/4
	3uGAVIscI8EGzjs7SeGldsntFpj2RSa6sVwh8/Syw6iLFkr3VlcSPfUt
X-Gm-Gg: AZFdTZd9+FgAqOr7Hs0jj5yYRCdjdPY9zrkD4uCaDJspnA8nogNXFiTarnx18/GHOrF
	l4cZ3dALAw+YTU5qBbZgGTI2opmbOvam0iRJ2EmQdgE+inZNR2SCqSvkkY3CzdfqSyHlxcu4D6t
	9parvf3seIlJIPE/lFhVBX9xdkke/FNgZUd8ZJKteWwxZaM2yvYpH/tAGowLn5hD+YFg+1YCgwi
	no2SBn8v0TE0ffog34yGhdZSNQr+MRIi1GUOZ/lFJLmts3eQb2WuPSiFMkB01YFI09huWpchbA4
	ZXqQ1YMM98B+dOHEhptJMUNQL+unmp6iKFNB/pqGzMFafV15UrX0lozuOZ/IRAETuUh+mRdcJp/
	9qWGiBIxeHwXZ8FxS9YFvVSW3rLX3GYBu5NmbsYM+FSEy5V+Ap7nn7JrZWS1O3DxuBel3rI8DE0
	e3+SFuwL4iK6JXm7aVkjD1C1Z9VIXK4WVsuoM3N/CBZyupPn0gpj9B2hyKMGb7KzcMrLHbdcgF4
	LqLKDagPZOWRIfN1s4Y2FWxrNW5eBo4NT3EalKTaoo3w8NTo1a6lCRRU2Q6vdIF+hnu5BcZPc/8
	8sehqjzqQujK/AJueLLjuQ9YGg+rv8pvNM6lfx0v6vKxT5RsDvuzsaE9FQ1tXle/2zHJCDY53M+
	2RHi8Biy56tTs9KDHRRtGFiSL
X-Received: by 2002:a17:90a:c10e:b0:3b3:c92e:f523 with SMTP id 98e67ed59e1d1-3b41c917320mr17279965a91.3.1795431747784;
        Mon, 23 Nov 2026 03:02:27 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:27 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 01/25] docs/zh_TW: process: sync 1.Intro.rst with the English original
Date: Mon, 23 Nov 2026 19:01:52 +0800
Message-ID: <20261123110217.170025-2-chenyou910331@gmail.com>
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

Re-check the whole translation against the current English text.  The
only English change since the last sync,
commit 4a0be1a25d98 ("Documentation: process: Capitalize Git, Quilt, and
Mercurial consistently"), capitalizes "Git", which the translation
already does.

While at it, fix a few translation errors:

 - "language" in "with, optionally, language allowing distribution
   under later versions of the GPL" means license wording, not a
   (natural) language; translate it as 條文.
 - "false economy" was translated literally as 在經濟上是錯誤的;
   use 因小失大 to convey the idiom.
 - Restructure the broken sentence about code that cannot be
   contributed.
 - Add the missing "too" (也) in the embedded systems paragraph.
 - "3-clause BSD" was carried over as 3子句BSD, which reads like a
   literal translation; use 三條款BSD授權條款.

update to commit 4a0be1a25d98 ("Documentation: process: Capitalize
Git, Quilt, and Mercurial consistently")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
---
 .../translations/zh_TW/process/1.Intro.rst     | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 65c5ae095504..55d0e08dc4a7 100644
--- a/Documentation/translations/zh_TW/process/1.Intro.rst
+++ b/Documentation/translations/zh_TW/process/1.Intro.rst
@@ -95,8 +95,8 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 有些公司和開發人員偶爾會想，為什麼他們要費心學習如何與核心社群合作，並將程
 式碼放入主線核心（“主線”是由Linus Torvalds維護的核心，Linux發行商將其用作
 基礎）。在短期內，貢獻程式碼看起來像是一種可以避免的開銷；維護獨立程式碼並
-直接支援使用者似乎更容易。事實上，保持程式碼獨立（“樹外”）是在經濟上是錯誤
-的。
+直接支援使用者似乎更容易。事實上，保持程式碼獨立（「樹外」）看似省事，其實是
+因小失大。
 
 為了說明樹外程式碼成本，下面給出核心開發過程的一些相關方面；本文稍後將更詳細地
 討論其中的大部分內容。請考慮：
@@ -161,16 +161,16 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 尤其是嵌入式系統的製造商，可能會傾向於忽視本節中所說的大部分內容；因為他們
 相信自己正在商用一種使用凍結核心版本的獨立產品，在發布後不需要再進行開發。
 這個論點忽略了廣泛的程式碼審查的價值以及允許使用者向產品添加功能的價值。但這些
-產品的商業壽命有限，之後必須發布新版本的產品。在這一點上，程式碼在主線上並得到
-良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
+產品的商業壽命也是有限的，之後必須發布新版本的產品。在這一點上，程式碼在主線
+上並得到良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
 
 許可
 ----
 
 程式碼是根據一些許可證提供給Linux核心的，但是所有程式碼都必須與GNU通用公共許可
 證（GPLv2）的版本2相容，該版本是覆蓋整個核心分發的許可證。在實踐中，這意味
-著所有程式碼貢獻都由GPLv2（可選地，語言允許在更高版本的GPL下分發）或3子句BSD
-許可（New BSD License，譯者注）覆蓋。任何不包含在相容許可證中的貢獻都不會
+著所有程式碼貢獻都由GPLv2（可選地附帶允許在更高版本的GPL下分發的條文）或三條款BSD
+授權條款（New BSD License，譯者注）覆蓋。任何不包含在相容許可證中的貢獻都不會
 被接受到核心中。
 
 貢獻給核心的程式碼不需要（或請求）版權分配。合併到主線核心中的所有程式碼都保留
@@ -182,9 +182,9 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 
 所有貢獻給核心的程式碼都必須是合法的自由軟體。因此，不接受身分不明或匿名的
 貢獻者的程式碼。所有貢獻者都需要在他們的程式碼上“sign off（簽發）”，聲明程
-式碼可以在GPL下與核心一起分發。無法提供未被其所有者許可為自由軟體的程式碼，
-或可能為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派
-生的程式碼）不能被接受。
+式碼可以在GPL下與核心一起分發。未被其所有者許可為自由軟體的程式碼，或可能
+為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派生的程
+式碼）都不能被貢獻。
 
 有關版權問題的提問在Linux開發郵件列表中很常見。這樣的問題通常會得到不少答
 案，但請記住，回答這些問題的人不是律師，不能提供法律諮詢。如果您有關於
-- 
2.43.0

