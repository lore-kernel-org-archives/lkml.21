Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431772;
	b=EWd8uxE4uAkrYZt43U5i/0PPVCod3HNPInmkcB8XLI02jjM/RFwOSQ7noEAZ6aTfImbQ
	 P65z5igWbupYqBSH2al04u2MtBicqaiVXj1CGxyI7ElfPjcp54jWOdLqaN7bhBrOM2YoX
	 E74jmRvBQuhnd7Bq+DeokvWrt/kFpt4Oz//d+Cn5D2MvcCbM2PzKZX/8kzjGGXbqSmmwo
	 CECjj6wIkSAN/tYKa8q55fGUUUXf3WKTI2lmrjO2Lnd3ys5jdEKkRMXakfABWh7mBFTLA
	 hHUztbReOEtlwRHk2h6EhlKnuFbA4HmOPzib/0r3EHYrcIxCxG7wkzX2EyAgZXRIhzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
	b=U/tUGgRZRkc/B0WLVqGOZcpoXImti+kxeyxLMalQhamJ63lmwH/heu0dcNPvdEpY6lS1
	 GTkUDjhQ5z+BXmO1NI4Ta+fA4Qwf4MUJ98VRkVKwfAlMNQ+C3LOos75F0m0walVg7TtVz
	 mwrTNO7xKMMPVL0UZIn6jWbVYpnvJTxuhwYK1W+v6dnrpPghXtTHbHqvziCRNquPKTCJJ
	 4Axi2ENlMJ+z8fKoQOxAvzirYVu76hKRTFnpGZnTW25esQCK9S8YtyLQddivhhMjPlqD+
	 sPJNlVDupj8eI1oxQKL2WB4Nq8m7yoKhmgnfrKthCyAUe5VsmvtmapzCAVUZ96fHkjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bnGBI/3s";
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B1606A686
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2B1606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnGBI/3s
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed3df47bc7so3259585ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431771; x=1796036571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
        b=bnGBI/3s93l0mK4QnKx4pvfPIBFpxgTDKMAzHbQdPbvg18kYXGrEgJINcHjjfOqpCG
         WexBx+nQQSEOsW2ihkVh5iG+F7fIfoLPAZPSkTLCjyJ2BoSUm+swJvnjTP7hDRAP3R4G
         akoCYEwYH73mwrT0OBAhqe1zzC57lZoaQb3QxwNtHaczhradyIW2pzN+g1iolBZoTJui
         F0NErFx51URIR+o3rkILcW2fgZ8HgJVjEpwBCLtXQ6z1gf/vncxFBg4FZsr5EvAGXqjc
         95Ah/Mvpkf8caIHSBAsKtv1w0GdhY/IO7CEYC/fBWa4TQFvpOsY/btpfqaQt2XVGM62T
         +MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431771; x=1796036571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
        b=H7UhdYTXkR96iiDJPw0FXASYylICOQBbwP3AYae0RM3fSO9gdtKVuqjVM/83ikzvij
         gWqVxHqwj+ank6/dBGBxjL5fcllx2V3um0Vrp8d5js1XkOd7kxQMQkS5ht3Si5M3cEs+
         fQT791vTUZip6bN+CVndscx7byxdbb5BjZHryT8SM7U2kv7gwZmBgqYzokdewCl0NDSd
         P7xYWthvPxofepwZ0YdOeMt1dQxO0lAi7mW1XhnTIoUhCAsMpHqIQLSqGN0iSR4KENZ+
         3XciJXTtkontSM2vha5UJhYI3JR5W07jenRlBTrAvW64sSidJNY+/5rdRnhrsGbP0Xfo
         qCNg==
X-Forwarded-Encrypted: i=1; AL+hErGbpZiq2D8mtH6linTKObddqsFWiGLx05Az1C1/mgfrwium8IF8/ijz9plfqLZO+xk/UVnaKeWFYHy2nyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s9+qfNlaTVdLff6DbNXmf00ilgYO+ZGeZMC//L/4G+ofJfeHU
	SgSjeilAzsLFr/nJpwPEhzgjF4aR4xRnBEYZ+FTaKr0r7E1SWcLc73Ap
X-Gm-Gg: AZFdTZcr7PBZfy7uOlikheXr2ci/4LQRAAKyXqCT0+PqrWh9oEmpJ9xxiLlM5d9+6QZ
	4wspZN0wDdo2j+I5FxLolAmmHotYc+Gm6Y1SHzYhyK3GC29OGhp8b/GMP4WXDh+G1QWsiw/RtH2
	fyixR4pY0i7jvBtqrvJpxe3Ko8l8xXm0usJI4GEs0X5lh57kma2QbXsSmzt3/P8HDqRFoM1N9iU
	Tds40DwzPgvCzHyfLUYL////6P9ZXRZNSH+501tg2Hn54pTYgmvjjzkYATIwquD/ktxWbNPJOxW
	AOvVSuF4+Le6nyIEXA4cNIeTRKq831xP3DrLxT4fZHFdqUq5RFChVaMpse+prA57kpK7hhB4MP4
	EuGTV/QTBwF6Tt2jZu1R0+ISJTaXtAqig2qAC7lH5h/sB+4Ki3B4cZ4+FvOwZX9mOPB4afloG1a
	NMIxJ3iquvjbJeWaDa8uUtv12OSbP45fh+lxduXiDgqk1ZnSQTvIsftQ8QgiuMSqIieBKQ07+Mf
	BcPchm47dg2jM2LOGR1nm+rGd1Oo9ELfwwdCfzKsg1nc/FJBKmZbYJu9GtPsioYxAGqMwVB4JBM
	M6MViXxQEsYSxuIW3Iae3Q5C4w+V4YTViqo4GVAAavwhjDPX97U9nwD3ybVWPD0FzSI5AL1sxXm
	DcMF3yfsJaN/l7HMSnjXBJS6c
X-Received: by 2002:a17:902:ef45:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2f03edf6f5cmr167023415ad.0.1795431770580;
        Mon, 23 Nov 2026 03:02:50 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:50 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 08/25] docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the English original
Date: Mon, 23 Nov 2026 19:01:59 +0800
Message-ID: <20261123110217.170025-9-chenyou910331@gmail.com>
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

The previous update claimed to track
commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB role in
enforcement decisions"), but the conflict mediator contact was still the
one from before commit 5fddf8962b42 ("docs: update mediator contact
information in CoC doc") and commit 8bfdfa0d6b92 ("docs: update mediator
information in CoC docs").  Update it to Joanna Lee
<jlee@linuxfoundation.org>.

While at it, translate "file" in the Maintainers and Scope sections as
檔案 and keep the MAINTAINERS file name untranslated, matching the rest
of process/, and rewrap lines that exceeded 80 columns.

update to commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB
role in enforcement decisions")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/code-of-conduct-interpretation.rst   | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
index 4fc568409198..6f87b104a96d 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
@@ -2,16 +2,18 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
+:Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst
+           <code_of_conduct_interpretation>`
 
 .. _tw_code_of_conduct_interpretation:
 
 Linux核心貢獻者契約行為準則解釋
 ===============================
 
-:ref:`tw_code_of_conduct` 準則是一個通用文件，旨在為幾乎所有開源社群提供一套規則。
-每個開源社群都是獨一無二的，Linux核心也不例外。因此，本文描述了Linux核心社群中
-如何解釋它。我們也不希望這種解釋隨著時間的推移是靜態的，並將根據需要進行調整。
+:ref:`tw_code_of_conduct` 準則是一個通用文件，旨在為幾乎所有開源社群提供一套
+規則。每個開源社群都是獨一無二的，Linux核心也不例外。因此，本文描述了Linux核心
+社群中如何解釋它。我們也不希望這種解釋隨著時間的推移是靜態的，並將根據需要
+進行調整。
 
 與開發軟體的“傳統”方法相比，Linux核心開發工作是一個非常個人化的過程。你的貢獻
 和背後的想法將被仔細審查，往往導致批判和批評。審查將幾乎總是需要改進，材料才
@@ -23,7 +25,7 @@ Linux核心貢獻者契約行為準則解釋
 ------
 
 行為準則多次使用“維護者”一詞。在核心社群中，“維護者”是負責子系統、驅動程式或
-文件的任何人，並在核心原始程式碼樹的維護者文件中列出。
+檔案的任何人，並在核心原始程式碼樹的 MAINTAINERS 檔案中列出。
 
 責任
 ----
@@ -39,7 +41,7 @@ Linux核心貢獻者契約行為準則解釋
 維護人員應該願意在出現問題時提供幫助，並在需要時與社群中的其他人合作。如果您
 不確定如何處理出現的情況，請不要害怕聯繫技術諮詢委員會（TAB）或其他維護人員。
 除非您願意，否則不會將其視為違規報告。如果您不確定是否該聯繫TAB 或任何其他維
-護人員，請聯繫我們的衝突調解人 Mishi Choudhary <mishi@linux.com>。
+護人員，請聯繫我們的衝突調解人 Joanna Lee <jlee@linuxfoundation.org>。
 
 最後，“善待對方”才是每個人的最終目標。我們知道每個人都是人，有時我們都會失敗，
 但我們所有人的首要目標應該是努力友好地解決問題。執行行為準則將是最後的選擇。
@@ -64,7 +66,7 @@ Linux核心貢獻者契約行為準則解釋
 
 Linux核心社群主要在一組公共電子郵件列表上進行交互，這些列表分佈在由多個不同
 公司或個人控制的多個不同伺服器上。所有這些列表都在核心原始程式碼樹中的
-MAINTAINERS 文件中定義。發送到這些郵件列表的任何電子郵件都被視為包含在行為
+MAINTAINERS 檔案中定義。發送到這些郵件列表的任何電子郵件都被視為包含在行為
 準則中。
 
 使用 kernel.org bugzilla和其他子系統bugzilla 或bug追蹤工具的開發人員應該遵循
-- 
2.43.0

